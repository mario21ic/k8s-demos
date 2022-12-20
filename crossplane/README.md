Installation:
```
kubectl create namespace crossplane-system
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane --namespace crossplane-system crossplane-stable/crossplane
```

Check:
```
helm list -n crossplane-system
kubectl get all -n crossplane-system

```

CLI:
```
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
sudo mv kubectl-crossplane /usr/local/bin
kubectl crossplane --help
```


Install Pkg:
```
kubectl crossplane install configuration registry.upbound.io/xp/getting-started-with-aws:v1.9.1
watch kubectl get pkg
```

Get aws keyfile:
```
AWS_PROFILE=default && echo -e "[default]\naws_access_key_id = $(aws configure get aws_access_key_id --profile $AWS_PROFILE)\naws_secret_access_key = $(aws configure get aws_secret_access_key --profile $AWS_PROFILE)" > creds.conf
kubectl create secret generic aws-creds -n crossplane-system --from-file=creds=./creds.conf
```

Configure:
```
kubectl apply -f awsProviderConfig.yaml
kubectl get providerconfig
```

Rds example:
```
kubectl apply -f aws_rds.yaml
kubectl get rdsinstance rdsdemo
```

PostgreSQL:
```
kubectl apply -f aws_postgrsql.yaml
kubectl get postgresqlinstance my-db

kubectl describe crossplane -l crossplane.io/claim-name=my-db
```

Test:
```
kubectl apply -g aws_pod.yaml
kubectl get pods

k logs -f see-db
```

