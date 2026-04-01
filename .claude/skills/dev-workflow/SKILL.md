---
name: {PROJECT_SLUG}-dev-workflow
description: |
  {PROJECT_NAME} development workflow. Load this skill when creating Linear tickets,
  writing commits, structuring PRs, adding tests, or planning a new feature.
---

# {PROJECT_NAME} — Dev Workflow

## Session Context

- Solo developer, ~2h/day coding sessions
- Every task must be completable in one session or split into atomic tickets
- Production use — no half-finished features in main
- Token-efficient communication preferred

## Linear Tickets

Team UUID: `7620fa65-54ee-4bcb-a640-8bf31deecbf9`
Ticket prefix: MIZ-

### Ticket Format

```
## Synopsis
1–2 sentence summary of what and why.

## Priority
🔴 Urgent / 🟠 High / 🟡 Medium / 🟢 Low

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Tests pass

## Technical Notes
- Implementation detail 1
- Implementation detail 2
```

### Ticket Sizing Rules

- One ticket = one session (~2h max)
- If a feature needs multiple sessions → split into subtasks
- Each ticket must have clear, testable acceptance criteria

## Commit Format

    MIZ-XXX: brief description in imperative mood

## Branch Naming

    miz-XXX-short-description

## Test-First Cycle

1. Write failing test
2. Implement minimal code to pass
3. Refactor if needed
4. Run full suite before commit
5. Never commit with failing tests

## Feature Implementation Order

1. Schema / model
2. Service function + unit tests
3. Handler / view + integration test
4. Template/UI (if needed)
5. Migration (if DB change)
6. Update AGENTS.md if architecture changes

## Architecture Guardrails

Before writing any code:
- [ ] Does this have a Linear ticket?
- [ ] Does this belong in the right layer?
- [ ] Are there tests for happy path + edge case?
- [ ] Does this introduce anti-patterns for the stack?

## Session Recap Template

    ✅ COMPLETED: [what was done]
    🧠 LEARNED: [1-2 concepts or decisions]
    ➡️  NEXT: [next ticket or focus area]
