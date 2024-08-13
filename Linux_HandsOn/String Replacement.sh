# Within the Stratos DC, the backup server holds template XML files crucial for the Nautilus application. Before utilization, these files require valid data insertion. As part of routine maintenance, system admins at xFusionCorp Industries employ string and file manipulation commands.

# Your task is to substitute all occurrences of the string About with Architecture within the XML file located at /root/nautilus.xml on the backup server.

sudo sed -i 's/About/Architecture/g' /root/nautilus.xml


# - sed is the command for "stream editor", which is used for text manipulation.
# - -i option edits the file in place, meaning it modifies the original file.
# - s/About/Architecture/g is the substitution command:
#     - s stands for "substitute".
#     - About is the search pattern.
#     - Architecture is the replacement string.
#     - g stands for "global", which means substitute all occurrences in the file, not just the first one.