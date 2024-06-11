FROM python:3.12-slim

WORKDIR /usr/src/app
COPY pyproject.toml poetry.lock ./
RUN pip install poetry && poetry install --only main --no-root --no-directory --no-cache
COPY . .
RUN poetry install --only main
ENV PORT=9000 \
    TOKEN=""
ENTRYPOINT ["poetry", "run", "python", "-m", "biliparser"]
