Dentro de un pod:
```
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/<nombre-nodo>
```

Setear los configs:
```
[default]
aws_access_key_id = xxxx
aws_secret_access_key = xxxxx
aws_session_token = "xxxx"
```

Conectar y probar:
```
aws eks update-kubeconfig --region us-east-1 --name <nombre-cluster>
kubectl get nodes,pods
```

