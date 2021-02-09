#!/bin/sh

set -e

eval $(minikube docker-env --unset)
minikube delete
docker network prune --force

if [ "$1" = "--delete" ] 
then
	exit
fi

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

if [ "$1" = "" ] 
then
	minikube start --memory=3000mb --vm-driver=docker --bootstrapper=kubeadm
    sleep 5
	minikube addons enable dashboard
    minikube addons enable metrics-server

    echo "\n->  Building images..."
    eval $(minikube docker-env)
    docker build -t my-nginx srcs/nginx > /dev/null
    docker build -t my-ftps srcs/ftps > /dev/null
    docker build -t my-wordpress srcs/wordpress > /dev/null
    docker build -t my-phpmyadmin srcs/phpmyadmin > /dev/null
    docker build -t my-mysql srcs/mysql > /dev/null
    docker build -t my-influxdb srcs/influxdb > /dev/null
    docker build -t my-telegraf srcs/telegraf > /dev/null
    docker build -t my-grafana srcs/grafana > /dev/null

    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml 
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply --filename srcs/k8s/config.yaml

    kubectl apply --filename srcs/k8s/nginx.yaml
    kubectl apply --filename srcs/k8s/ftps.yaml
    kubectl apply --filename srcs/k8s/wordpress.yaml
    kubectl apply --filename srcs/k8s/phpmyadmin.yaml
    kubectl apply --filename srcs/k8s/mysql.yaml
    kubectl apply --filename srcs/k8s/influxdb.yaml
    kubectl apply --filename srcs/k8s/telegraf.yaml
    kubectl apply --filename srcs/k8s/grafana.yaml

    minikube dashboard
    
	exit
fi