YELLOW='\033[1;33m' # Yellow
BLUE='\033[0;34m' # Blue
NC='\033[0m' # No Color


echo "${YELLOW}1 - Creating namespaces...${NC}"
kubectl apply -f ./k8s/namespaces.yaml


echo "${YELLOW}2 - Creating mongo-secret for each environment namespace...${NC}"
echo "- develop:"
kubectl create secret generic mongo-secret --from-literal=MONGO_INITDB_ROOT_USERNAME=mongouserdev --from-literal=MONGO_INITDB_ROOT_PASSWORD=mongopwd -n develop
echo "- staging:"
kubectl create secret generic mongo-secret --from-literal=MONGO_INITDB_ROOT_USERNAME=mongouserstag --from-literal=MONGO_INITDB_ROOT_PASSWORD=mongopwd -n staging
echo "- production:"
kubectl create secret generic mongo-secret --from-literal=MONGO_INITDB_ROOT_USERNAME=mongouserprod --from-literal=MONGO_INITDB_ROOT_PASSWORD=mongopwd -n production


echo "${YELLOW}3 - Run mongo deployment and service for each environment/namespace${NC}"
echo "- develop:"
kubectl apply -f ./k8s/mongo/mongo.yaml -n develop
echo "- staging:"
kubectl apply -f ./k8s/mongo/mongo.yaml -n staging
echo "- production:"
kubectl apply -f ./k8s/mongo/mongo.yaml -n production


echo "${YELLOW}4 - Creating api-configmap for each environment/namespace${NC}"
echo "- develop:"
kubectl apply -f ./k8s/api/config-map/develop.yaml -n develop
echo "- staging:"
kubectl apply -f ./k8s/api/config-map/staging.yaml -n staging
echo "- production:"
kubectl apply -f ./k8s/api/config-map/production.yaml -n production

echo "${YELLOW}Run api deployment for each environment/namespace${NC}"
echo "- develop:"
kubectl apply -f ./k8s/api/deployment/api.yaml -n develop
echo "- staging:"
kubectl apply -f ./k8s/api/deployment/api.yaml -n staging
echo "- production:"
kubectl apply -f ./k8s/api/deployment/api.yaml -n production

echo "${YELLOW}Run api services for each environment/namespace${NC}"
echo "- develop:"
kubectl apply -f ./k8s/api/services/api-develop-service.yaml
echo "- staging:"
kubectl apply -f ./k8s/api/services/api-staging-service.yaml
echo "- production:"
kubectl apply -f ./k8s/api/services/api-production-service.yaml


echo "${YELLOW}Wait for pods to be running and visit:${NC}"
echo "${BLUE}develop: http://localhost:8080/swagger ${NC}"
echo "${BLUE}staging: http://localhost:8081/swagger ${NC}"
echo "${BLUE}production: http://localhost:8082/swagger ${NC}"
echo "Run ${YELLOW}kubectl get pods --all-namespaces${NC} to check pods status"




