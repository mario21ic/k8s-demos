#!/bin/bash 

watch kubectl exec -ti $(kubectl get pods -l app=nginx -o name --field-selector=status.phase==Running| head -n 1) -- env
