# In the Stratos Datacenter, our Storage server is encountering performance degradation due to excessive processes held by the nfsuser user. To mitigate this issue, we need to enforce limitations on its maximum processes. Please set the maximum process limits as specified below:

# a. Set the soft limit to 1025

# b. Set the hard limit to 2027

sudo vi /etc/security/limits.conf
#Add the following lines at the end of the file:
nfsuser soft nproc 1025
nfsuser hard nproc 2027
:wq!