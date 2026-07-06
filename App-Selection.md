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
  * Sublime-Text/Sublime-Merge

* TUI
  * LazyVim
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
  * [LazyWorktree](https://github.com/chmouel/lazyworktree)
  * Vimdiff
  * Delta
  * [gh-dash](https://github.com/dlvhdr/gh-dash)

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
  * [harlequin.sh](https://harlequin.sh/)
  * Vim-Dadbod

* Command
  * dolt
  * mycli
  * mysql/mysqlbinlog/mysqlcheck/mysqld/mysqldump/mytop/mysqlsh

## File Transfer/Connection

* GUI
  * Filezilla

* TUI
  * Termscp
  * Lazyssh

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
  * [craigderington/lazyrestic](https://github.com/craigderington/lazyrestic)

* Command
  * rclone
  * rsync
  * lsyncd
  * unison
  * syncthing
  * restic

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
  * btop/btop4win
  * Systemctl-tui (Linux)

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
  * Psmux => Real Tmux On Windows-OS
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
    * [dweymouth/supersonic](https://github.com/dweymouth/supersonic)
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
  * [xdagiz/xytz](https://github.com/xdagiz/xytz)

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
  * [Lifailon/lazyjournal](https://github.com/Lifailon/lazyjournal)
  * [Lnav](https://lnav.org/)
  * [bensadeh/tailspin](https://github.com/bensadeh/tailspin)
  * ULogViewer

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

## ToDo & Issue-Tracker & Note & Documentation

* GUI
  * Jira Atlassian
  * Trello Atlassian
  * Confluence Atlassian
  * Mantis-BT
  * BugZilla
  * Joplin

* TUI
  * [textfuel/lazyjira](https://github.com/textfuel/lazyjira)
  * Taskwarrior
  * Timewarrior

* CLI
  * [ankitpokhrel/jira-cli](https://github.com/ankitpokhrel/jira-cli)

## Markdown

* GUI
  * mkdocs
  * [MarkText](https://github.com/marktext/marktext)
  * [Zettlr](https://github.com/Zettlr/Zettlr)
  * [Obsidian](https://obsidian.md/)

* TUI
  * [glow](https://github.com/charmbracelet/glow)
  * [leaf](https://github.com/rivolink/leaf)
  * [treemd](https://github.com/Epistates/treemd)

* CLI
  * grip

## AI

* GUI
  * ChatGPT

* TUI
  * [geminicli.com](https://geminicli.com/)

## Office Application

* GUI
  * LibreOffice (Word, Excel, Powerpoint)
  * Microsoft-Office (Work, Excel, Powerpoint)

## Graphics Application

* GUI

  * Image Editing
    * GIMP
    * Adobe Photoshop

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

## Build Applications

* Work

  * GUI
    * Create GUI application for "Backup-N-Sync" project using "Go + Fyne"
    * Input file and generate sum "sha256sum", "sha512sum" using command line program inside/backend. Example:  [base64-encoder-decoder](https://github.com/able8/base64-encoder-decoder)
    * Income/Expense Manager
  * TUI
    * Create TUI application for "Backup-N-Sync" project using "Go + Bubble-Tea"
    * VirtualBox TUI by using "VBoxManage" command as backend. Example: [vboxssh](https://github.com/bytemystery-com/vboxssh/)
    * Income/Expense Manager
  * Android
    * Create Android application for "Backup-N-Sync" project using "react-native"
    * Income/Expense Manager

* GUI
  * Go + Fyne
  * Example
    * [apps.fyne.io](https://apps.fyne.io/)
    * [base64-encoder-decoder](https://github.com/able8/base64-encoder-decoder)
    * [Fynance](https://github.com/clinton-mwachia/Fynance)
    * [vboxssh](https://github.com/bytemystery-com/vboxssh/)
    * [fynelabs/notes](https://github.com/fynelabs/notes)
    * [midu-SA/Taskmgr](https://github.com/midu-SA/Taskmgr)
    * [romanitalian/fyne-weather => Weather forecast](https://github.com/romanitalian/fyne-weather)
    * [ytget/yt-downloader](https://github.com/ytget/yt-downloader)
    * [anhcraft/ytb-downloader](https://github.com/anhcraft/ytb-downloader)

* TUI

  * Go + Bubble-Tea (charmbracelet) + Bubbles (charmbracelet) + Lipgloss (charmbracelet) + Harmonica (charmbracelet) + bubblezone (lrstanley) + ntcharts (NimbleMarkets)
    * Features:
      * Has Concurrency (goroutine), means multiple parallel/asynchronous command execution like "rclone", "rsync", "cp" at the same time.
      * Makes cross-platform single binary
      * Responsiveness => Suppose "rclone" is copying 500,000 files while the user is: searching, switching tabs,  cancelling transfers, viewing logs. Bubble Tea stays responsive because background work and UI updates are cleanly separated.
      * Packaging => This is a big difference. Bubble Tea "myapp.exe". That's it. One file. Runs everywhere. No interpreter. No dependencies.
      * When choose Bubble Tea => If want to build rclone frontend, rsync frontend, Git frontend, Docker frontend, yt-dlp manager, ffmpeg queue, package manager, backup manager, SSH manager, server monitor. Pick Bubble Tea every time. These applications are command-centric, process-oriented, and keyboard-driven—exactly where Bubble Tea shines.
      * Go makes cross-compilation extremely easy. It has no Go runtime dependency—the runtime is built into the executable. If app calls external tools like rclone, rysnc, those tools still need to exist.
    * Example
      * [Lazyjira](https://github.com/textfuel/lazyjira)
      * [madalinpopa/gocost](https://github.com/madalinpopa/gocost)
      * [armandsauzay/note](https://github.com/armandsauzay/note)
      * [handlebargh/yatto => ToDo list](https://github.com/handlebargh/yatto)
      * [Cladamos/clawea => Weather forecast](https://github.com/Cladamos/clawea)
    * Tutorial: [W3Schools Go Tutorial](https://www.w3schools.com/go/)

* Android
  * React-Native

* Web-Application
  * PHP + Laravel + VueJS + JavaScript + Bootstrap + HTML + CSS

