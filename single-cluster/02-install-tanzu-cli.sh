# 02-instal-tanzu-cli.sh
#
# Download Tanzu CLI from Tanzu Network at https://network.tanzu.vmware.com/
#
# This script runs on MacOS, For Linux:
# - Change download file to tanzu-framework-linux-amd64.tar
# - Change install command to sudo install cli/core/$VERSION/tanzu-core-linux_amd64 /usr/local/bin/tanzu
#

tar -xvf tanzu-framework-darwin-amd64.tar -C $HOME/tanzu
cd $HOME/tanzu
export VERSION=v0.25.0
install cli/core/$VERSION/tanzu-core-darwin_amd64 /usr/local/bin/tanzu
tanzu plugin install --local cli all
tanzu plugin list
tanzu version