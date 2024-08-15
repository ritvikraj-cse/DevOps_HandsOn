# The Nautilus system admins team has rolled out a web UI application for their backup utility on the Nautilus backup server within the Stratos Datacenter. This application operates on port 8087, and firewalld is active on the server. To meet operational needs, the following requirements have been identified:

# Allow all incoming connections on port 8087/tcp. Ensure the zone is set to public.

ssh user@ip
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=8087/tcp --permanent
firewall-cmd --reload
firewall-cmd --zone=public --list-ports
