FROM python:3.13-slim-bookworm

LABEL maintainer="amanskywalker <mail@amanskywalker.xyz>"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

# ---- python tooling ----
RUN python -m pip install --upgrade pip && \
    pip install pipenv

RUN python --version && pipenv --version