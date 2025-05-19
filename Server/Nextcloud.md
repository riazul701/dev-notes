# Nextcloud.md

# Installation

## Websites - Installation
* [Nextcloud CDN](https://download.nextcloud.com/server/releases/)

## General Instruction - Installation
* For php version "php-7.4.3" install nextcloud version "nextcloud-25" ("Nextcloud Hub 3 (25.0.5)"). [Download from here](https://download.nextcloud.com/server/releases/latest-25.zip)
* Connect using Android app on same wifi router: Enter server address "http://192.168.0.100/nextcloud" (Assuming Nextcloud is running using Docker. Docker PC ip address is "192.168.0.100". Permanently set nextcloud server pc ip address in wifi router "DHCP" settings.)

## Docker-Linux

### Required PHP Extension
* Dockerfile php extension installation:
>```shellscript
> apt-get install -y libgd-dev libzip-dev zip unzip libpng-dev
>```
>
> ```shellscript
> RUN pecl channel-update pecl.php.net; \
>   docker-php-ext-install mysqli pdo_mysql gd zip; \
>   docker-php-ext-configure zip; \
>   docker-php-ext-enable pdo_mysql gd zip;
> ```
### Installation Instruction
* Install like any other php content-management-system/software.

## Xampp-Windows

**Final Note: Nextcloud installation on Xampp-Windows shows "database table installation error". Perhaps Nextcloud does not support Windows-OS-Xampp. Use Windows Subsystem for Linux (WSL) for Nextcloud installation using Docker.**

### Error and Solution - Xampp-Windows

* **Installation Error**

> **Error-Message-01:**
>
> PHP module zip not installed.
> Please ask your server administrator to install the module.
> PHP module GD not installed.
> Please ask your server administrator to install the module.
> PHP modules have been installed, but they are still listed as missing?
> Please ask your server administrator to restart the web server.
>
> **Solution-01:**
>
> * Open file "xampp/php/php.ini"
> * Uncomment `extension=zip`
> * Uncomment `extension=gd`

## After Installation

### Error and Solution - After Installation

* **Data directory permission error**

> **Error-Message-01:**
>
> Error
> Your data directory is readable by other users.
>
> Please change the permissions to 0770 so that the directory cannot be listed by other users.
>
> **Solution-01:**
>
> Open file "xampp/htdocs/nextcloud/config/config.php"
> Add config line `'check_data_directory_permissions' => false,` to "$CONFIG" array.

* **Access from other device on same wifi router**

> **Error-Message-02:**
> 
> Access through untrusted domain
>
> Please contact your administrator. If you are an administrator, edit the "trusted_domains" settings in config/config.php like the example in config.sample.php.
>
> Further information how to configure this can be found in the [documentation](https://docs.nextcloud.com/server/25/admin_manual/installation/installation_wizard.html#trusted-domains).
>
> **Solution-02:**
>
> [Add all private IPs (local network) to Trusted Devices](https://help.nextcloud.com/t/add-all-private-ips-local-network-to-trusted-devices/2524)
> Open file "xampp/htdocs/nextcloud/config/config.php"
> Add to "$CONFIG" array
> ```php
> 'trusted_domains' =>
>   array (
>     '192.168.0.*',
>   ),
> ```

# Usage

## Android-OS

### [Cx File Explorer](https://play.google.com/store/apps/details?id=com.cxinventor.file.explorer&hl=en&gl=US)
* Open "Cx File Explorer"
* Goto "NETWORK" tab -> New location -> REMOTE -> WebDAV
* Enter following details
  * Host: 192.168.0.100/nextcloud/remote.php/dav/files/demo/
  * Port: 80 [http]
  * Username: <Nextcloud login username>
  * Password: <Nextcloud login password>

# References

## Websites

* [nextcloud-snap/nextcloud-snap GitHub](https://github.com/nextcloud-snap/nextcloud-snap)
* [nextcloud/all-in-one GitHub](https://github.com/nextcloud/all-in-one)
  * [How to Install the Nextcloud All-in-One on Linux](https://nextcloud.com/blog/how-to-install-the-nextcloud-all-in-one-on-linux/)
* [nextcloud/vm](https://github.com/nextcloud/vm)

## Tutorials

* [WebDAV - Rclone Nextcloud](https://rclone.org/webdav/)

## YouTube Tutorials

* [How to Set Up Nextcloud on Ubuntu 24.04 LTS BY Learn Linux TV](https://www.youtube.com/watch?v=fpr37FJSgrw)
* [Let's use Rclone to connect to your Nextcloud to serve as a Backup option](https://www.youtube.com/watch?v=RIWF3WK4dD8)
* [16 of the BEST NextCloud apps to replace Google and Apple services BY The Linux Experiment](https://www.youtube.com/watch?v=MlLrcpXBB_A)
