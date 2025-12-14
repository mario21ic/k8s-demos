```
helm repo add kubearmor https://kubearmor.github.io/charts
helm repo update kubearmor
helm upgrade --install kubearmor-operator kubearmor/kubearmor-operator -n kubearmor --create-namespace
kubectl apply -f https://raw.githubusercontent.com/kubearmor/KubeArmor/main/pkg/KubeArmorOperator/config/samples/sample-config.yml
```

kubearmor cli:
```
curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin

karmor probe --full
```

Test Apt policy:
```
kubectl apply -f apt-policy.yaml

kubectl create deployment nginx --image=nginx
POD=$(kubectl get pod -l app=nginx -o name)

kubectl exec -it $POD -- bash -c "apt update && apt install masscan"


karmor logs -n default --json
```

Recommend:
karmor recommend -n default

more info https://docs.kubearmor.io/kubearmor/quick-links/deployment_guide


