# ai-sdlc-template

Reusable AI SDLC base template for Mizulfar projects.
Fork this repo when starting a new project — GitHub Copilot handles the setup automatically.

---

## What's Included

```
ai-sdlc-template/
├── AGENTS.md                                  # AI agent instructions (all tools)
├── copilot-instructions.md                    # GitHub Copilot — setup + conventions
├── Makefile                                   # Dev commands (auto-adjusted by Copilot)
├── pyproject.toml                             # ruff + pytest config
├── Dockerfile                                 # Production-ready container
├── docker-compose.yml                         # App + PostgreSQL
├── requirements.txt                           # Runtime deps (auto-filled by Copilot)
├── requirements-dev.txt                       # Dev deps (auto-filled by Copilot)
├── .env.example                               # Environment variable reference
├── .pre-commit-config.yaml                    # ruff pre-commit hooks
├── .gitignore                                 # Python + Ruler + IDE entries
├── .ruler/
│   └── instructions.md                        # Ruler source of truth → syncs all formats
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
5. Copilot replaces all placeholders and adjusts framework-specific files automatically
6. **Fill in manually** (domain-specific, Copilot can't know these):
   - `AGENTS.md` → Business Domain, Architecture Rules, What Not To Do
   - `.claude/skills/domain/SKILL.md` → entities, rules, edge cases
   - `docs/architecture.md` → system diagram, data flow
   - `docs/decisions.md` → key decisions
7. Run `npx @intellectronica/ruler apply` to sync `.ruler/instructions.md` → all agent formats

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
| `{FRAMEWORK}` | `Django 5 + DRF` or `FastAPI` |
| `{DATABASE}` | `PostgreSQL` |
| `{DEPLOY_PLATFORM}` | `Railway` |
| `{TEST_FRAMEWORK}` | `pytest + pytest-django` or `pytest-asyncio` |
| `{MAIN_APP_DIR}` | `app/` or `config/` |
| `{FIRST_PARTY_MODULES}` | `app, core` |
| `{DB_USER}` | `pharma` |
| `{DB_PASSWORD}` | `pharma` |
| `{DB_NAME}` | `pharmabrain` |
| `{RUN_COMMAND}` | `uvicorn app.main:app --reload --port 8888` |
| `{MIGRATION_APPLY_COMMAND}` | `alembic upgrade head` |
| `{MIGRATION_CREATE_COMMAND}` | `alembic revision --autogenerate -m` |

Then adjust framework-specific files manually (see notes in each file).

---

## Linear

Team UUID: `7620fa65-54ee-4bcb-a640-8bf31deecbf9`
Ticket prefix: MIZ-

---

## Author

Luis Fernando Villalba — [luifer-villalba](https://github.com/luifer-villalba)
Brand: [Mizulfar](https://linkedin.com/in/luis-fernando-villalba)
