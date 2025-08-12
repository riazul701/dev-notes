# Mount-Drive.md

## Run Mount-Drive Command During Computer Starts

**ChatGPT Question: "linux run command during computer starts"**

* To run a command during system startup in Linux (every time the computer starts), you have multiple options depending on the type of system and your preferences.

* Here are the most common and reliable methods:

✅ 1. Use systemd (Recommended for modern Linux systems)
  * Step-by-step:
  * 1. Create a systemd service file:
```bash
sudo nano /etc/systemd/system/my-startup.service
```
  * 2. Add the following content (replace with your actual command or script):
```ini
[Unit]
Description=My Startup Command
After=network.target

[Service]
Type=oneshot
ExecStart=/path/to/your-command.sh
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
```
  * 3. Make your script executable:
```bash
chmod +x /path/to/your-command.sh
```
  * 4. Enable the service:
```bash
sudo systemctl enable my-startup.service
```
  * 5. (Optional) Start it immediately to test:
```bash
sudo systemctl start my-startup.service
```

* ✅ 2. Use `cron` with `@reboot` (Simple alternative)
  * 1. Open crontab:
```bash
crontab -e
```
  * 2. Add this line at the end:
```bash
@reboot /path/to/your-command.sh
```
  * 3. Make sure the script is executable:
```bash
chmod +x /path/to/your-command.sh
```
  * Note: `@reboot` runs as your user, so make sure the command/script doesn’t need root permissions (or use `sudo` carefully).

* ✅ 3. Use `/etc/rc.local` (For older systems only)
  * If your distro still supports `rc.local`:
  * 1. Edit the file:
```bash
sudo nano /etc/rc.local
```
  * 2. Add your command above the `exit 0` line:
```bash
/path/to/your-command.sh
exit 0
```
  * 3. Make it executable:
```bash
sudo chmod +x /etc/rc.local
```
  * This method is deprecated on many modern Linux distros.

* ✅ Summary
  * Title: Method => When to Use
  * `systemd` => Best for modern systems (Ubuntu 16+, CentOS 7+, etc.)
  * `@reboot` in `cron` => Quick and easy, for user-level startup tasks
  * `/etc/rc.local` => Only on older or minimal systems

* Let me know what distro you're using (e.g., Ubuntu, Fedora, Arch) and I can tailor the instructions more precisely.
