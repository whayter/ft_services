#!/bin/sh

set -euxo pipefail

if [ "$1" = "--install" ]
then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl &&
    chmod +x ./kubectl &&
    sudo mv ./kubectl /usr/local/bin/kubectl &&
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
    chmod +x minikube &&
    sudo mkdir -p /usr/local/bin/ &&
    sudo install minikube /usr/local/bin/
    exit
fi

if [ "$1" = "--start" ] 
then
	minikube start --vm-driver=docker --bootsrapper=kubeadm
    minikube addons enable metrics-server
	minikube addons enable dashboard
    #minikube addons enable metallb

    eval $(minikube docker-env)
    docker build -t my-nginx srcs/nginx > /dev/null
    eval $(minikube docker-env --unset)


    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml 
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f config.yaml
    
	exit
fi

if [ "$1" = "--delete" ] 
then
	docker system prune --force
    kubectl delete -f srcs > /dev/null
	exit
fi