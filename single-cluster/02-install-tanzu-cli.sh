# 02-instal-tanzu-cli.sh
#
# Download Tanzu CLI from Tanzu Network at https://network.tanzu.vmware.com/
#
# This script runs on MacOS, For Linux:
# - Change download file to tanzu-framework-linux-amd64.tar
# - Change install command to sudo install cli/core/$VERSION/tanzu-core-linux_amd64 /usr/local/bin/tanzu
#

mkdir $HOME/tanzu
tar -xvf $TANZU_CLI_FILE -C $HOME/tanzu
cd $HOME/tanzu
#use the parameter TANUZ_CLI_VERSION to set VERSION (and follow the format as shared in the TAP documentation)
export TANZU_CLI_NO_INIT=true
sudo install cli/core/$TANZU_CLI_VERSION /usr/local/bin/tanzu
tanzu plugin install --local cli all
tanzu plugin list
tanzu version
