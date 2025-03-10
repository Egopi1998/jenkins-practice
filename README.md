* * * * * * *master and agent configuration* * * * * * * * *
* on Agent create jenkins user and set password
```
sudo useradd -m jenkins 
sudo passwd jenkins
```
* on master
```
telnet <agent server> 22
ssh-keygen -f ~/.ssh/demo
ssh-copy-id -i ~/.ssh/demo.pub jenkins@<agent server>
```
* as we are using costomised key name then run below commands
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

required plugins : 

Pipeline stage view
AnsiColor
Pipeline Utility Steps
Nexus Artifact Uploader
Rebuild