# Commands/Usage

* `systemctl status rustdesk` : Check `rustdesk` service status

* `rustdesk` : Start RustDesk GUI

# RustDesk.md

## Tailscale and RustDesk

* To connect from pc/android to pc/android using tailscale network's IP address, turn on `Enable direct IP access` option in rustdesk settings.

**PC To Android Connection**

* To connect from pc to android using tailscale network's IP address : Open rustdesk android app -> Share screen -> Start Service

* "Input control" options' message
```
How to get Android input permission?

In order for a remote device to control your Android device via mouse or touch, you need to allow RustDesk to use the "Accessibility" service.

Please go to the next system settings page, find and enter [Installed Services], turn on [RustDesk Input] service.

"Cancel" (Button)

"Open system setting" (Button)
```

# Error and Solution

## Fedora-OS SELinux

**Error-Message-1**

```
Warning
SELinux is enabled on your device, which may prevent RustDesk from running properly as controlled side.
```

**Solution-1: Permanently Disable SELinux**

* [How to Disable SELinux Temporarily or Permanently](https://www.tecmint.com/disable-selinux-in-centos-rhel-fedora/)
  * Disable SELinux Permanently
  * To permanently disable SELinux, use your favorite text editor to open the file `/etc/sysconfig/selinux` as follows: `# vi /etc/sysconfig/selinux`
  * Then change the directive `SELinux=enforcing` to `SELinux=disabled` as shown in the below image. `SELINUX=disabled`
  * Then, save and exit the file, for the changes to take effect, you need to reboot your system and then check the status of SELinux using sestatus command as shown: `sestatus`

**Solution-2: Allow RustDesk Through SELinux**

* [Permission Issue](https://rustdesk.com/docs/en/client/linux/#permissions-issue)
* [SELINUX](https://rustdesk.com/docs/en/client/linux/selinux)

# Information

## PC to Android Connection (RustDesk)

**Google Search "rustdesk tailscale connect pc to android using ip" => AI Overview**

To connect a PC to an Android device using RustDesk with Tailscale, you'll first need to set up both RustDesk and Tailscale on both devices. Tailscale provides a secure VPN connection, and RustDesk acts as your remote desktop software. Once both are configured, you can connect to your Android device from your PC using the device's Tailscale IP address in RustDesk.

Here's a breakdown of the process:

1. Install and Configure Tailscale:

  * Install the Tailscale client on both your PC and Android device.
  * Create a Tailscale network and add both devices to it.
  * Tailscale will automatically assign each device a unique Tailscale IP address. 

2. Install and Configure RustDesk:

  * Install the RustDesk client on both your PC and Android device. 
  * Configure RustDesk on both devices to use the same ID Server for rendezvous. 

3. Connect using Tailscale IP:

  * On your PC's RustDesk client, enter the Android device's Tailscale IP address and port (typically 21114-21119 TCP and 21116 UDP). 
  * You might need to enable direct access via IP in RustDesk's settings. 
  * If direct connection fails, try connecting via the RustDesk relay server. 

Important Considerations:

Firewall Rules:
Ensure that your firewall rules allow the necessary TCP and UDP ports (21114-21119 TCP and 21116 UDP) for RustDesk communication. 

Permissions:
You may need to grant RustDesk specific permissions on your Android device to control it remotely. 

Relay Server:
If direct connections are not possible due to firewalls or NAT, RustDesk can use its relay server to establish a connection. 

Access Control Policies:
Tailscale's access control policies may need to be configured to allow connections between the PC and Android device. 

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
