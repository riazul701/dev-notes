# Nitrogen.md

## Websites

* [l3ib/nitrogen GitHub](https://github.com/l3ib/nitrogen)

## i3WM Nitrogen Wallpaper

**[Nitrogen is not setting the wallpaper when i start i3](https://askubuntu.com/questions/407514/nitrogen-is-not-setting-the-wallpaper-when-i-start-i3)**

* for i3 users : `vim ~/.config/i3/config`
* then add the line below to your config : `exec --no-startup-id nitrogen --restore`
* omitting --restore will cause the whole nitrogen app to come up instead of the wallpaper
