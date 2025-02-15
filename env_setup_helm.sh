export KUBECONFIG=/etc/rancher/k3s/k3s.yaml


helm uninstall web-server-project -n test
kubectl delete all --all -n test

sleep 10

helm install web-server-project kubernetes_helm/ -n test

