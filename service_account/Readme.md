kubectl apply -f .

kubectl get serviceaccount,role,rolebinding -n coolapp

kubectl auth can-i --as=system:serviceaccount:coolapp:myappid list pods --namespace=coolapp

kubectl auth can-i --as=system:serviceaccount:coolapp:myappid list services --namespace=coolapp
