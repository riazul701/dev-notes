# Commands/Usage

* `systemctl status zerotier-one`

* `zerotier-cli -h` : Shows help

# ZeroTier.md

## Notes

* ZeroTier works on Debian, but does not work on Fedora (firewall block udp port issue).

* Tailscale and Zerotier does not work simultaneously, internet connectivity issue.

* Internet connection lost, after Zerotier installation.

## Enable Ping On Windows-OS

**[Create a Network](https://docs.zerotier.com/start/) <sup>{1}</sup>**

* Windows by default doesn't respond to pings. If you try to ping a Windows computer from a different computer, it won't work. You can enable ping.

* How to enable ping on Windows
  * Search for Windows Firewall in the Start Menu, and click to open it.
  * Click Advanced Settings on the left.
  * From the left pane of the resulting window, click Inbound Rules.
  * In the right pane, find the rules titled File and Printer Sharing (Echo Request - ICMPv4-In).
  * Right-click each rule and choose Enable Rule.

* Here is a [tutorial by Microsoft](https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/create-an-inbound-icmp-rule)

# Installation

## Fedora

**[Create a Network](https://docs.zerotier.com/start/) <sup>{1}</sup>**

* `curl -s https://install.zerotier.com | sudo bash` : Install ZeroTier <sup>{2}</sup>

* `sudo zerotier-cli info` : Get current machine/node ID and insert into zerotier web interface's -> "Networks" list -> "Node Id (Manually Add Member)" section.

* `sudo zerotier-cli join {{network-id}}` : Join to zerotier network. After this command execution, zerotier machine/node will get IPv4 address.

* `ifconfig` : Check zerotier IPv4 address. If IPv4 address is not shown, then restart computer.

* `ping {{another-zerotier-machine-ip-address}}` : Test connection

* `zerotier-cli -v` : Check zerotier version

**Error-1**

* `sudo zerotier-cli peers` command shows error

```
NOTE: Currently tunneling through a TCP relay. Ensure that UDP is not blocked.
```

# References

* next-sl: 

## Websites

## Tutorials

* Installation
  * {1} [Create a Network](https://docs.zerotier.com/start/)
  * {2} [Download](https://www.zerotier.com/download/)


## YouTube Tutorials
  
* [Networking with ZeroTier: Creating software-defined networks with Ease BY Learn Linux TV](https://www.youtube.com/watch?v=9GTXN0opsdw)
* [Use ZeroTier with Blue Iris - view your cameras remotely and securely! BY Learn Blue Iris](https://www.youtube.com/watch?v=w9rC8HN2Umc)
