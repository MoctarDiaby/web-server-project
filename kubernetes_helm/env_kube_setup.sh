#!/bin/bash
pwd

cd templates

pwd

kubectl apply -f mariadb-secrets.yaml
kubectl apply -f mariadb-pv.yaml
kubectl apply -f mariadb-pvc.yaml
kubectl apply -f mariadb-deployment.yaml
kubectl apply -f mariadb-service.yaml

kubectl apply -f wordpress-configmap.yaml
kubectl apply -f wordpress-deployment.yaml
kubectl apply -f wordpress-service.yaml

kubectl apply -f nginx-configmap.yaml
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl apply -f nginx-ingress.yaml

cd ..