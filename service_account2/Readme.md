kubectl get svc
kubectl get sa --all-namespaces | grep default
kubectl get sa default -o yaml
kubectl get secret default-token-dffkj -o yaml


## Service Account Default ##
kubectl apply -f pod-default.yaml
kubectl describe pod pod-default
kubectl exec -ti pod-default -- sh
apk add --update curl
curl https://kubernetes/api/v1 --insecure
ls -la /run/secrets/kubernetes.io/serviceaccount/token
cat /run/secrets/kubernetes.io/serviceaccount/token
TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/ --insecure
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/default/pods/ --insecure


## Service Account Custom ##
kubectl apply -f service-account.yaml
kubectl apply -f role.yaml
kubectl apply -f role-binding.yaml
kubectl apply -f pod-sa.yaml
kubectl describe pod pod-default
kubectl exec -ti pod-default -- sh
apk add --update curl
curl https://kubernetes/api/v1 --insecure
ls -la /run/secrets/kubernetes.io/serviceaccount/token
cat /run/secrets/kubernetes.io/serviceaccount/token
TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/ --insecure
curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/default/pods/ --insecure


kubectl apply -f pod-api-default.yaml
curl $(minikube service api-sa-default --url)

kubectl apply -f pod-api-sa.yaml
curl $(minikube service api-demo-sa --url)
