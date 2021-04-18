#!/bin/bash

echo $(kubectl get secret -n argocd argocd-initial-admin-secret -o json|jq -r ".data.password")|base64 --decode
