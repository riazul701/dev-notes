# Commands/Usage

* `systemctl status jellyfin` : Check jellyfin server status

* `sudo systemctl enable jellyfin` : Auto-Start jellyfin server, during computer starts

* `sudo systemctl start jellyfin` : Start jellyfin server

* `sudo systemctl stop jellyfin` : Stop jellyfin server

* `sudo systemctl restart jellyfin` : Restart jellyfin server

# Jellyfin.md

## Notes

* Jellyfin Web Address: `http://localhost:8096`

# Jellyfin Local Network Access

## Fedora-OS

**[How to set up a firewall using FirewallD on RHEL 8](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/) <sup>{5}</sup>**

* Open firewall port (jellyfin) to access jellyfin from local network or Tailscale.

* Let us add rule (8096/tcp), (8920/tcp), (1900/udp), (7359/udp) permanently and reload firewalld:
```
$ sudo firewall-cmd --zone=public --add-service=jellyfin --permanent
$ sudo firewall-cmd --reload
```

* Verify it:
```
$ sudo firewall-cmd --list-services
$ sudo firewall-cmd --list-services --permanent
```

# References

* next-sl: {11}

## Websites

* {1} [jellyfin.org](https://jellyfin.org/)
* {2} [jellyfin/jellyfin GitHub](https://github.com/jellyfin/jellyfin)
* {3} [jellyfin/jellyfin-tizen GitHub](https://github.com/jellyfin/jellyfin-tizen)

* [awesome-jellyfin/awesome-jellyfin GitHub](https://github.com/awesome-jellyfin/awesome-jellyfin)
* {4} [fallenbagel/jellyseerr](https://github.com/Fallenbagel/jellyseerr)

* Other Media Server
  * [plex.tv](https://www.plex.tv/)
  * [emby.media](https://emby.media/)

## Tutorials

* {5} [How to set up a firewall using FirewallD on RHEL 8](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/)

## YouTube Tutorials

* {6} [EASY Jellyfin Install and Setup On Windows! BY GO Movies Geek](https://www.youtube.com/watch?v=caz_Fv7fUPc)
* {7} [The Ultimate Jellyfin Guide | Full Walkthrough + Tips for 2025 BY The Uncast Show](https://www.youtube.com/watch?v=F8k_nvatKZE)

* Series
  * {8} [ULTIMATE Jellyfin Media Server Guide - Install, Setup, Libraries (PART 1) BY TechHut](https://www.youtube.com/watch?v=eJvQKLVrmU8)
  * {9} [ULTIMATE Jellyfin Guide - Hardware Acceleration, Codecs (PART 2) BY TechHut](https://www.youtube.com/watch?v=aY732cSkopU)
  * {10} [ULTIMATE Jellyfin Media Server Guide - Plugins and Themes! (PART 3) BY TechHut](https://www.youtube.com/watch?v=DivZcyoY6bs)
