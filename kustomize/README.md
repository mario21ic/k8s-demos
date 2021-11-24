Deploy base:
```
kubectl apply -k base/
```

Deploy staging or prod:
```
kubectl apply -k overlays/staging
kubectl apply -k overlays/prod
kubectl get deploy,service
```

Deleting staging:
```
kubectl delete -k overlays/staging
```
