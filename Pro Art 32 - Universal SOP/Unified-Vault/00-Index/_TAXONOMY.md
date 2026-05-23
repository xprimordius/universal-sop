---
title: _TAXONOMY
type: reference
tags:
  - index
---

# Tag Taxonomy - Flat, Shared Across Both Sources

Every tag is one flat word, no nesting. Identical tags on Claude and ChatGPT notes, so `#sales` spans both. Source tags `#claude` / `#chatgpt` separate them when needed.

---

## source
- `#claude`
- `#chatgpt`

## person
- `#alan`
- `#josephine`

## signal
- `#high-signal`  ·  `#shared` (publicly shared GPT chat)

## areas
`#ai-workflow`  `#apw`  `#credit`  `#dj-music`  `#family`  `#finance`  `#funding`  `#health`  `#legal`  `#mindset`  `#tech`  `#travel`

## concepts
`#branding`  `#contracts`  `#copywriting`  `#dispute`  `#hiring`  `#legal-tech`  `#marketing`  `#negotiation`  `#networking`  `#ops`  `#procurement`  `#sales`  `#teaching`

## precision + entities
`#account-age`  `#address-strategy`  `#amex`  `#bank-list`  `#bankruptcy`  `#blitz`  `#bloodwork`  `#business-credit`  `#cca`  `#cfpb`  `#chargeback`  `#curriculum`  `#dbfi`  `#dell-financing`  `#demand-letter`  `#domains`  `#dsl`  `#equity`  `#faegre`  `#fib`  `#fitness`  `#instagram`  `#meta-ads`  `#no-doc`  `#offer-design`  `#payments`  `#personal-credit`  `#prime-protocol`  `#reg-z`  `#sales-framework`  `#scam`  `#scio`  `#skin`  `#sms`  `#sop`  `#supplements`  `#surgery`  `#tradeline`  `#trt`  `#ugc`  `#utilization`  `#vsl`

## Dataview - sales across both sources
````
```dataview
TABLE source, person, month
FROM #sales
SORT created DESC
```
````
