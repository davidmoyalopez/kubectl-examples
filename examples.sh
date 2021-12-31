#!/bin/bash

# get describe from secrets

kubectl describe secrets app-secrets

# get password from one secret

kubectl get secret app-secrets --template={{.data.PASSWORD}} | base64 -d

# or

kubectl -n NAMESPACE get secret app-secret -o jsonpath="{.data.username}" | base64 --decode

# get all password from one secret

for i in $(kubectl describe secrets app-secrets | tail -n 7 | cut -d : -f 1); 
do 
    echo $i;  
    kubectl get secret app-secrets --template={{.data.$i}} | base64 -d; 
    echo; 
done