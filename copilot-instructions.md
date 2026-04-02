# GitHub Copilot Instructions — {PROJECT_NAME}

---

## 🚨 First-Time Setup

If any `{PLACEHOLDER}` values exist anywhere in this project, **stop and run setup first**.

Ask the user these questions one by one before doing anything else:

1. **Project name?** (e.g. `Vitrina API`)
2. **Repo/slug name?** (e.g. `vitrina-api`)
3. **GitHub username?** (e.g. `luifer-villalba`)
4. **Framework(s)?** (e.g. `FastAPI`, `Next.js`, `React`, `none`)
5. **Database?** (e.g. `PostgreSQL`)
6. **Deploy platform?** (e.g. `Railway`)
7. **Test framework?** (e.g. `pytest`, `pytest-asyncio`, `vitest`)
8. **Main app directory?** (e.g. `app/` / `config/`)
9. **First-party Python modules?** (e.g. `app, core`)
10. **One sentence describing the project?**

Once you have the answers:

1. Replace **all** `{PLACEHOLDER}` values across every file with the correct values
2. Keep `.ruler/instructions.md` as the source of truth for agent instructions. Do not ask the user to edit generated files directly.
3. Run `npx @intellectronica/ruler apply` so generated instruction files (including `AGENTS.md`) match `.ruler/instructions.md`.
4. Keep one local workflow: Docker-first. Ensure `Makefile`, `Dockerfile`, `docker-compose.yml`, and `README.md` stay aligned.
5. Apply only the selected framework-specific adjustments (dependencies, run command, migrations, and tests).
6. Keep runtime command configurability in place (`APP_RUN_COMMAND` in `.env`) so the repo is not framework-locked.
7. Do not leave framework-specific code/dependencies for frameworks the user did not select.
8. Finish setup only after validation succeeds:
   - `make check`
   - `make lint`
   - `make test`

---

## Project Overview

{PROJECT_NAME} is {ONE_SENTENCE_DESCRIPTION}.
Stack: {FRAMEWORK} + {DATABASE}.
Deploy: {DEPLOY_PLATFORM}.

**Production software. Ship working code only.**

---

## Code Style

- Language: Python 3.11+
- snake_case for variables and functions
- PascalCase for classes and models
- UPPER_SNAKE_CASE for module-level constants
- Type hints on every function signature — no exceptions
- Docstrings on all public functions and classes
- Max line length: 88 (ruff enforced)
- Import order: stdlib → third-party → local

---

## Architecture Constraints

- No business logic in HTTP handlers/views
- Service functions contain all business logic — no framework imports
- Core/domain logic must be pure Python — zero framework dependencies
- All DB access through a centralized session/connection boundary
- Pydantic/serializer models for every request and response
- Keep framework-specific rules explicit in `.ruler/instructions.md`

---

## Testing Conventions

- All tests named: `test_<function>_<scenario>_<expected_result>`
- Minimum: one happy path + one edge case per function
- Use fixtures — never setUp/tearDown
- Never hit production DB in tests
- Run pytest before every commit

---

## What Copilot Should Suggest

✅ Full file contents, not partial snippets
✅ Async/await patterns where applicable
✅ Early returns over nested conditionals
✅ Specific exceptions, never bare `except:`
✅ Type-annotated function signatures

---

## What Copilot Should NOT Suggest

❌ Business logic inside HTTP handlers/views
❌ Hardcoded credentials or paths
❌ `print()` in application code — use logging
❌ Over-engineered solutions — ship simple, iterate

---

## Linear Workflow

- Commit prefix: `MIZ-XXX:`
- Branch: `miz-XXX-short-description`
- Every change has a ticket
