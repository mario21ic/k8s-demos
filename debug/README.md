First way - share namespace: debugging on unprivileged container:
```
kubectl run nginx --image=nginxinc/nginx-unprivileged
kubectl debug -ti nginx --image=ubuntu --target=nginx
# apt update && apt install -y tcpdump
# tcpdump -i any -nn port 80

kubectl port-forward pod/nginx 8080:80
curl localhost:8080
```

Second way - new process: copy with a new process:
```
kubectl run nginx2 --image=nginxinc/nginx-unprivileged
kubectl debug -ti nginx2 --image=ubuntu --share-processes --copy-to=nginx2-debug
```

Third way - pod failing: create a pod from another one with only one process:
```
kubectl run --image=alpine myapp -- false
kubectl debug myapp -ti --copy-to=myapp-debug --container=myapp -- sh
```

Fourth way - Node: running a simulated ssh:
```
kubectl get nodes
kubectl debug node/pibox -ti --image=ubuntu
```

