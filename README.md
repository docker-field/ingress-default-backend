# ingress-default-backend
A simple NGINX server that handles all the URL paths and hosts that Docker Enterprise Layer 7 Routing or the Kubernetes ingress controller doesn't understand.

## Swarm
### Deploy with Docker Enterprise  Layer 7 Routing
1. Deploy a stack using the docker-compose.yml

#### Windows PowerShell
```
${COMPOSE_DOCKER_IMAGE} = "<your docker image with tag>"
docker stack deploy -f docker-compose.yml ingress-default-backend-swarm
```

#### Linux Shell
```
COMPOSE_DOCKER_IMAGE = "<your docker image with tag>"
docker stack deploy -f docker-compose.yml ingress-default-backend-swarm
```

## Kubernetes
### Deploy with stable/nginx-ingress Helm Chart
1. Set the image in the `kube-manifest.yml`
1. Deploy the `kube-manifest.yml` into the `infra` namespace
1. Deploy the stable/nginx-ingress Helm Chart

#### Windows PowerShell
```
helm install stable/nginx-ingress --name nginx-ingess --namespace infra `
--set rbac.create=true `
--set controller.replicaCount=2 `
--set defaultBackend.enabled=false `
--set controller.defaultBackendService="infra/nginx-ingress-docker-backend" `
```

#### Linux Shell
```
helm install stable/nginx-ingress --name nginx-ingess --namespace infra \
--set rbac.create=true \
--set controller.replicaCount=2 \
--set defaultBackend.enabled=false \
--set controller.defaultBackendService="infra/nginx-ingress-docker-backend" 
```
