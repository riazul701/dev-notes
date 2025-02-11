# Plugin-Yazi.md

## Websites

* {1} [Yazi Resources](https://yazi-rs.github.io/docs/resources/)
* {2} [yazi-rs/plugins GitHub => Official Plugins](https://github.com/yazi-rs/plugins)
* {3} [AnirudhG07/awesome-yazi](https://github.com/AnirudhG07/awesome-yazi)

# Plugin List

## [Yazi Resources](https://yazi-rs.github.io/docs/resources/) <sup>{1}</sup>

* Previewers

  * Markdown
    * [glow.yazi](https://github.com/Reledia/glow.yazi) - Preview markdown files using [glow](https://github.com/charmbracelet/glow).
    * [mdcat.yazi](https://github.com/GrzegorzKozub/mdcat.yazi) - Preview markdown files using [mdcat](https://github.com/swsnr/mdcat).

  * CSV
    * [miller.yazi](https://github.com/Reledia/miller.yazi) - Preview CSV files (and other supported formats) using [miller](https://github.com/johnkerl/miller).

  * Binary
    * [hexyl.yazi](https://github.com/Reledia/hexyl.yazi) - Using [hexyl](https://github.com/sharkdp/hexyl) as the fallback previewer for files.

  * Media
    * [exifaudio.yazi](https://github.com/Sonico98/exifaudio.yazi) - Preview audio metadata and cover using [exiftool](https://exiftool.org/).
    * [mediainfo.yazi](https://github.com/boydaihungst/mediainfo.yazi) - Preview image, audio, video, and subtitle files using `ffmpegthumbnailer` and `mediainfo`.

  * Archives
    * [ouch.yazi](https://github.com/ndtoan96/ouch.yazi) - An [ouch](https://github.com/ouch-org/ouch) plugin for Yazi, supporting preview and compression.

  * Directories
    * [eza-preview.yazi](https://github.com/sharklasers996/eza-preview.yazi) - Preview directories using `eza`, can be switched between list and tree modes.

  * BitTorrent
    * [torrent-preview.yazi](https://github.com/kirasok/torrent-preview.yazi) - Preview `*.torrent` files using [transmission-cli](https://github.com/transmission/transmission).

  * Jupyter notebooks
    * [nbpreview.yazi](https://github.com/AnirudhG07/nbpreview.yazi) - Preview jupyter notebooks(`*.ipynb`) files using [nbpreview](https://github.com/paw-lu/nbpreview).

  * Misc
    * [rich-preview.yazi](https://github.com/AnirudhG07/rich-preview.yazi) - Preview Markdown, JSON, CSV, etc. using [rich-cli](https://github.com/textualize/rich-cli)

* Functional plugins

  * Jumping
    * [relative-motions.yazi](https://github.com/dedukun/relative-motions.yazi) - A Yazi plugin based about vim motions.
    * [jump-to-char.yazi](https://github.com/yazi-rs/plugins/tree/main/jump-to-char.yazi) - Vim-like f`<char>`, jump to the next file whose name starts with `<char>`.
    * [first-non-directory.yazi](https://github.com/lpanebr/yazi-plugins/tree/main/first-non-directory.yazi) - Skip directories and jump to the first file with one keypress.
    * [time-travel.yazi](https://github.com/iynaix/time-travel.yazi) - Browse forwards and backwards in time via BTRFS / ZFS snapshots.

  * Bookmarks
    * [bookmarks.yazi](https://github.com/dedukun/bookmarks.yazi) - A Yazi plugin that adds the basic functionality of Vi-like marks.
    * [mactag.yazi](https://github.com/yazi-rs/plugins/tree/main/mactag.yazi) - Bring macOS's awesome tagging feature to Yazi! The plugin is only available for macOS just like the name says.
    * [yamb.yazi](https://github.com/h-hg/yamb.yazi) - Yet another bookmarks plugins. It supports persistence, jumping by a key, jumping by [fzf](https://github.com/junegunn/fzf).
    * [bunny.yazi](https://github.com/stelcodes/bunny.yazi) - Simple bookmarks menu with fuzzy searching and an option to mark a single directory.

  * Tabs
    * [projects.yazi](https://github.com/MasouShizuka/projects.yazi) - Save all tabs and their states as a project, and restore them at any time.

  * File actions
    * [chmod.yazi](https://github.com/yazi-rs/plugins/tree/main/chmod.yazi) - Execute `chmod` on the selected files to change their mode.
    * [diff.yazi](https://github.com/yazi-rs/plugins/tree/main/diff.yazi) - Diff the selected file with the hovered file, create a living patch, and copy it to the clipboard.
    * [compress.yazi](https://github.com/KKV9/compress.yazi) - A Yazi plugin that compresses selected files to an archive.
    * [ouch.yazi](https://github.com/ndtoan96/ouch.yazi) - An [ouch](https://github.com/ouch-org/ouch) plugin for Yazi, supporting preview and compression.
    * [archivemount.yazi](https://github.com/AnirudhG07/archivemount.yazi) - Mounting and unmounting archives in yazi using [archivemount](https://github.com/cybernoid/archivemount).
    * [fuse-archive](https://github.com/dawsers/fuse-archive.yazi) - Mount and unmount archives transparently while navigating in yazi with [fuse-archive](https://github.com/google/fuse-archive).
    * [reflink.yazi](https://github.com/Ape/reflink.yazi) - Create reflinks to files.
    * [rsync.yazi](https://github.com/GianniBYoung/rsync.yazi) - Simple rsync copying locally and to remote servers.
    * [what-size.yazi](https://github.com/pirafrank/what-size.yazi) - Calculate total size of current selection or of current working directory.
    * [lazygit.yazi](https://github.com/Lil-Dank/lazygit.yazi) - Manage Git directories with [lazygit](https://github.com/jesseduffield/lazygit) with a quick shortcut.
    * [sudo.yazi](https://github.com/TD-Sky/sudo.yazi) - Execute specific file operations with `sudo` privileges.
    * [restore.yazi](https://github.com/boydaihungst/restore.yazi) - Restore/recover latest deleted files/folders using `trash-cli`.
    * [simple-mtpfs.yazi](https://github.com/boydaihungst/simple-mtpfs.yazi) - Mounting MTP devices (Android, Camera, etc) using `simple-mtpfs` (for Linux only).

  * Clipboard
    * [copy-file-contents.yazi](https://github.com/AnirudhG07/plugins-yazi/tree/main/copy-file-contents.yazi) - A simple plugin to copy file contents just from Yazi without going into editor.
    * [system-clipboard.yazi](https://github.com/orhnk/system-clipboard.yazi) - Cross platform implementation of a simple system clipboard.
    * [wl-clipboard.yazi](https://github.com/grappas/wl-clipboard.yazi) - Wayland implementation of a simple system clipboard.
    * [path-from-root.yazi](https://github.com/aresler/path-from-root.yazi) - Copy file path relative to git root

  * `filter` enhancements
    * [smart-filter.yazi](https://github.com/yazi-rs/plugins/tree/main/smart-filter.yazi) - Makes filters smarter: continuous filtering, automatically enter unique directory, open file on submitting.

  * `enter` enhancements
    * [bypass.yazi](https://github.com/Rolv-Apneseth/bypass.yazi) - Yazi plugin for skipping directories with only a single sub-directory.
    * [fast-enter.yazi](https://github.com/ourongxing/fast-enter.yazi) - Auto-decompress archives and enter them, or enter the deepest directory until it's not the only subdirectory.

  * `shell` enhancements
    * [open-with-cmd.yazi](https://github.com/Ape/open-with-cmd.yazi) - Open files using a prompted command.

  * General command enhancements
    * [augment-command.yazi](https://github.com/hankertrix/augment-command.yazi) - Enhances a few Yazi commands with better handling of the choice between selected items and the hovered item.

  * UI enhancements
    * [full-border.yazi](https://github.com/yazi-rs/plugins/tree/main/full-border.yazi) - Add a full border to Yazi to make it look fancier.
    * [max-preview.yazi](https://github.com/yazi-rs/plugins/tree/main/max-preview.yazi) - Maximize or restore the preview pane.
    * [hide-preview.yazi](https://github.com/yazi-rs/plugins/tree/main/hide-preview.yazi) - Switch the preview pane between hidden and shown.
    * [git.yazi](https://github.com/yazi-rs/plugins/tree/main/git.yazi) - Show the status of Git file changes as linemode in the file list.
    * [mount.yazi](https://github.com/yazi-rs/plugins/tree/main/mount.yazi) - A mount manager for Yazi, providing disk mount, unmount, and eject functionality.
    * [starship.yazi](https://github.com/Rolv-Apneseth/starship.yazi) - Starship prompt plugin for Yazi.
    * [omp.yazi](https://github.com/saumyajyoti/omp.yazi) - oh-my-posh prompt plugin for Yazi.
    * [yatline.yazi](https://github.com/imsi32/yatline.yazi) - Customize header-line and status-line with an easy configuration.
    * [simple-status.yazi](https://github.com/Ape/simple-status.yazi) - Minimalistic status line with useful file attribute information.
    * [no-status.yazi](https://github.com/yazi-rs/plugins/tree/main/no-status.yazi) - Remove the status bar.
    * [dual-pane.yazi](https://github.com/dawsers/dual-pane.yazi) - Dual pane navigation for Yazi like vifm or midnight commander.
    * [toggle-view.yazi](https://github.com/dawsers/toggle-view.yazi) - Toggle on or off the parent, current or preview panels.

*  Preloaders

  * Images
    * [allmytoes.yazi](https://github.com/Sonico98/allmytoes.yazi) - Preview freedesktop-compatible thumbnails using [allmytoes](https://gitlab.com/allmytoes/allmytoes).
    * [sips-preview.yazi](https://github.com/andreas-timm/sips-preview.yazi) - Quick previews of images on macOS. It focuses on PSD (Photoshop) files but also supports other image formats, utilizing the sips command-line tool.

* Fetchers

  * Mime-type
    * [mime-ext.yazi](https://github.com/yazi-rs/plugins/tree/main/mime-ext.yazi) - A mime-type provider based on a file extension database, replacing the builtin `file(1)` to speed up mime-type retrieval at the expense of accuracy.

* (Neo)vim plugins

  * Neovim
    * [yazi.nvim](https://github.com/mikavilpas/yazi.nvim) - A Neovim plugin for the yazi terminal file manager.
    * [tfm.nvim](https://github.com/Rolv-Apneseth/tfm.nvim) - Neovim plugin for terminal file manager integration.
    * [fm-nvim](https://github.com/Eric-Song-Nop/fm-nvim) - Neovim plugin that lets you use your favorite terminal file managers.

  * Vim
    * [yazi.vim](https://github.com/chriszarate/yazi.vim) - Vim plugin for Yazi.

* Helix
  * [Yazelix](https://github.com/luccahuguet/yazelix) - Adding a file tree to Helix & helix-friendly keybindings for Zellij
  * [Zide](https://github.com/josephschmitt/zide) - Group of configuration files and scripts to create an IDE-like experience in zellij

* Shell plugins
  * [yazi-prompt.sh](https://github.com/Sonico98/yazi-prompt.sh) - Display an indicator in your prompt when running inside a yazi subshell.
  * [custom-shell.yazi](https://github.com/AnirudhG07/custom-shell.yazi) - Run any commands through your default system shell.
  * [command.yazi](https://github.com/KKV9/command.yazi) - Display a prompt for executing yazi commands.

* Utilities
  * [icons-brew.yazi](https://github.com/lpnh/icons-brew.yazi) - Make a hot `theme.toml` for your Yazi icons with your favorite color palette.
  * [lsColorsToToml](https://github.com/Mellbourn/lsColorsToToml) - Generate the color rules for the `[filetype]` section in `theme.toml` based on your `$LS_COLORS`.

## [AnirudhG07/awesome-yazi](https://github.com/AnirudhG07/awesome-yazi) <sup>{3}</sup>

* Unique from {1} plugin list

* Previewers
  * [epub.yazi](https://gitee.com/DreamMaoMao/epub.yazi) - Plugin for Yazi to preview epub file.
  * [eza-preview.yazi](https://github.com/ahkohd/eza-preview.yazi) - Preview directories using [eza](https://github.com/eza-community/eza).
  * [lsar.yazi](https://github.com/yazi-rs/plugins/tree/main/lsar.yazi) - Previewing archive contents with lsar.
  * [mediainfo.yazi](https://github.com/Ape/mediainfo.yazi) - Preview image, audio, video, and subtitle files using `ffmpegthumbnailer` and `mediainfo`.

* Jumping
  * [easyjump.yazi](https://gitee.com/DreamMaoMao/easyjump.yazi) - Jump to files with a press of one or two keys for Yazi.
  * [fg.yazi](https://gitee.com/DreamMaoMao/fg.yazi) - A Yazi plugin that supports file searching with an fzf preview.
  * [searchjump.yazi](https://gitee.com/DreamMaoMao/searchjump.yazi) - A Yazi plugin similar to flash.nvim in Neovim, using a search string to generate labels for jumping to. Supports searching by chinese pinyin or regular expressions.

* Bookmarks
  * [DreamMaoMao/bookmarks.yazi](https://gitee.com/DreamMaoMao/bookmarks.yazi) - A Yazi plugin that Supports persistent bookmark management.No bookmarks are lost after you close yazi.

* File Actions
  * [convert.yazi](https://github.com/atareao/convert.yazi) - Convert between image formats using `magick`.
  * [file-actions.yazi](https://github.com/BBOOXX/file-actions.yazi) - A Yazi plugin that allows users to perform actions on selected files using custom scripts.
  * [SL-RU/mount.yazi](https://github.com/SL-RU/mount.yazi) - User interface for convinient mounting volumes using udisks2.
  * [thunar-bulk-rename.yazi](https://github.com/boydaihungst/thunar-bulk-rename.yazi) - Bulk rename using thunar -B in Linux.
  * [whide.yazi](https://github.com/Tyarel8/whide.yazi) - Hide/unhide files in Windows.

* Filter Enhancements

* Enter Enhancements

* General Command Enhancements
  * [win-clipboard.yazi](https://gitee.com/DreamMaoMao/clipboard.yazi) - Yazi plugin for copy file to clipboard,support linux and windows.

* UI enhancements
  * [current-size.yazi](https://gitee.com/DreamMaoMao/current-size.yazi) - Get current path size in header bar for yazi plugin/
  * [yatline-symlink.yazi](https://github.com/lpanebr/yazi-plugins/tree/main/yatline-symlink.yazi) - Shows a symlink's target in your header or status line.
  * [yaziline.yazi](https://github.com/llanosrocas/yaziline.yazi) - Simple lualine-like status line.
  * [file-extra-metadata.yazi](https://github.com/boydaihungst/file-extra-metadata.yazi) - Replaces the default file previewer plugin with extra information. Mimics Midnight Commander's file info for Linux.

* Git Utils
  * [DreamMaoMao/git.yazi](https://gitee.com/DreamMaoMao/git.yazi) - git extension and message prompt plugin for Yazi.
  * [githead.yazi](https://github.com/llanosrocas/githead.yazi) - git status header inspired by powerlevel10k.

* Preloader Images

* Fetchers
  * [DreamMaoMao/mime-ext.yazi](https://gitee.com/DreamMaoMao/mime-ext.yazi) - A Yazi plugin that quickly get mimetype to improved theme rendering speed.
  * [mime-preview.yazi](https://gitee.com/DreamMaoMao/mime-preview.yazi) - Enables the preview folder on the right pane of yazi to render theme colors. very quickly with almost no performance loss.

* Text Editor

* Shell Plugins

* Utilities
  * [yazi_types.lua](https://github.com/hankertrix/augment-command.yazi/blob/main/yazi_types.lua) - A type file containing most of Yazi's Lua API.

## Others

* [macydnah/office.yazi GitHub](https://github.com/macydnah/office.yazi)

# Error and Solution

## `ya pack` clone & copy

* Yazi is installed using Nix package manager
* Installing Plugin: [git.yazi](https://github.com/yazi-rs/plugins/tree/main/git.yazi)

**Error_Message**

> `ya pack -a yazi-rs/plugins:git`
> 
> Cloning into '/home/{{user}}/.local/state/yazi/packages/{{nix-hash}}'
> ...................
> Deploying package `git.yazi`
> 
> Error: failed to copy `/home/{{user}}/.local/state/yazi/packages/{{nix-hash}}/git.yazi/init.lua` to `/home/{{user}}/.config/yazi/plugins/git.yazi/init.lua`
> 
> Caused by: No such file or directory (os error 2)

**Solution**

* There is no file named `/home/{{user}}/.local/state/yazi/packages/{{nix-hash}}/git.yazi/init.lua`
* Actual file path is `/home/{{user}}/.local/state/yazi/packages/{{nix-hash}}/git.yazi/main.lua`
  * Copy this `main.lua` file and paste in `/home/{{user}}/.config/yazi/plugins/git.yazi/` directory and rename `main.lua` file to `init.lua`

# References

* next-sl: {4}

## Websites

* {1} [Yazi Resources](https://yazi-rs.github.io/docs/resources/)
* {2} [yazi-rs/plugins GitHub => Official Plugins](https://github.com/yazi-rs/plugins)
* {3} [AnirudhG07/awesome-yazi](https://github.com/AnirudhG07/awesome-yazi)
