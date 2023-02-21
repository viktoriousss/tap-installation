# Deployment flow

Prerequisites: https://www.viktorious.nl/2022/11/11/scripted-installation-of-tanzu-application-platform#prereq/

# Setup environment variables and install Tanzu CLI (if applicable)
```bash
# Allow run-as-root on TKGs cluster (not required on other Kubernetes flavours)
kubectl create clusterrolebinding default-tkg-admin-privileged-binding --clusterrole=psp:vmware-system-privileged --group=system:authenticated

# Read variables
source 00-set-environment-variables.sh

# If applicable remove previous version of Tanzu CLI:
./01-remove-tanzu-cli.sh

# Install Tanzu CLI:
./02-install-tanzu-cli.sh
```

# Prepare Kubernetes environment, registry and deploy database
```bash
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
```

# Install Tanzu Application Platform
Script 08-install-tap.sh installs TAP (supply_chain: basic).

Script 09-add-tekton-testing.sh creates an initial configuration for Tekton (supply_chain: testing and/or supply_chain: testing_scanning)

Script 10-add-scanning-policy.sh creates an initial configuration for Tekton (supply_chain: testing_scanning)

```bash
# Install TAP (finally)
./08-install-tap.sh

# Monitor TAP installation progress
./09-add-tekton-testing

# Add default Grype scanning policy
./10-add-scanning-policy.sh
```

# Maintenance scripts

```bash
# Monitors TAP installation progress
./97-monitor-tap-installation

# Run this script after an update to tap-values.yaml
./98-update-tap.sh

# Run this script to remove TAP
/99-remove-tap.sh
```