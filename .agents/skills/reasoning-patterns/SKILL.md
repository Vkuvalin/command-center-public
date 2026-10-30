---

name: reasoning-patterns
description: Use when the task mentions L0-L5, route hints, reasoning patterns, Plan Iterations, Self-consistency, Tree of Thoughts, ExecPlan, or asks Codex to choose an execution route.
---

# Reasoning Patterns

This skill helps Codex choose the lightest sufficient execution route for the current task.

Use this skill when the task explicitly mentions:

* `L0-L5`;
* route hints;
* reasoning patterns;
* Plan Iterations;
* Self-consistency;
* Tree of Thoughts;
* ExecPlan;
* auto-route / choose execution route.

This skill is a router. It does not define implementation policy, artifact policy, approval gates, or final response format.

This skill does not override:

* the task prompt;
* `AGENTS.md`;
* the initial task envelope, if referenced;
* approved scope;
* project guardrails;
* the selected route file.

## Core rule

Use the lightest sufficient route.

Route hints are advisory, not fixed complexity labels.

Prefer the requested route, but adapt after repository inspection if another route is safer, simpler, or more appropriate.

If you materially downgrade or escalate the route, briefly explain why.

Do not expose hidden chain-of-thought. Use concise visible rationale only when it affects route choice, implementation path, risk, or approval boundaries.

## Route file resolution rule

This skill owns the mapping from route labels to exact route file paths.

Route labels are not file names.

Do not infer route file names from labels such as `L2`, `L3`, `Plan Iterations`, or `Independent Checks`.

After selecting a provisional route choice, open only the exact route file path listed in the Route map below.

If another workflow file, initial task envelope, prompt, or documentation suggests a different route file path, stop and report the conflict before continuing.

## Route map

* `L0 Direct` — local, obvious, low-risk task.
  Exact route file: `docs/codex/reasoning/L0_direct.md`

* `L1 Micro-plan` — small task with a few clear steps.
  Exact route file: `docs/codex/reasoning/L1_micro_plan.md`

* `L2 Plan Iterations` — multi-step work; decompose and execute step by step.
  Exact route file: `docs/codex/reasoning/L2_plan_iterations.md`

* `L3 Independent Checks` — audit, review, risky inspection, or findings comparison.
  Exact route file: `docs/codex/reasoning/L3_self_consistency.md`

* `L4 Route Exploration` — architecture or strategy task with several plausible routes.
  Exact route file: `docs/codex/reasoning/L4_shallow_tree_of_thoughts.md`

* `L5 Deep Branching` — high-cost exploratory work, prototypes, or parallel paths.
  Exact route file: `docs/codex/reasoning/L5_deep_tree_of_thoughts.md`

Read only the selected exact route file unless the task clearly needs multiple routes.

Do not open any `docs/codex/reasoning/*` file by guessed name.

## Route handoff

Before opening a route-specific file:

1. `AGENTS.md` must already be loaded.
2. Any initial task envelope referenced by the external task prompt, such as `docs/codex/tasks/<task>.md`, must already be loaded.
3. This skill must resolve the provisional route choice and selected exact route file path.
4. Codex must open only that selected exact route file.

After the selected route file is loaded, continue with:

1. downstream task artifacts referenced by the task envelope or prompt, such as Stage Briefs;
2. route confirmation, reroute through this skill, or stop on conflict if downstream artifacts change the route or scope;
3. applicable skills or `.agents/PLANS.md`, if triggered;
4. project docs/code inspection, only as needed.

If downstream task artifacts reveal that the selected route is no longer the lightest sufficient route, return to this skill and select a safer route before continuing.

Do not duplicate route-specific tactics here. Put execution details in the relevant route file.
