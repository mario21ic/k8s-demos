# k8s-demos
Demo files to practice with k8s

Create a public ip address
```
$ gcloud compute addresses create kubernetes-ingress --global
```

Deploy:
```
$ kubectl apply -f deployments/nginx.yaml
```

Services type NodePort:
```
$ kubectl apply -f services/nginx.nodeport.yaml
```

Services type NodePort:
```
$ kubectl apply -f services/nginx.ingress.yaml
```

Get public Ip:
```
$ kubectl get ingress
```

To test if a container is mode privileged
```
grep "Cap" /proc/1/status
ls -la /dev/
```
