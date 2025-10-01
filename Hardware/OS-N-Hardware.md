# OS-N-Hardware.md

# ASUS Laptop X541U

* Works well with SparkyLinux-LXQt-(Semi-)Rolling OS. Mousepad touch left-click (one finger) and right-click (two finger) works perfectly.

* Does not support Fedora-LXDE-42 OS. Freezes during hard disk partitioning. Mousepad touch click does not work.

## SparkyLinux WiFi Connection Error

* Error Details:
  * Command: `nmcli device wifi connect {{SSID_or_BSSID}} password {{password}}`
  * Error Message: "Error: Failed to add/activate new connection: failure adding connection: settings plugin does not support adding connections"

* WiFi connection does not work during Live-CD session.

* WiFi connection works after operating system installation.
