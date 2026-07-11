# Python Pipenv container image

Base Docker image with Python and Pipenv for downstream CI/CD pipelines. Follows [official Python EOL](https://devguide.python.org/versions/) — only non-EOL versions are actively built, but older images remain available on DockerHub.

- **Current build:** `python:3.14-slim` (Debian-based, minimal footprint)
- **Version:** `$(cat VERSION)`
- **Registry:** https://hub.docker.com/r/amanskywalker/python-pipenv

## Supported versions

| Python | EOL | Status |
|--------|-----|--------|
| 3.14 | 2030-10 | Active |
| 3.13 | 2029-10 | Active |
| 3.12 | 2028-10 | Active |
| 3.11 | 2027-10 | Active |
| 3.10 | 2026-10 | Active |

The project started from Python 3.10. Older images can still be pulled by their specific tag.

## Usage

```dockerfile
FROM amanskywalker/python-pipenv:latest

COPY Pipfile Pipfile.lock ./
RUN pipenv install --deploy --ignore-pipfile
```

Pull a specific Python version:

```dockerfile
FROM amanskywalker/python-pipenv:3.13
```

## Tags

| Tag | Description |
|-----|-------------|
| `latest` | Most recent build from `main` |
| `3.14` | Python major.minor version |
| `3.14-slim` | Full Python base image tag |
| `vX.Y.Z` / `X.Y.Z` / `X.Y` | Release version (pushed on tag) |

## CI/CD

| Workflow | Trigger | Action |
|----------|---------|--------|
| [CI](.github/workflows/ci.yml) | PR / push to `main` | Builds image; on `main` pushes to DockerHub + creates `v*` git tag + GitHub Release |

### Releasing

1. Update `VERSION` (e.g. `0.2.0`) in your PR
2. Merge to `main` — CI auto-creates tag `v0.2.0`, pushes the image, and creates a GitHub Release

## Contributing

1. Fork the repo and create a feature branch
2. Update `VERSION` if making a release
3. Update `Dockerfile` if changing the Python base image
4. Open a PR — CI must pass before merging
5. Once merged, a new tag and DockerHub image are published automatically

## License

Copyright 2026 Aman. Licensed under the [Apache License, Version 2.0](LICENSE).