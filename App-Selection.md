# App-Selection.md

# Selected Applications

## Control Remote-PC

* Mesh-VPN Notes
  * Can not use multiple mesh-vpn at the same time, they conflicts with each other.
  * Transfer large files from pc to pc using rclone and google-drive. 
  * Use one mesh-vpn on host-pc and another inside virtualbox. Transfer large files using virtualbox.

* System Level (Mesh-VPN)
  * Tailscale / Headscale (Self-Hosted)
  * NetBird
  * Netmaker
  * ZeroTier

* GUI
  * RustDesk (/unison/rsync/free-file-sync/filezilla/termscp) + Tailscale (Fixed IP)
  * Anydesk
  * Teamviewer

## Documentation

* TUI
  * [navi](https://github.com/denisidoro/navi)
  * tldr.sh
  * cheat.sh

* Command
  * man
  * apropos

## File Manager

* Mount FTP/FTPS/SFTP/Google-Drive Using Rclone

* GUI
  * Double Commander
  * PeaZip/7-Zip

* TUI
  * Yazi
  * Vifm
  * Broot

* Command
  * czkawka-cli
  * progress
  * touch
  * rm/rmdir/trash-cli/rip
  * ln/symlinks/link/readlink/realpath/stow
  * File/Directory
    * ls/lsd/colorls/eza/exa/vdir
    * cp
    * mv
    * mkdir
    * cd/zoxide
    * pwd/zoxide-query
    * mkfile
    * mktemp
    * open
    * mmv
    * autojump/bashmarks
    * detox
    * dircolors
    * dirname
    * dirs
    * fdupes/jdupes/repren
    * file
    * split
    * tre/tree/erdtree
  * Search
    * find/fd/sd/rdfind
    * locate/plocate
    * fselect
  * Permission
    * chgrp
    * chmod
    * chown
  * Compression/Archive
    * ouch
    * unar
    * 7z
    * 7za
    * 7zr
    * cpio
    * funzip
    * gunzip
    * gzip
    * p7zip
    * zip/unzip/zipgrep/zipinfo/zipnote
    * rar/unrar
    * tar
  * Encryption
    * age
  * Image
    * pngcheck
    * catimg
    * chafa
    * feh
    * imgcat
    * viu
    * convert/magick/jpegoptim/mogrify/pngcrush/pngquant
  * PDF
    * cpdf
    * img2pdf
  * Clipboard
    * cb
    * copyq

## Container

* GUI

* TUI
  * Lazydocker

## Editor

* GUI
  * Visual Studio Code
  * Zed

* TUI
  * LunvarVim
  * Vim/NeoVim

* Command
  * sed/sd
  * fzf/sk (skim)
  * codespell
  * comby
  * comm
  * Viewer
    * cat/bat/highlight/tac
    * less/more/most/moar
    * head/tail
    * carbon-now
    * wc
  * Search/Replace Tools
    * grep/ripgrep(rg)/ag/rgrep/vgrep
    * ack
    * fastmod
  * Coding Tools
    * sed
    * awk/xsv/miller
    * sort/fq/yq
    * jq/jid/fx
    * expand


## Git

* GUI
  * Git-Cola

* TUI
  * LazyGit
  * Vimdiff
  * Delta

* Command
  * Fzf-Git
  * FotGit-Fzf
  * dvc
  * gh/gist (GitHub)
  * gibo

## REST API

* GUI
  * Postman

* TUI
  * Posting

* Command
  * HTTPie (http)

## Database

* GUI
  * DBeaver
  * PhpMyAdmin

* TUI
  * Lazysql
  * Vim-Dadbod

* Command
  * dolt
  * mycli
  * mysql/mysqlbinlog/mysqlcheck/mysqld/mysqldump/mytop/mysqlsh

## File Transfer

* GUI
  * Filezilla

* TUI
  * Termscp

* Command
  * Lftp
  * ftp
  * scp/sftp
  * Share
    * airshare
  * SSH
    * autossh
    * ssh-add
    * ssh-agent
    * ssh-copy-id
    * ssh-keygen
    * ssh-keyscan
    * ssh
    * sshd
    * sshfs
    * sshpass

## Download Manager

* GUI
  * Free Download Manager (http + torrent)
  * transmission (torrent)

* TUI
  * Surge (http)
  * Superseedr (torrent)

* Command
  * transmission-cli (torrent)
  * wget
  * curl
  * aria2/aria2c
  * axel
  * deluge
  * gallery-dl
  * Checksum
    * md5sum
    * sha1sum/sha224sum/sha256sum/sha384sum/sha512sum

## Network

* GUI
  * Load Testing
    * jmeter/loadtest/locust

* TUI
  * bandwhich

* Command
  * ping
  * traceroute
  * nmblookup
  * k6
  * ifconfig/ip/ipconfig
  * croc
  * ffsend
  * fast/speedtest-cli
  * fping
  * ioping
  * iperf
  * is-up
  * Scanner
    * nmap
    * masscan
    * netstat
  * Local Server Share
    * ngrok

## Backup & Sync

* GUI
  * Free File Sync

* TUI

* Command
  * rclone
  * rsync
  * lsyncd
  * unison
  * syncthing

## Partition Manager

* GUI
  * Easeus Partition Master
  * GParted

* TUI

* Command
  * fdisk/cfdisk
  * mount/umount
  * mmls

## System Monitor & Work

* GUI
  * Windows Task Manager
  * System Informer (Windows)
  * Stacer (Linux)

* TUI
  * bottom
  * btop/btop4win
  * Glances
  * Htop

* Command
  * lsof
  * iotop
  * procs
  * ps/psgrep
  * fg/bg
  * kill/killall/xkill/fkill/pkill
  * nice/renice
  * top
  * iftop
  * watch
  * Information
    * stat
    * uptime
    * quota/ulimit
    * id
    * uname
    * neofetch/fastfetch/pfetch/rfetch/macchina
    * arch
    * date
    * hostname
    * last
    * logname
    * users/w/who/whoami
  * Work-Procedure
    * watch
    * passwd
    * cron/crontab
    * chroot

## Operating System Snapshot

* GUI
  * Windows System Restore
  * Btrfs Assistant

* TUI

* Command
  * Snapper

## Configuration Manager

* GUI

* TUI

* Command
  * Chezmoi
  * keepassxc-cli

## Terminal

* GUI
  * asciinema => Record terminal sessions
  * Windows Terminal
  * WezTerm
  * Kitty
  * Alacritty

* Terminal Multiplexer
  * Tmux
  * WezTerm Like Tmux On Window-OS

* Command
  * atuin/history/fuck/mcfly
  * clear
  * exit
  * where/whereis/which

## Window Manager

* Windows-OS
  * Komorebi (Not GlazeWM, It Is Resource Hungry)
  * YASB
  * Flow Launcher
  * Rainmeter

* Linux-OS
  * i3
  * Polybar
  * Rofi
  * Conky

## Web Browser

* GUI
  * Vimium

* TUI
  * Lynx

* Command
  * buku

## Music Player

* GUI
  * Navidrome
  * Strawberry
  * Clementine

* TUI
  * [bjarneo/cliamp](https://github.com/bjarneo/cliamp)
  * Musikcube

* Command
  * mpc/mpd

## YouTube

* GUI

* TUI
  * [mps-youtube/yewtube](https://github.com/mps-youtube/yewtube)
  * [pystardust/ytfzf](https://github.com/pystardust/ytfzf)

* Command
  * Yewtube
  * yt-dlp + mpv
  * yt-dlp/youtube-dl/youtube-viewer
  * ytfzf

## Comparison/Diff

* GUI
  * Kdiff3
  * Meld

* TUI
  * delta
  * vifm (:difft) + vimdiff - folder comparison

* Command
  * difftastic
  * diff-so-fancy
  * diff/patch
  * diff3
  * diffoscope
  * sdiff
  * diffnav
  * colordiff
  * diffstat
  * csv-diff
  * diff-pdf
  * xzdiff

## Disk Space Usage Analyzer

* GUI
  * [Filelight](https://apps.kde.org/filelight/)

* TUI
  * [Byron/dua-cli](https://github.com/Byron/dua-cli)
  * [dundee/gdu](https://github.com/dundee/gdu)

* Command
  * df/duf
  * dfc
  * du/ncdu/dust
  * duf
  * dust
  * diskonaut

## Log Viewer

* GUI

* TUI
  * [Lnav](https://lnav.org/)
  * [bensadeh/tailspin](https://github.com/bensadeh/tailspin)

* Command
  * logger

## Shell

* Shell
  * Bash
  * PowerShell-7 (pwsh)
  * PowerShell-5 (powershell)

* Shell Prompt
  * starship

* Command
  * su/sudo
  * gum
  * fc
  * env/printenv
  * doas
  * xargs
  * alias/unalias
  * export
  * chsh
  * compgen
  * complete
  * direnv

## PDF

* GUI
  * mupdf

* Command
  * qpdf
  * ocrmypdf
  * pdf-parser
  * pdffonts
  * pdfgrep
  * pdfimages
  * pdfinfo
  * pdfseparate
  * pdftk
  * pdftocairo
  * pdftotext
  * pdfunite

## Virtual-Env

* GUI
  * VirtualBox

* Command
  * VBoxManage

## ToDo & Issue-Tracker

* GUI
  * Trello
  * Jira
  * Mantis-BT
  * BugZilla

* TUI
  * Taskwarrior
  * Timewarrior

## Other Commands

* dict
* espeak
* calc/gcal/gcalcli
* calendar/khal
* gpg/gpg-tui/pass
* Coding/Programming
  * prettier
  * license
  * lighthouse
  * linkchecker
  * loc
* Markdown
  * mkdocs
  * glow
  * grip
* Regular-Expression
  * grex
* Metadata
  * exiftool
  * exiv2
  * id3tag
  * mid3v2
  * mp3info
  * mediainfo
* Font
  * fc-list
  * fc-match
  * fc-pattern
* Audio/Video
  * obs
  * mplayer
  * mpv
  * ffmpeg
  * ffplay
  * handbrakecli
* Benchmark/Performance
  * hyperfine
