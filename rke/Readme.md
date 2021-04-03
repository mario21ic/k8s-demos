Set up
```
vagrant up

ssh-copy-id -i ~/.ssh/id_rsa vagrant@192.168.11.36
ssh-copy-id -i ~/.ssh/id_rsa vagrant@192.168.11.38

rke up --config cluster.yml
export KUBECONFIG=$PWD/kube_config_cluster.yml
```

Verify:
```
kubectl get nodes
kubectl apply -f ../deployment/deploy_rollout.yaml
```

Fix error:

Warning  NetworkNotReady  52s (x151 over 5m53s)  kubelet            network is not ready: runtime network not ready: NetworkReady=false reason:NetworkPluginNotReady message:docker: network plugin is not ready: cni config uninitialized

```
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
```



