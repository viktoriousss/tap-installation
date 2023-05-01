# 10-add-tekton-testing.sh
#

# Add tekton testing
#
kubectl apply -f  ./additional-configuration/testing-tekton/default-tests-production.yaml -n $PRODUCTION_NAMESPACE
kubectl apply -f  ./additional-configuration/testing-tekton/default-tests-iterate.yaml -n $ITERATE_NAMESPACE