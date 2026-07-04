# Xampp

## Notes

## Guides

# Make Xampp Cross-Platform Resource Share

## Concept - Linux
* During installation of xampp-windows, we can change installation path and folder name.
* During installation of xampp-linux, we can not change installation path and folder name. It will be installed in '/opt/lampp/' predefined path.
* First install different version xampp-linux (5.6.0, 7.2.0, 8.2.0) and rename folders to - lampp_5.6.0, lampp_7.2.0, lampp_8.2.0
* Do not use '/opt/lampp/' path.
* Use symlink to switch among xampp versions - lampp_5.6.0, lampp_7.2.0, lampp_8.2.0
* Check and mount hard disk partitions: `cd /` -> `sudo mkdir c` (create folder for partition) and `sudo fdisk -l` (check hard disk partition list) and `sudo mount /dev/sda2 /c` (mount partition)
* Also use symlink for "htdocs" and "mysql/data" folder.

## Guides - Linux
* [How to install multiple versions of XAMPP?](https://askubuntu.com/questions/198876/how-to-install-multiple-versions-of-xampp)
* [Play XAMPP "Happy Families" on Your PC](https://web.archive.org/web/20150919143637/http://www.jamesbrice.com/multiple-xampp-versions)

## Working Steps - Linux
* Install different version xampp-linux (5.6.0, 7.2.0, 8.2.0) and rename folders to - lampp_5.6.0, lampp_7.2.0, lampp_8.2.0
* 

# Xampp Local Network Access

## Fedora-OS

**[How to set up a firewall using FirewallD on RHEL 8](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/) <sup>{3}</sup>**

* Open firewall port (http, https) to access xampp from local network or Tailscale.

* Let us add rule (HTTP/80) and (HTTPS/443) permanently and reload firewalld:
```
$ sudo firewall-cmd --zone=public --add-service=http --permanent
$ sudo firewall-cmd --zone=public --add-service=https --permanent
$ sudo firewall-cmd --reload
```

* Verify it:
```
$ sudo firewall-cmd --list-services
$ sudo firewall-cmd --list-services --permanent
```

# Error and Solution

## Extension Error

* phpMyAdmin - Error: The mysqli extension is missing. Please check your PHP configuration. See our [documentation](http://localhost/phpmyadmin/doc/html/faq.html#faqmysql) for more information.
  * Run file "E:\xampp_8.2.4\setup_xampp.bat" in Non-Administrator mode. [Administrator mode shows error]
  * Shows Error
    > [XAMPP]: Test php.exe with php\php.exe -n -d output_buffering=0 --version ...
    > The system cannot find the path specified.
    > 
    > [ERROR]: Test php.exe failed !!!
    > [ERROR]: Perhaps the Microsoft C++ 2008 runtime package is not installed.
    > [ERROR]: Please try to install the MS VC++ 2008 Redistributable Package from the Mircrosoft page first
    > [ERROR]: http://www.microsoft.com/en-us/download/details.aspx?id=5582
  * Open PowerShell-7 in Administrator mode: 
    * `scoop bucket add extras`
    * `scoop install extras/vcredist2008`
  * Restart PC
  
## Apache Not Starting On Fedora LXDE 42

**Error-Message-1**

```
/opt/lampp/bin/httpd: error while loading shared libraries: libcrypt.so.1: cannot open shared object file: No such file or directory
```

**Solution-1**

* [Missing libcrypt.so in Fedora](https://stackoverflow.com/questions/78465523/missing-libcrypt-so-in-fedora)
  * In fedora 40, it was necessary the installation of the following package, to place the library libcrypt.so into the system : `sudo dnf install libxcrypt-compat`

**Error-Message-2**

```
httpd: Syntax error on line 522 of /opt/lampp/etc/httpd.conf: Syntax error on line 6 of /opt/lampp/etc/extra/httpd-xampp.conf: Cannot load modules/mod_perl.so into server: libnsl.so.1: cannot open shared object file: No such file or directory
```

**Solution-2**

* [How can I solve this problem of installation xampp on fedora?](https://stackoverflow.com/questions/55867534/how-can-i-solve-this-problem-of-installation-xampp-on-fedora)
  * It seems you're missing libnsl. install it through this command: `sudo dnf install libnsl`


# References

* next-sl: {4}

## Websites

* {1} [Xampp Official Site](https://www.apachefriends.org/)

## Tutorials

* FirewallD(Fedora)
  * {2} [How to enable firewalld logging for denied packets on Linux](https://www.cyberciti.biz/faq/enable-firewalld-logging-for-denied-packets-on-linux/)
  * {3} [How to set up a firewall using FirewallD on RHEL 8](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/)
