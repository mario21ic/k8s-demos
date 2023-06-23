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

Create a new release with helmfile:
```
$ helmfile sync
$ helm repo list
$ helm search repo mario21ic
$ helm show chart mario21ic/helloworld

$ helm list -A

$ kubectl get svc,deploy,replicaset,pod
```

Inspect values:
```
$ helm get values myhello-helmfile1
$ helm get values myhello-helmfile2
$ helm get values myhello-helmfile3
```

Releasing with environment vars:
```
$ helmfile --environment production sync
$ helm get values myhello-helmfile2 | grep domain
```


Delete all releases:
```
$ helmfile destroy
```

Based on https://jhooq.com/helmfile-manage-helmchart/
