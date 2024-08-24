# In response to the latest tool implementation at xFusionCorp Industries, the system admins require the creation of a service user account. Here are the specifics:
# Create a user named ammar in App Server 2 without a home directory.

ssh user@AppServer2

sudo useradd -M ammar 


# This command:

# - Connects to AppServer2 as the specified user via SSH
# - Runs the useradd command with superuser privileges using sudo
# - Creates a new user named ammar without a home directory (-M option)



