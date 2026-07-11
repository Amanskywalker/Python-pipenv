FROM python:3.14-slim

LABEL maintainer="amanskywalker <mail@amanskywalker.xyz>"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

RUN python -m pip install --upgrade pip pipenv && \
    python --version && pipenv --version