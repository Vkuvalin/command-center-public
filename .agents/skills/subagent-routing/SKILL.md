---

name: subagent-routing
description: Use when the task asks Codex to choose, dispatch, or coordinate existing approved subagents for bounded read-only audit, write-limited code review, risk inspection, independent findings, or consolidated summaries.
---

# Subagent Routing

This skill helps Codex choose and brief existing approved subagents.

Use it when a task asks to use existing subagents, audit agents, independent checks, parallel review, multi-focus review, risk inspection, or consolidated findings.

This skill does not create new agents.

This skill does not grant write permissions by itself.

Each subagent must follow its own `.toml` sandbox mode, role, write boundary, and forbidden actions.

This skill does not override `AGENTS.md`, the task prompt, the initial task envelope, approved scope, downstream task artifacts such as Stage Briefs, selected route-specific instructions, or individual agent `.toml` files.

---

## Core rule

Use subagents only when they materially reduce risk, improve independent coverage, close inspection gaps, or reduce main-context load through bounded summary.

Do not run subagents as a ritual.

If focused manual inspection is enough, do not dispatch subagents.

Use the smallest useful subagent set.

Do not use subagents to expand scope, bypass approval, replace route selection, or delegate unclear tasks.

---

## Workflow placement

For route-based, implementation, review, or Stage Brief based tasks, use this skill only after:

1. `AGENTS.md`;
2. the initial task envelope, if referenced by the external task prompt;
3. route resolution through `.agents/skills/reasoning-patterns/SKILL.md`, if triggered;
4. the selected exact route file, if triggered;
5. downstream task artifacts such as Stage Briefs, if referenced;
6. enough project context inspection to define bounded subagent questions or a bounded review envelope.

For direct audit-only, review-only, or explicitly requested subagent tasks, this skill may be used after `AGENTS.md` and task scope reading, including any referenced initial task envelope.

Do not use subagents as a substitute for:

* route selection;
* task scope reading;
* downstream artifact reading;
* project guardrails;
* architecture rules;
* approved scope;
* parent Codex responsibility.

If required context is missing, stop and request it instead of sending an under-specified subagent task.

---

## Available subagents

Before dispatching, check the current project agents in:

* `AGENTS.md`;
* `.codex/agents/*.toml`.

Known project agents may include the groups below.

If local agent files differ from this list, follow the actual local files and their `.toml` instructions.

### Read-only audit agents

* `.codex/agents/architecture_auditor.toml` — read-only architecture boundary, ownership, layer separation, responsibility leak, source-of-truth conflict, and scope-risk audit.
* `.codex/agents/test_auditor.toml` — read-only test coverage, stale/weak test, fake/mock/fixture risk, validation safety, and real external-call risk audit.
* `.codex/agents/docs_auditor.toml` — read-only documentation consistency, stale docs, docs/code/config/script mismatch, source-of-truth conflict, and report-as-source-of-truth audit.

Read-only audit agents return findings and recommendations only.

They do not edit files, do not implement, do not update source-of-truth docs, do not approve architecture direction, and do not commit.

### Write-limited review agents

* `.codex/agents/code_reviewer.toml` — write-limited independent code review agent. It uses `.agents/skills/review-code/SKILL.md` as its review methodology and may create or update exactly one Batched Code Review Report under `docs/codex/reports/`.

`code_reviewer` must not edit production code, tests, configs, scripts, source-of-truth docs, workflow files, task envelopes, Stage Briefs, ExecPlans, agents, or skills.

`code_reviewer` reports are preserved review analysis only. They are not source of truth, not implementation approval, not architecture approval, not merge approval, not commit approval, and not release approval.

---

## Selection guide

Use `architecture_auditor` when the task involves:

* architecture boundaries;
* ownership;
* layer responsibility;
* source-of-truth conflicts;
* state or workflow ownership;
* public/private API boundary risk;
* provider/tool/external-boundary ownership;
* broad refactor risk;
* scope expansion risk;
* architecture decisions hidden inside implementation.

Use `test_auditor` when the task involves:

* missing tests;
* stale or weak tests;
* fake/mock/fixture risk;
* real external-call risks in tests;
* validation safety;
* tests hiding production wiring bugs;
* regression coverage risk;
* test utility or fixture realism.

Use `docs_auditor` when the task involves:

* stale documentation;
* docs/code/config/script mismatch;
* source-of-truth conflicts;
* outdated setup/runtime/workflow/API/CLI docs;
* reports or temporary analysis artifacts mistaken for durable docs;
* missing documentation update after approved behavior, architecture, runtime, setup, or configuration changes.

Use `code_reviewer` when the task involves:

* non-trivial implementation diff review;
* broad, risky, or multi-file code review;
* architecture-sensitive implementation review;
* review requiring preserved Batched Code Review Report;
* independent review of correctness, architecture, contracts, data flow, security/safety, tests, performance, or integration risks;
* large review where batching reduces missed cross-file issues or context loss.

