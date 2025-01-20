# YouTube - Linux Crash Course BY Learn Linux TV

* [Linux Crash Course BY Learn Linux TV](https://www.youtube.com/playlist?list=PLT98CRl2KxKHKd_tH3ssq0HPrThx2hESW)

* Linux Crash Course - usermod
  * usermod
  * groups
  * chage
  * cat /etc/passwd

* Linux Crash Course - sudo
  * sudo
  * sudo su [Switch to "root" user]
  * su - [Switch to "root" user] [Switch to another user: su - <user-name>]
  * which
  * cat /etc/sudoers
  * sudo !! [Execute last command with "sudo"]
  * visudo [Use "visudo" command to edit "/etc/sudoers" file to check syntax.]

* Linux Crash Course - htop
  * htop

* Linux Crash Course - The ps Command
  * ps

* Linux Crash Course - Data Streams (stdin, stdout & stderr)
  * stdin
  * stdout
  * stderr
  * echo $? [stdin/stdout shows: 0, stderr shows: 1]
  * find /etc -type f 2> /dev/null ["1>" means stdout. "2>" means stderr.]
  * find /etc -type f > ~/results.txt
  * find /etc -type f 1> ~/results.txt 2> ~/errors.txt
  
* Linux Crash Course - User Account & Password Expiration
  * chage
  * cat /etc/passwd
  * passwd
  * su - [Switch to "root" user] [Switch to another user: su - <user-name>]

* Write Full Commands from Here

* Linux Crash Course: Background (bg) and Foreground (fg)
  * htop : Show process management
  * Ctrl+g : Keyboard shortcut. Send process to background.
  * fg : Send already background process to foreground. Most recent background process.
  * <command> & : Start process in background
  * jobs : Show all background jobs with "job-id"
  * fg <job-id> : Send specific background process to foreground. Use `jobs` command to get "job-id"

* Linux Crash Course - Bash Aliases
  * `alias` command entered into Terminal, only works on that Terminal session. To make it permanent write `alias` commands in `~/.barshrc` file.
  * alias mycmd="ls -lh" : Use `mycmd` as command
  * alias : Shows all aliases
  * unalias mycmd : Delete an alias
  * df -h : Show partition sizes
  * alias df="df -h -x squashfs -x tmpfs -x devtmpfs" : Create alias
  * alias df : Shows command of alias "df"
  * mount : Shows all mounted paths
  * alias lsmount="mount | column -t" : Shows all mounted paths in tabular way.
  * lsmount : Run alias
  * alias extip="curl icanhazip.com" : Create alias
  * alias intall="sudo apt install" : Create alias
  * alias upgrade="sudo apt update && sudo apt dist-upgrade" : Create alias
  * which python : Shows "python" path
  * which python3 : Shows "python3" path
  * alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -" : Get output from "speedtest.py" file and pass to "python3" command as argument.
  * alias mem5="ps auxf | sort -nr -k 4 | head -5" : Shows top 5 processes that are using memory/RAM.
  * alias cpu5="ps auxf | sort -nr -k 3 | head -5" : Shows top 5 processes that are using CPU.
  * mem5 : Shows top 5 processes that are using memory/RAM.
  * cpu5 : Shows top 5 processes that are using CPU.
  * nano ~/.bashrc : Make permanent "aliases".

* Linux Crash Course - Public Key Authentication
  * 