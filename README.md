# Certified Kubernates Administrator (CKA) Notes

## Prerequisite

1. Docker - <https://docs.docker.com/get-docker/>
2. kubectl - <https://kubernetes.io/docs/tasks/tools/>
3. kind cluster with 3 nodes - Run `make create_cluster` - <https://kind.sigs.k8s.io/>

## Architectural Overview

### Control Plane

Multiple components managing the cluster

#### Control Plane Components

kube-api-server - provides k8s API
Etcd - provides backend data store
kube-scheduler - handles scheduling. Process of selecting available node in cluster
kube-controller manager - manages utilities
cloud-controller-manager - interfaces with cloud providers

### k8s Nodes

The machines where the containers managed by the clusters run.

#### k8s Nodes Components

kubelet - k8s agent that runs on each node. Comunicates with control plane and ensures containers run as intructed. Also handles container status.
container runtime - container software used to run your container. Not included in k8s.
kube-proxy - network proxy for networking between nodes

### Using namespaces

Its important to note that most commands you might need to specify the namespace. If not specified, the `default` namespace will be used.
To get all namespaces - `kubectl get namespaces`
To create a namespace - `kubectl create namespace test`
To delete a namespace - `kubectl delete namespaces test`
Example - Getting pods from a specific namespace - `kubectl get pods -n kube-system` or for all pods `kubectl get pods --all-namespaces`
