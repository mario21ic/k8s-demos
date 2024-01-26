Privilege escalation: attempting to escalate privileges
File acess: read or writes to files at well-known locations like /, /usr/bin, etc
Binaries: execution of suspicious binaries, such as opening a shell.

Installation
```
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

helm install falco falcosecurity/falco --namespace falco --create-namespace
```

```
kubectl get all -n falco -o wide
kubectl get pods -n falco -o wide

kubectl logs -f -l app.kubernetes.io/name=falco -n falco -c falco
```


```
kubectl run alpine --image alpine -- sh -c "sleep infinity"
kubectl exec -it alpine -- sh -c "uptime"

kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Notice
```
