* * * * * * *master and agent configuration* * * * * * * * *
* on Agent create jenkins user and set password to copy ssh-id, skip if ec2-user have password login
```
sudo useradd -m jenkins 
sudo passwd jenkins
```
* change the owner ship of the authorised keys to user you created or ec2-user
```
sudo chown ec2-user:ec2-user ~/.ssh/authorized_keys
```
* on master
```
telnet <agent server> 22
ssh-keygen -f ~/.ssh/demo
ssh-copy-id -i ~/.ssh/demo.pub user@<agent server>
```
* as we are using customised key name then run below commands to know the master that where the ssh-id is
```
cat << EOF >> ~/.ssh/config
Host agent.hellandhaven.xyz
    User jenkins
    IdentityFile ~/.ssh/demo
EOF
```
* check for know_hosts file in ~/.ssh/ if you don't find run below command
```
ssh-keyscan agent.hellandhaven.xyz >> ~/.ssh/known_hosts
```
* create folder /var/lib/jenkins/.ssh if not exist
```
sudo mkdir /var/lib/jenkins/.ssh
sudo chown jenkins:jenkins /var/lib/jenkins/.ssh
sudo cp -R  ~/.ssh/known_hosts /var/lib/jenkins/.ssh/known_hosts
sudo cp ~/.ssh/demo /var/lib/jenkins/.ssh/demo
```
* Manage jenkins --> nodes --> new node --> Launch method 
    * Launch agent by connecting it to the controller --> agent should connect to the controller 
    * Launch agent via ssh --> master will connect to the agent 
        * select private key and username
        * past the master private key 


required plugins : 

Pipeline stage view
AnsiColor
Pipeline Utility Steps
Nexus Artifact Uploader
Rebuild