# An Ansible playbook needs completion on the jump host, where a team member left off. Below are the details:

# The inventory file /home/thor/ansible/inventory requires adjustments. The playbook must run on App Server 1 in Stratos DC. Update the inventory accordingly.

# Create a playbook /home/thor/ansible/playbook.yml. Include a task to create an empty file /tmp/file.txt on App Server 1.

# Note: Validation will run the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook works without any additional arguments.

cd /home/thor/ansible/
vi playbook.yml

---
- name: Create an empty file on App Server 1
  hosts: app_server_1
  become: yes
  tasks:
    - name: Create an empty file /tmp/file.txt
      file:
        path: /tmp/file.txt
        state: touch


vi inventory

[app_server_1]
stapp01 ansible_host=172.16.238.10 ansible_user=tony ansible_ssh_pass=your_password_here


ansible-playbook -i inventory /home/thor/ansible/playbook.yml

