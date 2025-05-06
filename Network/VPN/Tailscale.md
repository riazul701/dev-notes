# Tailscale.md

## Notes

* In Tailscale, computer (Fedora-OS) becomes available without login and SSH works perfectly. SFTP and RustDesk work after login.
* Tailscale is Mesh VPN / Overlay VPN.
* "exit node" option may solve internet connectivity problems. <sup>{6}</sup>

# Xampp Local Network Access

## Fedora-OS

**[How to set up a firewall using FirewallD on RHEL 8](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/) <sup>{16}</sup>**

* Open firewall port (http, https) to access xampp from local network or Tailscale.

* Let us add rule (HTTP/80) and (HTTPS/443) permanently and reload firewalld:
```
$ sudo firewall-cmd --zone=public --add-service=http --permanent
$ sudo firewall-cmd --zone=public --add-service=https --permanent
$ sudo firewall-cmd --reload
```

* Verify it:
```
$ sudo firewall-cmd --list-services
$ sudo firewall-cmd --list-services --permanent
```

# Configuration

## Tailscale Manual IP

**Google Search: "tailscale update manual ip" => AI Overview**

To update the IP address of a Tailscale node, you can either let Tailscale manage it automatically or assign a static IP address through the admin console or the CLI. Tailscale generally assigns and manages IP addresses, but admins can override this with static IP pools or manual IP address assignment.

Here's a more detailed explanation:

Automatic IP Address Assignment (Default):

Tailscale automatically assigns IP addresses to devices when they connect to the Tailnet. 
These IP addresses are typically within the 100.x.y.z range. 
The IP address remains the same for a node as long as it's connected to the Tailnet, unless changed by an administrator or the node is removed and re-added.

Manual IP Address Assignment:

Using IP Pools:
Admins can define IP pools in the admin console to assign IP addresses from specific ranges. This allows for better control over IP address allocation within the Tailnet.

Manual IP Address Assignment:
An administrator can manually assign a specific IP address to a node through the admin console.

Using the CLI:
You can use the tailscale ip command in the CLI to get the IP address of a specific device. The tailscale ip <device> command will show you the Tailscale IP address of the specified device.

Updating with the CLI:
The Tailscale CLI command tailscale update can be used to update Tailscale itself on a Windows client.

Important Considerations:

Node Removal and Re-addition:
If a node is removed from the Tailnet (e.g., by clicking "Remove" in the admin console) and then re-added, it will likely be assigned a new IP address.

DNS and IP Addresses:
Tailscale uses MagicDNS to resolve hostnames to IP addresses within the tailnet. You can also manage DNS settings within the Tailnet using the admin console.

Static IP Addresses and DNS:
While Tailscale often uses dynamic IP addresses, you can also configure static IP addresses for devices, which can then be used in conjunction with DNS for resolving hostnames. 

# IP Conflict

## Netbird and Tailscale

**Google Search: "tailscale and netbird ip conflict" => AI Overview**

Yes, conflicts can occur when using Tailscale and Netbird together due to both using the 100.x.y.z address space, which is part of the CGNAT range. This range is also commonly used by ISPs and other VPNs, increasing the likelihood of conflicts.

Here's a more detailed explanation:

IP Address Space:
Tailscale and Netbird both use the 100.x.y.z address space for their internal networking. This space is part of the Carrier-Grade NAT (CGNAT) range, which is also used by ISPs and other VPNs.

Conflict Potential:
When two services or devices use the same IP address space, there's a high chance of conflicts, especially when using different devices on the same network.

Solutions:

Disable IPv4 in Tailscale: One approach is to disable IPv4 in your Tailscale network, forcing it to use IPv6 only.

Use a Custom IP Pool: You can also configure a custom IP pool in Tailscale, using a different address space that doesn't overlap with Netbird or other VPNs.

Netfilter-mode=off: Running Tailscale with the --netfilter-mode=off option can prevent aggressive packet handling by the Tailscale daemon, reducing the risk of conflicts.

Consider ZeroTier: If you're facing persistent conflicts, you might consider switching to ZeroTier, which uses different networking principles and a different address space.

## Netmaker and Tailscale

**Google Search: "tailscale and netmaker ip conflict" => AI Overview**

Tailscale and Netmaker can experience IP conflicts because they both assign IP addresses from the 100.64.0.0/10 CGNAT range, which is a private IP range not used on the public internet. This can lead to situations where devices on your Tailscale network and Netmaker network cannot communicate with each other due to overlapping IP addresses.

Here's a more detailed breakdown of the problem and potential solutions:

Why the conflict happens:

CGNAT IP range:
Tailscale and Netmaker both utilize the 100.64.0.0/10 CGNAT range for assigning IP addresses to devices within their respective virtual networks.

Private IP range:
This is a private IP range, meaning it's not used on the public internet and is meant for internal network communication.

Overlapping IP addresses:
When you have devices from both Tailscale and Netmaker on the same network, they could potentially receive the same IP address within the CGNAT range, leading to a conflict.

Solutions to resolve IP conflicts:

1. Disable IPv4 in Tailscale:
You can disable IPv4 within your Tailscale configuration to force it to use only IPv6. This will prevent Tailscale from assigning IP addresses within the 100.64.0.0/10 range and may resolve the conflict.

2. Configure Netmaker to use a different IP pool:
Netmaker allows you to configure a custom IP pool, so you could choose a different range for your Netmaker network, avoiding overlap with Tailscale.

3. Change the IP address of affected devices:
You can manually change the IP address of devices that are experiencing the conflict on either the Tailscale or Netmaker network.

