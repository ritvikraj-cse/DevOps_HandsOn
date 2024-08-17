# An issue has arisen with a static website running in a container named nautilus on App Server 1. To resolve the issue, investigate the following details:

# a. Check if the container's volume /usr/local/apache2/htdocs is correctly mapped with the host's volume /var/www/html.

# b. Verify that the website is accessible on host port 8080 on App Server 1. Confirm that the command curl http://localhost:8080/ works on App Server 1.

ssh username@app-server-1
docker inspect nautilus
# Look for the Mounts section in the output
"Mounts": [
    {
        "Type": "bind",
        "Source": "/var/www/html",
        "Destination": "/usr/local/apache2/htdocs",
        ...
    }
]
ls -l /var/www/html #Verify the Host Directory

curl http://localhost:8080/ #Verify Website Accessibility on Host Port 8080
docker ps | grep nautilus #Check if the nautilus container is running:
docker start nautilus
docker inspect nautilus | grep -i "8080" #Check port mapping
docker restart nautilus
exit



