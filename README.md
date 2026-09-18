# kind-lab

Personal **kind** Kubernetes lab for Bradley Sapp (Grove City / Columbus, OH).

**Honesty lock (read this first):**
- This is a **personal lab**, not production Kubernetes.
- Do **not** claim prod K8s / CKA / cluster ownership from this repo alone.
- Infoblox DDI/NIOS + VMware NSX production ownership = DISA role (separate claim).
- CKA = coursework / exam prep **in progress** until scored.

Public repo: https://github.com/sappbr/kind-lab
Desk plan: `sappbr/ats-vet-handoff` → `reports/2026-09-17-k8s-kind-lab-plan.md`

## Prerequisites
- Docker Desktop or Linux Docker
- [kind](https://kind.sigs.k8s.io/)
- kubectl
- Helm 3

## Use it now (5 minutes)
```bash
./scripts/up.sh
kubectl apply -f manifests/demo/
./scripts/netpol-demo.sh
./scripts/rolling-update.sh
./scripts/down.sh
```

Or: `make up demo netpol roll down`

## Honest resume line (only after Definition of Done)
> Built and operate a personal Kubernetes lab (kind): Helm-packaged workloads, rolling updates, Services/Ingress, NetworkPolicy, kubectl troubleshooting.

## Layout
- `kind/cluster.yaml` — multi-node kind config
- `manifests/demo/` — Deployment, Service, NetworkPolicy, curl pods
- `helm/demo/` — thin Helm chart
- `scripts/` — up / down / netpol / rolling-update
- `docs/CLAIM-LANGUAGE.md` — allowed vs forbidden wording

## License
MIT — lab scaffolding only; no employer secrets.
