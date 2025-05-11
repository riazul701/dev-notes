# Commands/Usage

* `systemctl status zerotier-one`

* `zerotier-cli --help`

# ZeroTier.md

# Installation

## Fedora

**[Create a Network](https://docs.zerotier.com/start/) <sup>{1}</sup>**

* `curl -s https://install.zerotier.com | sudo bash` : Install ZeroTier <sup>{2}</sup>

* `sudo zerotier-cli info` : Get current machine/node ID and insert into zerotier network.

* `sudo zerotier-cli join {{network-id}}` : Join to zerotier network. After this command execution, zerotier node will get IPv4 address.

* `ifconfig` : Check zerotier IPv4 address.

# References

* next-sl: 

## Websites

## Tutorials

* Installation
  * {1} [Create a Network](https://docs.zerotier.com/start/)
  * {2} [Download](https://www.zerotier.com/download/)
