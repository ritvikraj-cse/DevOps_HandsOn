# Create a network with-
# network name - blog
# subnet - 172.168.0.0/24 
# iprange - 172.168.0.0/24
# network - macvlan

docker network create blog --driver=macvlan --subnet=172.168.0.0/24 --ip-range=172.168.0.0/24
