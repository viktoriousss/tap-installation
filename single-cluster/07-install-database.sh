# 07-install-database.sh
#
# Run this script in the context of the Kubernetes cluster you're installing TAP to.
# Use kubectl config set-context to switch to correct cluster prior to running this script.
#

# Install Postgresql for TAP GUI persistence
#

kubectl create ns $POSTGRESNAMESPACE
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install postgresql bitnami/postgresql -n "$POSTGRESNAMESPACE" --set global.postgresql.auth.postgresPassword="$POSTGRESPASSWORD" --set global.postgresql.auth.username="$POSTGRESUSERNAME" --set global.postgresql.auth.password="$POSTGRESUSERPASSWORD"
