---
name: audit-only
description: Use for read-only investigations before refactors, deletions, architecture changes, new layers, Web/API/payment/deployment work, or when current behavior is unclear. Do not use for implementation.
---

Confirm that the parent task is audit-only. If it asks for implementation,
stop and report the mismatch.

Read `AGENTS.md` and only the project docs or files needed for the audit. Do
not read the whole repo by default.

Do not change code, tests or existing docs. The only allowed write is an
explicitly requested audit report. Do not commit. Do not call Telegram/LLM/API
unless the parent task explicitly allows it.

Separate evidence from speculation. Cite concrete files, symbols or doc
sections. Classify findings as P0/P1/P2 when useful. Prefer small
recommendations and explicit open questions.

Use this output shape:

- Task
- Executive summary
- Findings
- Risks
- Recommendations
- Open questions
- Checks, if any
