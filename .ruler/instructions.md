# {PROJECT_NAME} — AI Agent Instructions

> Single source of truth for AI agent instructions.
> Edit this file, then run `npx @intellectronica/ruler apply` to sync all formats.

---

## Project Overview

**{PROJECT_NAME}** is {ONE_SENTENCE_DESCRIPTION}.
Repo: `{GITHUB_USERNAME}/{REPO_NAME}` — deployed on {DEPLOY_PLATFORM}.

**Production software. Every change must work before it ships.**

---

## Stack

- Framework: {FRAMEWORK}
- Database: {DATABASE}
- Deploy: {DEPLOY_PLATFORM}
- Code quality: ruff, pre-commit
- Tests: {TEST_FRAMEWORK}

---

## Project Structure

```
{REPO_NAME}/
├── {MAIN_APP_DIR}/
├── tests/
├── docs/
├── Makefile
├── .env.example
└── AGENTS.md
```

---

## Architecture Rules

- No business logic in HTTP handlers/views — use service functions
- Core business logic must be pure — zero framework dependencies
- All DB access through the session factory
- {FRAMEWORK_SPECIFIC_RULE}

---

## Code Conventions

- snake_case for variables and functions
- PascalCase for classes and models
- Type hints on every function signature
- Docstrings on all public functions
- Max line length: 88 (ruff)
- Imports: stdlib → third-party → local

---

## Testing

- `test_<function>_<scenario>_<expected_result>`
- One happy path + one edge case minimum
- Never hit production DB in tests
- Run before every commit

---

## Linear Workflow

- Ticket prefix: MIZ-
- Commit: `MIZ-XXX: imperative description`
- Branch: `miz-XXX-short-description`

---

## Dev Commands

    make install
    make run
    make test
    make lint
    make format
    make migrate
    make docker-up
    make docker-down

---

## What Not To Do

- No business logic in handlers/views
- No hardcoded credentials
- No failing test commits
- No over-engineering
