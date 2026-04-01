DC := docker compose
RUN_COMMAND ?= python -m http.server 8888
MIGRATION_APPLY_COMMAND ?= echo "No migration apply command configured"
MIGRATION_CREATE_COMMAND ?= echo "No migration create command configured"

.PHONY: build install up run dev down logs sh lint format test check migrate makemigrations clean help

build:  ## Build app image
	$(DC) build app

install: build  ## Alias for build (Docker-first workflow)

up:  ## Start app + database in background
	$(DC) up -d app

run: up  ## Alias for up

dev: up  ## Alias for up

down:  ## Stop all services
	$(DC) down --remove-orphans

logs:  ## Tail app logs
	$(DC) logs -f app

sh: up  ## Open shell in app container
	$(DC) exec app bash

lint:  ## Run ruff checks in container
	$(DC) run --rm --build --remove-orphans app ruff check .

format:  ## Format code with ruff in container
	$(DC) run --rm --build --remove-orphans app ruff format .

test:  ## Run pytest in container
	$(DC) run --rm --build --remove-orphans app pytest || test $$? -eq 5

check: lint test  ## Run base validation suite

migrate:  ## Apply migrations (framework-specific override)
	$(DC) run --rm --build --remove-orphans app sh -lc "$(MIGRATION_APPLY_COMMAND)"

makemigrations:  ## Create migrations (framework-specific override)
	$(DC) run --rm --build --remove-orphans app sh -lc "$(MIGRATION_CREATE_COMMAND)"

clean:  ## Stop services and remove DB volume
	$(DC) down -v --remove-orphans

help:  ## Show available commands
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "} {printf "    %-18s %s\n", $$1, $$2}'
	@echo ""
