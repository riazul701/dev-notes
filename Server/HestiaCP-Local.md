# HestiaCP-Local.md

# VirtualBox + Antix-OS + HestiaCP

## HestiaCP and Website Setup

* Install [VirtualBox](https://www.virtualbox.org/)
* Download [Ubuntu Server 22.04 Linux VM Images for VirtualBox](https://www.linuxvmimages.com/images/ubuntuserver-2204/) and setup it on VirtualBox.
* Select Machine "Ubuntu-Server-22.04" -> Settings -> Network -> Adapter 1
  * Tick Checkbox "Enable Network Adapter"
  * Attached to: Host-only Adapter
  * Name: vboxnet0
* Turn on "Ubuntu-Server-22.04" and enter command "ifconig" to see IP address. This will be like "192.168.56.101"
* Setup HestiaCP using Bash-Script or Ansible on "Ubuntu-Server-22.04". [If problem arises, use "Settings -> Network -> Adapter 1: { Tick Checkbox "Enable Network Adapter" && Attached to: Bridged Adapter && Name: wlan0" }]
* Open "/etc/hosts" file and enter: [FIRST CREATE A BACKUP OF "hosts" FILE] (Require "sudo" privileges)
  * 192.168.56.101	hestiacp1.local # "hostname" you entered during HestiaCP installation, For production it will be "server1.domain.com"
  * 192.168.56.101	user1-site1.local
  * 192.168.56.101	user1-site2.local
* Get hostname of HestiaCP: SSH into HestiaCP machine and enter command `cat /etc/hostname`
* Enter into HestiaCP control panel via url [hestiacp1.local:8083](http://hestiacp1.local:8083) OR [192.168.56.101:8083](http://192.168.56.101:8083)
* Create new user "user1". Log-in to "user1" panel
* Add Web Domain "user1-site1.local" and "user1-site2.local" without "DNS Support" and "Mail Support".
* Open File-Manager to create/edit web page.
* Visit website [user1-site1.local](http://user1-site1.local) and [user1-site2.local](http://user1-site2.local)

## phpMyAdmin Setup

### Access phpMyAdmin using IP

* {1} [Why I can’t use http://ip/phpmyadmin/](https://hestiacp.com/docs/server-administration/databases.html#why-i-can-t-use-http-ip-phpmyadmin)

* By default, phpMyAdmin does not work with IP address like [192.168.56.101/phpmyadmin](http://192.168.56.101/phpmyadmin/), instead use [hestiacp1.local/phpmyadmin](http://hestiacp1.local/phpmyadmin/)

* How can I enable access to http://ip/phpmyadmin/
* For Apache2 [nano /etc/apache2/conf.d/ip.conf (192.168.56.101.conf)]
```shellscript
nano /etc/apache2/conf.d/ip.conf

# Add the following code before both </VirtualHost> closing tags
IncludeOptional /etc/apache2/conf.d/*.inc

# Restart apache2
systemctl restart apache2

# You can also add the following in /etc/apache2.conf instead
IncludeOptional /etc/apache2/conf.d/*.inc
```
* For Nginx [nano /etc/nginx/conf.d/ip.conf (192.168.56.101.conf)]
```shellscript
nano /etc/nginx/conf.d/ip.conf

# Replace the following
location /phpmyadmin/ {
  alias /var/www/document_errors/;
  return 404;
}
location /phppgadmin/ {
  alias /var/www/document_errors/;
  return 404;
}

# With the following
include     /etc/nginx/conf.d/phpmyadmin.inc*;
include     /etc/nginx/conf.d/phppgadmin.inc*;
```

### phpMyAdmin Login Error

* NOTE: Restart Server after any modification.

* NOTE: HestiaCP installs MariaDB "root" user with no password and phpMyAdmin does not allow user to login without password.
  * To check enter command: `mysql -u root -p`
  * Create user with following commands.

* {4} [How to create PhpMyAdmin root user creditials](https://hestiacp.com/docs/server-administration/databases.html#how-to-create-phpmyadmin-root-user-creditials)
* How to create PhpMyAdmin root user credentials
```shellscript
sudo su
mysql -uroot
mysql > CREATE USER 'myrootusername'@'localhost' IDENTIFIED BY 'myrootusername_password';
mysql > GRANT ALL PRIVILEGES ON *.* TO 'myrootusername'@'localhost' WITH GRANT OPTION;
mysql > FLUSH PRIVILEGES;
```

* To get phpMyAdmin "root" user Password, SSH into HestiaCP machine and enter command: `nano /usr/local/hestia/conf/mysql.conf` <sup>{3}</sup> [It does not work]

### Reset MariaDB "root" password

* MariaDB password may be empty: `mysql -u root -p` [Does not ask for password]
* [How To Reset Your MySQL or MariaDB Root Password](https://www.digitalocean.com/community/tutorials/how-to-reset-your-mysql-or-mariadb-root-password)
  * 

### phpMyAdmin Error Fix

* [Error Existing configuration file (/etc/phpmyadmin/config.inc.php) is not readable](https://forum.hestiacp.com/t/error-existing-configuration-file-etc-phpmyadmin-config-inc-php-is-not-readable/12096)
  * Permission Fix: `chown -R root:www-data /etc/phpmyadmin/`

# Vagrant-Ubuntu-HestiaCP Installation

## Vagrant Installation

### Antix-OS Vagrant Error
* The provider 'virtualbox' that was requested to back the machine
'default' is reporting that it isn't usable on this system. The
reason is shown below:

Vagrant could not detect VirtualBox! Make sure VirtualBox is properly installed.
Vagrant uses the `VBoxManage` binary that ships with VirtualBox, and requires
this to be available on the PATH. If VirtualBox is installed, please find the
`VBoxManage` binary and add it to the PATH environmental variable.

### Vagrant and VirtualBox On Antix-OS
* Install latest VirtualBox
  * [VirtualBox Download](https://download.virtualbox.org/virtualbox/7.0.6/virtualbox-7.0_7.0.6-155176~Debian~bullseye_amd64.deb)
  * Open GDebi: `sudo gdebi-gtk`
  * Shows error: Conflicts with "virtualbox-guest-additions-iso"
  * sudo apt remove virtualbox-guest-additions-iso

* Install Vagrant latest version
  * wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
  * echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  * sudo apt update && sudo apt install vagrant

* Error: The private key to connect to the machine via SSH must be owned by the user running Vagrant. This is a strict requirement from SSH itself. Please fix the following key to be owned by the user running Vagrant:
.vagrant/machines/default/virtualbox/private_key
  * [Private key to connect to the machine via SSH must be owned by the user running Vagrant](https://stackoverflow.com/questions/35964050/private-key-to-connect-to-the-machine-via-ssh-must-be-owned-by-the-user-running)
  * Use vagrant from Linux path, not from NTFS partition.
  
# References

* next-sl: {6}

* VirtualBox + Antix-OS + HestiaCP
  * {1} [Why I can’t use http://ip/phpmyadmin/](https://hestiacp.com/docs/server-administration/databases.html#why-i-can-t-use-http-ip-phpmyadmin)
  * {2} [Phpmyadmin page not found Error 404](https://forum.hestiacp.com/t/phpmyadmin-page-not-found-error-404/1026)
  * {3} [Find the PHPmyadmin Password](https://forum.hestiacp.com/t/find-the-phpmyadmin-password/1657)
  * {4} [How to create PhpMyAdmin root user creditials](https://hestiacp.com/docs/server-administration/databases.html#how-to-create-phpmyadmin-root-user-creditials)
  * {5} [Error Existing configuration file (/etc/phpmyadmin/config.inc.php) is not readable](https://forum.hestiacp.com/t/error-existing-configuration-file-etc-phpmyadmin-config-inc-php-is-not-readable/12096)

