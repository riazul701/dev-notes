# HestiaCP.md

## Websites


# Commands

## Database

* 

# Knowledge

## DNS

* [DNS Lookup](https://mxtoolbox.com/DnsLookup.aspx)
* [NsLookup](https://www.nslookup.io/)

## CloudFlare

### CloudFlare as Name-Server (NS)

* For first time we setup website with CloudFlare.
* We enter CloudFlare's Name Server records to Domain register's NS fields.
* After several hours domain name works in browser.
* In server we previously installed HestiaCP control panel.
* If we reinstall operating system in server and freshly install HestiaCP control panel and use domain name as "FQDN" then domain name does not work. Instead create "Standard" user in HestiaCP panel and add domain, it will activate instantly.

## HestiaCP

### PATHS

* If we enter server's IP address into browser then this file will be loaded: "/var/www/html/index.html"
* Created domain will goto "/home" directory.
* phpMyAdmin path: "/usr/share/phpmyadmin"

### Instructions

* Installation
  * Light Installation (Low Resources): `bash hst-install.sh --multiphp yes --clamav no --spamassassin no`
  * WHAT IS FQDN? (Which is used during HestiaCP installation)

* Connection
  * VSFTPD FTP Server Credential: (Host: 101.102.103.104), (UserName: HestiaCP Panel UserName), (Password: HestiaCP Panel Password), (Port: 21)
  * SFTP / SSH Server Credential: (Host: sftp://101.102.103.104), (UserName: Server "root" UserName), (Password: Server "root" Password), (Port: 22)
    * Instead of "root" user, create another user with "ssh" access.
  
* By default, HestiaCP website php page does not show any error. Enable error from php script: <sup>{1}</sup>
```php
error_reporting(E_ALL);
ini_set('display_errors', '1');
```

* Change server's TimeZone: Admin Panel -> Settings -> Configure -> Basic Options -> Time Zone: Asia/Dhaka <sup>{7}</sup>
  * Active TimeZone: Go to Settings -> php(version)-fpm -> Restart

* PHP "ini" Settings: Admin Panel -> Settings -> php(version)-fpm -> Edit (Pencil Icon) [First make a backup of "ini" file]

# Installation (HestiaCP)

## Install with Main Domain

* USE CLOUDFLARE AS NAME-SERVER (NS)
  * Enter a website/domain into cloudflare account.
  * Create "A" record
    * Type: A, Name: example.com, Content: <server-ip>, Proxy status: Proxied, TTL: Auto
    * Type: CNAME, Name: www, Content: example.com, Proxy status: Proxied, TTL: Auto
  * Get two NS (name-server) records from CloudFlare.
  * Login to domain registrar's control panel and enter two NS records which got from CloudFlare.
  * Use Default Settings. No need to change anything like "https-redirect".

* During Installation of HestiaCP
  * Enter "FQDN" domain name: example.com [Do not enter "server.example.com" or "www.example.com"] [Which will be used as Server HostName, check it in Hestia Control Panel settings.]
  * Enter admin email address: demo@email.com

* After Installation
  * Login to HestiaCP control panel with "admin" (System User) credential, which is shown in terminal during installation.
  * Check in "Web" section "example.com" already exists. Delete "example.com".
  * Create "Standard" user and login to it.
  * Create "example.com" domain with "DNS" and "Email" support in "Standard" user panel.

* Check things are working
  * Enter into phpMyAdmin: "http://example.com/phpmyadmin" [ANY OTHER DOMAIN WORKS: "http://<any-other-domain>/phpmyadmin"]
  * Enter into HestiaCP control panel: "http://<ip-address>:8083" [Does Not Work: "http://example.com:8083"]
  
# Configuration (HestiaCP)

## Add Domain

* If adding domain using CloudFlare's Name-Server, then no need to add "DNS" supoort in Hestia Control Panel.

## TimeZone

* Change server's TimeZone: Admin Panel -> Settings -> Configure -> Basic Options -> Time Zone: Asia/Dhaka <sup>{7}</sup>
  * Active TimeZone: Go to Settings -> php(version)-fpm -> Restart

## Database

* [Optional] Note: Restart Server after any modification.

* NOTE: HestiaCP installs MariaDB "root" user with no password and phpMyAdmin does not allow user to login without password.
  * To check enter command: `mysql -u root -p`
  * There are three solutions:
    * (BEST-WAY) Login to Hestia Control Panel -> "DB" tab -> Add Database: This will create new "DB-User" and "Database"
    * Create password for mariadb "root" user.
    * Create another user with password.

* Create password for mysql "root" user:
  * [MySQL root password change](https://stackoverflow.com/questions/7534056/mysql-root-password-change)
  * [ERROR 1064 (42000): You have an error in your SQL syntax; Want to configure a password as root being the user](https://stackoverflow.com/questions/36099028/error-1064-42000-you-have-an-error-in-your-sql-syntax-want-to-configure-a-pa)
  * First log in to MySQL: `mysql -u root -p`

* Create another user with password:
  * Note: If can not login to phpMyAdmin using "root" user, then create another user.
  * {8} [How to create PhpMyAdmin root user creditials](https://hestiacp.com/docs/server-administration/databases.html#how-to-create-phpmyadmin-root-user-creditials)
  * How to create PhpMyAdmin root user credentials
```shellscript
sudo su
mysql -uroot
mysql > CREATE USER 'another_username'@'localhost' IDENTIFIED BY 'another_username_password';
mysql > GRANT ALL PRIVILEGES ON *.* TO 'another_username'@'localhost' WITH GRANT OPTION;
mysql > FLUSH PRIVILEGES;
```

* [Does not work] To get phpMyAdmin "root" user Password, SSH into HestiaCP machine and enter command: `nano /usr/local/hestia/conf/mysql.conf` <sup>{9}</sup>

##  This service allows sftp connections only

* {10} [SSH is disabled for users (“this service allows sftp connections only”)](https://forum.hestiacp.com/t/ssh-is-disabled-for-users-this-service-allows-sftp-connections-only/11106)
* {11} [Changing SSH access](https://hestiacp.com/docs/user-guide/users.html#changing-ssh-access)
* Login to HestiaCP using Admin Account
* Goto User -> Select "user" -> Edit -> Advanced Options -> SSH Access: bash (previously/by-default it was "nologin") -> Save

# Error and Solution (HestiaCP)

## phpMyAdmin Error

* [Error Existing configuration file (/etc/phpmyadmin/config.inc.php) is not readable](https://forum.hestiacp.com/t/error-existing-configuration-file-etc-phpmyadmin-config-inc-php-is-not-readable/12096)
  * Permission Fix: `chown -R root:www-data /etc/phpmyadmin/`

# References

* next-sl: {12}

* Commnads

  * Database
    * []()

* DNS
  * [How to Flush DNS Cache](https://www.hostinger.com/tutorials/how-to-flush-dns)

* Knowledge
  * {1} [Showing all errors and warnings [duplicate]](https://stackoverflow.com/questions/5438060/showing-all-errors-and-warnings)

* Configuration
  * {7} [“Server” Timezone does not change to PHP](https://forum.hestiacp.com/t/server-timezone-does-not-change-to-php/851)
  * {8} [How to create PhpMyAdmin root user creditials](https://hestiacp.com/docs/server-administration/databases.html#how-to-create-phpmyadmin-root-user-creditials)
  * {9} [Find the PHPmyadmin Password](https://forum.hestiacp.com/t/find-the-phpmyadmin-password/1657)
  * {10} [SSH is disabled for users (“this service allows sftp connections only”)](https://forum.hestiacp.com/t/ssh-is-disabled-for-users-this-service-allows-sftp-connections-only/11106)
  * {11} [Changing SSH access](https://hestiacp.com/docs/user-guide/users.html#changing-ssh-access)

* Linux Commands
  * {8} [How can I copy the contents of a folder to another folder in a different directory using terminal?](https://askubuntu.com/questions/86822/how-can-i-copy-the-contents-of-a-folder-to-another-folder-in-a-different-directo)

* YouTube Tutorial

  * PlayList
    * {2} [HestiaCP Tutorial Ubuntu 22.04 - Learn to use Hestia Control Panel BY Ricky Wahowa](https://www.youtube.com/playlist?list=PLhhBJ0l9FKMO6c7vaTBHSmu-rkc7pjwnn)

  * Video
    * {3} [HestiaCP Hestia Control Panel Full Tutorial - Installation, Users, DNS, WordPress, Backup, DB, Mail BY Bizanosa](https://www.youtube.com/watch?v=rQEzfp71WUY)
    * {4} [How to set up DNS on HestiaCP - Use Cloudflare or Personal Nameservers for HestiaCP DNS BY Ricky Wahowa](https://www.youtube.com/watch?v=CeBCPfD_l0k)
    * {5} [Learn to install Hestia Control Panel, Create Wordpress & Send Emails BY inGuide](https://www.youtube.com/watch?v=mYoJVS7c1yw)
    * {6} [Create Free Email Server With HestiaCP, Contabo VPS and Namecheap & Send Unlimited Free Emails BY Web Shanks](https://www.youtube.com/watch?v=LbO1oVKyD5s)
