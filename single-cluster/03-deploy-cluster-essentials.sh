# 03-deploy-cluster-essentials.sh
#
# This script is only required for non-TKGm clusters (AKS, EKS, GKE, etc.). For TKGs (vSphere with Tanzu) it's also required to install Cluster Essentials.
#
# Run this script in the context of the Kubernetes cluster you're planning to install TAP on.
# Use 'kubectl config set-context <kubernetes context>' to switch to correct cluster prior to running this script.
#
# Download Cluster Essentials from Tanzu Network at https://network.tanzu.vmware.com/
#
# For Linux:
# - Change download file to tanzu-cluster-essentials-linux-amd64-1.3.0.tgz
# 

mkdir $HOME/tanzu-cluster-essentials
tar -xvf tanzu-cluster-essentials-darwin-amd64-1.3.0.tgz -C $HOME/tanzu-cluster-essentials
export INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:54bf611711923dccd7c7f10603c846782b90644d48f1cb570b43a082d18e23b9
export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
export INSTALL_REGISTRY_USERNAME=$TANZU_NET_USER
export INSTALL_REGISTRY_PASSWORD=$TANZU_NET_PASSWORD
cd $HOME/tanzu-cluster-essentials
./install.sh --yes