#!/usr/bin/env node
/**
 * APW Token Tracker — SOP D27/D29/D31 Enforcement
 * Tracks estimated token usage per activity and cumulatively per session.
 *
 * Usage:
 *   node token_tracker.js init                          Start new session
 *   node token_tracker.js log <activity> <tokens>       Log an activity
 *   node token_tracker.js log-file <activity> <path>    Log activity, estimate tokens from file size
 *   node token_tracker.js status                        Current status line (for D29 header)
 *   node token_tracker.js report                        Full session report
 *   node token_tracker.js gate <planned_tokens>         Pre-output gate check (D27 prospective)
 *   node token_tracker.js export                        Update TOKEN_BUDGET_LOG.md with session data
 *   node token_tracker.js estimate <path>               Estimate tokens for a file (no logging)
 *   node token_tracker.js estimate-text <char_count>    Estimate tokens from character count
 */

const fs = require('fs');
const path = require('path');

// --- Configuration ---
const PROJECT_ROOT = path.resolve(__dirname, '..');
const SESSION_FILE = path.join(PROJECT_ROOT, 'cache', 'token_session.json');
const BUDGET_LOG = path.join(PROJECT_ROOT, 'cache', 'TOKEN_BUDGET_LOG.md');

const BUDGET = 160000; // Conservative total budget per session
const THRESHOLDS = {
  GREEN:    { max: 100000, label: 'GREEN',    action: 'Full operations' },
  YELLOW:   { max: 120000, label: 'YELLOW',   action: 'Alert Alan. Abbreviated validation. Prepare to checkpoint.' },
  RED:      { max: 140000, label: 'RED',      action: 'Checkpoint NOW. Cache all state. No new deliverables.' },
  CRITICAL: { max: Infinity, label: 'CRITICAL', action: 'STOP all work. Emergency cache dump.' },
};

// Token estimation: ~1 token per 4 characters (conservative)
const CHARS_PER_TOKEN = 4;

// Fixed cost estimates for common operations
const FIXED_COSTS = {
  'system-prompt':         15000,
  'cache-load-all':        13000,
  'agent-validator':       10000,
  'agent-karen':            7500,
  'agent-resolver':         7000,
  'agent-cache-manager':    5000,
  'agent-full-validation':  17500,
  'user-message-typical':   1000,
  'builder-response-typical': 2500,
};

// --- Session Management ---

function createSession() {
  const session = {
    id: new Date().toISOString().replace(/[:.]/g, '-'),
    started: new Date().toISOString(),
    budget: BUDGET,
    activities: [],
    cumulative: 0,
  };
  writeSession(session);
  console.log(`Session initialized: ${session.id}`);
  console.log(`Budget: ${BUDGET.toLocaleString()} tokens`);
  console.log(`Status: ${getStatusLabel(0)}`);
  return session;
}

function readSession() {
  if (!fs.existsSync(SESSION_FILE)) {
    console.error('No active session. Run: node token_tracker.js init');
    process.exit(1);
  }
  return JSON.parse(fs.readFileSync(SESSION_FILE, 'utf8'));
}

function writeSession(session) {
  const dir = path.dirname(SESSION_FILE);
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(SESSION_FILE, JSON.stringify(session, null, 2));
}

// --- Token Estimation ---

function estimateTokensFromFile(filePath) {
  const resolved = path.isAbsolute(filePath) ? filePath : path.resolve(PROJECT_ROOT, filePath);
  if (!fs.existsSync(resolved)) {
    console.error(`File not found: ${resolved}`);
    process.exit(1);
  }
  const stats = fs.statSync(resolved);
  const bytes = stats.size;
  // Conservative: use byte count / 4 (most chars are 1 byte in UTF-8 English text)
  return Math.ceil(bytes / CHARS_PER_TOKEN);
}

function estimateTokensFromChars(charCount) {
  return Math.ceil(charCount / CHARS_PER_TOKEN);
}

// --- Status Calculation ---

function getStatus(cumulative) {
  if (cumulative < THRESHOLDS.GREEN.max) return THRESHOLDS.GREEN;
  if (cumulative < THRESHOLDS.YELLOW.max) return THRESHOLDS.YELLOW;
  if (cumulative < THRESHOLDS.RED.max) return THRESHOLDS.RED;
  return THRESHOLDS.CRITICAL;
}

function getStatusLabel(cumulative) {
  const status = getStatus(cumulative);
  const remaining = BUDGET - cumulative;
  return `~${Math.round(cumulative / 1000)}K / ~${Math.round(remaining / 1000)}K remaining / ${status.label}`;
}

function getD29Line(cumulative) {
  const status = getStatus(cumulative);
  return `TOKEN EST: ~${Math.round(cumulative / 1000)}K cumulative / ~${Math.round((BUDGET - cumulative) / 1000)}K remaining / ${status.label}`;
}

