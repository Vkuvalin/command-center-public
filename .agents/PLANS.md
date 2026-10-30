# Codex Execution Plans (ExecPlans)

This file defines how to write and maintain an ExecPlan: a self-contained, living specification that Codex can use to deliver observable, working behavior in this repository.

An ExecPlan is not a note, scratchpad, or report. It is a working document for substantial implementation work that must remain useful if another agent or developer continues the task later using only the repository and the ExecPlan.

## When to Use an ExecPlan

Use an ExecPlan for substantial work, including:

* multi-step or multi-file implementation;
* new features;
* significant refactors;
* architecture-sensitive changes;
* long-running work;
* staged implementation;
* approved prototypes or parallel paths;
* tasks expected to take about an hour or more;
* tasks explicitly asking for `.agents/PLANS.md`, `ExecPlan`, or long-running planning.

Do not use an ExecPlan for:

* trivial local fixes;
* small docs-only edits;
* short tasks with an obvious path;
* audit-only, review-only, research, or route-analysis tasks without implementation;
* tasks where the user explicitly prohibited implementation.

If substantial work is done without an ExecPlan, briefly explain why.

Use a lighter approach only when the task is local, reversible, and not architecture-sensitive.

## Workflow placement

In the agentic workflow, `.agents/PLANS.md` should normally be read after:

1. `AGENTS.md`;
2. the initial task envelope, if referenced by the external task prompt;
3. route resolution through `.agents/skills/reasoning-patterns/SKILL.md`, if triggered;
4. the selected exact route file, if triggered;
5. downstream task artifacts such as Stage Briefs, if referenced.

Do not use an ExecPlan as a substitute for route selection, initial task envelope reading, downstream task artifact reading, or project guardrails.

If the direct task is only to create, update, or review an ExecPlan, this file may be read earlier after `AGENTS.md` and any referenced initial task envelope.

## ExecPlan file location

When an ExecPlan must be preserved as a repository artifact, create it under:

```text
docs/codex/plans/
```

Use a short descriptive filename:

```text
docs/codex/plans/<task-slug>-execplan.md
```

Do not create ExecPlan files in ad-hoc locations such as the repository root, `docs/codex/reports/`, `docs/codex/tasks/`, or `docs/codex/stage_briefs/`.

`docs/codex/plans/` stores concrete ExecPlan artifacts.
This `PLANS.md` file defines the rules for writing and maintaining them.

## Reports vs ExecPlans

Use a report when the task is to inspect, audit, review, research, compare routes, or recommend a direction.

Use an ExecPlan when Codex is expected to execute substantial work.

Reports are not source of truth. Durable conclusions must be moved into the proper project documents only after explicit user approval.

If an audit reveals implementation work, do not start it automatically. Return the report and propose the next safe step.

## Stage Briefs and ExecPlans

A Stage Brief is a downstream task artifact that may define approved implementation scope for a task.

An ExecPlan may structure execution inside that approved scope, but it must not expand the scope.

If the Stage Brief and ExecPlan conflict, stop and report the conflict before implementation.

## Non-Negotiable Requirements

Every ExecPlan must be:

* **Self-contained**: include the needed context, paths, terms, commands, and assumptions. Do not rely on chat memory or prior plans.
* **Living**: keep `Progress`, `Surprises & Discoveries`, `Decision Log`, and `Outcomes & Retrospective` current as work proceeds.
* **Beginner-friendly**: write for a developer who knows programming but does not know this repository.
* **Outcome-focused**: describe the behavior, artifact, or project capability gained after the work.
* **Explicitly verifiable**: include commands, working directories, expected outputs, and acceptance criteria.
* **Recoverable**: describe safe retries, partial-completion handling, rollback, cleanup, and failure handling where relevant.

## Authoring Rules

When drafting an ExecPlan:

1. Read required bootstrap files and downstream task artifacts first; then read the relevant repository context, not the whole repository by default.
2. State the purpose and observable result.
3. Define scope and non-goals.
4. Include full paths for relevant files, modules, functions, schemas, prompts, or contracts.
5. Define non-obvious terms.
6. Describe milestones as `goal → work → result → proof`.
7. Add concrete commands with working directory and expected output.
8. Add validation and acceptance criteria.
9. Identify risks, open questions, and approval gates.
10. Include idempotence and recovery notes.
11. If implementation requires approval, state that clearly before implementation starts.

## Execution Rules

When executing an ExecPlan:

1. Move through milestones without asking for every next step if the scope is already approved.
2. Update `Progress` after meaningful work and before every pause.
3. Record unexpected facts in `Surprises & Discoveries`.
4. Record meaningful decisions in `Decision Log`.
5. Rewrite affected sections when scope or approach changes so the plan remains coherent.
6. Stop and ask for approval if the work exits the approved scope.
7. Validate the result with relevant commands or manual checks.
8. Record evidence, not just claims.

## Approval Gates

Stop and ask for approval before continuing if the work requires anything not already approved by the task prompt, initial task envelope, downstream task artifacts, Stage Brief, AGENTS.md, or the active ExecPlan scope:

