kubectl apply -f pod.yaml
kubectl get pods
kuebctl describe pod/multi-pod

kubectl exec -ti pod/multi-pod -c alpine sh
# ps aux
# apk update
# apk add curl
# curl localhost
# echo "xD" > /tmp/hello.txt
# cat /tmp/hello.txt
# ifconfig

kubectl exec -ti pod/multi-pod -c nginx sh
# ps aux
# apk update
# apk add curl
# curl localhost
# cat /tmp/hello.txt
# ifconfig
