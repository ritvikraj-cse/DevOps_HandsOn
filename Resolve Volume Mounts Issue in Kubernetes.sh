# We encountered an issue with our Nginx and PHP-FPM setup on the Kubernetes cluster this morning, which halted its functionality. Investigate and rectify the issue:

# The pod name is nginx-phpfpm and configmap name is nginx-config. Identify and fix the problem.
# Once resolved, copy /home/thor/index.php file from the jump host to the nginx-container within the nginx document root. After this, you should be able to access the website using Website button on the top bar.

kubectl get pods
kubectl get configmap
kubectl describe configmap nginx-config
kubectl get pod nginx-phpfpm -o yaml  > /tmp/nginx.yaml
cat /tmp/nginx.yaml
cat /tmp/nginx.yaml  |grep /usr/share/nginx/html   -> Edit the nginx.yaml file and changed ‘/usr/share/nginx/html’ to ‘/var/www/html’
kubectl replace -f /tmp/nginx.yaml --force
kubectl get pods
kubectl cp  /home/thor/index.php  nginx-phpfpm:/var/www/html -c nginx-container
kubectl exec -it nginx-phpfpm -c nginx-container  -- curl -I  http://localhost:8099



