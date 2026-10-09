# ELSE API — GHCR

Image: **`ghcr.io/abhiudayg/else-api`**

## CI (preferred)

- Push to `main` (backend changes) → `:edge`, `:sha-*`
- Tag `v0.1.0` → `:0.1.0`, `:latest` + GitHub Release

See [`docs/CI.md`](../docs/CI.md).

## Local build (Apple Container)

```bash
cd backend
container build --platform linux/arm64 \
  -t ghcr.io/abhiudayg/else-api:local .
gh auth token | container registry login ghcr.io -u abhiudayg --password-stdin
container image push ghcr.io/abhiudayg/else-api:local
```

## Run

```bash
container run --rm -p 8081:8081 ghcr.io/abhiudayg/else-api:edge
# or: docker run --rm -p 8081:8081 ghcr.io/abhiudayg/else-api:edge
curl -fsS http://127.0.0.1:8081/api/v1/health
```
