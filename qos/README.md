https://kubernetes.io/docs/concepts/workloads/pods/pod-qos/

Apply
```
kubectl apply -f ./
```

Check:
```
kubectl get pod qos-guaranteed -o jsonpath='{.status.qosClass}'
kubectl get pod qos-burstable  -o jsonpath='{.status.qosClass}'
kubectl get pod qos-besteffort -o jsonpath='{.status.qosClass}'
```

Opcional: Genera presión de memoria o CPU en el nodo (por ejemplo con un contenedor stress-ng) y observa el orden de expulsión (eviction) en caso de presión de nodo: BestEffort primero, luego Burstable, finalmente Guaranteed
