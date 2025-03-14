# Commands/Usage

* `which connmanctl` : Shows path if installed `connmanctl` command

* `connmanctl scan wifi` : Scan for access points (run multiple times for more complete scan) <sup>{1}</sup>

* `connmanctl services` : Display access points discovered <sup>{1}</sup>

* `connmanctl services wifi_009e959b585c_32426c756557694669_managed_psk` : Displays details on the AP of interest <sup>{1}</sup>

* `cat << EOF > /var/lib/connman/<SSID>-psk.config` : Write config file for connecting to secure AP <sup>{1}</sup>

* `connmanctl connect wifi_009e959b585c_32426c756557694669_managed_psk` : Connect to the new secure AP <sup>{1}</sup>

# ConnMan.md

## Websites

* [ConnMan => command-line network manager](https://wiki.archlinux.org/title/ConnMan)
* [andrew-bibb/cmst GitHub => QT GUI for Connman](https://github.com/andrew-bibb/cmst)

# References

* next-sl: {2}

## Commands From

* {1} [kylemanna/connmanctl.md Gist => Connmanctl Cheat Sheet](https://gist.github.com/kylemanna/6930087)
