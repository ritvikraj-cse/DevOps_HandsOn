# The Nautilus DevOps team is testing various Ansible modules on servers in Stratos DC. They're currently focusing on file creation on remote hosts using Ansible. Here are the details:

# a. Create an inventory file ~/playbook/inventory on jump host and include all app servers.

# b. Create a playbook ~/playbook/playbook.yml to create a blank file /usr/src/code.txt on all app servers.

# c. Set the permissions of the /usr/src/code.txt file to 0755.

# d. Ensure the user/group owner of the /usr/src/code.txt file is tony on app server 1, steve on app server 2 and banner on app server 3.

ssh-keygen 
ssh-copy-id -i ~/.ssh/id_rsa.pub tony@172.16.238.10
ssh-copy-id -i ~/.ssh/id_rsa.pub steve@172.16.238.11
ssh-copy-id -i ~/.ssh/id_rsa.pub banner@172.16.238.12

cd ~/playbook/inventory

[app_servers]
stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa
stapp02 ansible_host=172.16.238.11 ansible_user=steve ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa
stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_ssh_private_key_file=/home/thor/.ssh/id_rsa

cd ~/playbook/playbook.yml

---
- name: Create blank file on app servers
  hosts: app_servers
  become: true

  tasks:
  - name: Create blank file
    file:
      path: /usr/src/code.txt
      state: touch

  - name: Set permissions
    file:
      path: /usr/src/code.txt
      mode: '0755'

  - name: Set owner and group
    file:
      path: /usr/src/code.txt
      owner: "{{ ansible_user }}"
      group: "{{ ansible_user }}"