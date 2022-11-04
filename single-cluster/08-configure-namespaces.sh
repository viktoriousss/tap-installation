# 07-monitor-tap-installation
#
# This scripts monitors the installation of TAP.
#
# Run this script in the context of the Kubernetes cluster you're installing TAP to.
# Use kubectl config set-context to switch to correct cluster prior to running this script.
#

# Monitor TAP installation

kubectl create ns $ITERATE_NAMESPACE
kubectl create ns $PRODUCTION_NAMESPACE

kubectl create secret docker-registry registry-credentials --docker-server=$MY_REGISTRY --docker-username=$MY_REGISTRY_USER --docker-password=$MY_REGISTRY_PASSWORD -n $ITERATE_NAMESPACE
kubectl create secret docker-registry registry-credentials --docker-server=$MY_REGISTRY --docker-username=$MY_REGISTRY_USER --docker-password=$MY_REGISTRY_PASSWORD -n $PRODUCTION_NAMESPACE

kubectl apply -f tap-namespaces-roles-accounts.yaml -n $ITERATE_NAMESPACE
kubectl apply -f tap-namespaces-roles-accounts.yaml -n $PRODUCTION_NAMESPACE