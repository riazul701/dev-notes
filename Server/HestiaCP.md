# HestiaCP.md Contents

## Websites


## Knowledge

* If we enter server's IP address into browser then this file will be loaded: "/var/www/html/index.html"
* Created domain will goto "/home" directory.
* VSFTPD FTP Server Credential: (Host: Server's IP Address), (UserName: HestiaCP Panel UserName), (Password: HestiaCP Panel Password), (Port: 21/Keep-It-Blank)
* By default, HestiaCP website php page does not show any error. Enable error from php script: <sup>{1}</sup>
```php
error_reporting(E_ALL);
ini_set('display_errors', '1');
```
* Change server's TimeZone: Admin Panel -> Settings -> Configure -> Basic Options -> Time Zone: Asia/Dhaka <sup>{7}</sup>
  * Active TimeZone: Go to Settings -> php(version)-fpm -> Restart

* PHP "ini" Settings: Admin Panel -> Settings -> php(version)-fpm -> Edit (Pencil Icon) [First make a backup of "ini" file]

# Configuration

## TimeZone

# References

* next-sl: {8}

* Knowledge
  * {1} [Showing all errors and warnings [duplicate]](https://stackoverflow.com/questions/5438060/showing-all-errors-and-warnings)

* Configuration
  * {7} [“Server” Timezone does not change to PHP](https://forum.hestiacp.com/t/server-timezone-does-not-change-to-php/851)

* YouTube Tutorial

  * PlayList
    * {2} [HestiaCP Tutorial Ubuntu 22.04 - Learn to use Hestia Control Panel BY Ricky Wahowa](https://www.youtube.com/playlist?list=PLhhBJ0l9FKMO6c7vaTBHSmu-rkc7pjwnn)

  * Video
    * {3} [HestiaCP Hestia Control Panel Full Tutorial - Installation, Users, DNS, WordPress, Backup, DB, Mail BY Bizanosa](https://www.youtube.com/watch?v=rQEzfp71WUY)
    * {4} [How to set up DNS on HestiaCP - Use Cloudflare or Personal Nameservers for HestiaCP DNS BY Ricky Wahowa](https://www.youtube.com/watch?v=CeBCPfD_l0k)
    * {5} [Learn to install Hestia Control Panel, Create Wordpress & Send Emails BY inGuide](https://www.youtube.com/watch?v=mYoJVS7c1yw)
    * {6} [Create Free Email Server With HestiaCP, Contabo VPS and Namecheap & Send Unlimited Free Emails BY Web Shanks](https://www.youtube.com/watch?v=LbO1oVKyD5s)
