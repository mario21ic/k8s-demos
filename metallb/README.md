# MetalLb

Installation:
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.5/config/manifests/metallb-native.yaml
```

Configuration:
```
kubectl apply -f metallb-ipaddresspool.yaml
```

Testing:
```
kubectl apply -f nginx.yaml
kubectl get svc

curl 192.168.1.55:8080
```
