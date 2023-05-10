To prevent the error "An error occurred while loading data from the Metadata Store" a few extra steps have to be executed.

After the (initial) installation of TAP, apply the metadata-store-sa.yaml file
```bash
kubectl apply -f metadata-store-sa.yaml
```

Now you have to retrieve a bearer token using the following command:
```bash
kubectl get secrets metadata-store-read-client -n metadata-store -o jsonpath="{.data.token}" | base64 -d
```

This bearer token should be added to the proxy configuration part of your tap-values.yaml file:

```bash
    proxy:
      /metadata-store:
        target: https://metadata-store-app.metadata-store:8443/api/v1
        changeOrigin: true
        secure: false
        headers:
          Authorization: "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IktaVV9MUFNkV3ptRmtYbG1vdktjMklhUkpVZnY0b1UwaWRwM1RCQlpZTkUifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJtZXRhZGF0YS1zdG9yZSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtZXRhZGF0YS1zdG9yZS1yZWFkLWNsaWVudCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJtZXRhZGF0YS1zdG9yZS1yZWFkLWNsaWVudCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjJlNDY4YThkLTBlNzEtNDUyNi05ZGMxLTQxY2U2MzlkZTVlZSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDptZXRhZGF0YS1zdG9yZTptZXRhZGF0YS1zdG9yZS1yZWFkLWNsaWVudCJ9.FwtOvG7AHuatebyCE7XeakyUj8rNAaTn1AgesTBz8E1aRiLFWjKNygiwio6CQ-bVRoEBtUFNwGE8g1bz_Gwjr8fi_bzi8tvoxwP0BIHvnBvZjQdiHO1ANbhTtnxd33HQcmmfbu0Wd7DSRYd3y-bTOOyCIx1fjgZzW8svjKujWwpBwVB-iN5Tb_CKKwqR98_XXm0GNlErCWJRUO4iPtTSeC2Qzsxjg_YL7GQBOvLMw_84_S1pXh7u0lrNNhbcWGCoWen9O0KRjloiciwkom6SwBNQMLQNGJkb7ZoSIjvQxSWa9IND6a1A77lPS8r6j86j5bc7SAJzQX0ywtqyFSE4Bw"
          X-Custom-Source: project-star
```
Note: This is an example bearer token, replace it with your own token. Don't remove the word Bearer.

Now update your TAP installation using script 98-update-tap.sh

More details available on this website: https://captainvirtualization.com/tap-metadatastore-error/.