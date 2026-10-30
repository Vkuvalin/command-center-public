# L3 Independent Checks

Use this route for audit, review, risky inspection, or findings comparison when independent checks can reduce blind spots.

L3 is not a fixed complexity label. It is a route hint for risk discovery and evidence-based review.

This route is self-consistency-inspired, but it is not a request to generate multiple hidden reasoning traces. Use independent checks, compare findings, and consolidate evidence.

## Loading assumption

This route file must be opened only after `.agents/skills/reasoning-patterns/SKILL.md` resolves it as the selected exact route file.

If this file was reached by guessing a route file name from a route label, stop and return to the bootstrap sequence:

1. `AGENTS.md`
2. initial task envelope, if referenced: `docs/codex/tasks/<task>.md`
3. `.agents/skills/reasoning-patterns/SKILL.md`
4. selected exact route file

For repo task-file based work, the initial task envelope should already have been read before route selection.

Read downstream task artifacts, such as Stage Briefs, after this route file and before project docs/code inspection.

If downstream task artifacts reveal that this route is no longer the lightest sufficient route, return to `reasoning-patterns` and select a safer route before continuing.

## When to use

Use L3 when the task:

* is audit-only or review-heavy;
* asks to inspect architecture, tests, docs, prompts, schemas, or workflow boundaries;
* has meaningful risk of missed issues;
* benefits from independent findings;
* requires comparing several observations before recommending action;
* should produce findings before implementation.

Typical examples:

* architecture boundary audit;
* broad diff review;
* test coverage review;
* docs consistency audit;
* prompt/schema/model-policy risk review;
* investigation before refactor, deletion, or new layer.

## Core approach

1. Define the audit question and scope.
2. Inspect the relevant files only.
3. Decide whether independent checks are useful.
4. If useful, use `subagent-routing` for bounded existing-subagent checks.
5. Collect findings.
6. Deduplicate repeated findings.
7. Separate facts from recommendations.
8. Rank findings by severity and evidence.
9. Return a concise audit result or use `report-writing` when preserved analysis is explicitly requested or clearly required.

Do not start implementation unless the task explicitly allows it.

## Subagents

L3 is the main route where subagents are often useful.

Use `subagent-routing` when existing approved subagents materially improve coverage or reduce risk.

Do not run subagents as a ritual.

Subagents provide findings and recommendations. They do not make architecture decisions.

If agents are unavailable, continue manually only when safe and report the limitation.

## Finding quality

A finding is useful only if it has evidence.

Prefer findings that include:

* file paths;
* observed behavior;
* violated rule or risk;
* affected layer;
* concrete consequence;
* suggested next step.

Discard or downgrade findings that are:

* generic;
* speculative without evidence;
* outside task scope;
* purely stylistic unless the task asked for style;
* duplicates of stronger findings.

## Prioritization

Prioritize findings by evidence, impact, and urgency.

Do not inflate severity. A finding is not severe only because it sounds important.

For preserved reports, use `report-writing` severity rules. When consolidating native subagent output, use `subagent-routing` mapping and handling.

## Report handling

Use `report-writing` when a preserved report is explicitly requested or the task clearly asks for preserved analysis.

If audit reveals implementation work, return the findings and propose the next safe step. Do not implement automatically.

## When to choose another route

Use a lighter route if the task is a small local review and independent checks add no value.

Use L2 if the task is mainly approved implementation, not audit.

Use L4 if the task requires comparing architecture routes before selecting a direction.

Use L5 only after explicit approval for deep branching, prototypes, or high-cost exploratory work.

Pause before continuing if audit discovers that the requested action would require:

* architecture decision not approved;
* dependency changes;
* DB model changes;
* workflow transition changes;
* public behavior changes;
* prompt/schema/model policy changes;
* touching forbidden zones from `AGENTS.md`;
* scope materially wider than requested.

## Validation

For audit-only tasks, validation usually means evidence quality, not full test execution.

Use tests or commands only when they directly support the audit question.

Examples:

* run narrow tests to verify suspected behavior;
* inspect existing test coverage without running full suite;
* run grep/search to confirm whether a pattern exists;
* skip runtime validation when the task is documentation-only or report-only.

If validation is skipped, explain why.

## Output

Final audit output should include:

* scope inspected;
* agents used or manual-only review;
* findings ranked by severity;
* evidence for each major finding;
* recommendations;
* what was not checked;
* whether implementation is blocked or needs approval.
