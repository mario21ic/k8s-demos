Install Krew https://krew.sigs.k8s.io/docs/user-guide/setup/install/

```
kubectl krew install minio
kubectl minio init
kubectl minio proxy -n minio-operator
```
