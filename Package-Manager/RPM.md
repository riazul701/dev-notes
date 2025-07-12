# Commands/Usage

* `sudo rpm -ivh {{package-name.rpm}}` : To install local `.rpm` packages with the `rpm` command, use the syntax <sup>{2}</sup>
  * `-i` - Installs packages. `-v` - Shows verbose output. `-h` - Prints hash marks, which are visual indicators that show the installation process progress. <sup>{2}</sup>
  * In general it would be preferred to use `"dnf install *.rpm"` since it checks for dependencies and requirements while using `rpm` would just install the packages. <sup>{5}</sup>

# RPM.md

# Add Repository

## [Configure the RPMFusion repository](https://rpmfusion.org/Configuration) <sup>{4}</sup>

**Installing Free and Nonfree Repositories**

* We have two separate software repositories:
  * `free` for Open Source Software (as defined by the Fedora Licensing Guidelines) which the Fedora project cannot ship due to other reasons
  * `nonfree` for redistributable software that is not Open Source Software (as defined by the Fedora Licensing Guidelines); this includes software with publicly available source-code that has "no commercial use"-like restrictions

* Installation can be done either using a web browser, or via the command line.

* Please also check the dedicated [Multimedia](https://rpmfusion.org/Howto/Multimedia) page for well known additional post-install steps.

* See a more dedicated page for [OSTree](https://rpmfusion.org/Howto/OSTree) Systems (such as Silverblue, Kinoite and CoreOS)

* Also worth to mention is the [CommonBugs](https://rpmfusion.org/CommonBugs) sections.

**Graphical Setup via Firefox web browser**

* First enable access to the free repository. For users of gpk (gnome package kit) or kpackagekit in Fedora that is easy and basically only one step: just click on one of the following files, depending on what distribution you use and then follow the default options that Firefox and Package Kit offer by clicking Enter a few times (¹):

  * [RPM Fusion free for Fedora 41](https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-41.noarch.rpm)
  * [RPM Fusion free for Fedora 42](https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-42.noarch.rpm)
  * [RPM Fusion free for Fedora Rawhide](https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm)
  * [RPM Fusion free for RHEL 8 or compatible like CentOS Stream](https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm)
  * [RPM Fusion free for RHEL 9 or compatible like CentOS Stream](https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-9.noarch.rpm)
  * [RPM Fusion free for RHEL 10 or compatible like CentOS Stream](https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-10.noarch.rpm)

* Once that succeeds, you can enable access to the nonfree repositories by clicking on one of the following files, depending on what distribution you use and then follow the default options that Firefox and Package Kit offer by clicking Enter a few times(¹):

  * [RPM Fusion nonfree for Fedora 41](https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-41.noarch.rpm)
  * [RPM Fusion nonfree for Fedora 42](https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-42.noarch.rpm)
  * [RPM Fusion nonfree for Fedora Rawhide](https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm)
  * [RPM Fusion nonfree for RHEL 8 or compatible like CentOS Stream](https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm)
  * [RPM Fusion nonfree for RHEL 9 or compatible like CentOS Stream](https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-9.noarch.rpm)
  * [RPM Fusion nonfree for RHEL 10 or compatible like CentOS Stream](https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-10.noarch.rpm)

* (¹) Once you clicked on above link Firefox will ask you how to Open the file. Here you can simply use the default and open the file with the default application Package Installer. Then Firefox will call Package Kit, which asks Do you want to install this file ?. Click OK to begin install; Package Kit then will complain about a Missing security signature; once you tell Package Kit to install the package nevertheless it will move on and install it. That's all.

**Command Line Setup using rpm**

* To enable access to both the free and the nonfree repository use the following command:

* Fedora with dnf:
```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

* On Fedora, we default to use the openh264 library, so you need the repository to be explicitly enabled.
  * On Fedora 41 and later: `sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1`
  * On Fedora up to 40, the command is as follow: `sudo dnf config-manager --enable fedora-cisco-openh264`

* Silverblue with rpm-ostree:
```
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
  * `#` You will have to reboot for the rpmfusion repositories to appear)

* RHEL or compatible (like Rocky and Alma)
```
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
```

* RHEL requires an additional step (for RHEL8 , RHEL9 and to RHEL10)
```
sudo subscription-manager repos --enable "codeready-builder-for-rhel-$(rpm -E %{rhel})-$(uname -m)-rpms"
```

* RHEL clones have a alternatives step (for Alma and Rocky, versions 8 to 10)
```
sudo /usr/bin/crb enable"
```

**AppStream metadata**

* RPM Fusion repositories also provide [Appstream metadata](https://www.freedesktop.org/wiki/Distributions/AppStream/) to enable users to install packages using Gnome Software/KDE Discover. Please note that these are a subset of all packages since the metadata are only generated for GUI packages.

* For the current Fedora releases: the suggested method is to install appstream-data using DNF.

* The following command will install the required group of packages: `sudo dnf update @core`
  * Since DNF5 (Fedora 41 and later), the Fedora groups cannot be extended by RPM Fusion, so you need to mention the package explicitely: `sudo dnf install rpmfusion-\*-appstream-data`

**Important notes**

* You need to enable [EPEL](http://fedoraproject.org/wiki/EPEL) on RHEL or compatible distributions like CentOS before you enable RPM Fusion for EL. See the fedoraproject wiki for instruction [how to enable EPEL](http://fedoraproject.org/wiki/EPEL/FAQ#howtouse).

# References

* next-sl: {6}

## Websites

* {1} [rpm.org](https://rpm.org/)

* RPM Packages
  * {3} [RPM Fusion](https://rpmfusion.org/)
  * [rpmfind.net/linux/RPM/](https://rpmfind.net/linux/RPM/) <sup>{2}</sup>
  * [rpm.pbone.net](https://rpm.pbone.net/) <sup>{2}</sup>
  * [freshrpms.net](https://freshrpms.net/) <sup>{2}</sup>

## Commands

* {2} [rpm Command: Syntax, Options, Examples](https://phoenixnap.com/kb/rpm-command-in-linux)

## Tutorials

* Add RPM Repository
  * {4} [Configure the RPMFusion repository](https://rpmfusion.org/Configuration)

## Guides

* Install Package
  * {5} [installing local pacakges with either dnf or rpm](https://forums.fedoraforum.org/showthread.php?327037-installing-local-pacakges-with-either-dnf-or-rpm)
