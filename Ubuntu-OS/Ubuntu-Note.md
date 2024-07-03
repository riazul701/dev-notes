*** Problem: When mouting external HDD Drive they are read-only (Both same HDD of Ubuntu or Other HDD) and can not write to them.
	Solution: This happens when you are running Windows OS alongside with Ubuntu. Startup Windows 8 -> Access Control Panel -> Power Option -> Click "Choose what the power buttons do" -> Click "Change settings that are currently unavailable" -> Uncheck "Turn on fast startup" -> Reboot and log in Ubuntu.
Guide: https://askubuntu.com/questions/963944/you-are-trying-to-save-the-file-on-a-read-only-disk-when-trying-to-save-a-file

1. Mount "htdocs" and "mysql" folder
https://askubuntu.com/questions/205841/how-do-i-mount-a-folder-from-another-partition

"sudo mount --bind some/where else/where"



2. Xampp - Move "htdocs" folder

https://stackoverflow.com/questions/18902887/how-to-configuring-a-xampp-web-server-for-different-root-directory



3. Xampp - Move "mysql/data" folder

https://stackoverflow.com/questions/19199039/xampp-change-mysql-data-dir-not-working

4. Xampp Application Log Solve:

Stderr:
/opt/lampp_5.6.15/proftpd/scripts/ctl.sh: 50: /opt/lampp_5.6.15/proftpd/scripts/ctl.sh: /opt/lampp/sbin/proftpd: not found

Stderr:
/opt/lampp_5.6.15/apache2/scripts/ctl.sh: 50: /opt/lampp_5.6.15/apache2/scripts/ctl.sh: /opt/lampp/bin/httpd: not found

5. Laradock Nginx "http://localhost" not found 404 (FOR Multiple Project Installation. For single project it will be ok.)
https://github.com/laradock/laradock/issues/86#issuecomment-264181045

Create docker containers using command "docker-compose up -d nginx mysql phpmyadmin redis workspace"

Note: Laradock assumes laravel source code is at "/var/www" directory in "workspace" container. So it finds for index.php file in "/var/www/public/index.php" directory.
Open file "laradock/nginx/sites/default.conf" and change line from "root /var/www/public" to "root /var/www".
Rebuild (configuration change) docker container using command "sudo docker-compose build nginx"
Configuration change for all docker container "sudo docker-compose build"

For Windows OS change path separator from ":" to ";" in ".env" file.

PhpMyAdmin Access:
Hostname: mysql
User Name: root
Password: root

Database Configuration for Laravel:
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=test_lara_1
DB_USERNAME=root
DB_PASSWORD=root

Run Laravel Command: "php artisan cache:clear" and "php artisan migrate"
Enter docker container using command: "docker container exec -it <container name/id> bash"
Start and Stop container by using command: "docker-compose start" and "docker-compose stop" (Current directory must be laradock directory)

PHP 7.4.30 (cli) (built: Jun 27 2022 08:20:35) ( NTS )


6. (On Windows Docker ToolBox) Docker compose throws - adduser: group 'www-data' in use
https://stackoverflow.com/questions/56960355/docker-compose-throws-adduser-group-www-data-in-use

You can find the DockerFile inside laradock/nginx folder. Just change the line

&& adduser -D -H -u 1000 -s /bin/bash www-data
to
&& adduser -D -H -u 1000 -s /bin/bash www-data -G www-data

This specifies the group that the user is a member of. Once done, build and bring your containers up with

docker-compose build --no-cache nginx
docker-compose up -d

7. Windows Docker ToolBox only works if Laradock folder is located at "C:\Users" directory. Otherwise source code and config files are not mounted to docker containers.
https://stackoverflow.com/questions/33126271/how-to-use-volume-option-with-docker-toolbox-on-windows

Docker Machine commands: "docker-machine start", "docker-machine stop", "docker-machine restart", "docker-machine env", "docker-machine ssh"

8. mysql docker container exited with code 1
https://stackoverflow.com/questions/52698909/mysql-docker-container-exited-with-code-1