When using multiple subagents, give each one a distinct bounded question.

Avoid sending the same broad task to all agents.

---

## Multi-focus code review

For broad or risky code review, parent Codex may run several independent `code_reviewer` invocations with different `review_focus` values.

Do not split reviewers by batch by default.

Split by review lens, not by file batch.

Useful `review_focus` values may include:

* `general_review`;
* `architecture_and_contracts`;
* `correctness_and_data_flow`;
* `security_and_safety`;
* `tests_and_verification`;
* `llm_agentic_tool_boundaries`;
* `performance_and_resources`;
* `integration_and_operations`.

Each `code_reviewer` invocation should receive its own bounded review envelope and its own report path when a report will be written.

For a preserved Stage-bound Review, supply an explicit canonical report path for each reviewer. The path must contain the Stage identity, work-unit identity, and Review ordinal. Keep the same logical ordinal as the corresponding Review diff and across independent focuses in one cycle; append each focus after the ordinal:

```text
docs/codex/diff/stage-12-frontend-ownership-review-02.diff
docs/codex/reports/stage-12-frontend-ownership-review-02-architecture-and-contracts.md
docs/codex/reports/stage-12-frontend-ownership-review-02-tests-and-verification.md
```

Use a new ordinal for a later Review / Fix-loop cycle. If the required identity or explicit path is missing, stop and request it before dispatch; do not generate a generic task-slug report path for Stage-bound Review.

For direct repo-local review outside the Stage-bound contract, generated report names may include the focus suffix according to `review-code` / `code_reviewer` rules, for example:

```text
docs/codex/reports/<task-slug>-code-review-<review-focus-slug>.md
```

Do not assign multiple independent `code_reviewer` invocations to write the same report file.

Do not tell an individual `code_reviewer` that sibling reviewers exist unless the explicit task is consolidation.

Do not ask `code_reviewer` to coordinate with other agents.

Consolidation is owned by the parent execution context, not by the individual reviewer.

---

## Dispatch mode

When dispatching a typed subagent, provide a self-contained brief.

Do not rely on inherited parent context unless the tool explicitly supports it.

If the tool cannot combine typed subagent selection with full-context fork, use typed subagent selection and include all required context in the prompt.

A subagent brief must be narrow enough that the subagent can answer without scanning the whole repo by default.

A subagent brief must not grant permissions that contradict the agent `.toml`.

If the parent task conflicts with the subagent `.toml`, the subagent `.toml` wins and the conflict must be reported.

---

## Dispatch task shape — read-only auditors

Use this shape for `architecture_auditor`, `test_auditor`, `docs_auditor`, or another read-only auditor.

A read-only audit subagent prompt should be self-contained enough to run without parent thread context.

Give each read-only auditor a bounded audit task.

Include:

* audit question;
* scope to inspect;
* scope not to inspect;
* instruction not to implement;
* expected output format;
* evidence requirement;
* severity scale;
* concise output request.

Template:

```text
You are running a read-only audit.

Audit question:
<question>

Scope to inspect:
<files/layers/docs/tests/configs>

Out of scope:
<what not to inspect or change>

Rules:
- Do not edit files.
- Do not implement.
- Do not update docs.
- Do not modify tests.
- Do not modify configs or scripts.
- Do not commit.
- Do not give yourself permissions that contradict your `.toml` instructions.
- If the parent task conflicts with your `.toml`, follow your `.toml` and report the conflict.
- Cite concrete files, symbols, tests, docs sections, configs, commands, or observed behavior.
- Separate evidence from speculation.
- Classify findings as P0/P1/P2.
- Use `P0` for blocker or unsafe-to-proceed risk.
- Use `P1` for high risk likely to affect architecture, runtime, validation, workflow, safety, or user-facing behavior.
- Use `P2` for cleanup, clarity, or bounded non-blocking risk.
- Recommend small next steps only.

Expected output:
- Use your native output format from your `.toml`.
- Keep findings concise.
- Include evidence for every non-trivial finding.
- Classify severity using your configured scale.
- Add recommendations and open questions when useful.
```

---

## Dispatch task shape — code_reviewer

Use this shape for `.codex/agents/code_reviewer.toml`.

A `code_reviewer` prompt should provide a bounded review envelope.

For an architecture-sensitive Stage-bound Review, pass the OPS Task, Stage Brief for Brief-backed (TS-B), and the same exact relevant architecture references / constraints supplied for the task. Do not ask an architecture-focused reviewer to reconstruct accepted architecture; missing required input blocks that lens. Pass existing material finding IDs when reviewing a Fix-loop delta.

Include only the fields that are relevant and available. Do not force-fill optional fields.

Recommended fields:

* review goal;
* review focus;
* diff or changed files;
* expected behavior;
* related files;
* architecture rules;
* test files;
* style reference files;
* risk areas;
* verification commands;
* external boundaries;
* report path;
* out of scope.