* changing architecture direction outside approved scope;
* touching forbidden zones from `AGENTS.md`;
* adding dependencies;
* changing DB models outside approved scope;
* changing workflow transition tables outside approved scope;
* changing public behavior outside approved scope;
* changing prompt/schema/model policy outside approved scope;
* expanding scope materially;
* fixing unrelated validation failures;
* starting prototype or parallel-path work that changes architecture direction, dependencies, DB, public behavior, prompt/schema/model policy, or forbidden zones outside approved scope.

A safe additive prototype inside an approved ExecPlan does not require a separate stop only if the approved ExecPlan scope explicitly allows prototypes or parallel paths and it:

* stays inside approved scope;
* is clearly labeled as prototype;
* adds no dependency;
* changes no DB/public behavior/prompt/schema/model policy without approval;
* has a validation path;
* has a cleanup or retirement path.

## Temporary Files

Do not create ad-hoc working files such as:

* `SCRATCHPAD.md`;
* `MEMORY.md`;
* `state.md`;
* `work.md`;
* `notes.md`;
* `draft.md`;
* `temp.md`.

If working state is needed for substantial implementation, use an ExecPlan.

If an analytical result must be preserved, use a report.

If tooling genuinely requires a temporary file, name it clearly, describe it in the ExecPlan, and remove or convert it before completion.

## Relationship to AGENTS.md

`AGENTS.md` defines repository guardrails and has priority over any ExecPlan.

An ExecPlan does not grant permission to violate `AGENTS.md`.

If an ExecPlan conflicts with `AGENTS.md`:

1. follow `AGENTS.md`;
2. record the conflict in `Risks and Open Questions`;
3. stop for approval if needed.

Every ExecPlan must state that it follows this `.agents/PLANS.md` file and applicable `AGENTS.md` rules.

## Formatting Rules

If writing an ExecPlan inside another response, use one fenced `md` block and do not nest triple backticks inside it.

If the file contains only the ExecPlan, omit the enclosing fence.

Prefer concise prose over long lists. Checklists are mandatory only in `Progress`.

Keep the plan detailed enough to resume work, but do not turn it into a general design essay.

---

# ExecPlan Skeleton

Use this skeleton for new ExecPlans.

```md
# <Short, action-oriented title>

This ExecPlan is a living document. `Progress`, `Surprises & Discoveries`, `Decision Log`, and `Outcomes & Retrospective` must stay current as work proceeds.

This ExecPlan follows the repository ExecPlan rules in `.agents/PLANS.md` and the applicable guardrails in `AGENTS.md`.

## 1. Purpose / Big Picture

Explain the problem, user/project value, expected observable behavior, and why this task needs an ExecPlan.

## 2. Scope

Describe the approved files, layers, expected changes, allowed checks, and implementation boundaries.

## 3. Non-goals

List related work that is explicitly out of scope.

## 4. Progress

- [ ] (YYYY-MM-DD HH:MMZ) Initial plan drafted.
- [ ] (YYYY-MM-DD HH:MMZ) Implementation not started.
- [ ] (YYYY-MM-DD HH:MMZ) Validation pending.

## 5. Surprises & Discoveries

- Observation:
  Evidence:
  Source:
  Impact:

## 6. Decision Log

- Decision:
  Rationale:
  Alternatives:
  Consequences:
  Date/Author:

## 7. Outcomes & Retrospective

Summarize completed work, remaining gaps, lessons learned, and compare the outcome to the original purpose.

## 8. Context and Orientation

Describe the current repository state as if the reader is new to the repo. Include full paths, key files/modules/functions, relevant terms, constraints, working directory, and environment assumptions.

## 9. Plan of Work

Describe milestones as goal → work → result → proof.

### Milestone 1: <name>

Goal:
Work:
Result:
Proof:

### Milestone 2: <name>

Goal:
Work:
Result:
Proof:

## 10. Concrete Steps

List exact actions.

For commands, include:

- Working directory:
- Command:
- When to run:
- Expected output:
- If failed:

For manual checks, include:

- Scenario:
- Input:
- Expected behavior:
- Failure signal:

## 11. Validation and Acceptance

List behavioral acceptance criteria, test commands, expected results, and evidence to record.

For code changes, consider the project validation commands from `AGENTS.md`, such as:

- `uv run ruff check .`
- `uv run pyright`
- `uv run pytest`

If a command is skipped, explain why.

## 12. Idempotence and Recovery

Explain safe retries, partial-completion detection, rollback, cleanup, and recovery from failed validation.

If rollback is simple, state:

- Rollback: revert the files modified by this ExecPlan.

If rollback is not simple, describe the recovery steps.

## 13. Artifacts and Notes

Include only concise useful evidence:

- test summaries;
- short transcripts;
- relevant diffs;
- generated artifact paths;
- links to reports.

Do not use this section as a scratchpad.

## 14. Interfaces and Dependencies

State target interfaces, stable signatures, changed contracts, integration points, and dependencies.

If no new dependencies are expected, state:

- No new dependencies are expected.

If a new dependency is required, stop for approval before adding it.
```

## Revising an ExecPlan

When the scope shifts, update all affected sections so the document remains self-contained and coherent.

After significant changes to the plan, add a short note in `Decision Log` or `Surprises & Discoveries` explaining what changed and why.

## Short Rule

Use a report to understand, compare, audit, or recommend.

Use an ExecPlan to implement, refactor, stage, prototype, or carry substantial work forward.
