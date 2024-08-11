# The system admin team at xFusionCorp Industries has streamlined access management by implementing group-based access control. Here's what you need to do:
# a. Create a group named nautilus_sftp_users across all App servers within the Stratos Datacenter.
# b. Add the user kano into the nautilus_sftp_users group on all App servers. If the user doesn't exist, create it as well.

ssh user@ip

vim script.sh

    # Create the group
    sudo groupadd nautilus_sftp_users

    # Create the user if it doesn't exist
    if ! id kano &>/dev/null; then
      sudo useradd kano
    fi

    # Add the user to the group
    sudo usermod -aG nautilus_sftp_users kano


sh script.sh

#This Command - 
# id kano: This command checks if the user kano exists by trying to display their user ID.
# &>/dev/null: This redirects both the standard output and standard error to /dev/null, effectively silencing the command. This means that even if the command produces output or errors, it will be discarded and not displayed.