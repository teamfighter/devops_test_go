1. `docker-compose up` will build containers and runn them
2. Prepare minikube:
- Install
- enable ingress addon
3. `helm install devops-test ./chart/` will deploy app with version 0.0.1 to minikube
4. Add `127.0.0.1 devops-test.example.io` to your /etc/hosts
5. `minikube tunnel` will start tunnel at 80 port


#TODO:
- Add monitoring for k8s
- Application needs correctly configured healthchecks, probably with https://pkg.go.dev/github.com/heptiolabs/healthcheck golang module
- More precise documentation
