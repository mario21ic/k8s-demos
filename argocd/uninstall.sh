#!/bin/bash

kubectl delete -f namespace.yaml
kubectl delete -f ingress-nginx.yaml
kubectl delete -f cert-manager.yaml
kubectl delete -f cert-issuer.yaml
kubectl delete -f argo-cd.yaml -n argocd
kubectl delete -f ingress.yaml
