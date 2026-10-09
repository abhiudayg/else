# ELSE API — GHCR

Image: **`ghcr.io/abhiudayg/else`**

## CI (preferred)

- Push to `main` (backend changes) → `:edge`, `:sha-*`
- Tag `v0.1.0` → `:0.1.0`, `:latest` + GitHub Release

See [`docs/CI.md`](../docs/CI.md).

## Local build (Apple Container)

```bash
cd backend
container build --platform linux/arm64 \
  -t ghcr.io/abhiudayg/else:local .
gh auth token | container registry login ghcr.io -u abhiudayg --password-stdin
container image push ghcr.io/abhiudayg/else:local
```

## Run

```bash
container run --rm -p 8081:8081 ghcr.io/abhiudayg/else:edge
# or: docker run --rm -p 8081:8081 ghcr.io/abhiudayg/else:edge
curl -fsS http://127.0.0.1:8081/api/v1/health
```

## Link package ↔ repository

Dockerfile includes:

```dockerfile
LABEL org.opencontainers.image.source https://github.com/abhiudayg/else
```

Owner namespace must match (`abhiudayg`). After the next image push, GitHub can auto-link the package to the `else` repo from this label.

The canonical image name matches the repository: `ghcr.io/abhiudayg/else`.
(The earlier `else-api` package name can remain as a private leftover; prefer `else`.)
