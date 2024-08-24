# The Nautilus DevOps team needs to copy data from the jump host to all application servers in Stratos DC using Ansible. Execute the task with the following details:

ssh-keygen 
ssh-copy-id -i ~/.ssh/id_rsa.pub tony@172.16.238.10
ssh-copy-id -i ~/.ssh/id_rsa.pub steve@172.16.238.11
ssh-copy-id -i ~/.ssh/id_rsa.pub banner@172.16.238.12

# a. Create an inventory file /home/thor/ansible/inventory on jump_host and add all application servers as managed nodes.
vi inventory

[app_servers]
stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa
stapp02 ansible_host=172.16.238.11 ansible_user=steve ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa
stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa

# b. Create a playbook /home/thor/ansible/playbook.yml on the jump host to copy the /usr/src/data/index.html file to all application servers, placing it at /opt/data.
vi playbook.yml

---
- name: Copy index.html to all application servers
  hosts: app_servers
  become: yes
  tasks:
    - name: Copy index.html to /opt/data
      copy:
        src: /usr/src/data/index.html
        dest: /opt/data/index.html
#        mode: '0644'

# Note: Validation will run the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook functions properly without any extra arguments.
