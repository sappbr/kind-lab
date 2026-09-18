#!/usr/bin/env bash
set -euo pipefail
kubectl -n demo set image deploy/web web=nginx:1.27
kubectl -n demo rollout status deploy/web --timeout=120s
kubectl -n demo rollout history deploy/web
