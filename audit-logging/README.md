
cp policy.yaml /var/lib/rancher/k3s/server/manifests/policy.yaml
```
sudo vim /etc/systemd/system/k3s.service
ExecStart=/usr/local/bin/k3s \
    server \
	'--cluster-cidr=172.31.10.0/24' \
	'--no-deploy' \
	'traefik' \
	'--disable=traefik' \
        '--kube-apiserver-arg=tls-min-version=VersionTLS12' \
        '--kube-apiserver-arg=audit-policy-file=/var/lib/rancher/k3s/server/manifests/policy.yaml' \
        '--kube-apiserver-arg=audit-log-path=/var/log/kubernetes/audit/audit.log' \
        '--kube-apiserver-arg=audit-log-maxsize=3' \
        '--kube-apiserver-arg=audit-log-maxbackup=10' \
        '--kube-apiserver-arg=audit-log-maxage=7' \
	'--kubelet-arg' \
	'container-log-max-files=3' \
	'--kubelet-arg' \
	'container-log-max-size=10Mi' \
```

sudo systemctl daemon-reload
sudo systemctl restart k3s

tail -f /var/log/kubernetes/audit/audit.log

kubectl apply -f deploy.yaml
kubectl apply -f pod.yaml
kubectl apply -f configmap.yaml
