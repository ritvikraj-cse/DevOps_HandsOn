# Create a pod named pod-nginx using the nginx image with the latest tag. Ensure to specify the tag as nginx:latest.

# Set the app label to nginx_app, and name the container as nginx-container.


vi pod-nginx.yaml

apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest


kubectl apply -f pod-nginx.yaml
kubectl get pods pod-nginx




