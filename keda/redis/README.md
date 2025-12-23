kubectl apply -f ./

stern -n keda keda --tail=100
k get pods -w

kubectl run -it redis-cli --rm --image=redis --restart=Never -- bash
redis-cli -h redis
> LPUSH myqueue task1
> LPUSH myqueue task2
> LPUSH myqueue task3
> LPUSH myqueue task4
> LPUSH myqueue task5



based on https://www.youtube.com/watch?v=6tm1u57_jmo


