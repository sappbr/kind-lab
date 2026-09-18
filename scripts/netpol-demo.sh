#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f manifests/demo/
kubectl -n demo rollout status deploy/web --timeout=120s
kubectl wait --for=condition=Ready pod/curl-same-ns -n demo --timeout=60s
kubectl wait --for=condition=Ready pod/curl-other-ns -n default --timeout=60s
echo "=== SAME namespace (should SUCCEED) ==="
kubectl -n demo exec curl-same-ns -- curl -s -o /dev/null -w "%{http_code}\n" http://web.demo.svc.cluster.local/ || true
echo "=== OTHER namespace (should FAIL under NetworkPolicy) ==="
kubectl -n default exec curl-other-ns -- curl -s -m 5 -o /dev/null -w "%{http_code}\n" http://web.demo.svc.cluster.local/ || echo "blocked_or_timeout (expected)"
