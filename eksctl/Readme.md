eksctl create cluster \                      
--name eks-cpu1 \
--region us-east-1 --zones us-east-1a,us-east-1b \
--nodegroup-name my-group1 \
--node-type t2.medium \
--nodes 2 \
--nodes-min 2 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key my_key_pem \
--managed

eksctl create cluster -f cluster.yaml

Optional: in order to recover k8s credentials
aws eks --region us-east-1 update-kubeconfig --name cluster_name

kubectl get nodes

# GPU

eksctl create cluster \                      
--name eks-gpu1 \
--region us-east-1 --zones us-east-1a,us-east-1b \
--nodegroup-name gpu-workers \
--node-type g4dn.xlarge \
--nodes 1 \
--nodes-min 1 \
--nodes-max 2 \
--ssh-access \
--ssh-public-key my_key_pem \
--managed

eksctl create cluster -f cluster-gpu.yaml

kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml
kubectl get nodes "-o=custom-columns=NAME:.metadata.name,GPU:.status.allocatable.nvidia\.com/gpu"
