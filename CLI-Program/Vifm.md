# Vifm.md

# Usage

* Lesson Progress
  * :copy

* Change ColorScheme
  * Download colorschemes from [colorschemes.shtml](https://vifm.info/colorschemes.shtml) and save to `~/.config/vifm/colors/`
  * Choose colorscheme: `:colorscheme`

* Copy
  * Copy file from left to right pane: `:copy`
  * Skip file, if already exists: `:copy -skip`
  * Copy and over-write: `:copy!`
  * Copy with range: `:<from>,<to>:copy`
  * Copy to path: `:copy /path/`
  * Copy and rename from left to right pane with range: `:<from>,<to>copy name1 name2`

# Elements of Vifm.md

## Websites

* General
  * [Vifm - Official Site](https://vifm.info/)
  * [Vifm Cheatsheet](https://vifm.info/cheatsheets.shtml)

* Integrate with Vim
  * [vifm/vifm.vim](https://github.com/vifm/vifm.vim)

* Icon/Image Preview
  * {10} [thimc/vifmimg](https://github.com/thimc/vifmimg)
  * {11} [thimc/lfimg](https://github.com/thimc/lfimg)
  * {15} [seebye/ueberzug](https://github.com/seebye/ueberzug)
  * {12} [ueber-devel/ueberzug](https://github.com/ueber-devel/ueberzug)
  * {13} [jstkdng/ueberzugpp](https://github.com/jstkdng/ueberzugpp)
  * {14} [Derek Taylor/Dotfiles/Repository](https://gitlab.com/dwt1/dotfiles/blob/master/.config/vifm/vifmrc)

## Tutorials

* {1} [Quickstart Tutorial - Official](https://wiki.vifm.info/index.php/Quickstart_Tutorial)
* {2} [Vifm – A Simple and Powerful Text Based File Manager for GNU/Linux](https://fossbytes.com/vifm-beginner-tutorial-file-manager-gnu-linux/)
* {8} [How to preview images](https://wiki.vifm.info/index.php/How_to_preview_images)

## Notes

* Activate view-mode using command ":view" to see text/image/pdf/ebook/font preview.
* h when ‘lsview’ is off move up one directory (moves to parent directory node in tree view), otherwise move left one file. <sup>{17}</sup>
* l when ‘lsview’ is off move into a directory or launches a file, otherwise move right one file. <sup>{17}</sup>

# Configuration

## File/Folder Icons

* {9} [thimc/vifm_devicons](https://github.com/thimc/vifm_devicons)
  * Append the `favicons.vifm` file to your `~/.config/vifm/vifmrc` file and restart Vifm to take effect.

## Image Preview Using [thimc/vifmimg](https://github.com/thimc/vifmimg)

* {10} [thimc/vifmimg](https://github.com/thimc/vifmimg)
* {8} [How to preview images](https://wiki.vifm.info/index.php/How_to_preview_images)
* Install required packages
  * "ueberzug": `sudo apt install ueberzug`
  * "ffmpegthumbnailer": `sudo apt install ffmpegthumbnailer`
  * "imagemagick": `sudo apt install imagemagick`
  * "pdftoppm": `sudo apt install poppler-utils` <sup>{16}</sup>
  * "ddjvu":  `sudo apt install djvulibre-bin`

# References

* next-sl: {19}

* Tutorials
  * {1} [Quickstart Tutorial - Official](https://wiki.vifm.info/index.php/Quickstart_Tutorial)
  * {2} [Vifm – A Simple and Powerful Text Based File Manager for GNU/Linux](https://fossbytes.com/vifm-beginner-tutorial-file-manager-gnu-linux/)
  * {17} [Vifm — Powerful command line file manager](https://aliarefwriorr.medium.com/vifm-powerful-command-line-file-manager-f6131de8b8d5)
  
* Guides
  * {7} [app-assignment for vifm on windows](https://stackoverflow.com/questions/43594291/app-assignment-for-vifm-on-windows)

* Installation

* Configuration

  * File/Folder Icon
    * {9} [thimc/vifm_devicons](https://github.com/thimc/vifm_devicons)

  * Icon/Image Preview
    * {8} [How to preview images](https://wiki.vifm.info/index.php/How_to_preview_images)
    * {10} [thimc/vifmimg](https://github.com/thimc/vifmimg)
    * {11} [thimc/lfimg](https://github.com/thimc/lfimg)
    * {15} [seebye/ueberzug](https://github.com/seebye/ueberzug)
    * {12} [ueber-devel/ueberzug](https://github.com/ueber-devel/ueberzug)
    * {13} [jstkdng/ueberzugpp](https://github.com/jstkdng/ueberzugpp)
    * {14} [Derek Taylor/Dotfiles/Repository](https://gitlab.com/dwt1/dotfiles/blob/master/.config/vifm/vifmrc)
    * {16} [Pdftoppm, convert PDF files into images from Ubuntu](https://ubunlog.com/en/pdftoppm-convierte-archivos-pdf-en-imagenes/)

* YouTube Tutorial
  * {18} [VIFM in-depth look and customization BY linux dabbler](https://www.youtube.com/watch?v=hDZ7JscJ5jM)
  * {3}[vifm - The Terminal File Manager For The Vim-Centric User BY DistroTube](https://www.youtube.com/watch?v=47QYCa8AYG4)
  * {4} [Icons And Image Previews In Vifm, Plus Xterm Is Great! BY DistroTube](https://www.youtube.com/watch?v=rnMXH_K8hz4)
  * {5} [Vifm and Überzug (Ueberzug) Image Previews BY DistroTube](https://www.youtube.com/watch?v=qgxsduCO1pE)
  * {6} [Ueberzug is dead. Now what? (Terminal image previews without Ueberzug) BY Eric Murphy](https://www.youtube.com/watch?v=nTQWI0OalVk)
