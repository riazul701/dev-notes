# Usage

## Config
* Reconnect/Refresh Token: `rclone config reconnect <remote-name>:`

## Graphical User Interface - GUI
* Run this command in a terminal and rclone will download and then display the GUI in a web browser: `rclone rcd --rc-web-gui` <sup>{7}</sup>

# Rclone.md Contents

## Website
* [Rclone](https://rclone.org/)
* [Rclone GitHub](https://github.com/rclone/rclone)
* [Rclone GUI](https://rclone.org/gui/)
* [kapitainsky/RcloneBrowser](https://github.com/kapitainsky/RcloneBrowser)
* [newhinton/Round-Sync](https://github.com/newhinton/Round-Sync) || [roundsync.com](https://roundsync.com/)
* [yuudi/rclone-webui-angular](https://github.com/yuudi/rclone-webui-angular)

## Notes
* What is the password for rclone GUI?: The default username is user. The default password is pass.
* Get rclone config file path: `rclone config file` [Backup and Replace this file to use existing configured accounts in both PC and Android mobile (Round-Sync app)]

## Guides
* [The basics of Rclone](https://www.youtube.com/watch?v=YDF1nBaAptw)
* [How To Use Rclone For Windows](https://www.youtube.com/watch?v=QPqN1SXixQg)
* [Rclone Google Drive](https://rclone.org/drive/)
* [Rclone Bisync](https://rclone.org/bisync/)

# Installation

## Windows-OS Installation

* Manual Way
  * Download "rclone" from "https://rclone.org/downloads/" and unzip it to "C:\rclone"
  * This PC (right click) -> Properties -> Advanced system settings -> Environment Variables -> User variable for <user_name> -> Path -> Edit -> Append text ";C:\rclone" [On Windows 10 click on "New" button. In "New user variable" dialog, set "Variable name: Path" and "Variable value: C:\rclone"]
  * Open Terminal and enter command "rclone" to check it is installed.

* Using Scoop package manager
  * Install Rclone
    * Add Bucket: `scoop bucket add main`
    * Install Rclone: `scoop install main/rclone`
  * Install RcloneBrowser
    * Add Bucket: `scoop bucket add extras`
    * Install RcloneBrowser: `scoop install extras/rclone-browser`

## Linux-OS Installation

* Using Script <sup>{1}</sup>
  * Command: `sudo -v ; curl https://rclone.org/install.sh | sudo bash`

## Google Drive Sync
** Generate Index
$ rclone lsf . --format "psth" --hash MD5 --files-only --recursive > ~/rclone_index/local_index.txt
$ rclone lsf testrc: --format "psth" --hash MD5 --files-only --recursive > ~/rclone_index/remote_index.txt

** "rclone-sync" bash script
File Path: C:\Program Files\Git\usr\bin\rclone-sync

# RClone Google Drive

## Website
* [Rclone Command Line](https://github.com/rclone/rclone)
* [Rclone Web UI](https://github.com/rclone/rclone-webui-react)

## Guides

## Note
* During `rclone config` of Google Drive, `Root Foler ID` is the last part of google drive folder url in browser. `Root Folder ID` is inside of advanced section during `rclone config`.

## Commands
* Set configuration: `rclone config`
* Show commands: `rclone help`
* Show information of a command: `rclone [command] --help`
* Sync source to destination. Make destination exact same like source: `rclone sync testrc: . --progress`
* Bisync current directory to remote: `rclone bisync . testrc: --resync --progress` [`--resync` flag is for error solving and `-progress` flag is for showing progress]
* 

## Client Secret ID

* CREATE ONE RCLONE-CLIENT-ID AND USE IT FOR ANY NUMBER (20/30) OF GOOGLE-DRIVE ACCOUNT.
* {4} [Making your own client_id](https://rclone.org/drive/#making-your-own-client-id)
* {5} [Python quickstart](https://developers.google.com/drive/api/quickstart/python)
* {6} [How to delete Project from Google Developers Console](https://stackoverflow.com/questions/24801168/how-to-delete-project-from-google-developers-console)

1. Log into the [Google API Console](https://console.developers.google.com/) with your Google account. It doesn't matter what Google account you use. (It need not be the same account as the Google Drive you want to access)
2. Select a project or create a new project.
3. Under "ENABLE APIS AND SERVICES" search for "Drive", and enable the "Google Drive API".
4. Click "Credentials" in the left-side panel (not "Create credentials", which opens the wizard).
5. If you already configured an "Oauth Consent Screen", then skip to the next step; if not, click on "CONFIGURE CONSENT SCREEN" button (near the top right corner of the right panel), then select "External" and click on "CREATE"; on the next screen, enter an "Application name" ("rclone" is OK); enter "User Support Email" (your own email is OK); enter "Developer Contact Email" (your own email is OK); then click on "Save" (all other data is optional). You will also have to add some scopes, including .../auth/docs and .../auth/drive in order to be able to edit, create and delete files with RClone. You may also want to include the ../auth/drive.metadata.readonly scope. After adding scopes, click "Save and continue" to add test users. Be sure to add your own account to the test users. Once you've added yourself as a test user and saved the changes, click again on "Credentials" on the left panel to go back to the "Credentials" screen.
(PS: if you are a GSuite user, you could also select "Internal" instead of "External" above, but this will restrict API use to Google Workspace users in your organisation).
6. Click on the "+ CREATE CREDENTIALS" button at the top of the screen, then select "OAuth client ID".
7. Choose an application type of "Desktop app" and click "Create". (the default name is fine)
8. It will show you a client ID and client secret. Make a note of these.
(If you selected "External" at Step 5 continue to Step 9. If you chose "Internal" you don't need to publish and can skip straight to Step 10 but your destination drive must be part of the same Google Workspace.)
9. Go to "Oauth consent screen" and then click "PUBLISH APP" button and confirm. You will also want to add yourself as a test user.
10. Provide the noted client ID and client secret to rclone.

# Rclone Android

* [newhinton/Round-Sync](https://github.com/newhinton/Round-Sync)
* {2} [Official Support for the Android platform](https://forum.rclone.org/t/official-support-for-the-android-platform/25024)

# Error and Solution

## 1: Rclone config - port in use/exclude range

**Error_1:**

Fatal error: config failed to refresh token: failed to start auth webserver: listen tcp 127.0.0.1:53682: bind: An attempt was made to access a socket in a way forbidden by its access permissions.

**Solution_1:**

Cause of Problem: Rclone cannot start webserver because port is in exclude range.

Solution: <sup>{8}</sup>
* `net stop winnat`
* `net start winnat`

## 2: Rclone mount giving no response

**Error_2:**

Rclone mount Google-Drive giving no response
Command: `rclone mount <remote-name>:/ /mount/path/`

**Solution_2:**

* Restart graphical file manager (like: PCManFM).
* Try other commands <sup>{11}</sup>
  * `rclone mount <remote-name>:/ /mount/path/` -vv --allow-other
  * mount helper error: fusermount3: option allow_other only allowed if 'user_allow_other' is set in /etc/fuse.conf
  * `sudo vim /etc/fuse.conf`
    * Uncomment (revome "#") from `#user_allow_other`
    * Save and exit vim: `:wq`

# Rclone Storage providers

## Free Storage Limit

* 1Fichier - 1TB Temporary Storage. Also remember that the service will drop files that haven’t been downloaded over the last 30 days.
* Akamai Netstorage 
* Alibaba Cloud (Aliyun) Object Storage System (OSS) 
* Amazon Drive  (See note)
* Amazon S3 
* Backblaze B2 
* Box 
* Ceph 
* China Mobile Ecloud Elastic Object Storage (EOS) 
* Cloudflare R2 
* Arvan Cloud Object Storage (AOS) 
* Citrix ShareFile 
* DigitalOcean Spaces 
* Digi Storage 
* Dreamhost 
* Dropbox 
* Enterprise File Fabric 
* FTP 
* Google Cloud Storage 
* Google Drive 
* Google Photos 
* HDFS (Hadoop Distributed Filesystem) 
* HiDrive 
* HTTP 
* Huawei Cloud Object Storage Service(OBS) 
* Internet Archive 
* Jottacloud 
* IBM COS S3 
* IONOS Cloud 
* Koofr 
* Mail.ru Cloud 
* Memset Memstore 
* Mega 
* Memory 
* Microsoft Azure Blob Storage 
* Microsoft OneDrive 
* Minio 
* Nextcloud 
* OVH 
* OpenDrive 
* OpenStack Swift 
* Oracle Cloud Storage 
* Oracle Object Storage 
* ownCloud 
* pCloud 
* premiumize.me 
* put.io 
* QingStor 
* Qiniu Cloud Object Storage (Kodo) 
* Rackspace Cloud Files 
* RackCorp Object Storage 
* Scaleway 
* Seafile 
* SeaweedFS 
* SFTP 
* SMB / CIFS 
* StackPath 
* Storj 
* SugarSync 
* Tencent Cloud Object Storage (COS) 
* Wasabi 
* WebDAV 
* Yandex Disk - 5GB
* Zoho WorkDrive 
* The local filesystem 

# References

* next-sl: {12}

* Install/Uninstall
  * {1} [Rclone Install](https://rclone.org/install/)

* RClone GUI
  * {7} [Rclone GUI](https://rclone.org/gui/)

* RClone Google Drive
  * {4} [Making your own client_id](https://rclone.org/drive/#making-your-own-client-id)
  * {5} [Python quickstart](https://developers.google.com/drive/api/quickstart/python)
  * {6} [How to delete Project from Google Developers Console](https://stackoverflow.com/questions/24801168/how-to-delete-project-from-google-developers-console)

* Rclone Android
  * {2} [Official Support for the Android platform](https://forum.rclone.org/t/official-support-for-the-android-platform/25024)
  * {3} [turn your android phone into a media server](https://github.com/rclone/rclone/wiki/turn-your-android-phone-into-a-media-server)

* Error and Solution

  * 1: Rclone config - port in use/exclude range
    * {8} [Cannot bind to some ports due to permission denied](https://stackoverflow.com/questions/48478869/cannot-bind-to-some-ports-due-to-permission-denied)
    * {9} [An attempt was made to access a socket in a way forbidden by its access permissions](https://stackoverflow.com/questions/15619921/an-attempt-was-made-to-access-a-socket-in-a-way-forbidden-by-its-access-permissi)
    * {10} [[Solved] Rclone Windows can’t create socket for auth webserver even when Win fw disabled](https://forum.rclone.org/t/solved-rclone-windows-cant-create-socket-for-auth-webserver-even-when-win-fw-disabled/35358)

  * 2: Rclone mount giving no response
    * {11} [Rclone mount giving no response](https://forum.rclone.org/t/rclone-mount-giving-no-response/19041)
