#!/usr/bin/env bash
# Deploy ELSE API to SnapDeploy (free Small tier).
# Requires: SNAPDEPLOY_API_KEY=sd_pat_… (scope: deploy)
set -euo pipefail

: "${SNAPDEPLOY_API_KEY:?Set SNAPDEPLOY_API_KEY to a deploy-scoped sd_pat_ token}"

API="https://snapdeploy.dev/api/mobile"
AUTH=(-H "X-API-Key: ${SNAPDEPLOY_API_KEY}" -H "Content-Type: application/json" -H "X-SnapDeploy-Client: cursor/else")
NAME="${SNAPDEPLOY_NAME:-else-api}"
MODE="${1:-github}"

echo "==> Checking account"
curl -fsS "${AUTH[@]}" "$API/bootstrap" | python3 -c 'import sys,json; d=json.load(sys.stdin); u=d.get("user") or {}; print("plan=",u.get("plan")); print("containers=",len(d.get("containers") or [])); print("deploys_remaining=",(d.get("deployCap") or {}).get("remaining"))'

if [[ "$MODE" == "image" ]]; then
  echo "==> Create from public image ghcr.io/abhiudayg/else:edge"
  BODY=$(python3 -c "import json; print(json.dumps({'name':'''$NAME''','image':'ghcr.io/abhiudayg/else','imageTag':'edge','port':8081,'memory':512,'environmentVariables':{'SPRING_PROFILES_ACTIVE':'snapdeploy'}}))")
  CREATE=$(curl -fsS "${AUTH[@]}" -X POST "$API/containers" -d "$BODY")
  echo "$CREATE" | python3 -m json.tool
  CID=$(echo "$CREATE" | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d.get("containerId") or d.get("id") or "")')
  [[ -n "$CID" ]] || { echo "No containerId"; exit 1; }
  echo "==> Start $CID"
  curl -fsS "${AUTH[@]}" -X POST "$API/containers/$CID/start" | python3 -m json.tool || true
  curl -fsS "${AUTH[@]}" "$API/containers/$CID" | python3 -m json.tool
  exit 0
fi

SHA=$(git rev-parse --short HEAD 2>/dev/null || echo manual)
BODY=$(python3 -c "import json; print(json.dumps({'repo':'abhiudayg/else','name':'''$NAME''','branch':'main','size':'small','port':8081,'env':{'SPRING_PROFILES_ACTIVE':'snapdeploy'}}))")
echo "==> GitHub deploy abhiudayg/else"
RESP=$(curl -fsS "${AUTH[@]}" -H "Idempotency-Key: else-$SHA" -X POST "$API/deploy" -d "$BODY")
echo "$RESP" | python3 -m json.tool
URL=$(echo "$RESP" | python3 -c 'import sys,json; print(json.load(sys.stdin).get("url") or "")')
DID=$(echo "$RESP" | python3 -c 'import sys,json; print(json.load(sys.stdin).get("deploymentId") or "")')
echo "URL: ${URL:-pending}"
[[ -n "$DID" ]] || exit 0
echo "==> Polling $DID"
for i in $(seq 1 60); do
  ST=$(curl -fsS "${AUTH[@]}" "$API/deployments/$DID")
  STATUS=$(echo "$ST" | python3 -c 'import sys,json; print(json.load(sys.stdin).get("status",""))')
  echo "[$i] $STATUS"
  case "$STATUS" in
    COMPLETED) echo "$ST" | python3 -m json.tool; exit 0 ;;
    FAILED|CANCELLED|ROLLED_BACK) echo "$ST" | python3 -m json.tool; exit 1 ;;
  esac
  sleep 10
done
echo "timed out"; exit 1
