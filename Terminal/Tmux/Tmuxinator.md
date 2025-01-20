# Tmux/Tmuxinator.md

## Websites
* [Tmuxinator GitHub](https://github.com/tmuxinator/tmuxinator)
* [MSYS2](https://www.msys2.org/)

## Tutorials
* [Using Tmuxinator with Netkit-JH](https://netkit-jh.github.io/blog/using-tmuxinator-with-netkit/)
* [Automating complex terminal flows with tmuxinator](https://dev.to/j_mplourde/automating-multiple-terminals-with-tmux-and-tmuxinator-47n2)

## Guides (Tmuxinator)

## Configuration
* Tmuxinator project config file directory change:
  * By default project config file location is "HOME" directory
    * On Linux: `/home/<user-name>/.config/tmuxinator`
  * Website Links    
    * [Project Configuration Location](https://github.com/tmuxinator/tmuxinator#project-configuration-location)
    * [Support specified config directory and XDG Base Dirs Spec (redux) #511](https://github.com/tmuxinator/tmuxinator/pull/511)
    * [How To Set Environment Variable in Bash](https://devconnected.com/set-environment-variable-bash-how-to/)
    * [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * echo 'export TMUXINATOR_CONFIG=/e/stproject/tmuxinator' >> ~/.bashrc
  * source ~/.bashrc
  * Additional Configuration
    * Check tmux, $EDITOR, $SHELL is set: `tmuxinator doctor`
    * Set $EDITOR: `echo 'export EDITOR=vim' >> ~/.bashrc`
    * Set $SHELL: `echo 'export SHELL=/usr/bin/bash' >> ~/.bashrc` [Check "bash" path: `which bash`]
    * source ~/.bashrc

## Tmux Commands
* Check tmux version: `tmux -V`

## Tmuxinator Commands
* Check tmuxinator version: `tmuxinator version`
* Check tmuxinator environment is set: `tmuxinator doctor`
* Start tmuxinator project: `tmuxinator start <project-name>`

# Installation

## Windows Installation

### Windows Git-Bash Pacman (Ruby)
* Install [PeaZip](https://github.com/peazip/PeaZip) to extract ".tar.zst" compressed file.
* [Installing pacman on git for windows](https://gist.github.com/AndreSteenveld/cb6662c93c8323795c5fd347defb8976)
  * Download the following packages from the [MSYS2 repository](https://repo.msys2.org/msys/x86_64/): pacman, pacman-mirrors, msys2-keyring.
  * Extract these files and copy files to respective folders. "/usr/bin" to "Git-Bash/usr/bin", "/etc" to "Git-Bash/etc" and so on.
* If [error: xxx: signature from "Christoph Reiter (MSYS2 master key) <reiter.christoph@gmail.com>" is unknown trust #2397](https://github.com/msys2/MSYS2-packages/issues/2397) is shown, then enter command:
  * `rm -r /etc/pacman.d/gnupg/`
  * `pacman-key --init`
  * `pacman-key --populate msys2`
* [Package Management using Pacman in Git-Bash](https://www.msys2.org/docs/package-management/)
  * Finding a package: `pacman -Ss <name or part of the name of the package>`
  * Installing a package: `pacman -S <name of the package>`
  * Uninstalling a package: `pacman -R <name of the package>`
* If [pacman "exists on filesystem" error](https://unix.stackexchange.com/questions/240252/pacman-exists-on-filesystem-error) is shown, then enter command
  * `sudo pacman -S --overwrite \* <package_name>` OR `sudo pacman -S --overwrite "*" <package_name>`
  * Check package is installed or not: `<package_name> --help`
  * Install "ruby": `pacman -S --overwrite "*" ruby`
* Check "ruby" version: `ruby --version`
* Check "gem" (ruby package manager) version: `gem --version`

* [Pacman package Manager – Removing packages](https://linuxconcept.com/pacman-package-manager-removing-packages/)
  * Removing ruby package using pacman: `pacman -R ruby` [Git-Bash does not have "sudo"]
  * Removing ruby and dependent packages: `sudo pacman -Rs ruby`

### Tmuxinator Install (Windows)
* Install Tmuxinator: `gem install tmuxinator` [Conflicts with "ruby" installed using "scoop". Therefore "tmuxinator" does not work.]
* [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * echo 'export PATH="$PATH:/c/Users/<user-name>/.local/share/gem/ruby/3.2.0/bin"' >> ~/.bashrc
  * source ~/.bashrc
* Check Tmuxinator version: `tmuxinator version`

* Error and Solution
  * Git-Bash: winpty nvim ["nvim" command does not work in Git-Bash, because mintty does not support prompt]
  * [tmux fails to start in local session #5132](https://github.com/microsoft/terminal/issues/5132)
    * script.exe actually comes with util-linux package (msys2)
    * Download "util-linux-x.y.z-x86_64.pkg.tar.zst" from [MSYS2 REPO x86_64](http://repo.msys2.org/msys/x86_64/).
    * Extract and copy "script.exe" file to "C:\ProgramData\scoop\apps\git\current\usr\bin" folder.
    * Open Git-Bash and enter command "script --help"
    * Open Windows-Terminal/Windows-PowerShell and enter command "bash" -> "script -c tmux /dev/null" -> script -c "tmux ls" -> "winpty nvim"
  * [Make a Bash alias that takes a parameter?](https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter)
    * Create Tmux alias for "util-linux(package)->script": `echo 'function tmux() { script -c "tmux $1 $2 $3 $4"; }' >> ~/.bashrc` [Note: Here '$@' (all arguments) syntax does not work. Instead use '$1' (first argument), '$2' (second argument), '$3' (third argument), '$4' (fourth argument)]
    * Create Tmuxinator alias for "util-linux(package)->script": `echo 'function mux() { script -c "tmuxinator $1 $2 $3 $4"; }' >> ~/.bashrc`
    * For the aliases to take effect immediately: `source ~/.bashrc`

## Windows Subsystem for Linux Install

### Notes (WSL)
* WSL Machine: Ubuntu-20.04
* Tmux is pre-installed.

## Install via Package Manager (WSL)
* Install Tmux: `sudo apt install tmux`
* Check Tmux version: `tmux --version`
* Below command install old version of Tmuxinator. To install latest version first install Ruby, and then install Tmuxinator via Gem.
* Install Tmuxinator: `sudo apt install tmuxinator`

### Ruby Installation (WSL)
* Install GPG2: `apt install gnupg2`
* Install signature-1: `curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -`
* Install signature-2: `curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -`
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable --ruby` [Install Ruby-3.0.0]
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable` [Install Latest Ruby]
* Add RVM to PATH: `echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc` -> `source ~/.bashrc`
* Install specific Ruby version: `rvm install ruby-3.2.2`
* Check ruby version: `ruby --version`
* Check gem (ruby package manager) version: `gem --version`

### Tmuxinator Install (WSL)
* Install Tmuxinator: `gem install tmuxinator`
* Check Tmuxinator version: `tmuxinator version`
* Check "gem" Path: `which gem`
* [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * echo 'export PATH="$PATH:/c/Users/<user-name>/.local/share/gem/ruby/3.2.0/bin"' >> ~/.bashrc
  * source ~/.bashrc

### Guides (WSL)
* Ruby
  * [Ruby Language](https://www.ruby-lang.org/en/downloads/)
  * [Ruby Version Manager (RVM)](http://rvm.io/) || [Ruby enVironment Manager (RVM) GitHub](https://github.com/rvm/rvm)
  * [Ubuntu - Install GPG 2](https://blog.programster.org/ubuntu-install-gpg-2)

## Linux (General) Installation

## Install via Package Manager (Linux)
* Install Tmux: `sudo apt install tmux`
* Check Tmux version: `tmux --version`
* Below command install old version of Tmuxinator. To install latest version first install Ruby, and then install Tmuxinator via Gem.
* Install Tmuxinator: `sudo apt install tmuxinator`

### Linux Ruby Installation
* Install GPG2: `sudo apt install gnupg2`
* Install signature-1: `curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -`
* Install signature-2: `curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -`
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable --ruby` [Install Ruby-3.0.0]
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable` [Install Latest Ruby]
* Add RVM to PATH: `echo "source /home/<user-name>/.rvm/scripts/rvm" >> ~/.bashrc` -> `source ~/.bashrc`
* Check RVM version: `rvm --version`  
* Install specific Ruby version: `rvm install ruby-3.2.2`
* Check ruby version: `ruby --version`
* Check gem (ruby package manager) version: `gem --version`

### Tmuxinator Install (Linux)
* Install Tmuxinator: `gem install tmuxinator`
* Check Tmuxinator version: `tmuxinator version`
* Check "gem" Path: `which gem`
* [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * echo 'export PATH="$PATH:/c/Users/<user-name>/.local/share/gem/ruby/3.2.0/bin"' >> ~/.bashrc
  * source ~/.bashrc

### Guides (Linux Install)
* Ruby
  * [Ruby Language](https://www.ruby-lang.org/en/downloads/)
  * [Ruby Version Manager (RVM)](http://rvm.io/) || [Ruby enVironment Manager (RVM) GitHub](https://github.com/rvm/rvm)
  * [Ubuntu - Install GPG 2](https://blog.programster.org/ubuntu-install-gpg-2)

## Antix-OS Tmux and Tmuxinator Install

### Notes (Tmux-AntixOS)
* Tmuxinator needs "ruby-3.2.2"

## Install via Package Manager (AntixOS)
* Install Tmux: `sudo apt install tmux`
* Check Tmux version: `tmux --version`
* Below command install old version of Tmuxinator. To install latest version first install Ruby, and then install Tmuxinator via Gem.
* Install Tmuxinator: `sudo apt install tmuxinator`

### Ruby Installation (Tmuxinator-AntixOS)
* Install GPG2: `sudo apt install gnupg2`
* Install signature-1: `curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -`
* Install signature-2: `curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -`
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable --ruby` [Install Ruby-3.0.0]
* Install RVM: `curl -sSL https://get.rvm.io | bash -s stable` [Install Latest Ruby]
* Add RVM to PATH: `echo "source /home/<user-name>/.rvm/scripts/rvm" >> ~/.bashrc` -> `source ~/.bashrc`
* Check RVM version: `rvm --version`  
* Install specific Ruby version: `rvm install ruby-3.2.2`
* Check ruby version: `ruby --version`
* Check gem (ruby package manager) version: `gem --version`

### Tmuxinator Installation (AntixOS)
* Install Tmuxinator: `gem install tmuxinator`
* Check Tmuxinator version: `tmuxinator version`
* Check "gem" Path: `which gem`
* [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
    * echo 'export PATH="$PATH:/c/Users/<user-name>/.local/share/gem/ruby/3.2.0/bin"' >> ~/.bashrc
    * source ~/.bashrc

### Guides (Tmux-AntixOS)
* Ruby
  * [Ruby Language](https://www.ruby-lang.org/en/downloads/)
  * [Ruby Version Manager (RVM)](http://rvm.io/) || [Ruby enVironment Manager (RVM) GitHub](https://github.com/rvm/rvm)
  * [Ubuntu - Install GPG 2](https://blog.programster.org/ubuntu-install-gpg-2)

# Error and Solution

## General Error

## Command Error
* Shows permission denied error during `tmuxinator new <project-name>` command execution.
  > sh: 1: /home/<user-name>/.config/tmuxinator/<project-name>.yml: Permission denied
  > Checking if tmux is installed ==> Yes
  > Checking if $EDITOR is set ==> No
  > Checking if $SHELL is set ==> Yes
  * Solution:
  * [Permission denied problem #186](https://github.com/tmuxinator/tmuxinator/issues/186)
  * [How can I set "vi" as my default editor in UNIX?](https://unix.stackexchange.com/questions/73484/how-can-i-set-vi-as-my-default-editor-in-unix)  
  * echo 'export EDITOR=lvim' >> ~/.bashrc
  * source ~/.bashrc

# ".yml" project file

## Notes (.yml)
* Enter command "env" to see environment variables.

## Commnads (.yml)
* Set "project.yml" will use general(xampp)/docker: `export RUNTIME_ENV='docker'`
* Set "project.yml" will use general(xampp)/docker: `export RUNTIME_ENV='general'`

## Instructions (.yml)
* [One Line if-else Condition in Linux Shell Scripting](https://www.baeldung.com/linux/one-line-if-else-condition)

## Guides (.yml)
* [pass arguments to tmuxinator project file](https://stackoverflow.com/questions/54322060/pass-arguments-to-tmuxinator-project-file)
* [ERB-Tmuxinator GitHub](https://github.com/tmuxinator/tmuxinator#erb)

# References

* Tmuxinator
  * [pass arguments to tmuxinator project file](https://stackoverflow.com/questions/54322060/pass-arguments-to-tmuxinator-project-file)
  * [ERB-Tmuxinator GitHub](https://github.com/tmuxinator/tmuxinator#erb)

* Docker
  * [How to set an environment variable in a running docker container](https://stackoverflow.com/questions/27812548/how-to-set-an-environment-variable-in-a-running-docker-container)

* Bash
  * [One Line if-else Condition in Linux Shell Scripting](https://www.baeldung.com/linux/one-line-if-else-condition)
  * [Check If the File Exists in Bash](https://linuxhint.com/check-if-a-file-exists-in-bash/)
  * [How to escape single quotes within single quoted strings](https://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings)
