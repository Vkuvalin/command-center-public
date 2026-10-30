---

name: report-writing
description: Use when the task asks for a report, preserved analysis, audit/review findings, research summary, risk analysis, route analysis, or comparison report.
---

# Report Writing

This skill helps Codex write clear preserved analysis reports.

Use it when a task needs structured analysis that should be returned to the user or saved as a report artifact.

This skill does not depend on any particular path of reasoning. It may be used from a direct task, route file, another skill, or explicit user prompt.

## Workflow placement

For direct report-only tasks, this skill may be used directly after `AGENTS.md` and any referenced initial task envelope.

For implementation, route-based, or Stage Brief based tasks, read this skill only after:

1. `AGENTS.md`;
2. the initial task envelope, if referenced by the external task prompt;
3. route resolution through `.agents/skills/reasoning-patterns/SKILL.md`, if triggered;
4. the selected exact route file, if triggered;
5. downstream task artifacts such as Stage Briefs, if referenced.

Do not use report-writing as a substitute for route selection, initial task envelope reading, downstream task artifact reading, project guardrails, or implementation planning.

## Core rule

A report may preserve analysis and recommend next steps.

A report does not approve implementation, change source-of-truth docs, or make architecture decisions.

Follow `AGENTS.md`, the task prompt, the initial task envelope, approved scope, downstream task artifacts such as Stage Briefs, and any selected route-specific instructions.

## File report vs chat report

Create a file report only when explicitly requested, or when the task clearly asks for preserved analysis.

Default location:

* `docs/codex/reports/`

Use a chat report instead when the analysis is short, temporary, or does not need to be preserved.

Usually do not commit reports unless explicitly requested.

Reports are not source of truth. Durable conclusions must be moved into the proper project documents only after explicit user approval.


## Report principles

Separate:

* fact — what was observed;
* evidence — where it is visible;
* interpretation — what it may mean;
* risk — why it matters;
* recommendation — what could be done next;
* decision — not made by the report.

Do not inflate findings. Do not present speculation as evidence.

Keep the report concise, structured, and scoped to the task.


## Optional metadata

Include metadata only when it helps interpret the report.

Recommended fields:

* Task:
* Initial task envelope / downstream artifact / Stage Brief:
* Intent:
* Report type:
* Route / mode, if relevant:
* Agents or skills used, if relevant:
* ExecPlan reference, if relevant:
* Files / layers inspected:
* Not inspected:

Do not force route, agent, skill, or ExecPlan fields when they are irrelevant.


## Severity

Use severity only for findings that represent risk or required action.

* `blocking` — must be resolved or explicitly accepted before proceeding.
* `high` — likely to cause architecture, runtime, validation, security, workflow, or user-facing problems.
* `medium` — real issue, but not immediately blocking.
* `low` — minor issue, cleanup, clarity, weak risk, or improvement suggestion.

A finding is not high severity only because it sounds important.

When consolidating native P-scale findings into preserved reports:

* `P0` maps to `blocking`;
* `P1` maps to `high`;
* `P2` maps to `medium` by default, or `low` when it is only a weak improvement or cleanup issue.


## Finding format

For audit/review findings, prefer:

```text
Finding:
Evidence:
Severity:
Affected files/layers:
Interpretation:
Risk:
Recommendation:
Confidence:
```

Every non-trivial finding should include evidence.

When a finding is carried from an existing Review, Fix-loop, validation cycle, or consolidated analysis, preserve the supplied finding identity.

Do not create a new identity for the same underlying issue unless the merge, split, or identity change is explicitly explained.

Do not introduce a global finding ID system when the active workflow does not provide one.

Downgrade or remove findings that are generic, unsupported, outside scope, duplicated, or purely stylistic unless the task asks for style.


## Flexible report skeleton

Use only the sections that fit the task.

```md
# <Report title>

Boundary: this report is preserved analysis, not source of truth, and does not authorize implementation.

## 1. Report Metadata

Task:
Intent:
Report type:
Route / mode, if relevant:
Agents or skills used, if relevant:
ExecPlan reference, if relevant:
Files / layers inspected:
Not inspected:

## 2. Executive Summary

Briefly state the main result, highest-risk findings, and recommended next step.

## 3. Findings

### Finding 1: <short title>

Severity:
Evidence:
Affected files/layers:
Interpretation:
Risk:
Recommendation:
Confidence:

## 4. Route / Option Comparison

Use only for route-analysis, architecture comparison, prototype comparison, or path comparison.

For each option:

- Summary:
- Benefits:
- Risks:
- Cost:
- Reversibility:
- Affected files/layers:
- Validation path:
- Approval needs:

Recommended option:
Rejected alternatives:
Remaining risks:

## 5. Recommendations

List prioritized next steps.

Separate:

- safe immediate steps;
- steps requiring approval;
- optional improvements;
- out-of-scope work.

## 6. Boundaries

State what this report does not approve.

Examples:

- implementation not approved;
- architecture decision not approved;
- source-of-truth docs not updated;
- public behavior not changed;
- prompt/schema/model policy not changed.

## 7. Open Questions

List unresolved questions, missing evidence, or follow-up checks.
```


## Route handoff

When used from a route file, adapt the report to the selected route.

- L3: preserve audit/review findings, evidence, severity, not checked, and next safe step.
- L4: preserve route comparison, approval needs, recommended route, rejected alternatives, and remaining risks.
- L5: preserve prototype/path comparison only when a report is explicitly requested or clearly needed; do not replace ExecPlan.
- L0/L1/L2: usually do not create preserved reports unless explicitly requested, required by the task artifact, or clearly needed.


## Boundaries

If the task is audit-only or report-only, do not edit code, docs, tests, configs, agents, or skills.

If the report recommends implementation, docs updates, architecture changes, or policy changes, stop and ask for explicit approval before making those changes.

If no preserved report is needed, return a concise structured answer instead of creating a file.

A report is not a task artifact, source of truth, approval artifact, or implementation permission unless another workflow file explicitly says so.
