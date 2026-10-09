# Deploy ELSE API on SnapDeploy

[SnapDeploy](https://snapdeploy.dev) runs the Spring API on AWS Fargate with HTTPS.
Free tier: Small **512 MB**, auto-sleep after ~15 min idle, **ARM64** builds from GitHub.

## Option A — GitHub + Dockerfile (recommended)

1. Sign in at [snapdeploy.dev](https://snapdeploy.dev) with GitHub.
2. **Deploy** → repository `abhiudayg/else` → branch `main`.
3. Set **root directory** to `backend` (monorepo).
4. Confirm Dockerfile is detected (`backend/Dockerfile`).
5. Port: `8081` (or leave auto — image reads `PORT`).
6. Size: **Small (512 MB)** to stay on the free tier.
7. Env (optional overrides):

| Variable | Value | Notes |
| --- | --- | --- |
| `SPRING_PROFILES_ACTIVE` | `snapdeploy` | Default in image |
| `PORT` | set by platform | Do not hardcode secrets in the image |

8. Deploy → URL like `https://else-api.containers.snapdeploy.app`.

Health probe: SnapDeploy uses Spring Boot **`/actuator/health`** (also available: `/api/v1/health`).

## Option B — Public GHCR image

After making `ghcr.io/abhiudayg/else-api` **public**:

1. Deploy → **Docker image** → `ghcr.io/abhiudayg/else-api:edge` (or `:latest`).
2. Set container port to **8081**.
3. Public images run on **x86-64** on SnapDeploy — our multi-arch GHCR tags include `amd64`.

## After deploy

Point the iOS client at the HTTPS URL:

- Info.plist `ElseAPIBaseURL`, or
- UserDefaults `else.api.baseURL`

Example:

```text
https://else-api.containers.snapdeploy.app
```

Enable cloud assist in the app only when ready: UserDefaults `else.optical.preferAPI = true`.

## Free-tier notes

- Container **sleeps** when idle; first request may take ~60s to wake.
- Disk is **ephemeral** (H2 under `/opt/else/data`) — fine for optional sync demos; use a SnapDeploy DB add-on or Neon for durable data.
- Stay on **Small** + free hours unless you need Always-On ($12/mo).
