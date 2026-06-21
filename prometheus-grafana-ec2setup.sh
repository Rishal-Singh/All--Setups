Please note that this will work when you have k8s cluster on ec2 it can be any like minikube, kind etc, Helm works with k8s cluster only.
-----------------------------------------------------------------------------------------------------------------------------------------

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm version

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install monitoring \
prometheus-community/kube-prometheus-stack \
-n monitoring \
--create-namespace

kubectl get pods -n monitoring

Access Grafana

For Minikube:

kubectl port-forward svc/monitoring-grafana \
3000:80 \
-n monitoring --address 0.0.0.0

run GRAFANA at background:

nohup kubectl port-forward svc/monitoring-grafana 3000:80 \
-n monitoring --address 0.0.0.0 > grafana-port-forward.log 2>&1 &

open:
http://EC2_PUBLIC_IP:3000

Get password:

kubectl get secret monitoring-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d

Access Prometheus

kubectl port-forward svc/monitoring-kube-prometheus-prometheus \
9090:9090 \
-n monitoring --address 0.0.0.0

Run PROMETHEUS at background

nohup kubectl port-forward svc/monitoring-kube-prometheus-prometheus \
9090:9090 -n monitoring --address 0.0.0.0 \
> prometheus-port-forward.log 2>&1 &

Open:

http://EC2_PUBLIC_IP:9090
