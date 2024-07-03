# Rsync.md

# Commands

* Linux box to a Windows machine <sup>{11}</sup>
  * Rsync inside Bash: `rsync -avP --rsync-path='C:\ProgramData\scoop\apps\git\current\usr\bin\rsync.exe' <file_to_send> <username>@<host_ip>:<path>`
  * Rsync inside WSL: `rsync -avP --rsync-path='wsl rsync' <file_to_send> <username>@<host_ip>:<path>`

# Contents of Rsync.md

## Websites
* [Rsync Site](https://rsync.samba.org/)
* [Grsync](http://www.opbyte.it/grsync/)

# Installation

## Windows Installation

* {1} [Add rsync to Windows git bash](https://prasaz.medium.com/add-rsync-to-windows-git-bash-f42736bae1b3)
* {2} [How to use rsync on Git Bash](https://shchae7.medium.com/how-to-use-rsync-on-git-bash-6c6bba6a03ca)

* Open PowerShell in Administrator mode and install Git-Bash: `scoop install --global git`
* Download `rsync-<version>-x86_64.pkg.tar.zst` from [MSYS2 Repo](https://repo.msys2.org/msys/x86_64/)
* Download and install [ZStandard compression package](https://facebook.github.io/zstd/) which is used to extract ".tar.zst" file.
* Extract "rsync.tar.zst" file: `zstd -d rsync-<version>-x86_64.pkg.tar.zst`
* Alternatively, install [PeaZip](https://peazip.github.io/): `scoop install --global peazip` [Extracts ".tar.zst" file]
* Copy the `rsync.exe` inside the package from `rsync-<version>-x86_64.pkg\usr\bin\` to `C:\ProgramData\scoop\apps\git\current\usr\bin\`
* Download and copy the dependent packages
  * [Package: libzst](https://repo.msys2.org/msys/x86_64/libzstd-1.4.7-1-x86_64.pkg.tar.xz)
  * [Package: libxxhash](https://repo.msys2.org/msys/x86_64/libxxhash-0.8.0-1-x86_64.pkg.tar.zst)
* Open Git-Bash and check "rsync": `rsync --version`
  
* {11} [How to rsync directly into a Windows 10 machine (using OpenSSH not cygwin or WSL)](https://akliang.medium.com/how-to-rsync-directly-into-a-windows-10-machine-using-openssh-not-cygwin-or-wsl-cbbadff95712)
  * The command to rsync from an Linux box to a Windows machine is:
  * Rsync inside Bash: `rsync -avP --rsync-path='C:\ProgramData\scoop\apps\git\current\usr\bin\rsync.exe' <file_to_send> <username>@<host_ip>:<path>`
  * Rsync inside WSL: `rsync -avP --rsync-path='wsl rsync' <file_to_send> <username>@<host_ip>:<path>`

# References

* next-sl: {13}

* Installation
  * {1} [Add rsync to Windows git bash](https://prasaz.medium.com/add-rsync-to-windows-git-bash-f42736bae1b3)
  * {2} [How to use rsync on Git Bash](https://shchae7.medium.com/how-to-use-rsync-on-git-bash-6c6bba6a03ca)
  * {3} [radleta/how-to-win-rsync-from-cmd.md](https://gist.github.com/radleta/0b337a2b14f761951cf2aab0578512b9)
  * {4} [How to Add rsync to Git Bash for Windows 10](https://gist.github.com/hisplan/ee54e48f17b92c6609ac16f83073dde6)
  * {12} [How to enable rsync through ssh on a Windows machine](https://gist.github.com/fmartins-andre/532faaad71ace2af6f396f176adee5de)

* Commands
  * {11} [How to rsync directly into a Windows 10 machine (using OpenSSH not cygwin or WSL)](https://akliang.medium.com/how-to-rsync-directly-into-a-windows-10-machine-using-openssh-not-cygwin-or-wsl-cbbadff95712)

* Tutorials
  * {5} [How to rsync only new files](https://unix.stackexchange.com/questions/67539/how-to-rsync-only-new-files)
  
* Guides
  * {6} [How do I synchronize in both directions?](https://stackoverflow.com/questions/1602324/how-do-i-synchronize-in-both-directions)
  * {7} [Is it possible to specify a different ssh port when using rsync?](https://stackoverflow.com/questions/4549945/is-it-possible-to-specify-a-different-ssh-port-when-using-rsync)
  * {8} [How does `scp` differ from `rsync`?](https://stackoverflow.com/questions/20244585/how-does-scp-differ-from-rsync)

* YouTube
  * {9} [How to Use rsync to Reliably Copy Files Fast (many examples)](https://www.youtube.com/watch?v=Pygr_TpZRpM)
  * {10} [How To Install rsync On Windows 10 (yes it's possible)](https://www.youtube.com/watch?v=qJN9mb8fjDM)
