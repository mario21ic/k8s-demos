helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm search repo stable
helm repo update
helm install happy-panda stable/mariad
helm list
helm status happy-panda
kubectl get pods
kubectl get deploy

helm repo add nginx https://helm.nginx.com/stable
helm search repo nginx
helm install my-ingress-controller nginx/nginx-ingress

helm uninstall happy-panda
helm uninstall my-ingress-controller


helm install full-coral ./mychart
helm ls
helm get manifest full-coral

vim mychart/templates/configmap.yaml
helm install clunky-serval ./mychart
helm get manifest clunky-serval


helm install --debug --dry-run goodly-guppy ./mychart
