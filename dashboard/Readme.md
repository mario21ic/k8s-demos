kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl apply -f rbac.yaml

kubectl -n kubernetes-dashboard create token admin-user
kubectl apply -f long-lived-token.yaml
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d

kubectl proxy

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

kubectl run -it hacker-container2 --image=madhuakula/hacker-container --overrides='{"spec": { "nodeSelector": {"kubernetes.io/hostname": "rockpix3"}}}' -- sh
# apk add stress-ng
# stress-ng -c 4
