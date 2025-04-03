# Commands/Usage

* `apt --fix-broken install` : Fix APT broken dependency

# APT.md

# Error & Solution

## `papirus-icon-theme` freezes system

**[Paper-icon-theme freezes system?](https://www.reddit.com/r/linuxmint/comments/5ecdut/papericontheme_freezes_system/)**

* Problem Details
```
Following some reddit advice, I decided to install paper-icon-theme on my Linux Mint 
Cinnamon 17.3 x32. However, upon installing, my system freezed on 
"Unpacking paper-icon-theme", and has been throwing various errors ever since. 
I had to hard reset my system, and now, whenever I install or update anything else, 
paper-icon-theme gets selected automatically, tries to install itself, and freezes 
my system on "Unpacking paper-icon-theme". When it has freezed, the error 
"bash: fork cannot allocate memory" appears on every command from tty, even basic ones 
like ls, or cd. This is a real nuisance. Then, following some advice on the internet, 
I deleted the Paper folder in /usr/share/icons hoping to uninstall the package, 
and that I believe has worsened the issue. Now, `apt-get remove paper-icon-theme` 
gets me "package is in very bad inconsistent state: you should reinstall it before 
attempting a removal". And dpkg then throws an error -1. And of course, if I attempt 
to install it, the system freezes again.

I'm all ears for any advice or suggestion. I want to get rid of this blasted package 
and make my system functional again. Thanks!
```

* Solution
  * First stop processes:
    * `sudo killall apt`
    * `sudo killall dpkg`
    * `sudo killall synaptic`

  * Try forcing the removal with dpkg first:
  ```
  $ sudo dpkg --remove --force-remove-reinstreq paper-icon-theme
  $ sudo apt-get remove paper-icon-theme
  $ sudo apt-get autoremove
  ```

# References

* next-sl: {10}

## Websites

* {1} [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* {8} [repology.org](https://repology.org/)
* {9} [distrowatch.com](https://distrowatch.com/)

## Commands

* [apt - command-line interface](https://man.archlinux.org/man/apt.8.en)

## Tutorials

* General
  * [How to Use APT Package Manager](https://phoenixnap.com/kb/apt-package-manager)

* Debian APT Sources
  * {2} [DebianTesting](https://wiki.debian.org/DebianTesting)
  * {3} [SourcesList => Debian](https://wiki.debian.org/SourcesList)
  * {4} [sources.list - List of configured APT data sources](https://manpages.debian.org/bookworm/apt/sources.list.5.en.html)
  * {5} [DebianRepository](https://wiki.debian.org/DebianRepository)
  * {6} [Unofficial => Debian Repository](https://wiki.debian.org/DebianRepository/Unofficial)
  * {7} [sources.list and Debian testing](https://www.reddit.com/r/debian/comments/1alt66a/sourceslist_and_debian_testing/)
