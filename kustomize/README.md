Deploy base:
```
kubectl apply -k base/
```

Deploy staging or prod:
```
kubectl apply -k staging
kubectl apply -k prod
kubectl get deploy
```
