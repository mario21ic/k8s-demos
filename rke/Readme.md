vagrant up

ssh-copy-id -i ~/.ssh/id_rsa vagrant@192.168.11.36
ssh-copy-id -i ~/.ssh/id_rsa vagrant@192.168.11.38

rke up --config  cluster.yml
export KUBECONFIG=$PWD/kube_config_cluster.yml

