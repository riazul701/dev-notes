# Server/Media-Server.md

# Antix-OS Setup

* FileZilla Server
  * Do not install FileZilla-Server, because it requires "systemctl" and "journalctl". Antix-OS uses "SysVinit".
  * If FileZilla-Server "deb" file has broken installation, then first remove user "ftp" "sudo userdel ftp"
    * [Linux List All Users In The System Command](https://www.cyberciti.biz/faq/linux-list-users-command/)
      * List all users: cat /etc/passwd
    * [How to Delete/Remove Users in Linux (userdel Command)](https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command/)
  * Remove broken FileZilla-Server installation:
  * [How to remove/install a package that is not fully installed?](https://askubuntu.com/questions/438345/how-to-remove-install-a-package-that-is-not-fully-installed)
    * sudo rm /var/lib/dpkg/info/[package_name].*
    * sudo dpkg --configure -a
    * sudo apt-get update
    * sudo apt-get install --reinstall dpkg

* ProFTPD
  * [How to Install and Set Up ProFTPD With TLS on Ubuntu](https://www.makeuseof.com/install-proftpd-on-ubuntu/)
    * Check ProFTPD is running or not: service proftpd status
  * Get local pc ip address: ifconfig
  * Default user of ProFTPD program is "proftpd"
  * [How to Install and Configure ProFTPD Server in Ubuntu/Debian](https://www.youtube.com/watch?v=cqkdD7slHBw)
    * Change FTP user's password: sudo passwd proftpd [Here "proftpd" is user name, which will be used during ftp login] [Do this for first time ProFTPD setup.]
    * Add new ftp user: sudo useradd proftpduser
    * Change ftp user password: sudo passwd proftpduser
    * Assign folder to ftp user (that user will access): sudo usermod -m -d /var/www/ proftpduser
  * ProFTPD logs are here: /var/log/proftpd/
  * Debug ProFTPD: proftpd -nd6
  * USER proftpd (Login failed): Invalid shell: '/usr/sbin/nologin'
    * [3 Ways to Change a Users Default Shell in Linux](https://www.tecmint.com/change-a-users-default-shell-in-linux/)
    * See shells in system: cat /etc/shells
    * Assign shell to user: usermod --shell /bin/bash proftpd
  * [How To Configure FTP Server on Ubuntu using ProFTPD](https://technixleo.com/configure-ftp-server-on-ubuntu-using-proftpd/)

* NOIP
  * [How to Download and Configure the No-IP Dynamic Update Client on Linux](https://www.youtube.com/watch?v=8xp4kkbsZi0)
  * [Download Client](https://www.noip.com/client/linux/noip-duc-linux.tar.gz)
  * Download the DUC and save the file to: /usr/local/src
  * Open terminal and execute the following:
  * cd /usr/local/src
  * tar xzf noip-duc-linux.tar.gz
  * cd no-ip-2.1.9
  * make
  * make install
  * Create the configuration file: /usr/local/bin/noip2 -C
  * You will be prompted to enter your username and password for No-IP, and for the hostnames you wish to update.
  * Launch the DUC: /usr/local/bin/noip2
  * Need more detailed instructions? Check out our [Knowledge Base article](https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client/).
  * [How to Port Forward a TP-Link Router](https://www.noip.com/support/knowledgebase/setting-port-forwarding-tp-link-router/)

* Configuration and Testing
  * Test Ping if Server is running (If firewall is blocking connection): [Ping.eu](https://ping.eu/ping/)
  * [How to see incoming IPs in Linux?](https://serverfault.com/questions/405647/how-to-see-incoming-ips-in-linux)
    * tcpdump -ni any port 2222
  * Port Checking
    * [Port Forwarding: How to Check If Your Router/Firewall Ports are Open Correctly](https://www.noip.com/blog/2012/02/07/port-forwarding-tip-how-to-check-if-your-routerfirewall-ports-are-open-correctly/)
    * [PortCheckTool.com - Port Check and IP detection Tool](https://www.portchecktool.com/)
    * [How to Port Forward – General Guide to Multiple Router Brands](https://www.noip.com/support/knowledgebase/general-port-forwarding-guide/)
    * [How to Troubleshoot Device Connection Issues: Port Forwarding](https://www.youtube.com/watch?v=CLunOJZqmc0)
    * "netstat" command
  * IPTables
    * [How to start/stop iptables on Ubuntu?](https://serverfault.com/questions/129086/how-to-start-stop-iptables-on-ubuntu)
      * sudo iptables-save > /root/firewall.rules
    * sudo ufw allow ftp
  * UFW (Configures IPTables)
    * [UFW Essentials: Common Firewall Rules and Commands](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands)
    * [How to Configure Ubuntu Firewall with UFW](https://www.cherryservers.com/blog/how-to-configure-ubuntu-firewall-with-ufw)
    * [Configuring Firewall to enable FTP, SSH and HTTP on Ubuntu](https://developernote.com/2013/08/configuring-firewall-to-enable-ftp-ssh-and-http-on-ubuntu/)
      * Enable UFW and check its status: "ufw enable", "ufw status verbose"
      * Allow FTP, SSH and HTTP: "ufw allow ssh", "ufw allow ftp", "ufw allow http"
      * Custom Commands: "sudo ufw allow 20/tcp" (for FTP), 

# Windows-OS Setup

* Scanning Port
  * [Advanced Port Scanner](https://www.advanced-port-scanner.com/)
  * [TCP Listen](https://www.allscoop.com/tcp-listen.php)
  * [Ping Test](https://ping.eu/)
  * [PortCheckTool.com - Port Check and IP detection Tool](https://www.portchecktool.com/)
  * [CanYouSeeMe.org](https://canyouseeme.org/)

# References

## Websites

* [linuxserver.io](https://www.linuxserver.io/)
  * [linuxserver.io Docker Hub](https://hub.docker.com/u/linuxserver)
* [qbittorrent.org](https://www.qbittorrent.org/)

* [homarr.dev => Dashboard for your server](https://homarr.dev/) || [homarr-labs/homarr GitHub](https://github.com/homarr-labs/homarr)
* [Ravencentric/awesome-arr GitHub](https://github.com/Ravencentric/awesome-arr)

* Media Downloader
  * [wiki.servarr.com => Consolidated wiki for Lidarr, Prowlarr, Radarr, Readarr, and Sonarr](https://wiki.servarr.com/)
  * [lidarr.audio => Music collection manager](https://lidarr.audio/) || [Lidarr/Lidarr](https://github.com/Lidarr/Lidarr)
  * [radarr.video => Movie collection manager](https://radarr.video/) || [Radarr/Radarr GitHub](https://github.com/Radarr/Radarr)
  * [readarr.com => Ebook collection manager](https://readarr.com/) || [Readarr/Readarr GitHub](https://github.com/Readarr/Readarr)
  * [sonarr.tv => Smart PVR for newsgroup and bittorrent users](https://sonarr.tv/) || [Sonarr/Sonarr GitHub](https://github.com/Sonarr/Sonarr)
  * [prowlarr.com => Indexer manager/proxy built on the popular arr](https://prowlarr.com/) || [Prowlarr/Prowlarr GitHub](https://github.com/Prowlarr/Prowlarr)
  * [home.tdarr.io](https://home.tdarr.io/)
  * [lunasea.app => Self-hosted software controller](https://www.lunasea.app/) || [jagandeepbrar/lunasea GitHub](https://github.com/JagandeepBrar/LunaSea)

## Tutorials

* Media Downloader
  * [Sonarr, Radares, Lidarr, Prowlarr](https://www.reddit.com/r/Fedora/comments/rm0rcp/sonarr_radares_lidarr_prowlarr/)

## Guides

* Others
  * [Duck DNS](https://www.duckdns.org/)
  * [NoIP Free](https://www.noip.com/free)
  * [ProFTPD WikiPedia](https://en.wikipedia.org/wiki/ProFTPD)
  * [Cannot install gproftpd - Ubuntu Forum](https://ubuntuforums.org/showthread.php?t=1416567)
  * [How to Setup vsftpd FTP Server on Debian 10?](https://linuxhint.com/setup-vsftpd-ftp-server-on-debian10/)
  * [GproFTPd](https://directory.fsf.org/wiki/GproFTPd)
  * [Everything You Need to Troubleshoot, Diagnose, and Fix Port Forwarding Issues.](https://portforward.com/)

## YouTube Tutorials

* General
  * [What's on my Home Server?? MUST HAVE Services! BY TechHut](https://www.youtube.com/watch?v=yUyxJr2xboI)

* FTP Server
  * [How to Setup an FTP Server on Windows 10 BY ProgrammingKnowledge](https://www.youtube.com/watch?v=ke3tnd73aUI)
  * [Filezilla FTP Server Setup for Windows BY Codingram](https://www.youtube.com/watch?v=HKJVWWFkZ_0)

* Media Download
  * [Setup Guide The Arrs Apps Prowlarr Sonarr Radarr Lidarr Readarr On Windows On Dockge On Docker BY KL Tech Videos](https://www.youtube.com/watch?v=3k_MwE0Z3CE)
  * [Prowlarr Media Search BY LoRes DIY](https://www.youtube.com/watch?v=kolBmw6X_xM)
  * [Find that music with Lidarr BY LoRes DIY](https://www.youtube.com/watch?v=azCIZzUriEU)

* Port Forwarding
  * [Connect to your PC using dynamic IP ! Free, Anywhere BY NETVN82](https://www.youtube.com/watch?v=3GxBkegfofI)
  * [Access Your Computer's Files From Anywhere In The World BY TechWiser](https://www.youtube.com/watch?v=SnLkrwMMxGA)
  * [Port Forwarding Kya Hota Hai ? | What is Port Forwarding & Use Of NoIP BY Technical Sagar](https://www.youtube.com/watch?v=cU7tiU77Xrk)
  * [Noip Website ko kaise use kare | How to use noip website | Dynamic DNS Practical BY Technical Sagar](https://www.youtube.com/watch?v=qU8K8bzVgOM)
  * [Port Forwarding ! How to Access Your PC Files From Anywhere In The World ? FTP Server Windows 10 BY Sarcastic Sindhi](https://www.youtube.com/watch?v=Mv15PBZgIcY)
  * [How to Download and Configure the No-IP Dynamic Update Client on Linux BY No-IP](https://www.youtube.com/watch?v=8xp4kkbsZi0)
