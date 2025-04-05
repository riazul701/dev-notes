# Commands/Usage

* `systemctl status` : Show system status <sup>{1}</sup>

* `systemctl` or `systemctl list-units` : List running units <sup>{1}</sup>

* `systemctl --failed` : List failed units <sup>{1}</sup>

* `systemctl list-unit-files` : List installed unit files <sup>{1}</sup>

* `systemctl status pid` : Show process status for a PID (cgroup slice, memory and parent) <sup>{1}</sup>

* `systemctl help unit` : Show a manual page associated with a unit (as supported by the unit) <sup>{1}</sup>

* `systemctl status unit` : Status of a unit (including whether it is running or not) <sup>{1}</sup>

* `systemctl is-enabled unit` : Check whether a unit is enabled <sup>{1}</sup>

* `systemctl start unit` (as root) : Start a unit immediately <sup>{1}</sup>

* `systemctl stop unit` (as root) : Stop a unit immediately <sup>{1}</sup>

* `systemctl restart unit` (as root) : Restart a unit <sup>{1}</sup>

* `systemctl reload unit` (as root) : Reload a unit and its configuration <sup>{1}</sup>

* `systemctl daemon-reload` (as root) : Reload systemd manager configuration (scan for new or changed units) <sup>{1}</sup>

* `systemctl enable unit` (as root) : Enable a unit to start automatically at boot <sup>{1}</sup>

* `systemctl enable --now unit` (as root) : Enable a unit to start automatically at boot and start it immediately <sup>{1}</sup>

* `systemctl disable unit` (as root) : Disable a unit to no longer start at boot <sup>{1}</sup>

* `systemctl reenable unit` (as root) : Reenable a unit (i.e. disable and enable anew) <sup>{1}</sup>

* `systemctl mask unit` (as root) : Mask a unit to make it impossible to start <sup>{1}</sup>

* `systemctl unmask unit` (as root) : Unmask a unit <sup>{1}</sup>

* `systemctl list-unit-files --state=masked` : Both manually and as a dependency, which makes masking dangerous. Check for existing masked units with <sup>{1}</sup>

* `systemctl reboot` : Shut down and reboot the system <sup>{1} {3}</sup>

* `systemctl poweroff` : Shut down and power-off the system <sup>{1} {3}</sup>

* `systemctl suspend` : Suspend the system <sup>{1} {3}</sup>

* `systemctl hibernate` : Put the system into hibernation (write RAM to disk) <sup>{1} {3}</sup>

* `systemctl hybrid-sleep` : Put the system into hybrid-sleep state (also called suspend-to-both, it saves RAM to disk and then suspends) <sup>{1} {3}</sup>

* `systemctl suspend-then-hibernate` : First suspend the system, then wake up after a configured time in order to just hibernate the system <sup>{1} {3}</sup>

* `systemctl soft-reboot` : Perform a reboot of the userspace-only with a [#Soft reboot](https://wiki.archlinux.org/title/Systemd#Soft_reboot). <sup>{1} {3}</sup>

* `systemctl show --property=UnitPath` : Unit files are loaded from multiple locations (to see the full list, run)

* `systemctl edit` : Editing the unit with this (which reloads the unit automatically) <sup>{1}</sup>

* `systemctl daemon-reload` : Reloading all units with <sup>{1}</sup>

* `systemd-delta` : You can use this to see which unit files have been overridden or extended and what exactly has been changed.

* `systemctl cat unit` : Use this to view the content of a unit file and all associated drop-in snippets.

* `systemctl edit --full unit` : This opens `/etc/systemd/system/unit` in your editor (copying the installed version if it does not exist yet) and automatically reloads it when you finish editing.

* `systemctl edit unit --drop-in=drop_in_name` : This opens the file `/etc/systemd/system/unit.d/drop_in_name.conf` in your text editor (creating it if necessary) and automatically reloads the unit when you are done editing.
  * Omitting `--drop-in=` option will result in systemd using the default file name `override.conf` .

* `systemctl revert unit` : To revert any changes to a unit made using `systemctl edit` do

* `systemctl list-units --type=target` : The following should be used under systemd instead of running `runlevel`

* `systemctl isolate graphical.target` : In systemd, targets are exposed via target units. You can change them like this. This will only change the current target, and has no effect on the next boot.

* `systemctl get-default` : To verify the current target with systemctl

* `systemctl set-default multi-user.target` : To change the default target to boot into, change the `default.target` symlink. With systemctl

* `systemctl list-dependencies --reverse nss-lookup.target` : Check which active service, if any, is pulling in `nss-lookup.target` with

* `systemd-analyze security unit`

* `systemctl --state=failed` : To find the systemd services which failed to start

* `systemctl list-jobs`

* `systemctl cancel`

* `systemctl stop systemd-suspend.service`

* `systemd-analyze blame`

# SystemD.md

# References

* next-sl: {}

## Websites

* [systemd.io](https://systemd.io/)
* [systemd/systemd-ui GitHub](https://github.com/systemd/systemd-ui)
* [systemdGenie](https://apps.kde.org/systemdgenie/)

## Commands

* [systemctl - Control the systemd system and service manager](https://man.archlinux.org/man/systemctl.1) <sup>{1}</sup>
* [systemd.unit - Unit configuration](https://man.archlinux.org/man/systemd.unit.5) <sup>{1}</sup>
* [systemd-soft-reboot.service - Userspace reboot operation](https://man.archlinux.org/man/systemd-soft-reboot.service.8) <sup>{1}</sup>
* [systemd-escape - Escape strings for usage in systemd unit names](https://man.archlinux.org/man/systemd-escape.1) <sup>{1}</sup>
* [systemd.service - Service unit configuration](https://man.archlinux.org/man/systemd.service.5) <sup>{1}</sup>
* [systemd-analyze - Analyze and debug system manager](https://man.archlinux.org/man/systemd-analyze.1) <sup>{1}</sup>
* [systemd.exec - Execution environment configuration](https://man.archlinux.org/man/systemd.exec.5) <sup>{1}</sup>
* [systemd-sysusers, systemd-sysusers.service - Allocate system users and groups](https://man.archlinux.org/man/systemd-sysusers.8)
* [systemd.mount - Mount unit configuration](https://man.archlinux.org/man/systemd.mount.5)
* [journalctl - Print log entries from the systemd journal](https://man.archlinux.org/man/journalctl.1)

## Tutorials

* {1} [systemd => Archlinux Wiki](https://wiki.archlinux.org/title/Systemd)
* {2} [systemd/User => Archlinux Wiki](https://wiki.archlinux.org/title/Systemd/User)
* {3} [polkit => Archlinux Wiki](https://wiki.archlinux.org/title/Polkit)
* [systemd/Journal](https://wiki.archlinux.org/title/Systemd/Journal)
* [systemd/Timers](https://wiki.archlinux.org/title/Systemd/Timers)
* [systemd-timesyncd](https://wiki.archlinux.org/title/Systemd-timesyncd)
* [Kexec => Archlinux Wiki](https://wiki.archlinux.org/title/Kexec)
* [Arch boot process => Archlinux Wiki](https://wiki.archlinux.org/title/Arch_boot_process)
* [Desktop entries](https://wiki.archlinux.org/title/Desktop_entries)
* [Kernel parameters](https://wiki.archlinux.org/title/Kernel_parameters)
* [fstab](https://wiki.archlinux.org/title/Fstab)

## YouTube Tutorials

* [Systemd Explained: The Ultimate Deep Dive for Linux Users BY Learn Linux TV](https://www.youtube.com/watch?v=Kzpm-rGAXos)
