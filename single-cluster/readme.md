# Deployment flow

Prerequisites: https://www.viktorious.nl/2022/11/11/scripted-installation-of-tanzu-application-platform#prereq/

```bash
# Allow run-as-root on TKGs cluster (not required on other Kubernetes flavours)
kubectl create clusterrolebinding default-tkg-admin-privileged-binding --clusterrole=psp:vmware-system-privileged --group=system:authenticated

# Read variables
source 00-set-environment-variables.sh

# If applicable remove previous version of Tanzu CLI:
./01-remove-tanzu-cli.sh

# Install Tanzu CLI:
./02-install-tanzu-cli.sh

# Deploy cluster essentials on cluster (not required for TKGm)
./03-deploy-cluster-essentials.sh

# Relocate images to registry
./04-relocate-images-to-registry.sh

# Add repo to the cluster
./05-add-repo-to-cluster.sh

# Install postgresql + TAP
./06-install-tap.sh

# Install database (if there's already a database available you might want to skip this)
./07-install-database

# Install TAP (finally)
./08-install-tap.sh

# Monitor TAP installation progress
./09-monitor-tap-installation.sh

# Add standard Tekton test scripts (Java test and empty test available now)
./10-add-tekton-testing

# Add default Grype scanning policy
./11-add-scanning-policy.sh

# Configure metadata roles
./12-configure-metadata-roles.sh

# Now some housecleaning scripts

## Run this script after an update to tap-values.yaml
./98-update-tap.sh

## Run this script to remove TAP
/99-remove-tap.sh
```