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

# Transcoding

* [Transcoding](https://jellyfin.org/docs/general/post-install/transcoding/)

## Google Search "jellyfin direct play without transcode"

AI Overview

To enable direct play and avoid transcoding in Jellyfin, ensure your clients support the formats used in your media, and disable transcoding for each user in the Jellyfin admin panel. Jellyfin will attempt to play media directly if the client supports the codec, bandwidth is sufficient, and the container format is compatible. 

How to Disable Transcoding:

Access the Jellyfin Admin Panel: Log in to your Jellyfin server and navigate to the admin panel. 

Go to User Settings: Find the "Users" section and click on the user you want to configure. 

Disable Transcoding: Locate the transcoding settings and disable the option that allows transcoding for the user. This might be labeled as "Allow transcoding" or similar. 

Repeat for Other Users: If you have multiple users, repeat steps 2 and 3 for each user to ensure they all play media directly. 

Factors that Influence Direct Play:

Client Support:
The client device (e.g., Android TV, smart TV, web browser) must support the video and audio codecs used in your media. 

Network Bandwidth:
A stable and fast network connection is crucial for direct streaming. Jellyfin will switch to transcoding if the network can't handle the bitrate. 

Container Format:
Jellyfin might require a specific container format for direct play. For example, some devices may have trouble with MKV files. 

Bitrate:
If the bitrate of the media is too high for the client, Jellyfin might initiate transcoding. 

Profile/Level:
Jellyfin uses profile and level settings for determining direct play compatibility. Some profiles are more compatible with certain clients than others. 

Additional Tips:

Check Client Capabilities:
Before making changes to Jellyfin's settings, check the codec support of your client devices to ensure they are compatible with your media files. 

Test and Troubleshoot:
After making changes, test the direct play feature to ensure it works as expected. If you encounter issues, consult the Jellyfin documentation for troubleshooting tips. 

Use a Dedicated Client:
Consider using a dedicated Jellyfin client that is known for its direct play capabilities. 

By carefully configuring Jellyfin's transcoding settings and ensuring your client devices support the necessary formats, you can enjoy direct play without the need for transcoding. 

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
