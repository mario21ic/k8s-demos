# MetalLb

Installation:
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.5/config/manifests/metallb-native.yaml
```
Opcional:
Si tienes k3s, segun el link https://metallb.universe.tf/configuration/k3s/ se debe desactivar klipper
Para ello editar el archivo /etc/systemd/system/k3s.service
```
...
ExecStart=/usr/local/bin/k3s \
    server \
	'--disable' \
	'servicelb' \
```
Luego reiniciar:
```
sudo systemctl daemon-reload
sudo systemctl restart k3s
```


Configuration:
```
kubectl apply -f metallb-ipaddresspool.yaml
```

Testing:
```
kubectl apply -f app.yaml
kubectl get svc nginx-lb-svc

curl 192.168.1.55:8080
```
