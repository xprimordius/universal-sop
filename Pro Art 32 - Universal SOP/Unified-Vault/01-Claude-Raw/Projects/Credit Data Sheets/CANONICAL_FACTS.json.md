---
title: CANONICAL_FACTS.json
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:03.116696+00:00"
uuid: 30d1fcb4-c211-403a-b5f5-7b10d314b508
tags:
  - claude
  - alan
  - credit
---
# CANONICAL_FACTS.json

> [!info] From project: [[_Project Info|Credit Data Sheets]]

{
  "_meta": {
    "title": "APW Funding Intel · Canonical Facts",
    "version": "2.0",
    "last_updated": "2026-05-15",
    "owner": "Alan Nguyen",
    "purpose": "Single source of truth. v2.0 supersedes v1.0 after full Python re-verification of every claim against source .xlsx files.",
    "v1_to_v2_changes": "All counts re-derived from raw files. Multiple v1 numbers were under-counted. v2 numbers are byte-accurate from openpyxl.",
    "verification_levels": {
      "VERIFIED_BYTE": "Re-extracted from source .xlsx by Python in v2 audit · numerically exact",
      "ALAN_LOCKED": "User-specified · authoritative",
      "WEB_VERIFIED": "Cross-checked with 2026 sources via web search",
      "INDUSTRY_TYPICAL": "Public-domain · not from Alan's data · use with caveat",
      "ESTIMATED": "AI projection · directional · flagged"
    }
  },

  "dataset_totals": {
    "total_files": { "value": 5, "verification": "VERIFIED_BYTE" },
    "total_sheets": { "value": 121, "verification": "VERIFIED_BYTE" },
    "total_data_rows_strict": { "value": 12955, "verification": "VERIFIED_BYTE", "v1_claimed": 12739, "delta": "+216 · v1 under-counted" },
    "total_populated_cells": { "value": 54295, "verification": "VERIFIED_BYTE", "v1_claimed": 53640, "delta": "+655 · v1 under-counted" }
  },

  "file_breakdown": {
    "CC_Data_1": {
      "data_rows": 1223,
      "cells_populated": 5055,
      "components_all_verified": {
        "business_cards": 868, "credit_unions": 151, "pre_approval_database": 62,
        "business_line_of_credit": 47, "business_cards_part_2": 35, "business_loans": 32,
        "additional_datapoints": 24, "research_links": 4
      },
      "verification": "VERIFIED_BYTE"
    },
    "CC_Data_2": {
      "data_rows": 508, "cells_populated": 3557, "unique_banks": 498, "double_dippable": 35,
      "underwriters": { "Elan": 274, "TCM": 133, "Self": 49, "Pinnacle_Bank": 8, "Card_Assets": 6, "FNBO": 5 },
      "verification": "VERIFIED_BYTE"
    },
    "CC_Data_3": {
      "total_sheets": 58, "state_sheets": 50, "reference_sheets": 8,
      "data_rows_state_only": 2231, "data_rows_reference": 217, "data_rows_total": 2448,
      "cells_populated": 10395,
      "blocked_banks": 113, "v1_claimed_blocked": 112, "delta_blocked": "+1",
      "multi_location_banks": 24, "v1_claimed_multi": 25, "delta_multi": "-1",
      "verification": "VERIFIED_BYTE"
    },
    "CC_Data_4": {
      "data_rows": 5443, "cells_populated": 16182,
      "v1_claimed_rows": 5379, "delta": "+64 · v1 under-counted",
      "bureau_distribution_normalized": { "TransUnion": 2036, "Experian": 1998, "Equifax": 1319 },
      "verification": "VERIFIED_BYTE"
    },
    "CC_Data_5": {
      "data_rows": 3180, "cells_populated": 19106, "unique_banks": 23,
      "approved": 3110, "denied": 70, "approval_rate_pct": 97.8,
      "approval_rate_caveat": "SELF-SELECTED DATASET · approval rate NOT generalizable.",
      "fico_mean_raw": 734, "fico_data_quality": "min/max include errors (74 and 6000 are not valid FICO scores)",
      "verification": "VERIFIED_BYTE"
    }
  },

  "file_3_state_sheets_datapoints_VERIFIED": {
    "total_bank_entries": 2231,
    "BCC_Yes": 1507, "v1_BCC_Yes": 1574, "delta": "-67",
    "BCC_No": 113, "v1_BCC_No": 118, "delta": "-5",
    "statements": { "No_Doc": 820, "Full_Doc": 24, "Lo_Doc": 13, "NA": 112, "Empty": 1250 },
    "geo_Yes": 169, "v1_geo_Yes": 179, "delta": "-10",
    "geo_No": 640, "v1_geo_No": 673, "delta": "-33",
    "apply_online_Yes": 1085, "v1_online_Yes": 1155, "delta": "-70",
    "apply_in_branch": 138, "v1_in_branch": 143, "delta": "-5",
    "underwriters_state_sheets_only": {
      "Elan_Financial": 407, "Within_Bank": 266, "TCM_Bank_NA": 49,
      "Card_Assets": 37, "FNBO": 32, "MeridianLink": 18, "ServisFirst": 6
    }
  },

  "underwriters_combined_F2_F3_state": {
    "Elan_combined": { "value": 681, "v1_claimed": 704, "delta": "-23" },
    "TCM_combined": { "value": 182, "v1_claimed": 184, "delta": "-2" },
    "FNBO_combined": { "value": 37, "v1_claimed": 39, "delta": "-2" },
    "Within_Bank_plus_Self": { "value": 315, "v1_claimed": 330, "delta": "-15" },
    "Card_Assets": { "value": 43, "v1_claimed": 43, "delta": "0" }
  },

  "hard_inquiries_total": { "value": 8623, "v1_claimed": 8559, "delta": "+64", "F4": 5443, "F5": 3180 },

  "alan_locked_stack_ranges": {
    "_meta": { "verification": "ALAN_LOCKED", "v2_status": "Unchanged from v1 · user-specified" },
    "Chase": { "per_card": "$25K-$62K", "qty": 2, "subtotal": "$50K-$124K", "timeline_days": "10-60+" },
    "Elan": { "per_card": "$3K-$12K-$30K", "qty": 4, "subtotal": "$12K-$120K", "spacing": "3-6 months" },
    "Amex": { "per_card": "$10K-$12K-$50K+", "qty": 2, "subtotal": "$20K-$100K+", "rule": "max 2/90" },
    "Bank_of_America": { "per_card": "$5K-$10K-$20K", "qty": 4, "subtotal": "$20K-$80K", "advantage": "multiple cards on 1 pull" },
    "US_Bank": { "per_card": "$3K-$30K", "qty": 2, "subtotal": "$6K-$60K" },
    "TCM_CC_plus_Charge": { "combined": "$70K", "subtotal": "$35K-$70K" },
    "Local_Regional": { "per_institution": "$10K-$50K", "qty": "user-defined" },
    "named_banks_subtotal": { "low": 143000, "mid": 301000, "high": 554000, "verification": "ALAN_LOCKED" }
  },

  "velocity_rules_WEB_VERIFIED_2026": {
    "Chase_5_24": {
      "rule": "Max 5 personal credit cards opened in past 24 months across ALL issuers",
      "business_cards_NOT_counted": ["Chase", "Amex", "Citi", "BofA", "US Bank", "Wells Fargo", "PNC"],
      "business_cards_DO_count_toward_5_24": ["Capital One", "Discover", "TD Bank"],
      "auth_user_count": "YES (but Chase may exclude on reconsideration)",
      "status_2026": "Active and strictly enforced",
      "verification": "WEB_VERIFIED"
    },
    "Amex_2_90": {
      "rule": "Max 2 Amex credit cards approved per 90 days",
      "amex_1_5_rule": "Plus: 1 card per 5 days · must wait 6+ days between apps",
      "charge_cards": "Traditionally excluded · 2026 sources note this is tightening",
      "card_limits": "5 credit cards max · 10 charge cards max",
      "verification": "WEB_VERIFIED"
    },
    "BofA_2_3_4": {
      "v1_was_WRONG": "v1 said '2/30/60/90 days' · CORRECT is 2/3/4 in MONTHS",
      "rule": "Max 2 BofA cards per 2 months · 3 per 12 months · 4 per 24 months",
      "BofA_3_12_or_7_12": "Without BofA checking: 3/12 rule (3 personal cards from any issuer in 12mo). With BofA checking: 7/12 rule",
      "verification": "WEB_VERIFIED"
    },
    "Citi_8_65_95": { "rule": "1 per 8 days · 2 per 65 days · 8 per 95 days", "verification": "INDUSTRY_TYPICAL · not re-verified in v2" },
    "Elan_3_6_months": { "rule": "3-6 months between apps", "verification": "ALAN_LOCKED" },
    "TCM_60_plus": { "rule": "60+ days between apps", "verification": "ALAN_LOCKED" }
  },

  "state_specifics": {
    "MN": { "total_banks": 48, "elan": 14, "tcm": 2, "fnbo": 1, "within_bank": 4, "verification": "VERIFIED_BYTE" },
    "OK": { "total_banks": 51, "elan": 5, "tcm": 2, "fnbo": 1, "within_bank": 3, "verification": "VERIFIED_BYTE" }
  }
}
