Deploy base:
```
kubectl apply -k base/
```

Deploy staging or prod:
```
kubectl apply -k overlays/staging
kubectl apply -k overlays/prod
kubectl get deploy,service,configmap
```

Deploying on a specific namespace:
```
#kubectl create namespace my-namespace
kubectl apply -k overlays/qa
kubectl get deploy,svc,configmap -n my-namespace
```

Building
```
kustomize build overlays/staging
```


Deleting staging:
```
kubectl delete -k overlays/staging
```
