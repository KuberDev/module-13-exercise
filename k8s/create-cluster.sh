# Delete kind cluster named cluster if exists
echo "Deleting cluster (if exists)..."
kind delete clusters cluster
echo "Creating cluster..."
kind create cluster --config ./k8s/kind.yaml --name cluster