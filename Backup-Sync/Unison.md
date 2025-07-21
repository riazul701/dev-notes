# Commands

## Unison Sync

* Sync-SSH
  * `unison ~/data1 ssh://USER@SERVER/data2` : Sync these two directories <sup>{51}</sup>
  * `unison -fat /d/data1 ssh://USER@SERVER:ssh-port//d/data2` : Unison BiSync [If File System is FAT, then use "-fat" argument] <sup>{51} {52}</sup>

# Unison.md

## Notes

* `unison-gtk` is GUI of `unison` command
  * `sudo dnf install unison-gtk` : Install `unison-gtk` on Fedora

* For Unison, if File System is FAT, then use "-fat" argument.

# References

## Websites

* [Unison GitHub](https://github.com/bcpierce00/unison)

## Tutorials

* Install/Config
  * {1} [Unison GitHub](https://github.com/bcpierce00/unison)

* Synchronize
  * {51} [How to use Unison to sync files on Linux machines across a network](https://www.techrepublic.com/article/how-to-use-unison-to-sync-files-on-linux-machines-across-a-network/)
  * {52} [How do I change the port for Unison?](https://www.linuxquestions.org/questions/linux-software-2/how-do-i-change-the-port-for-unison-4175477318/)

## YouTube Tutorials
