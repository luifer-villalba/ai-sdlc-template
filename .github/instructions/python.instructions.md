---
applyTo: "**/*.py"
---

# Python Conventions — {PROJECT_NAME}

## Style

- Follow PEP 8
- Max line length: 88 (ruff enforced)
- snake_case for variables and functions
- PascalCase for classes and models
- UPPER_SNAKE_CASE for module-level constants
- Type hints on every function signature — no exceptions
- Docstrings on all public functions and classes

## Imports

- Order: stdlib → third-party → local (isort enforced)
- Never use wildcard imports (`from module import *`)
- Known first-party: `{FIRST_PARTY_MODULES}`

## Functions

- Prefer early returns over nested conditionals
- One responsibility per function
- Keep functions under 30 lines — extract if longer
- Never use mutable default arguments

## Error Handling

- Raise specific exceptions, never bare `except:`
- Use custom exception classes for domain errors
- Always log before re-raising in services

## Type Hints

- Use `list[str]` not `List[str]` (Python 3.11+)
- Use `str | None` not `Optional[str]`
- Use `TypeAlias` for complex repeated types

## Tests

- All async test functions are `async def`
- Prefix with `test_`
- Name pattern: `test_<function>_<scenario>_<expected_result>`
- Use pytest fixtures, never setUp/tearDown
- Assert one concept per test

## What Not To Do

- No `print()` in app code — use `logging`
- No hardcoded credentials or paths
- No logic in `__init__.py` files
