# HestiaCP-Local.md

# Contents of HestiaCP-Local

# VirtualBox-HestiaCP

## Antix-OS Host

### HestiaCP and Website Setup

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

### phpMyAdmin Setup

* {1} [Why I can’t use http://ip/phpmyadmin/](https://hestiacp.com/docs/server-administration/databases.html#why-i-can-t-use-http-ip-phpmyadmin)

* By default, phpMyAdmin does not work with IP address like [192.168.56.101/phpmyadmin](http://192.168.56.101/phpmyadmin/), instead use [hestiacp1.local/phpmyadmin](http://hestiacp1.local/phpmyadmin/)

* How to create PhpMyAdmin root user creditials
```shellscript
sudo su
mysql -uroot
mysql > CREATE USER 'myrootusername'@'localhost' IDENTIFIED BY 'myrootusername_password'
mysql > GRANT ALL PRIVILEGES ON *.* TO 'myrootusername'@'localhost' WITH GRANT OPTION
mysql > FLUSH PRIVILEGES
```

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

* To get phpMyAdmin Password, SSH into HestiaCP machine and enter command: `nano /usr/local/hestia/conf/mysql.conf` <sup>{3}</sup> [It does not work]

# References

* next-sl: {4}

* VirtualBox-HestiaCP
  * {1} [Why I can’t use http://ip/phpmyadmin/](https://hestiacp.com/docs/server-administration/databases.html#why-i-can-t-use-http-ip-phpmyadmin)
  * {2} [Phpmyadmin page not found Error 404](https://forum.hestiacp.com/t/phpmyadmin-page-not-found-error-404/1026)
  * {3} [Find the PHPmyadmin Password](https://forum.hestiacp.com/t/find-the-phpmyadmin-password/1657)
