# Builder stage
FROM python:3.10-slim AS builder

ENV POETRY_HOME="/opt/poetry"
ENV POETRY_VIRTUALENVS_IN_PROJECT=1
ENV POETRY_NO_INTERACTION=1
ENV PATH="$POETRY_HOME/bin:$PATH"

# Update the package manager and install curl
RUN apt-get update && apt-get install -y --no-install-recommends curl

# Install poetry
WORKDIR /app
RUN curl -sSL https://install.python-poetry.org | python3 -

# Copy the necessary files
WORKDIR /app
COPY poetry.lock pyproject.toml ./
COPY ./src ./

# Install project dependencies and build the project
RUN poetry install --no-root --no-ansi --without dev --no-cache-dir \
    && poetry build

# Final stage
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app/.venv ./.venv
COPY --from=builder /app/dist ./dist

# Install the project as a package and remove build files
RUN pip install --no-cache-dir ./dist/*.whl && \
    rm -rf ./dist

ENTRYPOINT [ "python", "-m", "mega_calculator" ]
