# An engineer was tasked with creating a Kubernetes Pod template for a specific application deployment within the Kubernetes cluster. To ensure easy modification in the future.

# The directive is to generate a template file named ecommerce-t1q2.yml within the /usr/ecommerce-t1q2/ directory on the jump_host. This template will facilitate the creation of a pod named ecommerce-nginx-t1q2, utilizing the nginx image.
# The objective is to establish a template that streamlines the process of generating the designated pod within the Kubernetes cluster.

cd /usr/ecommerce-t1q2
vi ecommerce-t1q2.yml

apiVersion: v1
kind: Pod
metadata:
  name: ecommerce-nginx-t1q2
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80

kubectl create -f /usr/ecommerce-t1q2/ecommerce-t1q2.yml --dry-run=client
kubectl apply -f /usr/ecommerce-t1q2/ecommerce-t1q2.yml



# The Nautilus DevOps team is actively engaged in practicing pods and services deployment on the Kubernetes platform, preparing for the migration of numerous applications to this environment. Recently, a team member has been assigned the task of creating a pod with specific requirements:

# a. Create a pod named pod-nginx-t1q1 utilizing the nginx image, ensuring the use of the latest tag, denoted as nginx:latest (remember to mention tag name while defining the image).
# b. Set the app label to nginx_app_t1q1, and name the container as nginx-container-t1q1.

# This task aims to establish a new pod adhering to defined image specifications and container naming conventions.

vi pod-nginx-t1q1.yml

apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx-t1q1
  labels:
    app: nginx_app_t1q1
spec:
  containers:
  - name: nginx-container-t1q1
    image: nginx:latest
    ports:
    - containerPort: 80

kubectl apply -f pod-nginx-t1q1.yml



# This morning the Nautilus DevOps team rolled out a new release for one of the applications. Recently one of the customers logged a complaint which seems to be about a bug related to the recent release. Therefore, the team wants to rollback the recent release.

# There is a deployment named nginx-deployment-t2q2, roll it back to the previous revision.

kubectl rollout undo deployment nginx-deployment-t2q2
OR,
kubectl rollout history deployment nginx-deployment-t2q2
kubectl rollout undo deployment nginx-deployment-t2q2 --to-revision=<revision_number>



# Recently, the Nautilus DevOps team identified performance issues affecting certain applications on the Kubernetes cluster. Analysis revealed resource constraints, with some applications exhausting memory and CPU, while others were overconsuming resources beyond their requirements. To address this, the team plans to implement resource limits. Here are the details:

# Create a pod named httpd-pod-t3q6 and a container under it named as httpd-container-t3q6, use httpd image with latest tag only (remember to mention the tag i.e httpd:latest), further set the following limits:
# Requests:
    # Memory: 15Mi
    # CPU: 100m
# Limits:
    # Memory: 20Mi
    # CPU: 100m

vi httpd-pod-t3q6.yml

apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod-t3q6
spec:
  containers:
  - name: httpd-container-t3q6
    image: httpd:latest
    resources:
      requests:
        memory: 15Mi
        cpu: 100m
      limits:
        memory: 20Mi
        cpu: 100m

kubectl apply -f httpd-pod-t3q6.yml




# The Nautilus DevOps team is actively creating jobs within the Kubernetes cluster. While they are in the process of finalizing actual scripts/commands, they are presently structuring templates and testing the jobs using placeholder commands. Below are the specifications for creating a job template:

# Create a job named countdown-datacenter-t3q2.
# The spec template should be named as countdown-datacenter-t3q2 (under metadata), and the container should be named as container-countdown-datacenter-t3q2.
# Use image debian with latest tag only and remember to mention tag i.e debian:latest, and restart policy should be Never.
# Use command sleep 5.

vi countdown-datacenter-t3q2.yml

apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-datacenter-t3q2
spec:
  template:
    metadata:
      name: countdown-datacenter-t3q2
    spec:
      containers:
      - name: container-countdown-datacenter-t3q2
        image: debian:latest
        command: ["sleep", "5"]
      restartPolicy: Never

kubectl apply -f countdown-datacenter-t3q2.yml
kubectl get job countdown-datacenter-t3q2 -o yaml



# Despite diligent efforts, the DevOps team encountered difficulties deploying the orange-app-deployment-t4q6 on the Kubernetes cluster. Regrettably, this app is currently inaccessible. Your prompt attention to resolving this issue is crucial.

# The orange-app-deployment-t4q6 is currently facing accessibility issues on the Kubernetes cluster. Your immediate objective is to investigate and rectify this issue to restore the app's functionality and accessibility.
# Please prioritize diagnosing the root cause of the deployment issue and apply necessary fixes to ensure the successful deployment and accessibility of the orange-app-deployment-t4q6.

# Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

kubectl get deployments
kubectl describe deployment orange-app-deployment-t4q6
kubectl get pods -l app=orange-app-deployment-t4q6
kubectl get svc (to verify service existence)

Issues:
1. Selector typo: app=orage-app-t4q6 should be app=orange-app-t4q6
2. Endpoints not populated (due to selector typo)

kubectl describe svc orange-app-service-t4q6



# One of our junior DevOps team members encountered an issue while deploying a stack on the Kubernetes cluster. The webserver-t4q1 pod, with the nginx-container and a sidecar container named sidecar-container, is failing to start and remains in an error state.

# Your task is to investigate and rectify the problem to ensure the successful running state of the webserver-t4q1 pod. The nginx-container uses the nginx:latest image, while the sidecar-container utilizes the ubuntu:latest image. Ensure the webserver-t4q1 pod is running as expected and the application is accessible.

Update the nginx-container image in the webserver-t4q1 pod configuration



# The Nautilus DevOps team recently deployed an application on Kubernetes for testing purposes, the deployment name is httpd-deployment-t5q1. Initially, it was intended to test specific features. However, there's a current need to expose this application to test the frontend.

# To achieve this, a service needs to be created. The service should be named httpd-service-t5q1 with a nodePort set to 30004.

apiVersion: v1
kind: Service
metadata:
  name: httpd-service-t5q1
spec:
  type: NodePort
  selector:
    app: httpd-deployment-t5q1
  ports:
    - protocol: TCP
      port: 80       # Port on the service
      targetPort: 80 # Port on the deployment
      nodePort: 30004 # NodePort

kubectl apply -f httpd-service-t5q1.yaml
kubectl get services

Issue: The deployment label (app=app-t5q1) does not match the service selector (app=httpd-deployment-t5q1).

kubectl patch svc httpd-service-t5q1 -p '{"selector":{"app":"app-t5q1"}}'








