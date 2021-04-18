
Create K8s cluster
```
kind.sh
```

Install Argocd
```
install.sh
get-password.sh
```
Open on browser https://argocd.local/

Download and install cli:
```
wget https://github.com/argoproj/argo-cd/releases/download/v2.0.1/argocd-linux-amd64
chmod +x argocd-linux-amd64
sudo mv argocd-linux-amd64 /usr/local/bin/argocd
argocd version
argocd login argocd.local
```

Install App
```
kubectl apply -f 05-reloader-app.yaml
argocd app list
```
Check the app on argocd web

Modify configmap, commit and Check changes
```
vim ../reloader/configmap.yaml
watch.sh
```
