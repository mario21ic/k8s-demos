ArgoCD:
REPO URL: https://bitnami-labs.github.io/sealed-secrets
CHART: sealed-secrets
VERSION: 2.2.0 (This is a pre-release at the time of writing this guide)
NAMESPACE: kube-system

Generating a secret and encrypting it:
```
echo -n bar | kubectl create secret generic mysecret --dry-run=client --from-file=foo=/dev/stdin -o yaml > mysecret.yaml
kubeseal --controller-name=sealed-secrets --controller-namespace=kube-system --format yaml < mysecret.yaml > mysealedsecret.yaml
```

Applying sealed secret, listing and getting the value:
```
kubectl create -f mysealedsecret.yaml
kubectl get sealedsecret

kubectl get secret mysecret -o yaml
```

Backuping master key:
```
kubectl get secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key -o yaml > master.key
```

Restoring master key:
```
kubectl apply -f master.key
#delete the running pod, to restart it and read the new key
kubectl delete pod -n kube-system -l name=sealed-secrets-controller
```
