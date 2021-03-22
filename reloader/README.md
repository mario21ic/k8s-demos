Install reloader
```
kubectl apply -f reloader.yaml
```

Create configmap and deployment
```
kubectl apply -f configmap.yaml
kubectl apply -f deploy.yaml
```

Modify values of configmap.yaml and update in k8s:
```
kubectl apply -f configmap.yaml
```

Check pods
```
kubectl get pods
kubectl exec -ti <pod-id> -- env
```

More info https://github.com/stakater/Reloader
