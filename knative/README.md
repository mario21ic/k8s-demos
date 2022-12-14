Installation:
```
minikube start
brew install knative/client/kn
brew install knative-sandbox/kn-plugins/quickstart

kn quickstart minikube
kubectl get all -A

minikube profile list
minikube tunnel --profile knative
```

Simple service:
```
kubectl apply -f basics/01-service.yaml
kubectl get deploy,replicaset,service,pods

kn service list
kn revision list
kn route list

curl http://greeter.default.127.0.0.1.sslip.io
```

Traffic:
```
kubectl apply -f basics/03-service-v1.yaml
kubectl apply -f basics/03-service-v2.yaml
kubectl apply -f basics/04-service-traffic.yaml

curl http://greeter.default.127.0.0.1.sslip.io
```

Scaling:
```
kubectl apply -f basics/05-service-scaling.yaml
hey -c 50 -z 10s "http://prime-generator.default.127.0.0.1.sslip.io/?sleep=3&upto=10000&memload=100"
watch kubectl get pods # another terminal


kubectl apply -f basics/06-service-scaling-max-min.yaml
hey -c 50 -z 10s "http://prime-generator.default.127.0.0.1.sslip.io/?sleep=3&upto=10000&memload=100"
watch kubectl get pods # another terminal
```
