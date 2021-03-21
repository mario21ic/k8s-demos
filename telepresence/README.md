# Telepresence
Run a deployment with a service:
```
kubectl apply -f k8s.yaml
```

On the client run a curl:
```
telepresence --docker-run --rm -it pstauffer/curl curl http://hello-world:8000/
```

On the client build a docker image and make a swap:
```
docker build -t hello-dev .
telepresence --swap-deployment hello-world --docker-run --rm -it -v $(pwd):/app hello-dev
```

Run a shell:
```
$ kubectl run curler -ti --rm --image=pstauffer/curl --restart=Never -- sh
# curl http://hello-world:8000 
```

Try making a change in server.py then make a curl again
