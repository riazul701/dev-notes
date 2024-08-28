# Contents of Vifm.md

## Websites

* General
  * [Vifm - Official Site](https://vifm.info/)
  * [Vifm Cheatsheet](https://vifm.info/cheatsheets.shtml)

* Integrate with Vim
  * [vifm/vifm.vim](https://github.com/vifm/vifm.vim)

* File/Folder Icons
  * {9} [thimc/vifm_devicons](https://github.com/thimc/vifm_devicons)
  * {33} [How to add icons?](https://q2a.vifm.info/269/how-to-add-icons?show=270#a270)

* Image/File Preview
  * {10} [thimc/vifmimg](https://github.com/thimc/vifmimg)
  * {11} [thimc/lfimg](https://github.com/thimc/lfimg)
  * {14} [Derek Taylor/Dotfiles/Repository](https://gitlab.com/dwt1/dotfiles/blob/master/.config/vifm/vifmrc)
  * {23} [file-examples.com -> sample file download](https://file-examples.com/)
  * {32} [How do I preview office files?](https://q2a.vifm.info/1227/how-do-i-preview-office-files?show=1227#q1227)

* Image/File Preview Programs
  * {15} [seebye/ueberzug](https://github.com/seebye/ueberzug)
  * {13} [jstkdng/ueberzugpp](https://github.com/jstkdng/ueberzugpp)
  * {12} [ueber-devel/ueberzug](https://github.com/ueber-devel/ueberzug)
  * {25} [dirkvdb/ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
  * {26} [imagemagick.org](https://imagemagick.org/index.php)
  * {27} [Poppler -> PDF rendering library](https://poppler.freedesktop.org/)
  * {30} [DjVu Viewer](http://djvu.sourceforge.net/)
  * {31} [marianosimone/epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer)
  * {35} [sdushantha/fontpreview](https://github.com/sdushantha/fontpreview)

* Terminal/Nerd Font
  * {28} [nerdfonts.com](https://www.nerdfonts.com/) || [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
  * {29} [getnf/getnf](https://github.com/getnf/getnf)

* Preview Test Files
  * {34} [filesamples.com -> sample file download](https://filesamples.com/)
  * {23} [file-examples.com -> sample file download](https://file-examples.com/)

* File Opening Programs
  * Video
    * [FFmpeg](https://ffmpeg.org/)
      * [FFplay is media player using FFmpeg libraries](https://www.ffmpeg.org/ffplay.html)
    * [MPlayer](https://mplayerhq.hu/)
    * [VLC media player](https://www.videolan.org/vlc/)

## Tutorials

* [Vifm Manual](https://wiki.vifm.info/index.php/Manual)
* {1} [Quickstart Tutorial - Official](https://wiki.vifm.info/index.php/Quickstart_Tutorial)
* {2} [Vifm – A Simple and Powerful Text Based File Manager for GNU/Linux](https://fossbytes.com/vifm-beginner-tutorial-file-manager-gnu-linux/)
* {8} [How to preview images](https://wiki.vifm.info/index.php/How_to_preview_images)

## Notes
 
* There are two locations: global one (`/etc/vifm`, available since 0.8) meant to be shared among all users and local one, user specific. Global `vifmrc` is loaded before the local one, so that the latter can redefine anything configured globally. <sup>{19}</sup>
* Activate view-mode using command ":view" to see text/image/pdf/ebook/font preview.
* h when ‘lsview’ is off move up one directory (moves to parent directory node in tree view), otherwise move left one file. <sup>{17}</sup>
* l when ‘lsview’ is off move into a directory or launches a file, otherwise move right one file. <sup>{17}</sup>

# Configuration

## File/Folder Icons

* {9} [thimc/vifm_devicons](https://github.com/thimc/vifm_devicons)
  * There are two ways to install this.
  * I recommend the latter because when updates are released you simply need to update a git repo instead of messing with the actual `vifmrc` file.
  * Way 1:
    * Append the `favicons.vifm` file to your `~/.config/vifm/vifmrc` file and restart Vifm to take effect.
  * (Better Way) Way 2:
    * Append the following line to your vifmrc file: `source /path/to/your/repos/vifm_devicons/favicons.vifm`
    * OR
    * Save `favicons.vifm` file to `/home/{{user-name}}/.config/vifm/` directory.
    * Append the following line to your vifmrc file: `$HOME/.config/vifm/favicons.vifm`
    * Restart Vifm to take affect.

## Image/File Preview Using [thimc/vifmimg](https://github.com/thimc/vifmimg)

* Image preview tested on Antix-23

* {8} [How to preview images](https://wiki.vifm.info/index.php/How_to_preview_images)
* {10} [thimc/vifmimg](https://github.com/thimc/vifmimg)

* Install nerd font on Host-PC<sup>{24}</sup>
  * Install fzf: `sudo apt install fzf`
  * `git clone https://github.com/ronniedroid/getnf.git`
  * `cd getnf`
  * Install fonts in "~/.local/share/fonts" directory.
  * ./install.sh [If it does not work, use command: `./getnf`] [Don't use "sudo", as it install fonts in "/root/.local/share/fonts" user directory] [If shows error, check line-endings are in Linux Line-Feed]
  * Choose "Hack" font.
  * Restart PC if font is not showing in xfce4-terminal settings.
  * Open xfce4-terminal -> Edit -> Preferences -> Appearance -> Font -> Select "Hack NF Regular"

* Install required packages
  * "ueberzug": `sudo apt install ueberzug`
  * "ffmpegthumbnailer": `sudo apt install ffmpegthumbnailer` <sup>{25}</sup>
  * "imagemagick": `sudo apt install imagemagick` <sup>{26}</sup>
  * "pdftoppm": `sudo apt install poppler-utils` <sup>{16} {27}</sup>
  * "ddjvu":  `sudo apt install djvulibre-bin` <sup>{30}</sup>
  * [marianosimone/epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer) <sup>{31}</sup>
    * Install python3 and pip3: `sudo apt install python3 python3-pip`
      * Check "python3" version: `python3 --version`
      * Check "pip3" version: `pip3 --version` [Python Package Manager]
    * Clone "epub-thumbnailer" repo: `git clone https://github.com/marianosimone/epub-thumbnailer.git`
    * Goto directory: `cd epub-thumbnailer`
    * Install "epub-thumbnailer": `sudo python3 install.py install`
    * For Error "Could not determine your desktop environment version.", See [Error_1](#error_1)
  * [sdushantha/fontpreview](https://github.com/sdushantha/fontpreview) <sup>{35}</sup>
    * `sudo apt install xdotool`
    * `sudo apt install fzf`
    * `sudo apt install imagemagick`
    * `sudo apt install nsxiv`
    * Install it locally
    ```shell
    # Download the fontpreview source code, save as fontpreview and make it executeable
    curl -L https://git.io/raw_fontpreview > fontpreview && chmod +x fontpreview
    # Then move fontpreview to somewhere in your $PATH
    sudo mv fontpreview /usr/local/bin/
    ```

* Installation
  * Copy the vifmimg and vifmrun scripts to a folder that is included in your $PATH variable for easy access to the files.
    * Make file executable: `sudo chmod a+x vifmimg vifmrun`
    * Copy "vifmimg" file to $PATH: `sudo mv vifmimg /usr/local/bin/`
    * Copy "vifmrun" file to $PATH: `sudo mv vifmrun /usr/local/bin/`
  * Edit your ~/.config/vifm/vifmrc file and add fileviewer properties like so:
  ```shell
    fileviewer *.pdf
        \ vifmimg pdf %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.djvu
        \ vifmimg djvu %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.epub
        \ vifmimg epub %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <video/*>
        \ vifmimg video %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <image/*>
        \ vifmimg draw %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <audio/*>
        \ vifmimg audio %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <font/*>
        \ vifmimg font %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear
 ```
  * Launch "vifm" to preview files: `vifmrun`
  * Make an alias in your shell that points to vifm.

## Other Files Preview

* Install "zip" to preview ".zip" file: `sudo apt install zip`

## Preview Test Files

* {34} [filesamples.com -> sample file download](https://filesamples.com/)
* {23} [file-examples.com -> sample file download](https://file-examples.com/)

* Image
  * .bmp, .eps, .gif, .ico, .jpeg, .jpg, .png, .svg, .tif, .tiff

* Video
  * .3gp, .avi, .mkv, .mov, .mp4, .ogg, .webm, .wmv

* Audio
  * .mp3, .wav, .wma

* Graphics
  * .psd, .xcf, .ai 

* Office/document
  * .doc, .docx, .xls, .xlsx, .ppt, .pptx, .pdf

* Software
  * .apk, .deb, .exe, .jar, .msi 

* Archive
  * .zip, .7z, .bz2, .gz, .rar, .tar, .tar.bz2, .tar.gz, .iso, .phar

* Font
  * .ttf

## Open File with Programs

### Video

* Video Extensions
```shell
" Video
filextype {*.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
          \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
          \*.as[fx]},
          \*.f4v,*.hevc,*.m2ts,*.mjpeg,*.mxf,*.wtv,*.swf,
         \<video/*>
```

* [FFmpeg](https://ffmpeg.org/)
* [FFplay is media player using FFmpeg libraries](https://www.ffmpeg.org/ffplay.html)

* [MPlayer](https://mplayerhq.hu/)

* [VLC media player](https://www.videolan.org/vlc/)
  ```shell
  \ {View using VLC}
  \ vlc %c %i &,
  ```

# Error and Solution

* next-error: Error_2

## [marianosimone/epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer) <sup>{31}</sup>

### Error_1

* Message_1:
  * Could not determine your desktop environment version. You can still use the thumbnailer script manually.
 
* Solution_1:
  * [Works in pcmanfm #16](https://github.com/marianosimone/epub-thumbnailer/issues/16)
  * Bunsenlab debian stretch
  * I found that it install.py install /usr/bin/epub-thumbnailer but omits /usr/share/thumbnailers/epub.thumbnailer
  * I manually copy from master/src to /usr/share/thumbnailers/epub.thumbnailer and it worked with majority of epubs.

## [sdushantha/fontpreview](https://github.com/sdushantha/fontpreview) <sup>{35}</sup>

### Error_2

* Message_2:
  * magick: command not found

* Solution_2:
  * [Where is the magick command of Imagemagick?](https://askubuntu.com/questions/1315603/where-is-the-magick-command-of-imagemagick)
    * The ImageMagick version 6 command line API (shipped with Ubuntu 20.04 and earlier) consists of these commands:
      * animate, compare, composite, conjure, convert, display, identify, import, mogrify, montage, stream
      * Check ImageMagick version: `convert --help`
    * ImageMagick version 7 will unify these commands under the `magick` command.
      * `magick convert rose.jpg -resize 50% rose.png`

  * [ImageMagick 7](https://www.reddit.com/r/debian/comments/1683rxo/imagemagick_7/)
  * [Download ImageMagick AppImage](https://imagemagick.org/script/download.php)
    * Install ImageMagick AppImage
    * Make it executable for all user `chmod a+x ./magick`
    * Move to executable path: `sudo mv magick /usr/bin/magick`

# References

* next-sl: {36}

* Tutorials
  * {20} [Tutorial Manual](https://wiki.vifm.info/index.php/Manual)
  * {21} [Manual](https://vifm.info/manual.shtml)
  * {22} [Vifm Doc](https://vifm.info/vimdoc.shtml)
  * {1} [Quickstart Tutorial](https://wiki.vifm.info/index.php/Quickstart_Tutorial)
  * {19} [Configuration model](https://wiki.vifm.info/index.php/Configuration_model)
  * {2} [Vifm – A Simple and Powerful Text Based File Manager for GNU/Linux](https://fossbytes.com/vifm-beginner-tutorial-file-manager-gnu-linux/)
  * {17} [Vifm — Powerful command line file manager](https://aliarefwriorr.medium.com/vifm-powerful-command-line-file-manager-f6131de8b8d5)
  
* Guides
  * {7} [app-assignment for vifm on windows](https://stackoverflow.com/questions/43594291/app-assignment-for-vifm-on-windows)

* Installation

* Configuration

  * File/Folder Icons
    * {9} [thimc/vifm_devicons](https://github.com/thimc/vifm_devicons)
    * {33} [How to add icons?](https://q2a.vifm.info/269/how-to-add-icons?show=270#a270)

  * Image/File Preview Using [thimc/vifmimg](https://github.com/thimc/vifmimg)
    * {8} [How to preview images](https://wiki.vifm.info/index.php/How_to_preview_images)
    * {10} [thimc/vifmimg](https://github.com/thimc/vifmimg)
    * {11} [thimc/lfimg](https://github.com/thimc/lfimg)
    * {14} [Derek Taylor/Dotfiles/Repository](https://gitlab.com/dwt1/dotfiles/blob/master/.config/vifm/vifmrc)
    * {16} [Pdftoppm, convert PDF files into images from Ubuntu](https://ubunlog.com/en/pdftoppm-convierte-archivos-pdf-en-imagenes/)
    * {32} [How do I preview office files?](https://q2a.vifm.info/1227/how-do-i-preview-office-files?show=1227#q1227)

    * Image/File Preview Programs
      * {15} [seebye/ueberzug](https://github.com/seebye/ueberzug)
      * {12} [ueber-devel/ueberzug](https://github.com/ueber-devel/ueberzug)
      * {13} [jstkdng/ueberzugpp](https://github.com/jstkdng/ueberzugpp)
      * {25} [dirkvdb/ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
      * {26} [imagemagick.org](https://imagemagick.org/index.php)
      * {27} [Poppler -> PDF rendering library](https://poppler.freedesktop.org/)
      * {30} [DjVu Viewer](http://djvu.sourceforge.net/)
      * {31} [marianosimone/epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer)
      * {35} [sdushantha/fontpreview](https://github.com/sdushantha/fontpreview)

    * Terminal/Nerd Font
      * {24} [Configure nerd fonts](https://www.lunarvim.org/docs/configuration/nerd-fonts)
      * {28} [nerdfonts.com](https://www.nerdfonts.com/) || [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
      * {29} [getnf/getnf](https://github.com/getnf/getnf)

  * Preview Test Files
    * {34} [filesamples.com -> sample file download](https://filesamples.com/)
    * {23} [file-examples.com -> sample file download](https://file-examples.com/)

* YouTube Tutorial
  * {18} [VIFM in-depth look and customization BY linux dabbler](https://www.youtube.com/watch?v=hDZ7JscJ5jM)
  * {3}[vifm - The Terminal File Manager For The Vim-Centric User BY DistroTube](https://www.youtube.com/watch?v=47QYCa8AYG4)
  * {4} [Icons And Image Previews In Vifm, Plus Xterm Is Great! BY DistroTube](https://www.youtube.com/watch?v=rnMXH_K8hz4)
  * {5} [Vifm and Überzug (Ueberzug) Image Previews BY DistroTube](https://www.youtube.com/watch?v=qgxsduCO1pE)
  * {6} [Ueberzug is dead. Now what? (Terminal image previews without Ueberzug) BY Eric Murphy](https://www.youtube.com/watch?v=nTQWI0OalVk)
