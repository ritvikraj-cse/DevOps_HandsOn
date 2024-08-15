# The Nautilus DevOps team is testing Ansible playbooks on various servers within their stack. They've placed some playbooks under /home/thor/playbook/ directory on the jump host and now intend to test them on app server 3 in Stratos DC. However, an inventory file needs creation for Ansible to connect to the respective app. Here are the requirements:

# a. Create an ini type Ansible inventory file /home/thor/playbook/inventory on jump host.
# b. Include App Server 3 in this inventory along with necessary variables for proper functionality.
# c. Ensure the inventory hostname corresponds to the server name as per the wiki, for example stapp01 for app server 1 in Stratos DC.

# Note: Validation will execute the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook functions properly without any extra arguments.


ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub tony@172.16.238.10
ssh-copy-id -i ~/.ssh/id_rsa.pub banner@172.16.238.12
cd /home/thor/playbook/

vi inventory

stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa
stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa ansible_become_pass=Ir0nM@n

:wq!

ansible-playbook -i inventory playbook.yml