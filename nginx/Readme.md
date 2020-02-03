kubectl -f pod.yaml
kubectl -f service.yaml
kubectl proxy
http://localhost:8001/api/v1/namespaces/default/services/nginx-cl-svc/proxy/
