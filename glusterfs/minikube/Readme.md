

```
minikube addons enable storage-provisioner-gluster
kubectl -n storage-gluster get pods
kubectl get sc
kubectl apply -f pvc.yaml
kubectl apply -f pods.yaml
```