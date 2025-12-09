#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to the script directory so relative paths work
cd "$SCRIPT_DIR"

# Apply shared infra
kubectl apply -f postgres.yaml
kubectl apply -f keycloak.yaml

# Apply services
kubectl apply -f ../../course-service/k8s/
kubectl apply -f ../../student-service/k8s/
kubectl apply -f ../../schedule-service/k8s/
kubectl apply -f ../../degree-edge-service/k8s/
kubectl apply -f ../../degree-flowchart-ui/k8s/

echo "Deployment applied. Use 'kubectl get pods' to check status."
echo "Don't forget to port-forward:"
echo "kubectl port-forward svc/degree-edge-service 9000:9000 &"
echo "kubectl port-forward svc/degree-flowchart-ui 4200:80 &"
echo "kubectl port-forward svc/keycloak 8080:8080 &"
