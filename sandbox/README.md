```
k apply -f runtime.yaml

k apply -f non-sandbox-pod.yaml
k exec non-sandbox-pod -- dmesg

k apply -f sandbox-pod.yaml
k exec sandbox-pod -- dmesg
```
