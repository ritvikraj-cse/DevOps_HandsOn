# One of the Nautilus DevOps team members was working to configure services on a kkloud container that is running on App Server 3 in Stratos Datacenter. Due to some personal work he is on PTO for the rest of the week, but we need to finish his pending work ASAP. Please complete the remaining work as per details given below:

# a. Install apache2 in kkloud container using apt that is running on App Server 3 in Stratos Datacenter.
# b. Configure Apache to listen on port 8085 instead of default http port. Do not bind it to listen on specific IP or hostname only, i.e it should listen on localhost, 127.0.0.1, container ip, etc.
# c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.

ssh user@<App_Server_3_IP>
docker exec -it kkloud /bin/bash
apt update
apt install -y apache2
sed -i 's/Listen 80/Listen 8085/' /etc/apache2/ports.conf # Configure Apache to listen on port 8085
service apache2 restart
apt install -y net-tools #To run netstat
netstat -tlnp | grep 8085 #Verify Apache is running and listening on port 8085