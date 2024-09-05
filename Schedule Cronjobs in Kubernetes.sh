# The Nautilus DevOps team is setting up recurring tasks on different schedules. Currently, they're developing scripts to be executed periodically. To kickstart the process, they're creating cron jobs in the Kubernetes cluster with placeholder commands. Follow the instructions below:

# Create a cronjob named nautilus.
# Set Its schedule to something like */9 * * * *. You can set any schedule for now.
# Name the container cron-nautilus.
# Utilize the nginx image with latest tag (specify as nginx:latest).
# Execute the dummy command echo Welcome to xfusioncorp!.
# Ensure the restart policy is OnFailure.

apiVersion: batch/v1
kind: CronJob
metadata:
  name: nautilus
spec:
  schedule: "*/9 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: cron-nautilus
            image: nginx:latest
            command:
            - /bin/sh
            - -c
            - echo Welcome to xfusioncorp!
          restartPolicy: OnFailure


