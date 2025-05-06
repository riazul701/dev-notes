# Netbird.md

## Notes

* Netbird is Mesh VPN / Overlay VPN.

# Installation

## Fedora

* If `netbird up` command shows error "Unable to Connect https://localhost:53000", then try `netbird login` command.

* `curl -fsSL https://pkgs.netbird.io/install.sh | sh` command does not install `netbird` command in fedora-42, it just add netbird repository to fedora-42. After it, execute `sudo dnf install netbird` command. <sup>{3}</sup>

# References

* next-sl: {4}

## Websites

* {1} [netbird.io](https://netbird.io/)
* {2} [netbirdio/netbird GitHub](https://github.com/netbirdio/netbird)

## Tutorials

* Installation
  * {3} [Netbird Installation](https://docs.netbird.io/how-to/installation)

## YouTube Tutorials

* [Install a self-hosted VPN platform // Netbird BY Christian Lempa](https://www.youtube.com/watch?v=_Fgwap-sl3A)
