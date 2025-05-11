# Commands/Usage

* `systemctl status netbird`

* `netbird --help`

# NetBird.md

## Notes

* NetBird is Mesh VPN / Overlay VPN.

# Installation

## Fedora

**[NetBird Installation](https://docs.netbird.io/how-to/installation) <sup>{3}</sup>**

* `curl -fsSL https://pkgs.netbird.io/install.sh | sh` command does not install `netbird` command in fedora-42, it just add netbird repository to fedora-42. After it, execute `sudo dnf install netbird` command. <sup>{3}</sup>

* If `netbird up` command shows error "Unable to Connect https://localhost:53000", then try `netbird login` command.
  * Keep `netbird up` command running in one terminal window/tab and also web-browser window.
  * Then open another terminal window/tab and execute command `netbird login`
  * Then execute command `netbird up`. This will connect current machine/node to server.

* `ifconfig` : Check netbird IPv4 address.

# Information

## NetBird Custom IP

**Google Search "netbird peer custom ip" => AI Overview**

NetBird, by default, assigns IP addresses to peers within its network and does not support assigning custom IP addresses to individual peers. The network uses a Carrier Grade NAT address space (100.64.0.0/10) for peer communication. While you can't change the specific IP of a peer, you can modify the overall network range in a self-hosted NetBird setup.

Elaboration:

NetBird IP Assignment:
NetBird automatically assigns private IP addresses within its network to each peer.

Network Range Modification:
If you're running a self-hosted NetBird instance, you can adjust the network range. This involves modifying the store.json file, specifically the network_net field within the accounts table using sqlite3.

Default Network:
NetBird uses the 100.64.0.0/10 address space for peer-to-peer communication.

Routing:
You can configure routing peers to connect your NetBird network to other networks, including your internal network or the internet.

Exit Nodes:
NetBird allows you to set up exit nodes to route internet traffic through a specific peer, potentially masking the original source IP of the traffic.

Access Control:
You can manage access to resources within your network by creating access control policies that define which peers can access specific IP addresses, ranges, or DNS entries.

# References

* next-sl: {4}

## Websites

* {1} [netbird.io](https://netbird.io/)
* {2} [netbirdio/netbird GitHub](https://github.com/netbirdio/netbird)

## Tutorials

* Installation
  * {3} [Netbird Installation](https://docs.netbird.io/how-to/installation)

## Guides

* [Tailscale vs. NetBird => NetBird Serve](https://netbird.io/knowledge-hub/tailscale-vs-netbird)

## YouTube Tutorials

* [Install a self-hosted VPN platform // Netbird BY Christian Lempa](https://www.youtube.com/watch?v=_Fgwap-sl3A)
