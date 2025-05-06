# Thunar.md

## SFTP/SSH Connection

**Simple Way <sup>{3} {4}</sup>**

* Open Thunar -> Create new tab

* Enter address: `sftp://{{ip-address}}`, if ssh running on default port `22`

* Alternatively, enter address: `sftp://{{ip-address}}:2222`, if ssh running on non-default port `2222`

**[How do I connect to a server with thunar in Xubuntu?](https://askubuntu.com/questions/70423/how-do-i-connect-to-a-server-with-thunar-in-xubuntu) <sup>{3}</sup>**

* I was able to connect to servers by first running
```
sudo apt-get install gvfs-fuse gvfs-backends
```

* Then, open up any folder and hit Ctrl+L. In the location dialog box it presented I could then enter:
```
sftp://user@hostname:port/directory/path
```

* This would give me a browser of the remote system.

# References

* next-sl: {5}

## Websites

* {1} [Thunar File Manager](https://docs.xfce.org/xfce/thunar/start)
* {2} [Xfce/thunar](https://gitlab.xfce.org/xfce/thunar)

## Tutorials

* SFTP/SSH
  * {3} [How do I connect to a server with thunar in Xubuntu?](https://askubuntu.com/questions/70423/how-do-i-connect-to-a-server-with-thunar-in-xubuntu)
  * {4} [Thunar => Debian Wiki](https://wiki.debian.org/Thunar#FTP_.2F_SFTP_etc.)
