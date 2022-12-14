Installation:
```
minikube start --profile custom
skaffold config set --global local-cluster true
eval $(minikube -p custom docker-env)
```

Running:
```
skaffold dev
kubectl get deploy,pods
```

Testing:
```
kubectl port-forward pod/nginx-dp-7db98cd5bd-bsczn 8080:80
curl http://localhost:8080/
```

