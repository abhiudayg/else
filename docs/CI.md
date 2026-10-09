# CI / CD

| Workflow | Trigger | What it does |
| --- | --- | --- |
| [`ci.yml`](../.github/workflows/ci.yml) | PR + push to `main` | Maven test/package, Docker build smoke (no push) |
| [`ghcr-edge.yml`](../.github/workflows/ghcr-edge.yml) | Push to `main` touching `backend/**` | Multi-arch push to GHCR (`edge`, `sha-*`) |
| [`publish.yml`](../.github/workflows/publish.yml) | Tag `v*` or manual dispatch | Multi-arch GHCR (`version`, `latest`) + GitHub Release + jar |

## Image

```text
ghcr.io/abhiudayg/else-api:latest   # release tags
ghcr.io/abhiudayg/else-api:edge     # main branch
ghcr.io/abhiudayg/else-api:0.1.0    # semver from v0.1.0
```

Built for `linux/amd64` and `linux/arm64`. Local Apple Container builds: see [`deploy/ghcr.md`](../deploy/ghcr.md).

## Release

```bash
git tag v0.1.0
git push origin v0.1.0
```

Or **Actions → Publish → Run workflow**.

Package visibility: set `else-api` to public under GitHub → Packages if anonymous pulls are needed.
