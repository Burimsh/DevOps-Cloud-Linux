#!/bin/bash
set -e

echo "=== Kubernetes Networking Lab Test ==="

# Pod IPs
POD_A=$(kubectl get pod pod-a -o jsonpath='{.status.podIP}')
POD_B=$(kubectl get pod pod-b -o jsonpath='{.status.podIP}')

echo "[1] Pod-to-Pod by IP"
kubectl exec pod-a -- ping -c 3 $POD_B

echo "[2] Pod-to-Service by DNS"
kubectl exec pod-a -- wget -qO- http://svc-b

echo "[3] Pod DNS check for kubernetes.default"
kubectl exec pod-a -- nslookup kubernetes.default.svc.cluster.local

echo "[4] CoreDNS reachable"
kubectl exec pod-a -- ping -c 3 10.96.0.10

echo "[✔] All networking tests passed!"
