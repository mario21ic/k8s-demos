List current priority classes:
```
kubectl get priorityclass
```

New Priority classes:
```
kubectl apply -f 0-priorities.yaml
```

Testin:
```
kubectl apply -f 1-low-priority.yaml
```
