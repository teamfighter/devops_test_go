1. `docker-compose up` will build containers and runn them
2. Prepare minikube:
- Install minikube using official documentation
- enable ingress addon: `minikube addons enable ingress` 
3. Install redis:
- `helm repo add bitnami https://charts.bitnami.com/bitnami`
- `helm install redis bitnami/redis --values minikube_files/values-minikube.yml`
4. Install application: 
- `helm install devops-test ./chart/` will deploy app with version 0.0.1 to minikube
5. Add `127.0.0.1 devops-test.example.io` to your /etc/hosts
6. Start tunneling ingress controller: `minikube tunnel` will start tunnel at 80 port


#TODO:
- Add monitoring for k8s
- Application needs correctly configured healthchecks, probably with https://pkg.go.dev/github.com/heptiolabs/healthcheck golang module
- Application security hardening - should be used Hashicorp Vault for storing secrets, such as a Redis connection string
- More precise documentation
