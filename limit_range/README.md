Limit range por default para cada namespace:
```
kubectl apply -f limit-range.yaml
kubectl apply -f pod.yaml
kubectl describe my-nginx # revisar default limits
```

Probando con un request muy grande:
```
kubectl apply -f pod2.yaml
```
