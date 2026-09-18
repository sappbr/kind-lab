#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
command -v kind >/dev/null || { echo "Install kind: https://kind.sigs.k8s.io/"; exit 1; }
command -v kubectl >/dev/null || { echo "Install kubectl"; exit 1; }
if kind get clusters 2>/dev/null | grep -qx bradley-lab; then
  echo "Cluster bradley-lab already exists"
else
  kind create cluster --config "$ROOT/kind/cluster.yaml"
fi
kubectl cluster-info --context kind-bradley-lab
echo "Next: kubectl apply -f manifests/demo/"
