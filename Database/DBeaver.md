# DBeaver

## Websites
* [DBeaver](https://dbeaver.io/)
* [DBeaver GitHub](https://github.com/dbeaver/dbeaver)

## Notes
* In Linux-OS launch DBeaver using sudo mode: `sudo dbeaver`

# Connection

## DBeaver + Docker + MariaDB + AntixOS

* [kekeimiku/mysql](https://gist.github.com/kekeimiku/e1da488d96727789de88332499a51d57)
* Dbeaver connect to docker database unable to export and import temporary solutions. mysql/postgres
* localclient set to the directory where the below file is located
* Launch DBeaver in sudo mode `sudo dbeaver`, otherwise docker commands will not work.
* Setup a new connection with folling details
  * Server Host: localhost
  * Port: 3306
  * Username: root
  * Password: root
  * Local Client: "/home/<user-name>/.local/share/DBeaverData/mysql_home"
* Inside "/home/<user-name>/.local/share/DBeaverData/mysql_home" folder place these files
* File Name: mysql
```bash
#!/bin/bash
docker exec -i mysql-container-name /usr/bin/mysql $@ -proot
```
* File Name: mysqldump
```bash
#!/bin/bash
docker exec -i mysql-container-name /usr/bin/mysqldump $@ -proot
```
* File Name: pg_dump
```bash
#!/bin/sh
docker exec -i postgres-container-name /usr/local/bin/pg_dump $@
```
* File Name: pg_restore
```bash
#!/bin/sh
docker exec -i postgres /usr/local/bin/pg_restore $@
```
* Right click on database -> Tools -> Dump database / Restore database / Execute script
