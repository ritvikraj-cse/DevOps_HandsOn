# Create a deployment named nginx to deploy the application nginx using the image nginx:latest (ensure to specify the tag)

vi deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80

kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pods


Access nginx:
kubectl port-forward deploy/nginx 8080:80 &
curl http://localhost:8080