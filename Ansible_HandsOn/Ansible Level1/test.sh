# Ansible utilizes SSH connections to communicate with remote hosts. The Nautilus DevOps team intends to employ a unified Ansible manager for overseeing several remote hosts. To streamline operations, they seek to implement a common Ansible configuration to govern these hosts.
# Create an Ansible configuration file under /home/thor/ansible-config directory and disable the SSH host key checking for all Ansible managed hosts.

# Created the Ansible configuration file under "home/thor/ansible-config" directory and disabled the SSH host key checking for Ansible?

vi /home/thor/ansible-config/ansible.cfg

[defaults]
host_key_checking = False



# The Nautilus DevOps team is running Ansible using a sudo user on the jump host, where the sudo user is configured to prompt for a password for each execution. Currently, playbooks fail when attempting tasks that require superuser privileges, such as package installation. They aim to ensure that Ansible prompts for a sudo password during playbook execution. Consequently, they have outlined the following requirements to resolve this issue:

# Please ensure the necessary adjustments are made within the Ansible configuration located at /home/thor/ansible-t5q4/ansible-t5q4.cfg. Avoid creating a new configuration file.

# Note: This is a sample Ansible configuration. If you intend to test an Ansible playbook using this configuration, you may need to explicitly set the ANSIBLE_CONFIG variable.

sudo vi /home/thor/ansible-t5q4/ansible-t5q4.cfg
#Add the following lines under the [defaults] section:
[defaults]
ask_become_pass = True
become = True
:wq!
export ANSIBLE_CONFIG=/home/thor/ansible-t5q4/ansible-t5q4.cfg



# a. On jump host create a playbook /home/thor/ansible/playbook-t2q5.yml to copy /usr/src/sysops-t2q5/story-t2q5.txt file from App Server 2 at location /opt/sysops-t2q5 on App Server 2.

# b. An inventory is already placed under /home/thor/ansible/inventory-t2q5.

# Note: Validation will try to run the playbook using command ansible-playbook -i inventory-t2q5 playbook-t2q5.yml so please make sure the playbook works this way without passing any extra arguments.

vi playbook-t2q5.yml

---
- name: Copy file from App Server 2
  hosts: stapp02
  become: true

  tasks:
  - name: Copy file
    copy:
      src: /usr/src/sysops-t2q5/story-t2q5.txt
      dest: /opt/sysops-t2q5/story-t2q5.txt
      remote_src: yes

:wq!



# a. On jump host we already have an inventory file /home/thor/ansible/inventory-t2q2.

# b. On jump host create a playbook /home/thor/ansible/playbook-t2q2.yml to copy /usr/src/sysops-t2q2/system-t2q2.txt file to all application servers at location /opt/sysops-t2q2 with permissions 0600.

vi playbook-t2q2.yml

---
- name: Copy file to application servers
  hosts: all
  become: true

  tasks:
  - name: Create destination directory
    file:
      path: /opt/sysops-t2q2
      state: directory
      mode: '0600'

  - name: Copy file
    copy:
      src: /usr/src/sysops-t2q2/system-t2q2.txt
      dest: /opt/sysops-t2q2/system-t2q2.txt
      mode: '0600'
:wq!



# The Nautilus DevOps team is was doing some cleanup work on all app servers in Stratos DC. Instead of doing this manually they want to utilise Ansible for the same. Below are the requirements team has received.

# a. Utilise the inventory file /home/thor/playbook/inventory-t4q4, present on the jump host.

# b. Create a playbook name /home/thor/playbook/playbook-t4q4.yml to delete a file named /opt/fruits-t4q4.txt from all App Servers.

vi playbook-t4q4.yml

---
- name: Delete file from App Servers
  hosts: app_servers
  become: true

  tasks:
  - name: Check if file exists
    stat:
      path: /opt/fruits-t4q4.txt
    register: file_stat

  - name: Delete file
    file:
      path: /opt/fruits-t4q4.txt
      state: absent
    when: file_stat.stat.exists

:wq!



# The Nautilus DevOps team is working to create some data on different app servers in using Ansible. They want to create some files/directories and have some specific requirements related to this task. Find below more details about the same:

# a. Utilise the inventory file /home/thor/playbook/inventory-t4q3, present on the jump host.

# b. Create a playbook named /home/thor/playbook/playbook-t4q3.yml to create a directory named /opt/backup-t4q3 on all App Servers.

vi playbook-t4q3.yml

---
- name: Create directory
  hosts: all
  become: true

  tasks:
  - name: Create a directory if it does not exist
  ansible.builtin.file:
    path: /opt/backup-t4q3
    state: directory

:wq!



# The Nautilus DevOps team intends to test multiple Ansible playbooks across various app servers in the Stratos DC. Before proceeding, certain prerequisites must be addressed. Specifically, the team requires the establishment of a password-less SSH connection between the Ansible controller and the managed nodes. An assigned ticket outlines the task; please carry out the following details:

# a. The Jump host serves as our Ansible controller, and the Ansible playbooks will be executed through the thor user from the jump host.

# b. An inventory file, /home/thor/playbook/inventory-t3q2, is available on the jump host. Utilize this inventory file to perform an Ansible ping from the jump host to App Server 2 and ensure the successful execution of the ping command.

vi /home/thor/playbook/inventory-t3q2

stapp02 ansible_host=172.16.238.11 ansible_user=steve ansible_ssh_pass=Am3ric@
:wq!

ansible -i /home/thor/playbook/inventory-t3q2 all -m ping



# The Nautilus DevOps team recently recommended employing Ansible for configuration management and automation purposes. As they've commenced creating playbooks, a need has arisen for a basic playbook, outlined as follows.

# Create a playbook named /home/thor/ansible/playbook-t1q2.yml on the jump host and configure the playbook to run on localhost and execute an echo command echoing Welcome!.

vi /home/thor/ansible/playbook-t1q2.yml

---
- name: Run echo command on localhost
  hosts: localhost
  tasks:
  - name: Echo Welcome!
    shell: echo "Welcome!"

:wq!



# The application development team has requested the installation of a package on multiple servers. To avoid manual installation across each server, the plan is to leverage an Ansible playbook. Initially, the aim is to create an Ansible playbook to install this package on the App Server 3, with intentions to deploy it across other necessary servers later.

# Create a playbook named /home/thor/ansible/playbook-t1q3.yml on the jump host and configure the playbook to install zlib package on App Server  3. Use inventory file /home/thor/ansible/inventory-t1q3.

vi /home/thor/ansible/playbook-t1q3.yml

--- 
- name: Install zlib package on App Server 3
  hosts: stapp03
  become: true

  tasks:
  - name: Install zlib package
    yum:
      name: zlib
      state: present
:wq!





