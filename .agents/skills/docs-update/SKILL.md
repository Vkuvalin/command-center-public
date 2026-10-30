---
name: docs-update
description: Use to update one documentation file after an approved architecture, runtime, workflow, LLM, deployment or process change. Do not use for code changes or broad documentation rewrites.
---

Identify the target doc file and source-of-truth inputs before editing. Read
`AGENTS.md` and the relevant docs or code references needed to verify current
behavior.

Update only the approved doc file unless the parent task explicitly allows more.
Remove stale claims and reflect current behavior. Keep documentation practical;
do not turn it into a changelog. Do not rewrite unrelated docs, over-explain
implementation details owned by another doc, or copy large code blocks unless
necessary.

Do not change code, tests, config or scripts. Do not commit. Do not call
Telegram/LLM/API.

Use this output shape:

- Changed files
- Main updates
- Removed stale claims
- Intentional omissions
- Tests: not run, docs-only
- Notes
