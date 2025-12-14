sudo microk8s enable cilium

cilium hubble enable --ui
cilium status
cilium hubble ui


Prueba:
```
kubectl create ns demo
kubectl -n demo run web --image=nginx --labels app=web
kubectl -n demo expose pod web --port 80
```

kubectl -n demo run client --image=alpine -- sleep 3600
kubectl -n demo exec -it client -- apk add curl
kubectl -n demo exec -it client -- curl web

