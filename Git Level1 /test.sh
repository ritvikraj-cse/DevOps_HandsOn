# As developers are currently in the process of creating Git repositories, a new requirement has emerged to create a bare repository on the storage server. Below are the details for this request.

# Create a bare repository named /home/sarah/media.git on Storage server.

# Use below credentials to SSH into the storage server and to complete this task.

# Username: sarah
# Password: S3cure321

ssh sarah@<storage_server_ip_address>
mkdir -p /home/sarah
cd /home/sarah
git init --bare media.git


# The developers are adding some content under new repositories. There was some data added under /home/sarah/story-blog-t1q8 repository on the storage server. Commit the files that are currently in the staging area under this repository.

# First check the status of the file using the command git status. Then commit using the commit message as Added the lion and mouse story


ssh sarah@172.16.238.15
cd /home/sarah/story-blog-t1q8
git status
git commit -m "Added the lion and mouse story"


# A couple of new Git repositories were created recently and this is still in progress. The developers now has started adding some content under these repositories. Below are the details for this request.

# There is a file named lion-and-mouse-t1q5.txt which is placed under /home/sarah/story-blog-t1q5 repository, stage the same to make it available for commit.

ssh sarah@<storage_server_ip_address>
cd /home/sarah/story-blog-t1q5
git status
git add lion-and-mouse-t1q5.txt

# Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/media-t2q1. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:

# On Storage server in Stratos DC create a new branch xfusioncorp_media-t2q1 from master branch in /usr/src/kodekloudrepos/media-t2q1 git repo.

# Please do not try to make any changes in the code.

ssh <username>@<storage_server_ip_address>
cd /usr/src/kodekloudrepos/media-t2q1
git checkout master
git checkout -b xfusioncorp_media-t2q1


# The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/media-t2q4 present on Storage server in Stratos DC. One of the developers mistakenly created a couple of files under this repository, but now they want to clean this repository without adding/pushing any new files. Find below more details:

# Clean the /usr/src/kodekloudrepos/media-t2q4 git repository without adding/pushing any new files, make sure git status is clean.

ssh <username>@<storage_server_ip_address>
cd /usr/src/kodekloudrepos/media-t2q4
git status
git clean -fd







