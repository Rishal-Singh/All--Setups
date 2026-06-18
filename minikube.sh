Minikube setup 
=========================================================================================

3 Requirement : Docker, Kubectl and Minikube.
=========================================================================================

sudo apt update -y
sudo apt upgrade -y

Docker:
---------

sudo apt install docker.io -y

sudo systemctl enable docker
sudo systemctl start docker

docker --version

sudo usermod -aG docker $USER
newgrp docker

docker ps

Kubectl :
---------------

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

kubectl version --client

Minikube :
----------
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube version

minikube start --driver=docker

minikube status
kubectl get nodes

addons minikube:
minikube addons enable metrics-server
minikube addons enable ingress
minikube addons enable dashboard

commond error:
------------------
kubectl port-forward svc/noteapp-service 8000:80 --address 0.0.0.0
