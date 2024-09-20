# We are working on an application that will be deployed on multiple containers within a pod on Kubernetes cluster. There is a requirement to share a volume among the containers to save some temporary data. The Nautilus DevOps team is developing a similar template to replicate the scenario. Below you can find more details about it.

# Create a pod named volume-share-datacenter.
# For the first container, use image centos with latest tag only and remember to mention the tag i.e centos:latest, container should be named as volume-container-datacenter-1, and run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/official.
# For the second container, use image centos with the latest tag only and remember to mention the tag i.e centos:latest, container should be named as volume-container-datacenter-2, and again run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/demo.
# Volume name should be volume-share of type emptyDir.
# After creating the pod, exec into the first container i.e volume-container-datacenter-1, and just for testing create a file official.txt with any content under the mounted path of first container i.e /tmp/official.
# The file official.txt should be present under the mounted path /tmp/demo on the second container volume-container-datacenter-2 as well, since they are using a shared volume.

apiVersion: v1
kind: Pod
metadata:
  name: volume-share-datacenter
spec:
  containers:
  - name: volume-container-datacenter-1
    image: centos:latest
    command: ["sleep", "infinity"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/official
  - name: volume-container-datacenter-2
    image: centos:latest
    command: ["sleep", "infinity"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/demo
  volumes:
  - name: volume-share
    emptyDir: {}

kubectl apply -f volume-share-pod.yaml
kubectl get pods
kubectl exec -it volume-share-datacenter -c volume-container-datacenter-1 -- /bin/bash
echo "Hello, world!" > /tmp/official/official.txt
kubectl exec -it volume-share-datacenter -c volume-container-datacenter-2 -- /bin/bash
ls /tmp/demo/