#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

kubectl create namespace argocd
kubectl apply -n argocd -f "$SCRIPTPATH/../manifests/argocd.yaml"
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "ClusterIP"}}'
