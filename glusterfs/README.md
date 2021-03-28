Prerequisite:
https://github.com/mario21ic/glusterfs-vagrant

Installing endpoints and service:
```
kubectl apply -f glusterfs-endpoints.yaml
kubectl apply -f glusterfs-service.yaml
```

Persistent volume and persistent volume claim:
```
kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
```

Launch pods:
```
kubectl apply -f deploy.yaml
```


More info:
https://github.com/kubernetes/examples/tree/master/volumes/glusterfs
https://ralph.blog.imixs.com/2020/03/03/kubernetes-and-glusterfs/
