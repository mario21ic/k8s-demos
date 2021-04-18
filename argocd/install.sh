#!/bin/bash

kubectl apply -f namespace.yaml
kubectl apply -f ingress-nginx.yaml
kubectl apply -f cert-manager.yaml
sleep 10
kubectl apply -f cert-issuer.yaml
kubectl apply -f argo-cd.yaml -n argocd
sleep 10
kubectl apply -f ingress.yaml
