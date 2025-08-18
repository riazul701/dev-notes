# Commands/Usage

## PATH

* Connection file <sup>{1}</sup>
  * In `/etc/NetworkManager/system-connections/`, modify the corresponding `Wired connection 2.nmconnection` file. <sup>{1}</sup>
  * Do not forget to reload the configuration file with `nmcli connection reload`. <sup>{1}</sup>

## Commands

* `which nmcli` : Command Line Interface for NetworkManager <sup>{1}</sup>

* `which nmtui` : Terminal User Interface for NetworkManager <sup>{1}</sup>
  * `sudo dnf install NetworkManager-tui` : Install on Fedora-OS

* `which nm-connection-editor` : NetworkManager GUI connection editor <sup>{1}</sup>

* `which nm-applet` : System tray applet for network connection <sup>{1}</sup>
  * `network-manager-applet` : Install `nm-applet` package
  * In order to run nm-applet without a systray, you can use [trayer](https://github.com/sargon/trayer-srg) or [stalonetray](https://github.com/kolbusa/stalonetray).

* `systemctl status NetworkManager.service` : Check on/off status of NetworkManager service <sup>{1}</sup>

* `systemctl start NetworkManager.service` : Start NetworkManager service <sup>{1}</sup>

* `systemctl stop NetworkManager.service` : Stop NetworkManager service <sup>{1}</sup>

* `systemctl restart NetworkManager.service` : Stop NetworkManager service <sup>{1}</sup>

* `nmcli device wifi list` : List nearby Wi-Fi networks <sup>{1}</sup>

* `nmcli device wifi connect SSID_or_BSSID password password` : Connect to a Wi-Fi network <sup>{1}</sup>

* `nmcli device wifi connect SSID_or_BSSID password password hidden yes` : Connect to a hidden Wi-Fi network <sup>{1}</sup>

* `nmcli device wifi connect SSID_or_BSSID password password ifname wlan1 profile_name` : Connect to a Wi-Fi on the `wlan1` interface <sup>{1}</sup>

* `nmcli device disconnect ifname eth0` : Disconnect an interface <sup>{1}</sup>

* `nmcli connection show` : Get a list of connections with their names, UUIDs, types and backing devices <sup>{1}</sup>

* `nmcli connection up name_or_uuid` : Activate a connection (i.e. connect to a network with an existing profile) <sup>{1}</sup>

* `nmcli connection delete name_or_uuid` : Delete a connection <sup>{1}</sup>

* `nmcli device` : See a list of network devices and their state <sup>{1}</sup>

* `nmcli radio wifi off` : Turn off Wi-Fi <sup>{1}</sup>

* `nmcli connection edit 'Wired connection 2'` : nmcli interactive editor <sup>{1}</sup>

* `nmcli connection modify 'Wired connection 2' setting.property value` : nmcli command line interface <sup>{1}</sup>
  * `nmcli connection modify 'Wired connection 2' ipv4.route-metric 200` : For example, you can change its IPv4 route metric to 200 using this command. <sup>{1}</sup>

 * `nmcli connection modify 'Wired connection 2' setting.property ""` : To remove a setting, pass an empty field ("") to it like this <sup>{1}</sup>

# NetworkManager.md

## Notes

* `NetworkManager`, `ConnMan (Connection Manager)`, `iwd (iNet wireless daemon)` : Three popular Linux network management solutions

* `NetworkManager` is default wired/wireless/wifi connection manager for Fedora-42-LXDE

* [impala](https://github.com/pythops/impala) required [iwd](https://archive.kernel.org/oldwiki/iwd.wiki.kernel.org/), which conflicts with NetworkManager.

## networkmanager-dmenu <sup>{1}</sup>

* Alternatively there is [networkmanager-dmenu-git](https://aur.archlinux.org/packages/networkmanager-dmenu-git/)<sup>AUR</sup> which is a small script to manage NetworkManager connections with [dmenu](https://wiki.archlinux.org/title/Dmenu) or [rofi](https://wiki.archlinux.org/title/Rofi) instead of `nm-applet`. It provides all essential features such as connection to existing NetworkManager Wi-Fi or wired connections, connect to new Wi-Fi connections, requests passphrase if required, connect to existing VPN connections, enable/disable networking, launch nm-connection-editor GUI, connect to Bluetooth networks.

# References

* next-sl: {2}

## Websites

* [networkmanager.dev](https://networkmanager.dev/)
* [NetworkManager/NetworkManager GitLab](https://gitlab.freedesktop.org/NetworkManager/NetworkManager)

## Tutorials

* {1} [NetworkManager => Archlinux Wiki](https://wiki.archlinux.org/title/NetworkManager)
