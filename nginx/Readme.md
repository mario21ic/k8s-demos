## Pods, service clusterIP and proxy ##
kubectl -f pod.yaml
kubectl -f service.yaml
kubectl proxy
http://localhost:8001/api/v1/namespaces/default/services/nginx-cl-svc/proxy/

## Pods, service nodeport and expose ##
kubectl -f deploy.yaml
kubectl -f service.np.yaml
minikube service nginx-np-svc
