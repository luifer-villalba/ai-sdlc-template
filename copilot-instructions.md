# GitHub Copilot Instructions — {PROJECT_NAME}

---

## 🚨 First-Time Setup

If any `{PLACEHOLDER}` values exist anywhere in this project, **stop and run setup first**.

Ask the user these questions one by one before doing anything else:

1. **Project name?** (e.g. `Vitrina API`)
2. **Repo/slug name?** (e.g. `vitrina-api`)
3. **GitHub username?** (e.g. `luifer-villalba`)
4. **Framework?** (`FastAPI` / `Django` / other)
5. **Database?** (e.g. `PostgreSQL`)
6. **Deploy platform?** (e.g. `Railway`)
7. **Test framework?** (e.g. `pytest-asyncio` / `pytest-django`)
8. **Main app directory?** (e.g. `app/` / `config/`)
9. **First-party Python modules?** (e.g. `app, core`)
10. **One sentence describing the project?**

Once you have the answers:

1. Replace **all** `{PLACEHOLDER}` values across every file with the correct values
2. Adjust `Makefile` based on framework:
   - **FastAPI** → keep `uvicorn app.main:app --reload --port 8888`, keep `alembic` commands
   - **Django** → replace `uvicorn` with `python manage.py runserver 0.0.0.0:8888`, replace `alembic` commands with `python manage.py migrate` and `python manage.py makemigrations`
3. Adjust `requirements.txt` based on framework:
   - **FastAPI** → `fastapi uvicorn[standard] sqlalchemy[asyncio] asyncpg alembic python-multipart jinja2`
   - **Django** → `django djangorestframework psycopg2-binary`
4. Adjust `docker-compose.yml` `command:` based on framework:
   - **FastAPI** → `uvicorn app.main:app --host 0.0.0.0 --port 8888 --reload`
   - **Django** → `python manage.py runserver 0.0.0.0:8888`
5. Confirm to the user when all replacements are done

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
- All DB access through the session factory in `{DB_MODULE}`
- Pydantic/serializer models for every request and response
- {FRAMEWORK_SPECIFIC_CONSTRAINT}

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
