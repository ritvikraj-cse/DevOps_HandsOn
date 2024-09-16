# A junior DevOps team member encountered difficulties deploying a stack on the Kubernetes cluster. The pod fails to start, presenting errors. Let's troubleshoot and rectify the issue promptly.


# There is a pod named webserver, and the container within it is named nginx-container, its utilizing the nginx:latest image.
# Additionally, there's a sidecar container named sidecar-container using the ubuntu:latest image.
# Identify and address the issue to ensure the pod is in the running state and the application is accessible.

kubectl describe pod webserver
kubectl logs webserver -c nginx-container
kubectl logs webserver -c sidecar-container
kubectl get pod webserver -o yaml
kubectl edit pod webserver -> Update the issue and save it.


