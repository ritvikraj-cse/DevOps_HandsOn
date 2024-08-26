# A new DevOps Engineer has joined the team and he will be assigned some Jenkins related tasks. Before that, the team wanted to test a simple parameterized job to understand basic functionality of parameterized builds. He is given a simple parameterized job to build in Jenkins. Please find more details below:


# 1. Create a parameterized job which should be named as parameterized-job
# 2. Add a string parameter named Stage; its default value should be Build.
# 3. Add a choice parameter named env; its choices should be Development, Staging and Production.
# 4. Configure job to execute a shell command, which should echo both parameter values (you are passing in the job).
# 5. Build the Jenkins job at least once with choice parameter value Production to make sure it passes.

Jenkins -> New Item -> parameterized-job -> Configuration -> Tick "This project is parameterised"
Jenkins -> parameterized-job -> Configure -> Add parameter -> String parameter -> Name: Stage -> Default value: Build
Jenkins -> parameterized-job -> Configure -> Add parameter -> Choice parameter -> Name: env -> Choices: Development, Staging and Production
Jenkins -> parameterized-job -> Configure -> Add build step -> Execute shell -> echo "$Stage $env" -> Save
Jenkins -> parameterized-job -> Build Now -> env: Production -> Click on the build number -> Console Output

