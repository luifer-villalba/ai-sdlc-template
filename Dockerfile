# Dockerfile

FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create non-root user
RUN adduser --disabled-password --gecos "" appuser \
    && chown -R appuser:appuser /app
USER appuser

EXPOSE 8888

# NOTE: Copilot will adjust this command based on your framework during setup.
# FastAPI → uvicorn app.main:app --host 0.0.0.0 --port 8888
# Django  → python manage.py runserver 0.0.0.0:8888
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8888"]
