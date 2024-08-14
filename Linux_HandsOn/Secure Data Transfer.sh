# A Nautilus developer has stored confidential data on the jump host within Stratos DC. To ensure security and compliance, this data must be transferred to one of the app servers. Given developers lack direct access to these servers, the system admin team has been enlisted for assistance.

# Copy /tmp/nautilus.txt.gpg file from jump server to App Server 3 placing it in the directory /home/code.

scp /tmp/nautilus.txt.gpg banner@172.16.238.12:/home/code/

#scp allows you to copy files between systems in a secure and reliable way, using the same authentication and encryption as SSH.