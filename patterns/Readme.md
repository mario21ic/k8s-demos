## Sidecar
kubectl apply -f sidecar.yaml
kubectl exec pod-with-sidecar -c sidecar-container -it sh
apk update && apk add curl
curl 'http://localhost:80/app.txt'

## Adapter
kubectl apply -f adapter.yaml
kubectl exec pod-with-adapter -c app-container -it sh
cat /var/log/top.txt
cat /var/log/status.txt


## Ambassador

