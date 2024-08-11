# Due to an accidental data mix-up, user data was unintentionally mingled on Nautilus App Server 1 at the /home/usersdata location by the Nautilus production support team in Stratos DC. To rectify this, specific user data needs to be filtered and relocated. Here are the details:
# Locate all files (excluding directories) owned by user kirsty within the /home/usersdata directory on App Server 1. Copy these files while preserving the directory structure to the /media directory.

ssh tony@172.16.238.10

# Locate files:
find /home/usersdata -type f -user kirsty

# Copy files while preserving directory structure:
find /home/usersdata -type f -user kirsty -exec cp --parents {} /media \;

# Or, using rsync:
find /home/usersdata -type f -user kirsty -print0 | rsync -av --files-from=- /home/usersdata/ /media

# /: Searches the entire filesystem (start from the root directory).
# -type f: Only considers files (not directories).
# -user kirsty: Only selects files owned by user "kirsty".
# -exec: Executes the following command for each found file.
# cp --parents {} /media: Copies the file while preserving its directory structure. The {} placeholder represents the file path.
# \;: Marks the end of the -exec command.

# The {} placeholder only works within the -exec option of find. When using a pipe (|), the {} is not replaced with the found file paths.
# Instead, you can use xargs to execute the cp command for each found file:

# find /home/usersdata -type f -user kirsty | xargs -I {} cp --parents {} /media