Template:

```text
You are running an independent write-limited code review.

Review goal:
<review_goal>

Review focus:
<review_focus or omit if general>

Review object:
<diff, changed_files, or exact scope that allows discovering changed files>

Expected behavior:
<expected_behavior or acceptance criteria>

Related files:
<files needed for context>

Architecture rules:
<architecture rules / source-of-truth docs / boundaries>

Test files:
<tests added, changed, or relevant>

Risk areas:
<areas to inspect carefully>

Verification commands:
<commands to suggest/check/report, if any>

External boundaries:
<LLM/tool/provider/DB/storage/filesystem/network/browser/CLI/API/user-input boundaries, if relevant>

Report path:
<explicit docs/codex/reports/stage-<stage-id>-<work-slug>-review-<ordinal>[-<review-focus-slug>].md for a preserved Stage-bound Review; direct repo-local path if a report is expected>

Out of scope:
<files, behaviors, checks, fixes, or decisions that must not be reviewed or changed>

Rules:
- Use `.agents/skills/review-code/SKILL.md` as the review methodology.
- Follow your own `.toml` sandbox mode, write boundary, and forbidden actions.
- You may create or update exactly one Batched Code Review Report under `docs/codex/reports/` when report writing is requested or clearly required by review size/risk.
- Do not write anywhere else.
- Do not edit production code, tests, configs, scripts, source-of-truth docs, workflow files, task envelopes, Stage Briefs, ExecPlans, agents, or skills.
- Do not implement fixes.
- Do not make architecture decisions.
- Do not commit.
- If `review_focus` is provided, use it as your primary review lens.
- Do not broaden review beyond the assigned scope.
- Cite concrete files, symbols, tests, docs sections, commands, or observed behavior.
- Separate evidence from speculation.
- Return a concise handoff.

Expected output:
- report path, if a report was created or updated;
- verdict: approve / approve with comments / request changes;
- blocker count;
- major count;
- highest-risk findings;
- missing tests summary;
- suggested verification;
- unresolved questions;
- remaining risks;
- confirmation of write scope.
```

---

## Consolidation

After subagents return findings:

1. Deduplicate repeated findings.
2. Separate facts from recommendations.
3. Keep evidence attached to each non-trivial finding.
4. Rank findings by severity and impact.
5. Discard unsupported findings.
6. Discard out-of-scope findings.
7. Identify contradictions between agents.
8. Identify what was not checked.
9. Separate audit findings, review verdicts, and implementation recommendations.
10. Preserve unresolved questions that affect correctness, architecture, safety, or verification.
11. Preserve original material finding IDs across Review/Fix cycles and consolidated findings; explain any merge or split of identities.

Subagents provide findings, recommendations, reports, or review verdicts according to their `.toml`.

Subagents do not make architecture decisions.

Subagent output does not authorize implementation.

Read-only auditors return findings only.

`code_reviewer` may return a code review verdict and report path because it is a write-limited review agent.

A `code_reviewer` verdict is a code review verdict only. It is not architecture approval, implementation approval, merge approval, commit approval, or release approval unless the surrounding workflow explicitly grants that meaning.

Do not overwrite individual `code_reviewer` reports during consolidation.

If a consolidated artifact is explicitly requested, create a separate consolidated report through `report-writing` or the approved reporting path.

Do not silently downgrade, hide, or delete individual agent findings. If a finding is rejected or downgraded, explain why.

### Severity mapping

When consolidating native read-only auditor P-scale findings into a preserved report:

* `P0` maps to `blocking`;
* `P1` maps to `high`;
* `P2` maps to `medium` by default, or `low` when it is only a weak improvement or cleanup issue.

When consolidating `code_reviewer` findings:

* `blocker` maps to `blocking`;
* `major` maps to `high`;
* `minor` maps to `medium`;
* `nit` maps to `low`.

When several agents identify the same underlying risk with different severity, keep the highest justified severity and explain the consolidation.

Do not inflate severity just because multiple agents mentioned adjacent concerns.

---

## Handoff to report-writing

If findings must be preserved, use `report-writing` skill to create a structured report unless the selected subagent already created its own approved report.

Use a separate consolidated report when:

* several subagent outputs must be compared;
* the task explicitly requests preserved consolidated findings;
* parent Codex needs to preserve synthesis separately from individual reports.

Reports are preserved analysis artifacts only.

Reports are not source of truth.

Reports do not authorize implementation.

If the task is audit-only, review-only, or report-only, do not start implementation after the report unless explicitly approved.

---

## When not to use subagents

Do not use subagents when:

* the task is simple and local;
* the scope is too small for independent review;
* the user asked for direct implementation only and independent review would not reduce risk;
* subagents would add latency without reducing risk;
* the relevant subagent would have no clear bounded question;
* required context is missing and cannot be supplied safely;
* the task would require permissions the target subagent does not have;
* a specialized skill without subagents is sufficient.
