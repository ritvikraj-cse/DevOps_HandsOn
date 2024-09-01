# Execute a rolling update for this application, integrating the nginx:1.17 image. The deployment is named nginx-deployment.

kubectl set image deployment/nginx-deployment nginx=nginx:1.17

OR,

kubectl patch deployment nginx-deployment -p '{"spec":{"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.17"}]}}}}'

OR,

kubectl edit deployment nginx-deployment
Update the image field to nginx:1.17 in the editor.
kubectl get deployments -o wide
kubectl describe deployment nginx-deployment
