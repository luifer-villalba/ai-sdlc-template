# Makefile — {PROJECT_NAME}

PYTHON := python3
VENV := .venv
BIN := $(VENV)/bin

.PHONY: install run dev test lint format migrate migration \
        docker-build docker-up docker-down docker-logs sh \
        db-reset clean help

# ---------- Setup ----------

$(VENV):
	@echo "📦 Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install -r requirements-dev.txt
	@echo "✅ Virtual environment ready"

install: $(VENV)  ## Set up venv and install dependencies

# ---------- Local Development ----------

# NOTE: Copilot will adjust this command based on your framework during setup.
# FastAPI  → uvicorn app.main:app --reload --port 8888
# Django   → python manage.py runserver 0.0.0.0:8888
run: $(VENV)  ## Start dev server with auto-reload
	@echo "🚀 Starting dev server..."
	@echo "📍 App:  http://127.0.0.1:8888"
	@echo "📍 Docs: http://127.0.0.1:8888/docs"
	$(BIN)/{RUN_COMMAND}

dev: run  ## Alias for run

test: $(VENV)  ## Run pytest
	@echo "🧪 Running tests..."
	PYTHONPATH=. $(BIN)/pytest || test $$? -eq 5

lint: $(VENV)  ## Check code quality with ruff
	@echo "🔍 Linting with ruff..."
	$(BIN)/ruff check .
	@echo "✅ Lint passed"

format: $(VENV)  ## Format code with ruff
	@echo "🎨 Formatting code..."
	$(BIN)/ruff format .
	@echo "✅ Format complete"

# ---------- Migrations ----------

# NOTE: Copilot will adjust these commands based on your framework during setup.
# FastAPI/Alembic → alembic upgrade head / alembic revision --autogenerate
# Django          → python manage.py migrate / python manage.py makemigrations
migration: $(VENV)  ## Create new migration
	@read -p "Migration name: " name; \
	$(BIN)/{MIGRATION_CREATE_COMMAND} "$$name"

migrate: $(VENV)  ## Apply all pending migrations
	@echo "📋 Running migrations..."
	$(BIN)/{MIGRATION_APPLY_COMMAND}
	@echo "✅ Migrations applied"

# ---------- Docker ----------

docker-build:  ## Build Docker image
	@echo "🏗️  Building Docker image..."
	docker compose build
	@echo "✅ Build complete"

docker-up:  ## Start all services (detached)
	@echo "🚀 Starting services..."
	docker compose up -d
	@echo "✅ Services running"
	@echo "📍 App:  http://127.0.0.1:8888"
	@echo "📍 Docs: http://127.0.0.1:8888/docs"

docker-down:  ## Stop all services
	@echo "⏹️  Stopping services..."
	docker compose down
	@echo "✅ Stopped"

docker-logs:  ## Tail app container logs
	docker compose logs -f app

sh:  ## Open shell in app container
	docker compose exec app bash

# ---------- Database ----------

db-reset:  ## Reset database (drops volume, recreates, applies migrations)
	@echo "🔄 Resetting database..."
	docker compose down -v
	docker compose up -d db app
	@echo "⏳ Waiting for database to be ready..."
	@sleep 5
	@$(MAKE) migrate
	@echo "✅ Database reset complete"

# ---------- Cleanup ----------

clean:  ## Remove caches and virtual environment
	@echo "🧹 Cleaning up..."
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	rm -rf .venv dist build *.egg-info
	@echo "✅ Cleanup complete"

# ---------- Help ----------

help:  ## Show this help message
	@echo ""
	@echo "  {PROJECT_NAME}"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "} {printf "    %-20s %s\n", $$1, $$2}'
	@echo ""
