# 08-configure-namespaces
#
# This scripts create an iterate and production namespace on your Kubernetes cluster
#
# Run this script in the context of the Kubernetes cluster you're installing TAP to.
# Use kubectl config set-context to switch to correct cluster prior to running this script.
#

# Monitor TAP installation

kubectl create ns $ITERATE_NAMESPACE
kubectl create ns $PRODUCTION_NAMESPACE

kubectl create secret docker-registry registry-credentials --docker-server=$MY_REGISTRY --docker-username=$MY_REGISTRY_USER --docker-password=$MY_REGISTRY_PASSWORD -n $ITERATE_NAMESPACE
kubectl create secret docker-registry registry-credentials --docker-server=$MY_REGISTRY --docker-username=$MY_REGISTRY_USER --docker-password=$MY_REGISTRY_PASSWORD -n $PRODUCTION_NAMESPACE

#
# Only add the next lines if you're using the supply_chain: testing or testing_scanning setting in tap-values.yaml
# By default Tekton will pull test images from dockerhub. If you're using another registry for this, access to Dockerhub is not required. 
# The Dockerhub account is required for solves rate-limiting issues: https://docs.docker.com/docker-hub/download-rate-limit/
#
kubectl create secret docker-registry dockerhub-credentials --docker-server=https://index.docker.io/v1/ --docker-username=$DOCKERHUB_USER --docker-password=$DOCKERHUB_PASSWORD --docker-email=$DOCKERHUB_EMAIL -n $ITERATE_NAMESPACE
kubectl create secret docker-registry dockerhub-credentials --docker-server=https://index.docker.io/v1/ --docker-username=$DOCKERHUB_USER --docker-password=$DOCKERHUB_PASSWORD --docker-email=$DOCKERHUB_EMAIL -n $PRODUCTION_NAMESPACE

kubectl apply -f tap-namespaces-roles-accounts.yaml -n $ITERATE_NAMESPACE
kubectl apply -f tap-namespaces-roles-accounts.yaml -n $PRODUCTION_NAMESPACE