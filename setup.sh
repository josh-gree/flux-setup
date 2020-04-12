helm repo add fluxcd https://charts.fluxcd.io
helm repo update

kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/crds.yaml

kubectl create namespace flux

helm upgrade -i flux fluxcd/flux \
--set git.url=git@github.com:josh-gree/flux-setup \
--namespace flux

helm upgrade -i helm-operator fluxcd/helm-operator \
--set git.ssh.secretName=flux-git-deploy \
--namespace flux