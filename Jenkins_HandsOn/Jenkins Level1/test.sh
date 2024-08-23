# The Nautilus team wanted to set a custom welcome/system message for a new Jenkins server which will be a greeting basically to welcome new Jenkins users. They came up with a custom message as per details given below.

# Add a system message Welcome to KKE Labs for the Jenkins server.

Jenkins -> Manage Jenkins -> System -> Add a system message "Welcome to KKE Labs"



# Since the Jenkins server was set up recently, there are still some configurations that need to be done. The team has just realised that they need to update the default executors in the Jenkins configuration.

# Change the number of default executors to 5.

Jenkins -> Manage Jenkins -> Configure System -> Default Executor Count -> 5



# To manage the increasing number of jobs on the Jenkins server, the Nautilus team recognized the need to categorize them based on their nature, environment, etc. This categorization would facilitate easier visualization and organization of the jobs. Consequently, the team intends to create a new view and relocate specific jobs accordingly.

# Create a list view named jobs-t3q4 and list the job app-t3q4 under the same. Make sure this view is a global view.

Jenkins -> My Views -> New View -> view named jobs-t3q4 -> select "gobal view" -> list the job app-t3q4.



# After setting up a new Jenkins server, the Nautilus team aimed to create and test some jobs to ensure everything is configured correctly. Currently, they have very basic requirements as outlined below.

# Create a freestyle job named app-job-t3q1, add any sample code (bash commands or something) under this job.

Jenkins -> New item -> Freestyle - app-job-t3q1 -> Build steps -> echo 'ritvik' -> Save.



# The Nautilus DevOps team has recently setup a Jenkins server, which they want to use for some CI/CD jobs. Before that they want to install some plugins which will be used in most of the jobs. Please find below more details about the task.

# Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and Adm!n321 password.
# Once logged in, install Git and GitLab plugins. You might need to restart Jenkins service to install these plugins, so we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre.

Jenkins -> Manage Jenkins -> plugins -> Install git and gitlab -> Restart Jenkins.



# The Nautilus DevOps team has recently installed a new Jenkins server and is now in the process of creating users and groups to grant access to different team members. Below are the current requirements:

# Create a user named royt4q1, its full name should be Roy and password should be royt4q1.

Jenkins -> Manage Jenkins -> Jenkins’ own user database -> Create User

Username: royt4q1
Full name: Roy
Password: royt4q1

-> Save.