Custom resource definition AlbertCrd:
```
k apply -f crd.yml
k api-resources
```

Object:
```
k apply -f miobj.yml
k get ac
k describe ac
k describe albertcrd
```


Controller with Kuberneters Operator Framework
```
pip install -r requirements.txt
kopf run controller.py

kubectl apply -f miobj2.yml
kubectl apply -f miobj.yml # modify first
```


Deploy Controller:
```
kubectl apply -f controller.py
```

Based on https://www.albertcoronado.com/2025/01/14/tutorial-operadores-kubernetes
