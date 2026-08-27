
helm repo add cilium https://helm.cilium.io
helm repo update
helm install tetragon cilium/tetragon -n kube-system


kubectl rollout status -n kube-system ds/tetragon -w


kubectl exec -n kube-system -ti daemonset/tetragon -c tetragon -- \
	tetra getevents -o compact



kubectl exec -n kube-system -ti daemonset/tetragon -c tetragon -- \
  tetra getevents -o compact --pods hello-world-66d97767c4-mznkg

kubectl exec -n kube-system -ti daemonset/tetragon -c tetragon -- \
  tetra getevents -o compact --processes curl,python



Based on https://tetragon.io/docs/installation/kubernetes/

