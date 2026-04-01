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
4. What framework are you using? (`FastAPI` / `Django` / other)
5. What is the database? (e.g. `PostgreSQL`)
6. What is the deploy platform? (e.g. `Railway`)
7. What is the test framework? (e.g. `pytest-asyncio` / `pytest-django`)
8. What is the main app directory? (e.g. `app/` / `config/`)
9. What are the first-party Python modules? (e.g. `app, core`)
10. One sentence describing what the project does?

Once you have the answers:

1. Replace **all** `{PLACEHOLDER}` values across every file
2. Adjust `Makefile` based on framework:
   - **FastAPI** → keep `uvicorn app.main:app --reload --port 8888`, keep `alembic` commands
   - **Django** → replace with `python manage.py runserver 0.0.0.0:8888`, replace migrations with `python manage.py migrate` / `makemigrations`
3. Adjust `requirements.txt` based on framework:
   - **FastAPI** → `fastapi uvicorn[standard] sqlalchemy[asyncio] asyncpg alembic python-multipart jinja2`
   - **Django** → `django djangorestframework psycopg2-binary`
4. Adjust `docker-compose.yml` app `command:` to match the framework run command
5. Confirm to the user when all replacements and adjustments are done

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
6. Update AGENTS.md if architecture changes

## Session Recap Format

    ✅ COMPLETED: [what was done]
    🧠 LEARNED: [1-2 concepts or decisions]
    ➡️  NEXT: [next ticket or focus area]
