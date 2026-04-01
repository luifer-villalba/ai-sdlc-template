---
applyTo: "**"
---

# General Conventions — {PROJECT_NAME}

## 🚨 First-Time Setup

If any `{PLACEHOLDER}` values exist anywhere in this project, **stop immediately**
and ask the user the following questions before doing anything else:

1. What is the project name? (e.g. `Vitrina API`)
2. What is the repo/slug name? (e.g. `vitrina-api`)
3. What is the GitHub username? (e.g. `luifer-villalba`)
4. What framework(s) are you using? (e.g. `FastAPI`, `Next.js`, `React`, `none`)
5. What is the database? (e.g. `PostgreSQL`)
6. What is the deploy platform? (e.g. `Railway`)
7. What is the test framework? (e.g. `pytest`, `pytest-asyncio`, `vitest`)
8. What is the main app directory? (e.g. `app/` / `config/`)
9. What are the first-party Python modules? (e.g. `app, core`)
10. One sentence describing what the project does?

Once you have the answers:

1. Replace **all** `{PLACEHOLDER}` values across every file
2. Keep `.ruler/instructions.md` as the canonical source for agent instructions
3. Run `npx @intellectronica/ruler apply` so generated instruction files are synced
4. Keep one local development workflow: Docker-first. Ensure `Makefile`, `Dockerfile`, `docker-compose.yml`, and `README.md` agree.
5. Adjust framework specifics only for selected frameworks
6. Keep runtime command configurable via `.env` (`APP_RUN_COMMAND`) so the template remains framework-agnostic
7. Remove framework-specific code/dependencies for frameworks not selected
8. Confirm setup only after validation passes:
    - `make check`
    - `make lint`
    - `make test`

---

## Commit Format

    MIZ-XXX: brief description in imperative mood

Examples:
- `MIZ-012: add upload endpoint`
- `MIZ-013: fix negative stock edge case`

## Branch Naming

    miz-XXX-short-description

## PR Format

Title: `MIZ-XXX: brief description`

Body:
```
## What
## Why
## How
## Testing
```

## Architecture Guardrails

Before writing any code:
- Does this have a Linear ticket?
- Does this belong in the right layer (handler vs service vs core)?
- Are there tests for happy path + at least one edge case?
- Does this introduce any anti-patterns for the stack?

## File Creation Order (for any feature)

1. Schema / serializer / model
2. Service function + unit tests
3. HTTP handler / view + integration test
4. Template/UI (if needed)
5. Migration (if DB change)
6. Update `.ruler/instructions.md` if architecture changes, then run `npx @intellectronica/ruler apply`

## Session Recap Format

    ✅ COMPLETED: [what was done]
    🧠 LEARNED: [1-2 concepts or decisions]
    ➡️  NEXT: [next ticket or focus area]
