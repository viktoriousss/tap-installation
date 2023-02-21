# Deployment flow

Prerequisites: https://www.viktorious.nl/2022/11/11/scripted-installation-of-tanzu-application-platform#prereq/

Also make sure you have Helm available on your system.

# Setup environment variables and install Tanzu CLI (if applicable)
First steps, configuring some prerequisites. Edit 00-set-environment-variables.sh so it reflects the settings for your environment.
```bash
# Allow run-as-root on TKGs cluster (not required on other Kubernetes flavours)
kubectl create clusterrolebinding default-tkg-admin-privileged-binding --clusterrole=psp:vmware-system-privileged --group=system:authenticated

# Read variables - required for the other scripts to work
source 00-set-environment-variables.sh

# Removal of Tanzu CLI - only if a previous version of Tanzu CLI is installed on your system.
./01-remove-tanzu-cli.sh

# Install Tanzu CLI - only if Tanzu CLI is not available on your system.
./02-install-tanzu-cli.sh
```

# Prepare Kubernetes environment, registry and deploy database
Kubernetes cluster should be available at this time. You should also have a private registry available. Helm is also required.
```bash
# Deploy cluster essentials on K8S cluster (not required for TKGm, required for TKGs and other K8S distributions)
./03-deploy-cluster-essentials.sh

# Relocate images to your private registry. Not required if you use script 05b-add-repo-to-cluster.
./04-relocate-images-to-registry.sh

# Add repo to the cluster using the relocated images from your private registry. Not required if you use script 05b-add-repo-to-cluster.
./05-add-repo-to-cluster.sh

# Add the repo directly from Tanzu Net registry. Not advised for production, because Tanzu Net registry doesn't have an SLA. Skip scripts 04 & 05.
./05b-add-repo-to-cluster.sh

# Because we're going to install TAP on a single cluster, a iterate and production cluster is created.
./06-configure-namespaces.sh

# Install database (if there's already a database available you might want to skip this) + TAP using Helm.
./07-install-database.sh
```

# Install Tanzu Application Platform
Script 08-install-tap.sh installs TAP (supply_chain: basic).

Script 09-add-tekton-testing.sh creates an initial configuration for Tekton (supply_chain: testing and/or supply_chain: testing_scanning)

Script 10-add-scanning-policy.sh creates an initial configuration for Tekton (supply_chain: testing_scanning)

```bash
# Install TAP (finally)
./08-install-tap.sh

# Add default Tekton scanning policy
./09-add-tekton-testing

# Add default Grype scanning policy
./10-add-scanning-policy.sh
```

# Maintenance scripts
```bash
# Monitor TAP installation progress
./97-monitor-tap-installation

# Run this script after an update to tap-values.yaml
./98-update-tap.sh

# Run this script to remove TAP
/99-remove-tap.sh
```