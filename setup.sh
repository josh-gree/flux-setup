helm repo add fluxcd https://charts.fluxcd.io
helm repo update

kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/crds.yaml

kubectl create namespace flux

helm upgrade -i flux fluxcd/flux \
--set git.url=git@github.com:josh-gree/flux-setup \
--set git.pollInterval=30s \
--set syncGarbageCollection.enabled=true \
--namespace flux