# Commands/Usage

* `fc-query -f '%{family[0]}\n' /path/to/file` : The family name of a font file can be acquired with the use of `fc-query` for example <sup>{2}</sup>
  * The formatting is described in [FcPatternFormat(3)](https://man.archlinux.org/man/FcPatternFormat.3) <sup>{2} {13}</sup>

* `fc-cache` : Update the Fontconfig cache (usually unnecessary as software using the Fontconfig library does this) <sup>{2}</sup>

* `mkfontscale`, `mkfontdir` : With older applications that do not support Fontconfig (e.g. GTK 1.x applications, and `xfontsel`) the index will need to be created in the font directory <sup>{2}</sup>
  * `xlsfonts | grep fontname` : To check that the font(s) is included <sup>{2}</sup>

* `fc-match` : Test for a default font being set like so <sup>{2}</sup>

* `fc-match monospace` : To reverse an alias and find which font it is representing, run this
  * Shows Output: `DejaVuSansMono.ttf: "DejaVu Sans Mono" "Book"`
  * In this case, `DejaVuSansMono.ttf` is the font represented by the `monospace` alias.

* `fc-list :lang="two letter language code"` : To list installed fonts for a particular language, issue a command <sup>{2}</sup>
  * `fc-list -f '%{file}\n' :lang=ar` : For instance, to list installed Arabic fonts or fonts supporting Arabic glyphs <sup>{2}</sup>

* `fc-list :charset=2B9D` : To list all fonts supporting a particular Unicode codepoint—[black upwards equilateral arrowhead](https://graphemica.com/%E2%AE%9D) (⮝) in this case <sup>{2}</sup>

* `fc-match --sort monospace:charset=2B9D | head` : To search for monospaced fonts supporting a particular Unicode codepoint you could try the following <sup>{2}</sup>

* `fc-list ':' file` : To see a list of known Fontconfig fonts <sup>{3}</sup>
  * See [fc-list(1)](https://man.archlinux.org/man/fc-list.1) for more output formats. <sup>{3} {14}</sup>

* `grep /fonts ~/.local/share/xorg/Xorg.0.log` : Check for Xorg known font paths by reviewing its log: <sup>{3}</sup>

* `xset q` : You can also check the list of Xorg known font paths using the command <sup>{3}</sup>
  * Use `/var/log/Xorg.0.log` if Xorg is run with root privileges. <sup>{3}</sup>

* `xlsfonts` : To see a list of fonts known by Xorg use this, from the [xorg-xlsfonts](https://archlinux.org/packages/?name=xorg-xlsfonts) package. <sup>{3}</sup>

* `fc-scan .fonts/lklug.ttf --format='%{family}\n'` : Obtain the Family name as listed in the font itself. <sup>{3}</sup>
  * Shows Output : `LKLUG`

* `fc-match --verbose Sans` : To find out what settings are in effect, use <sup>{3}</sup>

* `ftview -e unic -d 1024x768x24 -r 96 10 /usr/share/fonts/noto/NotoSans-Regular.ttf` : `ftview` is a GUI in which you can tweak font rendering settings with a live preview. For example <sup>{3}</sup>

# Fonts

## Notes

* Don't mix `~/.fonts` and `~/.local/share/fonts` directory. Use one only.

## Fontconfig configuration <sup>{3}</sup>

* Fontconfig gathers all its configurations in a central file (`/etc/fonts/fonts.conf`).

* This file is replaced during Fontconfig updates and should not be edited.

* This file is a conglomeration of rules from the global configuration (`/etc/fonts/local.conf`), the configured presets in `/etc/fonts/conf.d/`, and the user configuration file (`$XDG_CONFIG_HOME/fontconfig/fonts.conf`).

* `fc-cache` can be used to rebuild Fontconfig configuration, although changes will only be visible in newly launched applications.

* Fontconfig configuration files use XML format and need these headers:
```shell
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>

  <!-- settings go here -->

</fontconfig>
```

# Install Font

## [How to install and manage fonts on Linux](https://linuxconfig.org/how-to-install-and-manage-fonts-on-linux) <sup>{1}</sup>

**The fontconfig library**

* on Linux-based operating systems, fonts are managed via the `fontconfig` library.

* The directories where the fonts should be installed are declared in the `/etc/fonts/fonts.conf` configuration file:
```shell
<!-- Font directory list -->
        <dir>/usr/share/fonts</dir>
        <dir>/usr/share/X11/fonts/Type1</dir> <dir>/usr/share/X11/fonts/TTF</dir> <dir>/usr/local/share/fonts</dir>
        <dir prefix="xdg">fonts</dir>
        <!-- the following element will be removed in the future -->
        <dir>~/.fonts</dir>
```

* As you can see, directories that are scanned for font files are declared using the `<dir>` tag. The following directories are set by default:
  * `/usr/share/fonts`
  * `/usr/share/X11/fonts/Type1`
  * `/usr/share/X11/fonts/TTF`
  * `/usr/local/share/fonts`
  * `~/.fonts`

* In the following line, for example, the prefix attribute has the `xdg` value; this means that the passed directory will be prefixed by of `XDG_DATA_HOME` variable: `<dir prefix="xdg">fonts</dir>`

* This system-wide configuration file should not be modified in place, since it could be overwritten by future system updates.

* Custom settings, instead, should be put in the `/etc/fonts/local.conf` file, which should be created, if it doesn’t exist. Per user configurations can also be created:
  * `$XDG_CONFIG_HOME/fontconfig/fonts.conf`
  * `~/.fonts.conf`

**Font utilities**

* Included in the fontconfig package come some utilities which let us easily perform useful operations like re-generating the fonts cache or listing the installed fonts.

**Generating and updating the fonts cache**

* `fc-cache` : If invoked without any argument, the utility re-scans all configured directories

* `fc-cache -v /usr/share/fonts` : In the following example we re-scan only the `/usr/share/fonts` directory. The `-v` option is used to make the output more verbose

* `fc-cache -v -f /usr/share/fonts` : In the example above, you can see that if the existing cache is considered valid, regeneration is skipped. If we want to force the process, we can pass the -f option to the command:

**Getting a list of the available fonts with fc-list**

* `fc-list` : To get the list of the current available fonts on our system from the command line, we can use the command. As you can see above, for each installed font, the command returns:
  * The path of the font file on the system
  * The font family
  * The font style(s)

* `fc-list -v` : Further information about the installed fonts can be obtain by invoking the utility with the `-v` option

* `fc-list cantarell` : To get information for the fonts matching “Cantarell”, we would run

* A method to check if a specific font is installed in the system is to use the `-q` option when invoking `fc-list`. When we do so, all the output of the application is suppressed, and `1` is returned as `exit code` if the passed pattern produces no matches. In the following example the “foo” font doesn’t exist on the system. As you probably know, the `$?` variable contains the exit code of the last command launched in the shell:
```shell
$ fc-list -q foo
echo $?
1
```

* `fc-list :style=Demilight` : Installed fonts can be filtered also on the base of a specific property. For example, suppose we want to get information only about fonts which has the “DemiLight” style. We would run

* `fc-list :lang=it` : In the same way, to obtain information only for fonts with support for a specific language, we would use the `lang` property

**Installing a new font**

* Once we download and extracted the downloaded zip containing the font file, all we have to do, to make the font available only for our user, is to copy it in the `~/.fonts` or `~/.local/share/fonts` directory, and then refresh the font cache:
```shell
$ cp JetBrainsMono-Italic-VariableFont_wght.ttf ~/.local/share/fonts
$ fc-cache -vf
```

* Fonts can also be installed using graphical applications like `GNOME fonts` (the package is called `gnome-fonts-viewer`). To install a font using such application, we open the font file with it: a preview of the font will be displayed. To proceed with the installation, we just click on the “install” button

* If KDE Plasma Desktop is our favorite environment, the native application to perform the same operation is called `KFontView`

## [Fonts => Archlinux Wiki](https://wiki.archlinux.org/title/Fonts) <sup>{2}</sup>

**Manual installation**

* Alternatively, fonts can be installed manually:

* For a single user, install fonts to `~/.local/share/fonts/`.
  * In many cases this suffices, unless you run graphical applications as other users.
  * In the past `~/.fonts/` was used, but is now deprecated.

* For system-wide (all users) installation, place your fonts under `/usr/local/share/fonts/`.
  * You may need to create the directory first: `mkdir -p /usr/local/share/fonts`.
  * `/usr/share/fonts/` is under the purview of the package manager, and should not be modified manually.

* The creation of a subdirectory structure is up to the user, and varies among Linux distributions. For clarity, it is good to keep each font in its own directory. [Fontconfig](https://wiki.archlinux.org/title/Fontconfig) will search its default paths recursively, ensuring nested files get picked up.

* An example structure might be:
```shell
/usr/local/share/fonts/
├── otf
│   └── SourceCodeVariable
│       ├── SourceCodeVariable-Italic.otf
│       └── SourceCodeVariable-Roman.otf
└── ttf
    ├── AnonymousPro
    │   ├── Anonymous-Pro-B.ttf
    │   ├── Anonymous-Pro-I.ttf
    │   └── Anonymous-Pro.ttf
    └── CascadiaCode
        ├── CascadiaCode-Bold.ttf
        ├── CascadiaCode-Light.ttf
        └── CascadiaCode-Regular.ttf
```

* The font files need to have sufficient read permissions for all users, i.e. at least chmod `444` for files, and `555` for directories.

* For the Xserver to load fonts directly (as opposed to the use of a font server), the directory for your newly added font must be added with a FontPath entry. This entry is located in the Files section of your [Xorg configuration file](https://wiki.archlinux.org/title/Xorg#Configuration) (e.g. `/etc/X11/xorg.conf` or `/etc/xorg.conf`). See [#Older applications](https://wiki.archlinux.org/title/Fonts#Older_applications) for more detail.

* Finally, update the Fontconfig cache (usually unnecessary as software using the Fontconfig library does this): `fc-cache`

## [Installing a Nerd Font in Ubuntu](https://dev.to/thiagomg/installing-a-nerd-font-in-ubuntu-558l)

## Fonts Installation

* [How to Install New Fonts in Ubuntu and Other Linux Distributions](https://itsfoss.com/install-fonts-ubuntu/)
* [SutonnyMJ Regular](https://bengalifonts.net/fonts/sutonnymj-regular)

* Step 1: Create `~/.fonts` directory in your home directory
* Step 2: Put fonts files in the `~/.fonts` directory

* `apt show font-manager` : Install font using graphical way

## Install bangla font

* Open Synaptic Package Manager -> Search for "font"
* Install "fonts-beng", "fonts-beng-extra", "fonts-lohit-beng-bengali", "fonts-lohit-beng-assamese", "fonts-indic"
* Then bangla font will work in Firefox, Chrome browser.
* Install Avro Keyboard "ibus-avro" [For problem use command "ibus" and "ibus-daemon"] [Run ibus daemon in background: `ibus-daemon -d`]

# References

* next-sl: {17}

## Commands

* {16} [fonts.conf - Font configuration files](https://man.archlinux.org/man/fonts-conf.5) <sup>{3}</sup>
* {14} [fc-list - list available fonts](https://man.archlinux.org/man/fc-list.1) <sup>{3}</sup>
* {13} [FcPatternFormat - Format a pattern into a string according to a format specifier](https://man.archlinux.org/man/FcPatternFormat.3) <sup>{2}</sup>
* {11} [fc-match - match available fonts](https://man.archlinux.org/man/fc-match.1) <sup>{2}</sup>
* {12} [FcFontSort - Return list of matching fonts](https://man.archlinux.org/man/FcFontSort.3) <sup>{2}</sup>

## Tutorials

* {1} [How to install and manage fonts on Linux](https://linuxconfig.org/how-to-install-and-manage-fonts-on-linux)
* {2} [Fonts => Archlinux Wiki](https://wiki.archlinux.org/title/Fonts)
* {3} [Font configuration => Archlinux Wiki](https://wiki.archlinux.org/title/Font_configuration)
* {4} [Installing a Nerd Font in Ubuntu](https://dev.to/thiagomg/installing-a-nerd-font-in-ubuntu-558l)
* {15} [X Logical Font Description => Old way](https://wiki.archlinux.org/title/X_Logical_Font_Description)

* {5} [Pango markup documentation => Used in i3WM](https://docs.gtk.org/Pango/pango_markup.html)

## Font Collection

* {6} [Localization/Bengali#Fonts => Archlinux Wiki](https://wiki.archlinux.org/title/Localization/Bengali#Fonts) <sup>{2}</sup>
* {7} [FontAwesome](https://fontawesome.com/) <sup>From Polybar</sup>
* {8} [Material icons](https://material.io/icons/) <sup>From Polybar</sup>
* {9} [IcoMoon](https://icomoon.io/app/#/select/library) <sup>From Polybar</sup>
* {10} [Nerd Patched Fonts](https://github.com/ryanoasis/nerd-fonts) <sup>From Polybar</sup>
