# The Nautilus DevOps team is establishing a ReplicationController to deploy multiple pods for hosting applications that require a highly available infrastructure. Follow the specifications below to create the ReplicationController:

# Create a ReplicationController using the nginx image, preferably with latest tag, and name it nginx-replicationcontroller.
# Assign labels app as nginx_app, and type as front-end. Ensure the container is named nginx-container and set the replica count to 3.
# All pods should be running state post-deployment.

vi nginx-replicationcontroller.yaml

apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-replicationcontroller
  labels:
    app: nginx_app
    type: front-end
spec:
  replicas: 3
  selector:
    app: nginx_app
    type: front-end
  template:
    metadata:
      labels:
        app: nginx_app
        type: front-end
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest
        ports:
        - containerPort: 80


kubectl apply -f nginx-replicationcontroller.yaml
kubectl get rc
kubectl describe rc nginx-replicationcontroller
kubectl get pods -l app=nginx_app