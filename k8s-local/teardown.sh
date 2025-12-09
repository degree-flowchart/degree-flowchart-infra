#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to the script directory so relative paths work
cd "$SCRIPT_DIR"

echo "Deleting services..."
kubectl delete -f ../../degree-flowchart-ui/k8s/
kubectl delete -f ../../degree-edge-service/k8s/
kubectl delete -f ../../schedule-service/k8s/
kubectl delete -f ../../student-service/k8s/
kubectl delete -f ../../course-service/k8s/

echo "Deleting shared infra..."
kubectl delete -f keycloak.yaml
kubectl delete -f postgres.yaml

echo "Stopping port-forwarding..."
pkill -f "kubectl port-forward"

echo "Teardown complete."
