# Certified Kubernates Administrator Notes

## Prerequisite

Docker - <https://docs.docker.com/get-docker/>
kubectl - <https://kubernetes.io/docs/tasks/tools/>
kind cluster with 3 nodes `make create_cluster` - <https://kind.sigs.k8s.io/>

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
