ssh user@ip

sudo useradd -m -s /sbin/nologin siva

# This command:-

# - Connects to the server with the specified IP address as the specified user via SSH
# - Runs the useradd command with superuser privileges using sudo
# - Creates a new user named siva
# - Creates a home directory for the user (-m option)
# - Assigns a non-interactive shell (/sbin/nologin) to the user