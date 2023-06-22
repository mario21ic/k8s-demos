Create a new deploy using helm:
```
$ helm install myhello-helm ./helloworld
$ helm list

$ kubectl get svc,deploy,replicaset,pod
```

Download and install:
```
wget https://github.com/roboll/helmfile/releases/download/v0.144.0/helmfile_darwin_amd64
mv helmfile_darwin_amd64 /usr/local/bin/
```

Create a new deploy with helmfile:
```
helmfile sync
helm list

$ kubectl get svc,deploy,replicaset,pod
```


