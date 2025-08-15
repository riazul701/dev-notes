# Debian-Desktop.md

## Websites

* [Live install images => Debian offline installer](https://www.debian.org/CD/live/) <sup>{1}</sup>
* [repology.org => The packaging hub](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)

* [Debian ISO Download => Live Image](https://www.debian.org/CD/)
  * [Debian Testing Branch ISO](https://cdimage.debian.org/cdimage/weekly-live-builds/amd64/iso-hybrid/)

* [DontBreakDebian](https://wiki.debian.org/DontBreakDebian) <sup>{2}</sup>

## Notes

* If windows OS is used in dual boot system and shutdown/hibernate from windows OS, then failed to mount hard disk partitions in linux OS. To solve this issue, restart from windows OS. If problem persists, from windows OS enable "fast-startup" and shutdown, then start pc and disable "fast-startup" and shutdown, then start pc and restart to linux OS.

## Download ISO

* [What's the difference between Debian Standard and Gnome?](https://unix.stackexchange.com/questions/87182/whats-the-difference-between-debian-standard-and-gnome)
  * `Debian Live Standard` is Debian without the Graphical User Interface.
  * `Debian Live Gnome` is Debian Standard with Gnome.

## [Debian Releases](https://www.debian.org/releases/) <sup>{3}</sup>

* Debian always has at least three releases in active maintenance: "stable", "testing" and "unstable".

* stable
  * The "stable" distribution contains the latest officially released distribution of Debian.
  * This is the production release of Debian, the one which we primarily recommend using.

* testing
  * The "testing" distribution contains packages that haven't been accepted into a "stable" release yet, but they are in the queue for that. The main advantage of using this distribution is that it has more recent versions of software.

* unstable
  * The "unstable" distribution is where active development of Debian occurs. Generally, this distribution is run by developers and those who like to live on the edge. It is recommended that users running unstable should subscribe to the debian-devel-announce mailing list to receive notifications of major changes, for example upgrades that may break.
  * The "unstable" distribution is always called `sid`.

# References

* next-sl: {4}

## Tutorials

* {3} [Debian Releases](https://www.debian.org/releases/)

## YouTube Tutorials
  
* {1} [Beginner’s Guide for Navigating the Debian 12 "Bookworm" Live Installer BY Learn Linux TV](https://www.youtube.com/watch?v=Xd1uFBZbe8w)
* {2} [Do NOT Break Debian BY Titus Tech Talk](https://www.youtube.com/watch?v=d3Ux1pSEKK8)
