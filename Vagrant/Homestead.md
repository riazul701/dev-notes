Command: vagrant up

Shows Error: 
Check your Homestead.yaml (or Homestead.json) file, the path to your private key does not exist.

Guide: https://stackoverflow.com/questions/44463987/homestead-installation

Solution:
You want to follow these steps from terminal

Generate a ssh key:: ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

Start ssh agent:: eval "$(ssh-agent -s)"

Add your SSH private key to the ssh-agent:: ssh-add -k ~/.ssh/id_rsa

Then run:: vagrant up

