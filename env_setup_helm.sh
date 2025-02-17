export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

export my_namespace="test"

kubectl create namespace $my_namespace

echo "Deleting web-server-project installed resources .................."
helm uninstall web-server-project -n $my_namespace
kubectl delete all --all -n $my_namespace
sleep 10
echo "All web-server-project installed resources deleted .................."

echo "Performing  new web-server-project installation .................."
helm install web-server-project kubernetes_helm/ -n $my_namespace

sleep 5
kubectl get deployment -n $my_namespace

kubectl get service -n $my_namespace

kubectl get pods -n $my_namespace
