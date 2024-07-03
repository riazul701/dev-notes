# Android Internet Connection Issue

* Problem Details:
  * Android phone connected to WiFi.
  * Google-Chrome works with Internet perfectly.
  * Any other apps can not connect to Internet.

* Problem Reason:
  * DNS problem.
  * DNS is pointing to router IP address: 192.168.0.1
  * Router can not resolve Domain to IP address.

* Solution:
  * Goto Connection -> WiFi Settings
  * Select WiFi Connection -> Settings -> Advanced
  * IP Settings: Static
  * DNS 1: 8.8.8.8 [Google's DNS]
  * DNS 2: 8.8.4.4 [If required, use CloudFlare's DNS: 1.1.1.1]
  * Save
