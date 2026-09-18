.PHONY: up down demo netpol roll status
up:
	./scripts/up.sh
down:
	./scripts/down.sh
demo:
	kubectl apply -f manifests/demo/
netpol:
	./scripts/netpol-demo.sh
roll:
	./scripts/rolling-update.sh
status:
	kubectl get nodes,pods,svc,netpol -A
