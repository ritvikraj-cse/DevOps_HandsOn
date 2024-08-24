# The Nautilus team is integrating Jenkins into their CI/CD pipelines. After setting up a new Jenkins server, they're now configuring user access for the development team, Follow these steps:

# 1. Click on the Jenkins button on the top bar to access the Jenkins UI. Login with username admin and password Adm!n321.
# 2. Create a jenkins user named anita with the password LQfKeWWxWD. Their full name should match Anita.
# 3. Utilize the Project-based Matrix Authorization Strategy to assign overall read permission to the anita user.
# 4. Remove all permissions for Anonymous users (if any) ensuring that the admin user retains overall Administer permissions.
# 5. For the existing job, grant anita user only read permissions, disregarding other permissions such as Agent, SCM etc.


1. Login with username admin and password Adm!n321
2. Manage Jenkins -> Users -> Create User -> username(anita), password(LQfKeWWxWD), Fullname(Anita).
3. Manage Jenkins -> Available -> Install Project-based Matrix Authorization Strategy.
4. Manage Jenkins -> Security -> Authorization -> Matrix-based Security -> Add anita -> Overall and Job -> Read.
5. Save changes
6. Login with user anita and verify the read permissions.
