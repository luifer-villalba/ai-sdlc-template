# ai-sdlc-template

Reusable AI SDLC base template for Mizulfar projects.
Fork this repo when starting a new project — GitHub Copilot handles the setup automatically.
The template is framework-agnostic and starts from a neutral runnable base.

---

## What's Included

```
ai-sdlc-template/
├── .ruler/instructions.md                     # Canonical source for generated agent instructions
├── copilot-instructions.md                    # GitHub Copilot — setup + conventions
├── Makefile                                   # Docker-first dev commands + validation
├── pyproject.toml                             # ruff + pytest config
├── Dockerfile                                 # Dev/default container (replace or extend for production)
├── docker-compose.yml                         # Generic app service
├── requirements.txt                           # Runtime deps (project-specific)
├── requirements-dev.txt                       # Dev/test deps
├── .env.example                               # Environment variable reference
├── .pre-commit-config.yaml                    # ruff pre-commit hooks
├── .gitignore                                 # Python + Ruler + IDE entries
├── .github/
│   └── instructions/
│       ├── general.instructions.md            # Setup flow + workflow conventions
│       └── python.instructions.md             # Applied to **/*.py
├── .claude/
│   └── skills/
│       ├── domain/SKILL.md                    # Business domain knowledge (fill manually)
│       └── dev-workflow/SKILL.md              # Dev workflow + Linear conventions
└── docs/
    ├── architecture.md                        # System diagram + stack decisions
    └── decisions.md                           # Decisions log
```

---

## Setup

1. **Fork or use as template** on GitHub
2. **Open in VS Code** with GitHub Copilot enabled
3. **Open Copilot Chat** and type anything
4. Copilot detects `{PLACEHOLDER}` values and asks you 10 setup questions
5. Copilot replaces placeholders and applies framework-specific adjustments
6. Run `npx @intellectronica/ruler apply` to generate tool-specific instruction files (including `AGENTS.md`) from `.ruler/instructions.md`
7. **Fill in manually** (domain-specific, Copilot cannot infer):
   - `.claude/skills/domain/SKILL.md` → entities, rules, edge cases
   - `docs/architecture.md` → system diagram, data flow
   - `docs/decisions.md` → key decisions
8. Validate base health:
    - `make check`
    - `make lint`
    - `make test`

---

## Local Development Standard

This template is Docker-first for local development.

- Start stack: `make up`
- Tail logs: `make logs`
- Stop stack: `make down`
- Validate: `make check`

Framework-specific runtime and migration commands are configurable:

- `APP_RUN_COMMAND` in `.env` controls container startup command
- `MIGRATION_APPLY_COMMAND` and `MIGRATION_CREATE_COMMAND` can be overridden when running `make`

Examples:

- `APP_RUN_COMMAND=uvicorn app.main:app --host 0.0.0.0 --port 8888 --reload`
- `APP_RUN_COMMAND=npm run dev -- --host 0.0.0.0 --port 8888`

Avoid mixing a local `venv` workflow with Docker in the same project bootstrap.

---

## Manual Fallback (without Copilot)

Global search & replace (`Ctrl+Shift+H` in VS Code):

| Placeholder | Example |
|-------------|---------|
| `{PROJECT_NAME}` | `Vitrina API` |
| `{PROJECT_SLUG}` | `vitrina-api` |
| `{REPO_NAME}` | `vitrina-api` |
| `{GITHUB_USERNAME}` | `luifer-villalba` |
| `{ONE_SENTENCE_DESCRIPTION}` | `An online catalog platform for local pharmacies` |
| `{FRAMEWORK}` | `FastAPI`, `Next.js`, `React`, etc. |
| `{DATABASE}` | `PostgreSQL` |
| `{DEPLOY_PLATFORM}` | `Railway` |
| `{TEST_FRAMEWORK}` | `pytest`, `pytest-asyncio`, `vitest`, etc. |
| `{MAIN_APP_DIR}` | `app/` or `config/` |
| `{FIRST_PARTY_MODULES}` | `app, core` |

Then run framework adjustments in setup instructions, run `npx @intellectronica/ruler apply`, and validate with `make check`.

---

## Compatibility Defaults

- Default runtime base: Python 3.12 container with no framework preselected
- Setup should only add dependencies and commands for the framework(s) the user selects

---

## Author

Luis Fernando Villalba — [luifer-villalba](https://github.com/luifer-villalba)
Brand: [Mizulfar](https://linkedin.com/in/luis-fernando-villalba)
