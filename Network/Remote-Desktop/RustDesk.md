# Commands/Usage

* `systemctl status rustdesk`

* `rustdesk` : Start RustDesk GUI

# RustDesk.md

# Error and Solution

## Fedora-OS SELinux

**Error-Message-1**

```
Warning
SELinux is enabled on your device, which may prevent RustDesk from running properly as controlled side.
```

**Solution-1**

* [Permission Issue](https://rustdesk.com/docs/en/client/linux/#permissions-issue)
* [SELINUX](https://rustdesk.com/docs/en/client/linux/selinux)

* [How to Disable SELinux Temporarily or Permanently](https://www.tecmint.com/disable-selinux-in-centos-rhel-fedora/)
  * Disable SELinux Permanently
  * To permanently disable SELinux, use your favorite text editor to open the file `/etc/sysconfig/selinux` as follows: `# vi /etc/sysconfig/selinux`
  * Then change the directive `SELinux=enforcing` to `SELinux=disabled` as shown in the below image. `SELINUX=disabled`
  * Then, save and exit the file, for the changes to take effect, you need to reboot your system and then check the status of SELinux using sestatus command as shown: `sestatus`

# References

## Websites

* [rustdesk.com](https://rustdesk.com/)
* [rustdesk/rustdesk GitHub](https://github.com/rustdesk/rustdesk)

## Tutorials

* [Is it possible to connect through local network instead of setting up my own server and/or using the public server?](https://www.reddit.com/r/rustdesk/comments/1frnzdr/is_it_possible_to_connect_through_local_network/)

* Fedora SELinux
  * [SELinux/Tutorials](https://wiki.gentoo.org/wiki/SELinux/Tutorials)
  * [How to Disable SELinux Temporarily or Permanently](https://www.tecmint.com/disable-selinux-in-centos-rhel-fedora/)

## YouTube Tutorials

* [Your Remote Desktop SUCKS!! Try this instead (FREE + Open Source) BY NetworkChuck](https://www.youtube.com/watch?v=EXL8mMUXs88)
