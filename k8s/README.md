
## Cluster
Create a kind cluster to work (if you don't have one) with open ports
> `kind create cluster --config ./k8s/kind.yaml --name cluster`

https://k3d.io/usage/guides/exposing_services/#2-via-nodeport
https://kind.sigs.k8s.io/docs/user/configuration/#extra-port-mappings


Create mongodb pod & Create mongodb Service
> `kubectl apply -f ./k8s/mongodb.yaml`
(check in: `kubectl get pods`)



Create api pod & Create api Service
> `kubectl apply -f ./k8s/api.yaml`
(check in: `kubectl get pods`)


After all of them are ready go to http://localhost/swagger



## Commands
kubectl get pods
kubectl get endpoints
kubectl get all


