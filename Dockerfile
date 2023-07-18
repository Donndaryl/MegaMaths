# Builder stage
FROM python:3.10-slim AS builder

ENV POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_NO_INTERACTION=1 \
    PATH="$POETRY_HOME/bin:$PATH"

SHELL ["/bin/bash", "-o", "pipefail"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl=<latest> \
    && curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app

COPY poetry.lock pyproject.toml ./
COPY ./src ./

RUN poetry install --no-root --no-ansi --without dev --no-cache-dir \
    && poetry build

# Final stage
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

WORKDIR /app

COPY --from=builder /app/.venv ./.venv
COPY --from=builder /app/dist ./dist

RUN pip install ./dist/*.whl && \
    rm -rf ./dist

ENTRYPOINT [ "python", "-m", "mega_calculator" ]
