# A container named kke-container was created by one of the Nautilus project developers on App Server 1. It was solely for testing purposes and now requires deletion. Execute the following task:

# Delete the kke-container on App Server 1 in Stratos DC.

ssh user@ip
docker ps -a
docker rm -f kke-container