4. Isolate the devices:
If you have difficulty accessing one of the devices, try isolating the devices experiencing the conflict to be able to reconfigure them.

5. Assign a non-conflicting address:
Once you can reliably access one of the devices, assign it a "good" IP address that does not conflict with the other devices.

Important considerations:

Impact of disabling IPv4:
Disabling IPv4 in Tailscale will limit access to IPv4-only resources on your network.

Network configurations:
Ensure your network devices (routers, etc.) are configured correctly to accommodate both Tailscale and Netmaker's IP ranges.

Documentation:
Refer to the official documentation for both Tailscale and Netmaker for more specific instructions on configuring their IP pools and resolving conflicts. 

## Zerotier and Tailscale

**Google Search: "tailscale and zerotier ip conflict" => AI Overview**

Yes, there can be IP address conflicts when using Tailscale and ZeroTier together, specifically if they both assign IP addresses from the CGNAT range (100.64.0.0 through 100.127.255.255). Tailscale defaults to using this range, and ZeroTier can also be configured to use it. To resolve this, you can either:

Configure ZeroTier to use a different IP range:
This is the recommended solution, as it avoids any potential conflicts.

Configure Tailscale to use a custom IP pool:
Tailscale allows you to specify a custom IP range for your Tailnet, which can be outside the CGNAT range.

Isolate devices and reconfigure them:
If you can reliably access one of the conflicting devices, you can change its IP address to one that doesn't clash with the other service.

Disable IPv4 in Tailscale:
If you're primarily using IPv6, disabling IPv4 in Tailscale can also resolve the conflict.

By carefully configuring both services to use non-conflicting IP address ranges, you can ensure that they can run together without causing any connectivity issues.

# References

* next-sl: {18}

## Websites

* {1} [tailscale.com](https://tailscale.com/)
* {2} [tailscale/tailscale GitHub](https://github.com/tailscale/tailscale)

* Tailscale Alternative
  * {9} [netbird.io](https://netbird.io/) || [netbirdio/netbird GitHub](https://github.com/netbirdio/netbird)
  * {11} [zerotier.com](https://www.zerotier.com/) || [zerotier/ZeroTierOne GitHub](https://github.com/zerotier/ZeroTierOne)
  * {10} [netmaker.io => Only Self-hosted is Free](https://www.netmaker.io/) || [gravitl/netmaker GitHub](https://github.com/gravitl/netmaker)

## Tutorials

* Mesh VPN
  * {13} [When to Use a Mesh VPN and Four Signs You Shouldn’t](https://www.techrepublic.com/article/mesh-vpn/)

* Tailscale General
  * {3} [How Tailscale works](https://tailscale.com/blog/how-tailscale-works)
  * [IP pool](https://tailscale.com/kb/1304/ip-pool)

* Tailscale Sharing
  * [Share your machines with other users](https://tailscale.com/kb/1084/sharing)

* Tailscale Serve
  * [Tailscale Serve](https://tailscale.com/kb/1312/serve)

* Tailscale Funnel
  * [Tailscale Funnel](https://tailscale.com/kb/1223/funnel)
  * [tailscale funnel command](https://tailscale.com/kb/1311/tailscale-funnel)

* Tailscale Taildrop
  * [Taildrop](https://tailscale.com/kb/1106/taildrop)

* Android
  * {4} [Tailscale session with SSH on android](https://www.reddit.com/r/Tailscale/comments/11j2l7u/tailscale_session_with_ssh_on_android/?rdt=65131)

* RustDesk
  * {14} [Is it possible to connect through local network instead of setting up my own server and/or using the public server?](https://www.reddit.com/r/rustdesk/comments/1frnzdr/is_it_possible_to_connect_through_local_network/)

* FirewallD(Fedora) / Xampp
  * {15} [How to enable firewalld logging for denied packets on Linux](https://www.cyberciti.biz/faq/enable-firewalld-logging-for-denied-packets-on-linux/)
  * {16} [How to set up a firewall using FirewallD on RHEL 8](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/)

* Camera
  * [Building a Remote CCTV System with TailScale](https://medium.com/@sampsa.riikonen/building-a-remote-cctv-system-with-tailscale-7532e8744e3f)

## Guides

* {5} [Tailscale when I don't have a public IP in my home network?](https://www.reddit.com/r/Tailscale/comments/xa2c0o/tailscale_when_i_dont_have_a_public_ip_in_my_home/)
* {6} [No internet connection when connected over mobile data](https://www.reddit.com/r/Tailscale/comments/1325r09/no_internet_connection_when_connected_over_mobile/)
* {7} [Accessing IP cameras on a device that is connected to tailscale](https://www.reddit.com/r/Tailscale/comments/1glfaep/accessing_ip_cameras_on_a_device_that_is/)

* Tailscale Bandwidth Limit
  * [does Tailscale have a data transfer limit? thx](https://www.reddit.com/r/Tailscale/comments/qa693j/does_tailscale_have_a_data_transfer_limit_thx/)

* TailScale & Netbird
  * [How to avoid IP conflict with tailscale? #544](https://github.com/netbirdio/netbird/issues/544)

## YouTube Tutorials

* {8} [How to Use Tailscale: Step-by-Step Setup Guide for Beginners BY Learn Linux TV](https://www.youtube.com/watch?v=tW50igaFZTQ)
* {17} [Tailscale Exit Node - Setup and Configuration BY Mike Faucher](https://www.youtube.com/watch?v=HFTqo_ts0iw)