// --- Commands ---

function logActivity(activity, tokens) {
  const session = readSession();
  const entry = {
    timestamp: new Date().toISOString(),
    activity,
    tokens: parseInt(tokens, 10),
    cumulative_before: session.cumulative,
    cumulative_after: session.cumulative + parseInt(tokens, 10),
  };
  session.activities.push(entry);
  session.cumulative = entry.cumulative_after;
  writeSession(session);

  const status = getStatus(session.cumulative);
  console.log(`Logged: ${activity} | ~${parseInt(tokens, 10).toLocaleString()} tokens`);
  console.log(`Cumulative: ${getStatusLabel(session.cumulative)}`);

  if (status.label !== 'GREEN') {
    console.log(`\n*** ${status.label} WARNING: ${status.action} ***`);
  }
}

function logFileActivity(activity, filePath) {
  const tokens = estimateTokensFromFile(filePath);
  logActivity(activity, tokens);
}

function showStatus() {
  const session = readSession();
  const status = getStatus(session.cumulative);
  console.log('--- TOKEN STATUS ---');
  console.log(getD29Line(session.cumulative));
  console.log(`Activities logged: ${session.activities.length}`);
  console.log(`Session started: ${session.started}`);
  if (status.label !== 'GREEN') {
    console.log(`\n*** ${status.label}: ${status.action} ***`);
  }
}

function gateCheck(plannedTokens) {
  const session = readSession();
  const projected = session.cumulative + parseInt(plannedTokens, 10);
  const currentStatus = getStatus(session.cumulative);
  const projectedStatus = getStatus(projected);

  console.log('--- D27 PRE-OUTPUT GATE ---');
  console.log(`Current:   ~${Math.round(session.cumulative / 1000)}K (${currentStatus.label})`);
  console.log(`Planned:   ~${Math.round(parseInt(plannedTokens, 10) / 1000)}K`);
  console.log(`Projected: ~${Math.round(projected / 1000)}K (${projectedStatus.label})`);

  if (projectedStatus.label === 'GREEN') {
    console.log('\nGATE: PASS — proceed with output.');
  } else if (projectedStatus.label === 'YELLOW') {
    console.log('\nGATE: CAUTION — output allowed but alert Alan. Prepare checkpoint.');
  } else if (projectedStatus.label === 'RED') {
    console.log('\nGATE: BLOCKED — checkpoint instead of delivering. Cache all state.');
  } else {
    console.log('\nGATE: BLOCKED — STOP all work. Emergency cache dump.');
  }

  return projectedStatus.label;
}

function showReport() {
  const session = readSession();
  console.log('=== APW TOKEN SESSION REPORT ===');
  console.log(`Session: ${session.id}`);
  console.log(`Started: ${session.started}`);
  console.log(`Budget:  ${BUDGET.toLocaleString()} tokens`);
  console.log(`Used:    ~${session.cumulative.toLocaleString()} tokens`);
  console.log(`Remain:  ~${(BUDGET - session.cumulative).toLocaleString()} tokens`);
  console.log(`Status:  ${getStatus(session.cumulative).label}`);
  console.log('');
  console.log('--- ACTIVITY LOG ---');
  console.log('');

  if (session.activities.length === 0) {
    console.log('(no activities logged)');
    return;
  }

  // Table header
  const col1 = 4, col2 = 50, col3 = 12, col4 = 12;
  console.log(
    '#'.padEnd(col1) +
    'Activity'.padEnd(col2) +
    'Tokens'.padStart(col3) +
    'Cumulative'.padStart(col4)
  );
  console.log('-'.repeat(col1 + col2 + col3 + col4));

  session.activities.forEach((a, i) => {
    console.log(
      String(i + 1).padEnd(col1) +
      a.activity.substring(0, col2 - 1).padEnd(col2) +
      `~${Math.round(a.tokens / 1000)}K`.padStart(col3) +
      `~${Math.round(a.cumulative_after / 1000)}K`.padStart(col4)
    );
  });

  console.log('-'.repeat(col1 + col2 + col3 + col4));
  console.log(
    ''.padEnd(col1) +
    'TOTAL'.padEnd(col2) +
    `~${Math.round(session.cumulative / 1000)}K`.padStart(col3) +
    getStatus(session.cumulative).label.padStart(col4)
  );
}

