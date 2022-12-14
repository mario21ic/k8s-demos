Installation:
```
brew install knative/client/kn
brew install knative-sandbox/kn-plugins/quickstart

kn quickstart minikube
minikube status --profile knative

kubectl api-resources
kubectl get all -A

minikube profile list
minikube tunnel --profile knative
```

Simple service:
```
kubectl apply -f 01-basic/01-service.yaml
kubectl get deploy,replicaset,service,pods

kn service list
kn revision list
kn route list

curl http://greeter.default.127.0.0.1.sslip.io
```

Traffic:
```
kubectl apply -f 01-basic/03-service-v1.yaml
kubectl apply -f 01-basic/03-service-v2.yaml
kubectl apply -f 01-basic/04-service-traffic.yaml

curl http://greeter.default.127.0.0.1.sslip.io
```

Scaling:
```
kubectl apply -f 01-basic/05-service-scaling.yaml
hey -c 50 -z 10s "http://prime-generator.default.127.0.0.1.sslip.io/?sleep=3&upto=10000&memload=100"
watch kubectl get pods # another terminal


kubectl apply -f 01-basic/06-service-scaling-max-min.yaml
hey -c 50 -z 10s "http://prime-generator.default.127.0.0.1.sslip.io/?sleep=3&upto=10000&memload=100"
watch kubectl get pods # another terminal
```

Eventing:
```
kubectl apply -f 02-eventing/01-hello-sink.yaml
kn service list
curl -I http://eventinghello.default.127.0.0.1.sslip.io

kubectl apply -f 02-eventing/01-hello-source-cron.yaml
kn source list

stern eventinghello -c user-container # another terminal
watch kubectl get pods # another terminal
```

Channel:
```
kubectl apply -f 02-eventing/02-channel.yaml
kn channel list

kubectl apply -f 02-eventing/02-channel-source.yaml
kn source list
kn source ping describe event-greeter-ping-source

kubectl apply -f 02-eventing/02-channel-servicea.yaml
kubectl apply -f 02-eventing/02-channel-serviceb.yaml
kn service list
curl http://eventinghelloa.default.127.0.0.1.sslip.io
curl http://eventinghellob.default.127.0.0.1.sslip.io

kubectl apply -f 02-eventing/02-channel-servicea-sub.yaml
kubectl apply -f 02-eventing/02-channel-serviceb-sub.yaml
kn subscription list

stern eventinghello -c user-container # another terminal
watch kubectl get pods # another terminal
```
