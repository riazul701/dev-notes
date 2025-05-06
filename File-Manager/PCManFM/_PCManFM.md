# PCManFM.md

## SFTP/SSH Connection

**Simple Way <sup>{3}</sup>**

* Open PCManFM -> Create new tab

* Enter address: `sftp://{{ip-address}}`, if ssh running on default port `22`

* Alternatively, enter address: `sftp://{{ip-address}}:2222`, if ssh running on non-default port `2222`

**[In PCManFM, is it possible to launch and connect to a SFTP server?](https://unix.stackexchange.com/questions/348494/in-pcmanfm-is-it-possible-to-launch-and-connect-to-a-sftp-server) <sup>{3}</sup>**

* Your question almost contains the answer... for me this command line works:
```
pcmanfm 'sftp://aries:2222'
```

* In my case the "SFTP Server" is an Android device running [SshHelper](https://arachnoid.com/android/SSHelper/) App;

* In the App the port is defined as `2222` instead of default `22`

* My Ubuntu knows hostname via my router - the device `aries` is ping-able.

* EDIT:

* On my new device (Sony XZ2 compact, running on Pie) the latest SshHelper was not working any longer - so Termux with ssh-Package `apt install openssh` helps. In Termux' `~/.ssh/authorized_keys` my Ubuntu's PublicKey is added. Default port for Termux' sshd is `8022` (Termux widget to start a script for `sshd &` is a handy thing).

* Example of pcmanfm "storage" is Termux' `~/storage/` and `3933-3933` is my SdCard:
```
pcmanfm 'sftp://xz2c:8022/storage/3933-3933/media/audio'
```

# References

* next-sl: {4}

## Websites

* {1} [lxde/pcmanfm GitHub](https://github.com/lxde/pcmanfm)
* {2} [lxqt/pcmanfm-qt GitHub](https://github.com/lxqt/pcmanfm-qt)

## Tutorials

* SFTP/SSH
  * {3} [In PCManFM, is it possible to launch and connect to a SFTP server?](https://unix.stackexchange.com/questions/348494/in-pcmanfm-is-it-possible-to-launch-and-connect-to-a-sftp-server)
