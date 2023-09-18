CLUSTER_NAME := "k8s-playground"

create_cluster:
	@echo "Creating cluster..."
	@kind create cluster --name $(CLUSTER_NAME) --config kind-config.yaml
	@echo "Cluster created"

delete_cluster:
	@echo "Deleting cluster..."
	@kind delete cluster --name $(CLUSTER_NAME)
	@echo "Cluster deleted"