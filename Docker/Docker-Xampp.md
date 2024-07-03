# Docker/Docker-Xampp.md

## Websites (Docker-Xampp)
* [Docker-Xampp GitHub](https://github.com/riazul701/docker-xampp)
* [PHP Official Image](https://hub.docker.com/_/php)
* [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer)
* [Tmux Terminal Multiplexer](https://github.com/tmux/tmux)
* [Tmuxinator - Tmux Config](https://github.com/tmuxinator/tmuxinator)
* [Starship Shell Prompt](https://github.com/starship/starship)

## Tutorials (Docker-Xampp)
* [Setup Xdebug WITH DOCKER and debug in VSCode](https://www.youtube.com/watch?v=it7JQKPfWTU)

## Notes (Docker-Xampp)
* Switch to "root" user inside container: `su -`
* "docker compose" and "docker-compose" are two different programs. "docker compose" is buit-in inside Docker and "docker-compose" is separate project.
* Use docker without "sudo"
  * [Remote Development BY Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
  * Add your user to the docker group by using a terminal to run: `sudo usermod -aG docker $USER` Sign out and back in again so this setting takes effect.

* Extensions
  * There are two machines - Host and Docker. For debugging, Browser and VSCode must be on Host machine.
  * PHP configuation path: "/usr/local/etc/php"
  * PHP extensions path: "/usr/src/php/ext"
  * Shows phpinfo() inside Terminal: `php -i`
  * Shows php configuration files: `php --ini`
  * Commands for Extensions Management
    * docker-php-ext-configure
    * docker-php-ext-install
    * docker-php-ext-enable (Optional) 
      * Generally use after `pecl install <extension-name>` command.
    * Commands use sequence: docker-php-ext-configure + install + enable (Optional)
      * Reference: [LaraDock php-worker Dockerfile](https://github.com/laradock/laradock/blob/master/php-worker/Dockerfile) -- Section: (# Intl:)


## Guides (Docker-Xampp)
* Shell and Bash
  * [Pass args for script when going thru pipe](https://stackoverflow.com/questions/14693100/pass-args-for-script-when-going-thru-pipe)

* PHP Extension
  * [Installing GD in Docker](https://stackoverflow.com/questions/39657058/installing-gd-in-docker)

* Docker-Compose
  * [Add a “–no-cache” Option to “docker-compose build”](https://linuxhint.com/add-no-cache-option-docker-compose-build/)

* Composer
  * [Install Composer Globally](https://getcomposer.org/doc/00-intro.md#globally)
  * [Installing composer using curl](https://gist.github.com/vinaydotblog/6896317)

* XDebug
  * [XDebug Install](https://xdebug.org/docs/install)
  * [Debugging PHP with XDebug v3 inside Docker using VSCode](https://gist.github.com/megahirt/e80086d1d029a7406e9eaec1fb1dcc9e)
  * [Xdebug: [Step Debug] Could not connect to debugging client](https://stackoverflow.com/questions/64878376/xdebug-step-debug-could-not-connect-to-debugging-client)
  * [Laravel 9 with Sail: XDebug not connecting](https://laracasts.com/discuss/channels/laravel/laravel-9-with-sail-xdebug-not-connecting?page=1&replyId=801714)

* PHP-Docker Config
  * [How to determine if a process runs inside lxc/Docker?](https://stackoverflow.com/questions/20010199/how-to-determine-if-a-process-runs-inside-lxc-docker)
  * [How does my PHP recognise whether it is running via Docker or Xampp?](https://stackoverflow.com/questions/70077960/how-does-my-php-recognise-whether-it-is-running-via-docker-or-xampp)

## Error and Solution (Docker-Xampp)
  
* Error Message: Docker: Temporary failure resolving 'deb.debian.org'
  * [Docker: Temporary failure resolving 'deb.debian.org'](https://stackoverflow.com/questions/61567404/docker-temporary-failure-resolving-deb-debian-org)
  * Restart Docker: `sudo service docker restart`

* PHP-APACHE: You don't have permission to access this resource.Server unable to read htaccess file, denying access to be safe
  * [Server unable to read htaccess file, denying access to be safe](https://stackoverflow.com/questions/31365981/server-unable-to-read-htaccess-file-denying-access-to-be-safe)
  * sudo chown -R www-data:www-data /var/www/YOUR-DIRECTORY
  * chown -R www-data:www-data .

## Host OS & Docker Network Conflicts

### Docker Antix-OS WiFi Conflict
* Problem: Docker wired network conflicts with WiFi, as result internet connection does not work.
* Solution
  * Open "Connman System Tray"
  * Goto "Status" tab
  * Goto "Services" section
  * Move WiFi connection at first position.

### Instructions (Conflicts)
* See active networks: `docker network ls`
* Remove unused networks: `docker network prune`
* Manage containers: `docker container ls`, `docker container stop`, `docker container rm <container-id>`
* NOTE: Use `docker-compose down` instead of `docker-compose stop`

## Commands (Docker-Xampp)
* Build with compose: `docker-compose up --build --detach`
* Enter inside of container: `docker container exec -it <container-name> bash`
* Build without cache: `docker-compose build --no-cache`
* Build with memory-limit and no-cache: `docker-compose build --no-cache --memory 1024m`

# PHP-APACHE Dockerfile

## Ruby

### Installation (Ruby)
* Install GPG2: `apt install gnupg2`
* Install signature-1: `curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -`
* Install signature-2: `curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -`
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable --ruby` [Install Ruby-3.0.0]
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable` [Install Latest Ruby]
* Add RVM to PATH: `echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc` -> `source ~/.bashrc`
* Install specific Ruby version: `rvm install ruby-3.2.2`
* Check ruby version: `ruby --version`
* Check gem (ruby package manager) version: `gem --version`

### Guides (Ruby)
* [Ruby Language](https://www.ruby-lang.org/en/downloads/)
* [Ruby Version Manager (RVM)](http://rvm.io/) || [Ruby enVironment Manager (RVM) GitHub](https://github.com/rvm/rvm)
* [Ubuntu - Install GPG 2](https://blog.programster.org/ubuntu-install-gpg-2)

## Rust

### Installation (Rust)
* Install rustc (rust language) and cargo (rust package manager)
  * [Install Rust](https://www.rust-lang.org/tools/install)
  * curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    * [run rustup's curl-fetched installer script non-interactively](https://stackoverflow.com/questions/57251508/run-rustups-curl-fetched-installer-script-non-interactively)
    * [Pass args for script when going thru pipe](https://stackoverflow.com/questions/14693100/pass-args-for-script-when-going-thru-pipe)
    * Unattended Install: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  * Add to $PATH: `source "$HOME/.cargo/env"`
  * Check rustc version: `rustc --version`
  * Check cargo version: `cargo --version`
  * LunarVim installation shows error: Unable to find cargo. Make sure to install it to avoid problems.
  * [Create Symlink](https://stackoverflow.com/questions/1951742/how-can-i-symlink-a-file-in-linux)
    * sudo ln -s ~/.cargo/bin/rustc /usr/bin/rustc
    * sudo ln -s ~/.cargo/bin/cargo /usr/bin/cargo
    * sudo ln -s ~/.cargo/bin/rustup /usr/bin/rustup
    * sudo rustup default stable

## Git & Git-Credential-Manager

### Instructions (GCM/Linux-OS)

* Install Using DEB file
  * Download DEB file from [GitCredentialManager DEB File](https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.886/gcm-linux_amd64.2.0.886.deb)
  * Install: `sudo dpkg -i <path-to-package>`
  * Installation configure: `git-credential-manager configure`
  * Uninstallation configure: `git-credential-manager unconfigure`
  * Uninstall: `sudo dpkg -r gcm`
  
* If there are errors duing DEB file installation, then try TAR file
  * Error Reason: [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * Debian’s dpkg package didn’t support zstd compression prior to version 1.21.18. Support was added just in time for Debian 12.

* Install Using TAR file
  * In Antix-OS-22-amd64 Full version, dpkg version is 1.20.12 (amd64). So use TAR instruction set.
  * Download TAR file from [GitCredentialManager TAR File](https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.886/gcm-linux_amd64.2.0.886.tar.gz)
  * Install: `tar -xvf <path-to-tarball> -C /usr/local/bin` [For permission error use `sudo` command]
  * Installation configure: `git-credential-manager configure`
  * Uninstallation configure: `git-credential-manager unconfigure`
  * Uninstall: `rm $(command -v git-credential-manager)`

### Configuration (GCM/Linux-OS)

* Attach GitCredentialManager with Git: `git config --global credential.helper manager`
* Settings for "credentialStore: gpg"
  * Install "gpg" command if not exists: `sudo apt install gpg`
  * Install "pass" command if not exists: `sudo apt install pass`
  * Generates "gpg-id": `gpg --gen-key` [Here provide Name and Email]
  * Generates pass file: `pass init <gpg-id>` [<gpg-id> is long hash which is under "pub" tag from `gpg --gen-key` command] [Here a password must be provided, which will be required during GitHub/BitBucket authentication]
  * Set credential backing store: `git config --global credential.credentialStore gpg`
* Settings for "credentialStore: cache"
  * Set credential backing store: `git config --global credential.credentialStore cache`
  * By default, git credential-cache stores credentials for 900 seconds.
* Configuration for [LazyGit](https://github.com/jesseduffield/lazygit)
  * Problem: GPG password prompt does not work with LazyGit.
  * When `gpg --gen-key` command asks for password, then do not enter any password and press "OK" button.
  * Now, during use of `git push` command, no password will be asked.
* Check GitCredentialManager is working or not: `git push`

### Error and Solution (GCM/Linux-OS)

* Error Message: fatal: No credential store has been selected.
  > $ git push
  > fatal: No credential store has been selected.
  > 
  > Set the GCM_CREDENTIAL_STORE environment variable or the credential.credentialStore Git configuration setting to one of the following options:
  >
  >  secretservice : freedesktop.org Secret Service (requires graphical interface)
  >  gpg           : GNU `pass` compatible credential storage (requires GPG and `pass`)
  >  cache         : Git's in-memory credential cache
  >  plaintext     : store credentials in plain-text files (UNSECURE)
  >
  > See https://aka.ms/gcm/credstores for more information.

  * Solution:
  * [How to fix git credential manager core](https://techoverflow.net/2021/09/19/how-to-fix-git-credential-manager-core-git-fatal-no-credential-backing-store-has-been-selected/)
  * `git config --global credential.credentialStore gpg`

### Guides (GCM/Linux-OS)
* [Unable to commit to git with the gpg key error](https://stackoverflow.com/questions/63793836/unable-to-commit-to-git-with-the-gpg-key-error)

## NeoVim

### Install NeoVim
* [Nvim release build](https://github.com/neovim/neovim/releases/tag/stable)
  * Download neovim.tar.gz: wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
* [Syntax For Tar Command To Extract Tar Files To a Different Directory](https://www.cyberciti.biz/faq/howto-extract-tar-file-to-specific-directory-on-unixlinux/)
  * tar xzvf nvim-linux64.tar.gz --directory /opt
* [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
  * source ~/.bashrc
* Remove neovim.tar.gz file: rm nvim-linux64.tar.gz

* ALTERNATE WAY: $PATH for BASH, ZSH, FISH and other shell, using "~/.profile" common file - [Adding a Path to the Linux PATH Variable](https://www.baeldung.com/linux/path-variable)
  * touch ~/.profile
  * echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.profile
  * Or if we’re using Bash, we could use the source command: source ~/.profile
  * We could also append our export command to ~/.bash_profile if we’re using Bash, but our changes won’t be reflected in other shells, such as Zsh.

### Errors of NeoVim
* NeoVim installation bash "source" command
  * [Using the RUN instruction in a Dockerfile with 'source' does not work](https://stackoverflow.com/questions/20635472/using-the-run-instruction-in-a-dockerfile-with-source-does-not-work)

* Error Message: NeoVim.AppImage requires FUSE to run
  * [AppImages don't work in Docker containers any more #828](https://github.com/AppImage/AppImageKit/issues/828)
  * nvim --appimage-extract-and-run [This command will extract "neovim" on current folder and run it.]

## LunarVim

### Installation (LunarVim)
* export LV_BRANCH='release-1.3/neovim-0.9' \
* curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | bash

### Guides
* [How To Set Environment Variable in Bash](https://devconnected.com/set-environment-variable-bash-how-to/)

## Docker PHP Extensions
* [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer)

### Notes (PHP-Extensions)
* XDebug
  * Check XDebug is installed: xdebug_info()
  * pecl install xdebug
    * Installing '/usr/local/lib/php/extensions/no-debug-non-zts-20220829/xdebug.so'
    * You should add "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20220829/xdebug.so" to php.ini

### Errors (PHP-Extensions)
* docker-php-ext-install xdebug
  * Error: /usr/src/php/ext/xdebug does not exist
  * Solution

* Call to undefined function Intervention\Image\Gd\imagecreatefromjpeg()
  * Error Message:
  > local.ERROR: Call to undefined function Intervention\Image\Gd\imagecreatefromjpeg() {"userId":1,"exception":"[object] 
  > (Error(code: 0): Call to undefined function Intervention\\Image\\Gd\\imagecreatefromjpeg() at 
  > /var/www/html/<project-name>/vendor/intervention/image/src/Intervention/Image/Gd/Decoder.php:38)
  * Solution
  * [Call to undefined function Intervention\Image\Gd\imagecreatefromjpeg() Laravel 8 + Docker desktop 4.4.4](https://stackoverflow.com/questions/70979075/call-to-undefined-function-intervention-image-gd-imagecreatefromjpeg-laravel-8)
  * docker-php-ext-configure and docker-php-ext-install php "gd" extension (docker-php-ext-enable is not necessary)

### Settings (PHP-Extensions)
* XDebug
  * php.ini
  ```shellscript
  [xdebug]
  zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20220829/xdebug.so
  xdebug.mode=debug
  xdebug.start_with_request=yes
  xdebug.client_host="host.docker.internal"
  ```

  * .vscode/launch.json
  ```json
  "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/var/www/html/test-debug-1": "${workspaceFolder}"
            }
        }
    ]
  ```

# MariaDB - Dockerfile

## Error and Solution (MariaDB)

* MariaDB latest version error

  * See Error Message: `sudo docker logs <mariadb-container-name>`
  * mariadb_1  |  [Warning] mariadbd: io_uring_queue_init() failed with ENOMEM: try larger memory locked limit, ulimit -l, or https://mariadb.com/kb/en/systemd/#configuring-limitmemlock under systemd (262144 bytes required)
  mariadb_1  |  [Warning] InnoDB: liburing disabled: falling back to innodb_use_native_aio=OFF
  
  * Solution
  * [Error starting mariaDB on docker-compose build](https://stackoverflow.com/questions/72410663/error-starting-mariadb-on-docker-compose-build)
  * Same problem here with latest docker container of MariaDB and the latest tag. Pinning to 10.8.2 (mariadb:10.8.2) in docker-compose fixes this issue.db:
  This is my new image line and with 10.8.2 it keeps working. In the mariadb issue tracker is already a discussion going so they are working on this.
  image: mariadb:10.8.2
  * Worked for me. I used 10.7 as suggested below.

# Code-Server - Dockerfile

## Websites (Code-Server)
* [Coder](https://coder.com/) || [Coder GitHub](https://github.com/coder/code-server)
* [linuxserver/docker-code-server GitHub](https://github.com/linuxserver/docker-code-server)
* [linuxserver/code-server DockerHub](https://hub.docker.com/r/linuxserver/code-server)
* [Code-Server Extension](https://open-vsx.org/) || [Code-Server Extension GitHub](https://github.com/eclipse/openvsx)

## Notes (Code-Server)
* SSH
  * By default, "sshd" prohibits "root" login. First add user "test" with password. Login using "test" user and use command "su" to become "root". [Not Working] Alternatively, edit /etc/ssh/sshd_config and add the line "PermitRootLogin yes"
  * vim /etc/ssh/sshd_config -> Uncomment "Port 22"

## Guides (Code-Server)

* General
  * [Allow pre-installing VS code server and extensions in development Docker image #1718](https://github.com/microsoft/vscode-remote-release/issues/1718)
  * [How do I set hostname in docker-compose?](https://stackoverflow.com/questions/29924843/how-do-i-set-hostname-in-docker-compose)

* SSH
  * [How to execute command from one docker container to another](https://stackoverflow.com/questions/59035543/how-to-execute-command-from-one-docker-container-to-another)
  * [SSH into Docker Container [3 Simple Methods]](https://www.golinuxcloud.com/docker-container-ssh/)
  * [Run sshd in Docker container](https://stackoverflow.com/questions/65381311/run-sshd-in-docker-container)
  * [How to reset default ssh password in Ubuntu?](https://superuser.com/questions/404701/how-to-reset-default-ssh-password-in-ubuntu)
  * [Change User's Password using root](https://superuser.com/questions/809683/change-users-password-using-root)
  * [How do I create a user with a password in one line, in Bash, on Redhat?](https://serverfault.com/questions/868092/how-do-i-create-a-user-with-a-password-in-one-line-in-bash-on-redhat)

* Docker Entrypoint
  * [Appending to base image's ENTRYPOINT](https://stackoverflow.com/questions/42975476/appending-to-base-images-entrypoint)

## Commands (Code-Server)
* Check sshd is running: `service ssh status`
* Start sshd: `service ssh start`

# Connections

## Docker + VSCode + DBeaver

* Guides
  * [VisualStudio Code PHP executablePath in docker](https://stackoverflow.com/questions/53501925/visualstudio-code-php-executablepath-in-docker)
  * [kekeimiku/mysql](https://gist.github.com/kekeimiku/e1da488d96727789de88332499a51d57)
  * [What does $@ mean in a shell script?](https://stackoverflow.com/questions/9994295/what-does-mean-in-a-shell-script)
  * [Remove first element from $@ in bash [duplicate]](https://stackoverflow.com/questions/2701400/remove-first-element-from-in-bash)
  * [How to permanently set $PATH on Linux/Unix [closed]](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux-unix)
  * [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)

* Add to $PATH
  * Alternatively place executable files in: `/home/<user-name>/.local/bin`
  * echo $PATH
  * echo 'export PATH="$PATH:/home/<user-name>/.local/bin"' >> ~/.bashrc
  * source ~/.bashrc

* Create executables
  * sudo touch /usr/local/bin/dphp7.4.3
  ```shellscript
  #!/bin/bash
  docker exec -i e_xampp_743_php-apache_1 /usr/local/bin/php "$@"
  ```
  * sudo touch /usr/local/bin/dphp8.2.4
  ```shellscript
  #!/bin/bash
  docker exec -i e_xampp_824_php-apache_1 /usr/local/bin/php "$@"
  ```
  * sudo touch /usr/local/bin/dmysql7.4.3
  ```shellscript
  #!/bin/bash
  docker exec -i e_xampp_743_mariadb_1 /usr/bin/mysql "$@" -proot
  ```
  * sudo touch /usr/local/bin/dmysql8.2.4
  ```shellscript
  #!/bin/bash
  docker exec -i e_xampp_824_mariadb_1 /usr/bin/mysql "$@" -proot
  ```
  * sudo touch /usr/local/bin/dmysqldump7.4.3
  ```shellscript
  #!/bin/bash
  docker exec -i e_xampp_743_mariadb_1 /usr/bin/mysqldump "$@" -proot
  ```
  * sudo touch /usr/local/bin/dmysqldump8.2.4
  ```shellscript
  #!/bin/bash
  docker exec -i e_xampp_824_mariadb_1 /usr/bin/mysqldump "$@" -proot
  ```

* Reference Code
```shellscript
#!/bin/bash

php_version="$1"
shift; # Remove first argument
#echo "$@"

if [[ "${php_version}" == "7.4.3" ]]
then
  docker exec -i e_xampp_743_php-apache_1 /usr/local/bin/php "$@"
elif [[ "${php_version}" == "8.2.4" ]]
then
  docker exec -i e_xampp_824_php-apache_1 /usr/local/bin/php "$@"
else
  echo "Specify php version 7.4.3 / 8.2.4"
fi

```

# Project Setup

## Guides (Project Setup)
* [How to configure virtual host for laravel](https://medium.com/@laravelguy/how-to-configure-virtual-host-for-laravel-2e55e23219a)
* [Getting Started - LaraDock](https://laradock.io/getting-started/)
* [Laradock.io | Simple way to setup multiple projects in local environment in Mac/Windows](https://xmxxrxl.medium.com/laradock-io-simple-way-to-setup-multiple-projects-in-local-environment-in-mac-windows-1bb13487208)

## Instructions (Project Setup)
* `docker container exec -it e_xampp_743_php-apache_1 bash`
* Edit file: "/etc/apache2/sites-available/000-default.conf" [Make A Backup First]. Add these entry at the end of file
  ```shellscript
  <VirtualHost *:80>
    DocumentRoot /var/www/html/lara8vue2-snippet/public
    ServerName lara8vue2-snippet.test
  </VirtualHost>
  ```
* Edit file: "/etc/hosts" (On Host Operating System) [Make A Backup First]. Add these entry
  ```shellscript
  127.0.0.1 lara8vue2-snippet.test
  ```
* `docker-compose stop`
* `docker-compose ps`
* `docker-compose up -d`
* `service apache2 status` [Inside php-apache container]

# Docker Hub

## Websites
* [Docker Hub](https://hub.docker.com/)

## Xampp Instructions
* [Specify a Dockerfile (-f, --file)](https://docs.docker.com/engine/reference/commandline/build/#file)
  * Build from Dockerfile with Tag: `docker build --file /e/xampp_8.2.4/htdocs/docker-xampp/php-apache/Dockerfile.build /e/xampp_8.2.4/htdocs/docker-xampp/php-apache --tag <user-name>/xampp-php:8.2.4 --no-cache`
* Login to Docker-Hub: `docker login`
  * Shows Warning:
    > WARNING! Your password will be stored unencrypted in /home/<user-name>/.docker/config.json.
    > Configure a credential helper to remove this warning. See
    > [https://docs.docker.com/engine/reference/commandline/login/#credentials-store](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)

* Push to Docker-Hub: `docker push <user-name>/xampp-php:tagname`

## Commands (DockerHub)

## References (DockerHub)
