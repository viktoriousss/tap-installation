# 00-set-environment-variables.sh
#
# Run this script by running "source 00-set-environment-variables.sh"
#

# Tanzunet loging credentials
#
export TANZU_NET_USER=<Tanzu Network Email Address>
export TANZU_NET_PASSWORD=<Tanzu Network Password>

# Private registry details, used for TAP installation and storing container images
#
export MY_REGISTRY=<Private registry URL - e.g. registry.azurecr.io>
export MY_REGISTRY_USER=<Private registry login>
export MY_REGISTRY_PASSWORD=<Private registry password>
# Name of repository where you want to store TAP installation files
export MY_REGISTRY_INSTALL_REPO=tap-install

# Set iterate & developer namespace-names
#
export ITERATE_NAMESPACE=tap-iterate
export PRODUCTION_NAMESPACE=tap-production

# --------------------- Version specific TAP installation parameters below here ---------------------
#
# Either 1.3.0, 1.3.1, 1.3.2, 1.3.3, 1.3.4 or 1.4.0
#
# Parameters for TAP 1.4 are configured
#
export TAP_VERSION=1.4.0

# Tanzu CLI TAR file - you have to download this file from https://network.tanzu.vmware.com/
# 1.3.x: tanzu-framework-darwin-amd64.tar
# 1.4.0: tanzu-framework-darwin-amd64-v0.25.4.1.tar
#
export TANZU_CLI_FILE=tanzu-framework-darwin-amd64-v0.25.4.1.tar

# Tanzu CLI version - you have to download this file from https://network.tanzu.vmware.com/
# 1.3.x: v0.25.0
# 1.4.x: v0.25.4
#
export TANZU_CLI_VERSION=v0.25.4

# Cluster essentials file - you have to download this file from https://network.tanzu.vmware.com/
# 1.3.x: tanzu-framework-darwin-amd64.tar
# 1.4.0: tanzu-framework-darwin-amd64-v0.25.4.1.tar
#
export TANZU_CLUSTER_ESSENTIALS_FILE=tanzu-cluster-essentials-darwin-amd64-1.4.0.tgz

# Cluster essentials install bundle - this file is available on registry.tanzu.vmware.com
# 1.3.x: registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:54bf611711923dccd7c7f10603c846782b90644d48f1cb570b43a082d18e23b9
# 1.4.0: registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:5fd527dda8af0e4c25c427e5659559a2ff9b283f6655a335ae08357ff63b8e7f
#
export TANZU_CLUSTER_ESSENTIALS_INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:5fd527dda8af0e4c25c427e5659559a2ff9b283f6655a335ae08357ff63b8e7f