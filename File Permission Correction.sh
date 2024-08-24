# After conducting a security audit within the Stratos DC, the Nautilus security team discovered misconfigured permissions on critical files. To address this, corrective actions are being taken by the production support team. Specifically, the file named /etc/hosts on Nautilus App 3 server requires adjustments to its Access Control Lists (ACLs) as follows:



# 1. The file's user owner and group owner should be set to root.

sudo chown root:root /etc/hosts

# 2. Others should possess read only permissions on the file.

sudo chmod o=r /etc/hosts

# 3. User ravi must not have any permissions on the file.

sudo setfacl -m u:ravi:--- /etc/hosts

# 4. User jerome should be granted read only permission on the file.

sudo setfacl -m u:jerome:r-- /etc/hosts #setfacl- Set Access Control List.

#Then, verify the permissions:

getfacl /etc/hosts


