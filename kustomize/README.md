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

Deploying a new image version:
```
cd base/ && kustomize edit set image mario21ic/nginx:v3 && cd ..
#kustomize build base > base.yaml
kustomize build base | k apply -f -
```

Deploying into a new namespace:
```
cd base/ && kustomize edit set namespace staging && cd ..
kustomize build base | k apply -f -
```
