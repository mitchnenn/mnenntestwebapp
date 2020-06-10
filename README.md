Helm test install:
helm install --debug --dry-run mnenn-test-web-app ./mnenntestweb

Helm install:
helm install mnenn-test-web-app ./mnenntestweb

Port forward:
kubectl port-forward service/mnenn-test-web-app-service 5004:5004
