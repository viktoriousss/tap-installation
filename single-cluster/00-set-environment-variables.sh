# 00-set-environment-variables.sh
#
# Run this script by running "source 00-set-environment-variables.sh"
#

# Tanzunet loging credentials
export TANZU_NET_USER=<Tanzu Network Email Address>
export TANZU_NET_PASSWORD=<Tanzu Network Password>

# Private registry details, used for TAP installation and storing container images
export MY_REGISTRY=<Private registry URL - e.g. registry.azurecr.io>
export MY_REGISTRY_USER=<Private registry login>
export MY_REGISTRY_PASSWORD=<Private registry password>
export MY_REGISTRY_INSTALL_REPO=tap-install

# TAP Version you're installing, this case 1.3.0
export TAP_VERSION=1.3.0

# Set iterate & developer namespace-names
export ITERATE_NAMESPACE=tap-iterate
export PRODUCTION_NAMESPACE=tap-production
