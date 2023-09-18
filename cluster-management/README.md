# Cluster Management

## High Availability

Stacked etcd - running multiple etcd instances in different control plane nodes
External etcd - running multiple etcd in separate nodes from control plane nodes

## Management Tools

1. kubectl - official command line interface for k8s.
2. kubeadm - used to create k8s clusters.
3. helm - templating and packaging for k8s objects. - charts
4. kompose - translate compose files to k8s objects
5. Kustomize - config management tools

## Safely Draining a k8s Node

Draining - removing containers from a node and potentially moving to another node.
While draining, you might need to ignore DeamonSets which are pods tied to the nodes.

`kubectl drain --ignore-daemonsets <node-name>`

After succeful maintainace you can bring back the node using;

`kubectl uncordon <node-name>`

### Practise

- Create a pod `kubectl apply -f cluster-management/pod.yaml`
- Create a deplyment `kubectl apply -f cluster-management/deployment.yaml`
- Check pods are running. Use wide to include node. `kubectl get pods -n default -o wide`
- Drain the node and see how the pod and deplyment are treated.
- Use force flag to drain the node with the pod `kubectl drain --ignore-daemonsets <node-name> --force`
- Uncordon the node. Important to note that this process does not reschedule pods to to the node.

## Upgrading using kubeadm

Guide - <https://v1-27.docs.kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/>

### Control Plane Upgrade

- Drain the node `kubectl drain --ignore-daemonsets <node-name>`
- Upgrade kubeadm
- Check for upgrade changes `sudo kubeadm upgrade plan v1.27.2`, use respective upgrade version
- Apply upgrade `sudo kubeadm upgrade apply v1.27.2`
- Upgrade kubelet, kubectl to same version. Restart kubelet `sudo systemctl deamon-reload`, `sudo systemctl restart kubelet`
- Finanly uncordon the node

### Worker Node Upgrade

- Drain the node `kubectl drain --ignore-daemonsets <node-name> --force`
- Upgrade kubeadm
- Apply upgrade `sudo kubeadm upgrade apply v1.27.2`
- Upgrade kubelet, kubectl to same version. Restart kubelet `sudo systemctl deamon-reload`, `sudo systemctl restart kubelet`
- Finanly uncordon the node

## Backup and restore etcd

- Backup

```sh
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 \
  --cacert=<trusted-ca-file> --cert=<cert-file> --key=<key-file> \
  snapshot save <backup-file-location>
```

- Restore `ETCDCTL_API=3 etcdctl --endpoints 10.2.0.9:2379 snapshot restore snapshotdb`
