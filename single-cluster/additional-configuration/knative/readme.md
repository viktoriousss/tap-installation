# Patch guide

kubectl patch configmap config-network -n knative-serving --patch-file patch-network-tls.yaml

kubectl patch configmap config-certmanager -n knative-serving --patch-file patch-certmanager-tls.yaml
