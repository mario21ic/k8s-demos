
kubectl apply -f pv.yaml
kubectl apply -f web.yaml


kubectl get pods -w -l app=nginx
kubectl get service nginx
kubectl get statefulset web
kubectl get pv
kubectl get pvc


for i in 0 1; do kubectl exec web-$i -- sh -c 'hostname'; done
kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm /bin/sh 
nslookup web-0.nginx
nslookup web-1.nginx
exit


kubectl get pvc -l app=nginx


# Storage
for i in 0 1; do kubectl exec web-$i -- sh -c 'hostname'; done
for i in 0 1; do kubectl exec web-$i -- sh -c 'echo $(hostname) > /usr/share/nginx/html/index.html'; done
for i in 0 1; do kubectl exec -it web-$i -- curl localhost; done
kubectl delete pod -l app=nginx
kubectl get pod -w -l app=nginx
for i in 0 1; do kubectl exec -it web-$i -- curl localhost; done

# Scaling
kubectl get pods -w -l app=nginx
kubectl scale sts web --replicas=5
kubectl get pods -w -l app=nginx
kubectl patch sts web -p '{"spec":{"replicas":3}}'

# Rolling Update
kubectl patch statefulset web -p '{"spec":{"updateStrategy":{"type":"RollingUpdate"}}}'
kubectl patch statefulset web --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"gcr.io/google_containers/nginx-slim:0.8"}]'


