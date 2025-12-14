Privilege escalation: attempting to escalate privileges
File acess: read or writes to files at well-known locations like /, /usr/bin, etc
Binaries: execution of suspicious binaries, such as opening a shell.

Installation
```
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

helm install --replace falco --namespace falco --create-namespace --set tty=true falcosecurity/falco
```

Check installation
```
kubectl get all -n falco -o wide
kubectl get pods -n falco -o wide

kubectl wait pods --for=condition=Ready --all -n falco
kubectl logs -f -l app.kubernetes.io/name=falco -n falco -c falco
```


Test
```
kubectl create deployment nginx --image=nginx
kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- cat /etc/shadow
kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Warning
```

Custom rule:
```
helm upgrade --namespace falco falco falcosecurity/falco --set tty=true -f falco_custom_rules_cm.yaml
kubectl wait pods --for=condition=Ready --all -n falco

kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- touch /etc/test_file_for_falco_rule
kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Warning
```


Deploy Falcosidekick and Falcosidekick UI 
```
helm upgrade --namespace falco falco falcosecurity/falco -f falco_custom_rules_cm.yaml --set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true
kubectl -n falco get svc

kubectl -n falco port-forward svc/falco-falcosidekick-ui 2802
kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- cat /etc/shadow
```

Forwardevents to Slack webhook
```
helm upgrade --namespace falco falco falcosecurity/falco \
  --set falcosidekick.enabled=true \
  --set falcosidekick.config.slack.webhookurl=YOUR_WEBHOOK_URL_HERE \
  --set falcosidekick.config.slack.minimumpriority=notice
```


Uninstall
```
helm -n falco uninstall falco
```
