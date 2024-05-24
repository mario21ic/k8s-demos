```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml

kubectl get all --namespace cert-manager

kubectl get certificates -A

kubectl apply -f test-resources.yaml
kubectl describe certificate -n cert-manager-test
```

Based on https://cert-manager.io/docs/tutorials/acme/nginx-ingress/
