** Alpine Linux Gist-Backup

Guide:
1. https://stackoverflow.com/questions/52899227/alpine-add-package-from-edge-repository
2. https://stackoverflow.com/questions/73374745/error-http-dl-4-alpinelinux-org-alpine-edge-testing-untrusted-signature
3. https://github.com/cli/cli/blob/trunk/docs/install_linux.md
4. https://pkgs.alpinelinux.org/contents?branch=edge&name=github-cli&arch=x86_64&repo=community

Note:
** For Windows 8.1 GitHub CLI working version is "gh_2.14.4_windows_amd64.msi"
In github-cli version ghi 1.0.0 it is installed in "/usr/bin/ghi" path, for later version path is "/usr/bin/gh"

In Vagrantfile share folder Host to Guest
config.vm.synced_folder "./data", "/vagrant"

Commands:
sudo su -- Enter into Super User Mode in Linux Operating System

sudo apk update

apk search github-cli

sudo apk add github-cli -- Install "github-cli" package

apk info -- Show installed packages

sudo apk del github-cli -- Uninstall "github-cli" package

sudo updatedb -- Update database, that is used by "locate" command

locate github-cli -- Find file

apk add librdkafka --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community  -- Install from Alpine EDGE Repository
apk add github-cli --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community  -- Install from Alpine EDGE Repository

[Working Command]
sudo su -- Enter into Super User Mode in Linux Operating System
exit -- Exit from Super User Mode
cat /etc/apk/repositories -- Show content from Alpine repository list
echo "@edge-community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
sudo apk update --allow-untrusted
sudo apk add git@edge-community --allow-untrusted
sudo apk add github-cli@edge-community --allow-untrusted
sudo apk add zip@edge-community --allow-untrusted
[Note: Do not backup gist into vagrant shared folder, because if host os is windows7/8/10/11 then file name case sensitivity conflicts. Instead backup gist into another location, zip Gist_Backup and copy Gist_Backup.zip to vagrant shared folder.]
gh extension install riazul701/gh-gist-backup
cd /home/backup
gh auth login
gh gist-backup backup
zip -r Gist_Backup.zip Gist_Backup
cp Gist_Backup.zip /home/vagrant/
