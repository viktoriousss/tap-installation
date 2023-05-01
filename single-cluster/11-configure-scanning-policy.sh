# 11-configure-scanning-policy.sh
#
# Configure grype default scanning policy
#
kubectl apply -f ./additional-configuration/scanning-grype/scanpolicy.yaml -n $PRODUCTION_NAMESPACE
kubectl apply -f ./additional-configuration/scanning-grype/scanpolicy.yaml -n $ITERATE_NAMESPACE

echo 
echo "--------------------------------------------------------------------------------------------------------------"
echo " Add this token to your tap-values.yaml under proxy.headers.authorization (remove the % at the end if visible)"
echo " Also see: http://captainvirtualization.com/tap-metadatastore-error/"
echo "--------------------------------------------------------------------------------------------------------------"
kubectl get secrets metadata-store-read-client -n metadata-store -o jsonpath="{.data.token}" | base64 -d