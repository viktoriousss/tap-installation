# 10-add-tekton-testing.sh
#

# Add tekton testing
#
kubectl apply -f  ./additional-configuration/testing-tekton/default-tests-production.yaml -n $PRODUCTION_NAMESPACE
kubectl apply -f  ./additional-configuration/testing-tekton/default-tests-iterate.yaml -n $ITERATE_NAMESPACE

# Optional, add java specific test
kubectl apply -f  ./additional-configuration/testing-tekton/java-test-pipeline.yaml -n #PUT A NAMESPACE HERE