function exportToLog() {
  const session = readSession();

  if (!fs.existsSync(BUDGET_LOG)) {
    console.error(`TOKEN_BUDGET_LOG.md not found at: ${BUDGET_LOG}`);
    process.exit(1);
  }

  let log = fs.readFileSync(BUDGET_LOG, 'utf8');

  // Build the session log table
  const lines = [
    '',
    `### Session: ${session.started.split('T')[0]} (${session.id})`,
    '| Operation | Est. Tokens | Cumulative |',
    '|-----------|-------------|-----------|',
  ];

  session.activities.forEach(a => {
    lines.push(
      `| ${a.activity} | ~${Math.round(a.tokens / 1000).toLocaleString()},000 | ${Math.round(a.cumulative_after / 1000).toLocaleString()},000 |`
    );
  });

  lines.push(`| **TOTAL** | | **~${Math.round(session.cumulative / 1000).toLocaleString()},000** |`);
  lines.push('');
  lines.push(`**Status: ${getStatus(session.cumulative).label}**`);
  lines.push('');

  // Append under SESSION LOG section
  const marker = '## SESSION LOG';
  const markerIdx = log.indexOf(marker);
  if (markerIdx !== -1) {
    // Find the end of the existing session log section content
    const insertPoint = log.length;
    log = log.trimEnd() + '\n' + lines.join('\n') + '\n';
  } else {
    log = log.trimEnd() + '\n\n' + marker + '\n' + lines.join('\n') + '\n';
  }

  fs.writeFileSync(BUDGET_LOG, log);
  console.log(`Exported session ${session.id} to TOKEN_BUDGET_LOG.md`);
}

function estimateFile(filePath) {
  const tokens = estimateTokensFromFile(filePath);
  console.log(`File: ${filePath}`);
  console.log(`Size: ${fs.statSync(path.isAbsolute(filePath) ? filePath : path.resolve(PROJECT_ROOT, filePath)).size.toLocaleString()} bytes`);
  console.log(`Estimated tokens: ~${tokens.toLocaleString()}`);
}

function estimateText(charCount) {
  const tokens = estimateTokensFromChars(parseInt(charCount, 10));
  console.log(`Characters: ${parseInt(charCount, 10).toLocaleString()}`);
  console.log(`Estimated tokens: ~${tokens.toLocaleString()}`);
}

function showFixedCosts() {
  console.log('--- FIXED COST REFERENCE ---');
  console.log('');
  Object.entries(FIXED_COSTS).forEach(([key, val]) => {
    console.log(`  ${key.padEnd(30)} ~${val.toLocaleString()} tokens`);
  });
}

function showHelp() {
  console.log(`APW Token Tracker — SOP D27/D29/D31 Enforcement

Commands:
  init                          Start new session (resets counters)
  log <activity> <tokens>       Log an activity with token estimate
  log-file <activity> <path>    Log activity, auto-estimate from file size
  status                        Current D29 token status line
  gate <planned_tokens>         Pre-output gate check (D27 prospective)
  report                        Full session activity report
  export                        Append session data to TOKEN_BUDGET_LOG.md
  estimate <path>               Estimate tokens for a file (no logging)
  estimate-text <char_count>    Estimate tokens from character count
  costs                         Show fixed cost reference table
  help                          This message

Thresholds:
  GREEN    < 100K    Full operations
  YELLOW   100-120K  Alert Alan. Abbreviated validation. Prepare checkpoint.
  RED      120-140K  Checkpoint NOW. Cache all state. No new deliverables.
  CRITICAL > 140K    STOP all work. Emergency cache dump.

Token Estimation:
  ~1 token per 4 characters (conservative)
  ~1 token per 4 bytes (for English UTF-8 text)
`);
}

// --- Main ---

const [,, command, ...args] = process.argv;

switch (command) {
  case 'init':
    createSession();
    break;
  case 'log':
    if (args.length < 2) { console.error('Usage: log <activity> <tokens>'); process.exit(1); }
    logActivity(args.slice(0, -1).join(' '), args[args.length - 1]);
    break;
  case 'log-file':
    if (args.length < 2) { console.error('Usage: log-file <activity> <path>'); process.exit(1); }
    logFileActivity(args.slice(0, -1).join(' '), args[args.length - 1]);
    break;
  case 'status':
    showStatus();
    break;
  case 'gate':
    if (args.length < 1) { console.error('Usage: gate <planned_tokens>'); process.exit(1); }
    gateCheck(args[0]);
    break;
  case 'report':
    showReport();
    break;
  case 'export':
    exportToLog();
    break;
  case 'estimate':
    if (args.length < 1) { console.error('Usage: estimate <file_path>'); process.exit(1); }
    estimateFile(args[0]);
    break;
  case 'estimate-text':
    if (args.length < 1) { console.error('Usage: estimate-text <char_count>'); process.exit(1); }
    estimateText(args[0]);
    break;
  case 'costs':
    showFixedCosts();
    break;
  case 'help':
  case '--help':
  case '-h':
  case undefined:
    showHelp();
    break;
  default:
    console.error(`Unknown command: ${command}`);
    showHelp();
    process.exit(1);
}
