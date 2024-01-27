# Ansible.md

## TODO
* Add to Ansible: LazyGit, Tmuxinator, Termscp, Lftp, Starship

## Websites
* [Ansible Official Site](https://www.ansible.com/)
* [Ansible GitHub](https://github.com/ansible/ansible)
* [Ansible Galaxy](https://galaxy.ansible.com/)
* [ansible/ansible-examples](https://github.com/ansible/ansible-examples)
* [ansible-semaphore/semaphore](https://github.com/ansible-semaphore/semaphore)
* Ansible Documentation
  * [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
  * [Ansible Galaxy Documents](https://galaxy.ansible.com/docs/)
* []()

## Tutorials
* [Ansible Tutorial](https://www.tutorialspoint.com/ansible/index.htm)
* [Ansible](https://training.galaxyproject.org/training-material/topics/admin/tutorials/ansible/tutorial.html)
* [YouTube - Getting started with Ansible BY Learn Linux TV](https://www.youtube.com/playlist?list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70)
* [YouTube - Using Ansible to automate your Laptop and Desktop configs!](https://www.youtube.com/watch?v=gIDywsGBqf4)

## Notes
* If VPS ram is 512MB then do not install clamav, spamassassin. These uses lot of RAM.
* VirtualBox network settings -> Select Machine -> Settings -> Network -> Attached to: Bridged Adapter; Name: wlan0 <sup>{4} {5} {6} {7}</sup>
* HestiaCP installation path: '/usr/local/hestia'

## Installation
* [Installing Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
  * Check python and pip version: `python3 -m pip -V`
  * Use pip in your selected Python environment to install the full Ansible package for the current user: `python3 -m pip install --user ansible`
  * Ansible installed path: `/home/<user-name>/.local/bin`
  * Add ansible path to "~/.bashrc" file: `echo 'export PATH=/home/<user-name>/.local/bin:$PATH' >> ~/.bashrc`
  * Execute "~/.bashrc" file: `source ~/.bashrc`
  * Check ansible version: `ansible --version`  

## SSH Setup
* Connect to remote host using SSH <sup>{2} {501} {502}</sup>
* To generate an RSA key pair on your local computer, type: `ssh-keygen`
* Press ENTER to leave this blank if you do not want a passphrase.: `Enter passphrase (empty for no passphrase):`
  * ~/.ssh/id_rsa: The private key. DO NOT SHARE THIS FILE!
  * ~/.ssh/id_rsa.pub: The associated public key. This can be shared freely without consequence.
  * To change or remove the passphrase, simply type: `ssh-keygen -p`
* Copying your Public SSH Key to a Server with SSH-Copy-ID: `ssh-copy-id username@remote_host`
  * After typing in the password, the contents of your ~/.ssh/id_rsa.pub key will be appended to the end of the user account’s ~/.ssh/authorized_keys file in remote host.
* You can now log in to that account without a password: `ssh username@remote_host`

# Commands

## Ansible Playbook
* ansible-playbook -i hosts --ask-become-pass site.yml

## Ruby Gems
* Check tmuxinator(gem) path: `gem which tmuxinator`

## Resource Management
* Launch htop: `htop`
* Install glances: `sudo apt install glances`
* Launch glances: `glances`
* Show RAM usage: `free -m`

# Error and Solution

## VirtualBox
* end Kernel panic - not syncing: System is deadlocked on memory <sup>{505}</sup>
  * Increase Processor, RAM, Disable-Audio

## LunarVim

* [Error while lunarvim installation unknown flag 'u' (read workaround at the top of the issue) #3612](https://github.com/LunarVim/LunarVim/issues/3612)
  * Remove exec -a "$NVIM_APPNAME" from ~/.local/bin/lvim as a workaround

# References

* Installation
  * {1} [How to Set Up SSH Keys on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04)
  * {2} [SSH Essentials: Working with SSH Servers, Clients, and Keys](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)
  * {3} [How To Install and Configure Ansible on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-22-04)
  * {4} [How to set a static IP on a virtualbox VM?](https://forums.virtualbox.org/viewtopic.php?t=104442)
  * {5} [Static IP for Ubuntu server in VirtualBox using Bridged Adapter](https://superuser.com/questions/456057/static-ip-for-ubuntu-server-in-virtualbox-using-bridged-adapter)
  * {6} [VirtualBox with Static IP on Ubuntu Server Guest](https://www.ernieleseberg.com/virtualbox-with-static-ip-on-ubuntu-server-guest/)
  * {7} [VirtualBox → How to properly set up your VM’s network for various Network situations](https://medium.com/code-kings/virtualbox-how-to-properly-set-up-your-vms-network-for-various-network-situations-f589ee3a8f8)
  * {8} [Installing Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
  * {9} [Rust Toolchains](https://rust-lang.github.io/rustup/concepts/toolchains.html)
  * {10} [How to Install Python Pip on Ubuntu 20.04](https://linuxize.com/post/how-to-install-pip-on-ubuntu-20.04/)
  * {11} [Error while lunarvim installation unknown flag 'u' (read workaround at the top of the issue) #3612](https://github.com/LunarVim/LunarVim/issues/3612)
  * {12} [ansible : how to pass multiple commands](https://stackoverflow.com/questions/24851575/ansible-how-to-pass-multiple-commands)
  * {13} [How to Check if a File or Directory Exists in Bash](https://linuxize.com/post/bash-check-if-file-exists/)
  * {14} [How to find where gem files are installed](https://stackoverflow.com/questions/19072070/how-to-find-where-gem-files-are-installed)
  * {15} [Copy multiple files with Ansible](https://stackoverflow.com/questions/36696952/copy-multiple-files-with-ansible)
  * {16} [How to prevent 'changed' flag when 'register'-ing a variable?](https://stackoverflow.com/questions/23946112/how-to-prevent-changed-flag-when-register-ing-a-variable)
  * {17} [Termscp Quick setup](https://termscp.veeso.dev/get-started.html)
  * {18} [HestiaCP: What are the system requirements? Can I install?](https://forum.hestiacp.com/t/what-are-the-system-requirements-can-i-install/375)

* Configuration
  * {51} [How to Run Ansible Playbook Locally | Devops Junction](https://www.middlewareinventory.com/blog/run-ansible-playbook-locally/)
  * {52} [alces/ansible_local_playbooks.md](https://gist.github.com/alces/caa3e7e5f46f9595f715f0f55eef65c1)
  * {53} [Provisioning your Windows from inside of WSL by Ansible](https://github.com/Wintus/Ansible-WSL)
  * {54} [Setup windows 10 workstation using Ansible installed on WSL](https://stackoverflow.com/questions/58345011/setup-windows-10-workstation-using-ansible-installed-on-wsl)
  * {55} [Ansible on WSL](https://www.reddit.com/r/ansible/comments/q9uqnu/ansible_on_wsl/)
  
* DigitalOcean
  * {101} [An Introduction to Configuration Management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management)
  * {102} [Configuration Management 101: Writing Ansible Playbooks](https://www.digitalocean.com/community/tutorials/configuration-management-101-writing-ansible-playbooks)
  * {103} [How to Use Ansible to Automate Initial Server Setup on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-automate-initial-server-setup-on-ubuntu-22-04)
  * {104} [Understanding Privilege Escalation in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/understanding-privilege-escalation-in-ansible-playbooks)
  * {105} [How To Use Loops in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-use-loops-in-ansible-playbooks)
  * {106} [How To Use Conditionals in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-use-conditionals-in-ansible-playbooks)
  * {107} [How To Use Variables in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-use-variables-in-ansible-playbooks)
  * {108} [How To Define Tasks in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-define-tasks-in-ansible-playbooks)
  * {109} [How To Manage Multiple Servers with Ansible Ad Hoc Commands](https://www.digitalocean.com/community/cheatsheets/how-to-manage-multiple-servers-with-ansible-ad-hoc-commands)
  * {110} [How To Set Up Ansible Inventories](https://www.digitalocean.com/community/tutorials/how-to-set-up-ansible-inventories)
  * {111} [How to Use Ansible Roles to Abstract your Infrastructure Environment](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-roles-to-abstract-your-infrastructure-environment)
  * {112} [How To Define and Use Handlers in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-define-and-use-handlers-in-ansible-playbooks)
  * {113} [How To Create and Use Templates in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-create-and-use-templates-in-ansible-playbooks)
  * {114} [How to Use Ansible to Install and Set Up LAMP on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-lamp-on-ubuntu-18-04)
  * {115} [How to Use Ansible to Install and Set Up LEMP on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-lemp-on-ubuntu-18-04)
  * {116} [How to Use Ansible to Install and Set Up Docker on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-docker-on-ubuntu-22-04)
  * {117} [How to Manage Multistage Environments with Ansible](https://www.digitalocean.com/community/tutorials/how-to-manage-multistage-environments-with-ansible)
  * {118} [How to Use Ansible: A Reference Guide](https://www.digitalocean.com/community/cheatsheets/how-to-use-ansible-cheat-sheet-guide)
  * {119} [How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04)

* Debug
  * {151} [How to print command output in Ansible?](https://linuxhint.com/print-command-output-ansible/)
  * {152} [How to see stdout of ansible commands?](https://serverfault.com/questions/537060/how-to-see-stdout-of-ansible-commands)
  * {153} [Ansible - Save registered variable to file](https://stackoverflow.com/questions/26732241/ansible-save-registered-variable-to-file)
  * {154} [How to save ansible stdout.lines to a file is in list format](https://unix.stackexchange.com/questions/444677/how-to-save-ansible-stdout-lines-to-a-file-is-in-list-format)
  * {155} [Ansible : APT module: how to get stdout?](https://stackoverflow.com/questions/51410696/ansible-apt-module-how-to-get-stdout)
  * {156} [Ansible: Register iterating with the loop](https://stackoverflow.com/questions/68388949/ansible-register-iterating-with-the-loop)
  * {157} [shell output to variable](http://net.cmed.us/Home/unixlinux/ansible/shell-output-to-variable)

* YouTube Tutorial
  * {501} [How to SSH Without a Password (like a boss)](https://www.youtube.com/watch?v=j2vBT3T79Pg)
  * {502} [Getting started with Ansible 02 - SSH Overview & Setup](https://www.youtube.com/watch?v=-Q4T9wLsvOQ)
  * {503} [Ansible Shell Module Tutorial - Complete Beginner's Guide](https://www.youtube.com/watch?v=57gAqKvAKck)
  * {504} [This web UI for Ansible is so damn useful!](https://www.youtube.com/watch?v=NyOSoLn5T5U)
  * {505} [Solved: Kernel Panic Installing Ubuntu on VirtualBox](https://www.youtube.com/watch?v=cRLPPZdrHwM)
