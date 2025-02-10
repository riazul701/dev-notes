# General Concept

## Important

* You should start `broot` with `br` in order to use its full power.
* Enter `:` or `space`, and then enter verb.
* Press `tab` to auto-complete verb/command.
* If go to another command/terminal, then execute `exit` to go back to "Broot".
* Press `esc` (single/multiple times) to go at tree root, and press `enter` to go at parent directory.

## PATH

* Trash PATH: `~/.local/share/Trash`

## Install broot <sup>{7}</sup>

* Windows users:
   * broot may need additional rights at first use in order to write its configuration file. Some users on Windows also report problems with the colon; remember that a space can be used instead of a colon. You should also use a modern terminal, for example the new Microsoft one

## Quitting broot <sup>{4}</sup>

* Other than executing a command leaving broot, there are several ways to quit:
* hit `ctrl+Q` or `ctrl+C`
* type `:q` or `space q` then `enter`
* call any other verb whose action quits broot, for example `:print_path`

## Use a panel to edit a verb argument <sup>{5}</sup>

* Assuming you started from just one panel and wanted to execute a command taking a path as argument.
* You may use tab-completion to type it faster but you may also hit `ctrl+P` to create a panel and select it.
* Here's the complete workflow.
  * Start with selecting a file and typing the verb of your choice: `cp`
  * hit `ctrl-p`. This opens a new panel which becomes the focused panel
  * navigate to the desired destination using standard broot features
  * hit `ctrl-p` again, which closes the panel and updates the input in the first panel
  * You may now hit enter to execute the command, maybe after having completed the path.

## Regular Expressions <sup>{4}</sup>

* If there's a `/` before or after the pattern, it's interpreted as a regular expression.
* For example `/pat+ern` would match `"patern.zip"` or `"some_patttern.rar"` but not `"pATTern"`.
* If you want the regex to be case insensitive, add the `i` flag: `/pat+ern/i`.

## Total Search/Search again <sup>{4}</sup>

* When you search in broot in a very big directory on a slow disk, broot doesn't always look at all files. It stops when it found enough matches and then rates those matches.
* If you think there might be a better match, hidden deeper, you may require a total search, which is a search which look at all files.
* This is done using the `:search_again` verb, which may be triggered with the `Ctrl+S` key combination (you may redefine it, see [configuration](https://dystroy.org/broot/conf_file/#keyboard-key)).
* As for other searches, it's interrupted as soon as you type anything.
* If no filtering is active, hit `Ctrl+S` to bring back the last used filtering pattern.

## See what takes space <sup>{6}</sup>

* You may sort by launching broot with `--sort-by-size` or `--sort-by-date`. Or you may, inside broot, type a space, then `sd`, and `enter` and you toggled the `:sort_by_date` mode.
* If you start broot with the `--whale-spotting` option (or its shortcut `-w`), you get a mode tailored to "whale spotting" navigation, making it easy to determine what files or folders take space.
* Sizes, dates, files counts, are computed in the background, you don't have to wait for them when you navigate.
* If you hit `:fs`, you can check the usage of all filesystems, so that you focus on cleaning the full ones.

# Help From `?` Keybinding (broot v1.44.6)

## Broot Introduction

* `broot` lets you explore directory trees and launch commands.
* It's best used when launched as `br`.
* See https://dystroy.org/broot for a complete guide.
* The esc key gets you back to the previous state.
* The ↑ and ↓ arrow keys can be used to change selection.
* The mouse can be used to select (on click) or open (on double-click).

## Search Modes

* Type some letters to search the tree and select the most relevant file.
* For example, flam matches `src/flag/mod.rs`.
* Various types of search can be used:

| prefix | search | example |
|--------|--------|---------|
| `f/` | fuzzy search on file name | `f/conh` matches `DefaultConf.hjson`
| `/` | regex search on file name | `/rs$` matches `build.rs`
| `e/` | exact string search on file name | `e/feat` matches `help_features.rs`
| `nt/` | tokens search on file name | `nt/fea,he` matches `HelpFeature.java`
| `ep/` | exact string search on sub path | `ep/te\/do` matches `website/docs`
| | fuzzy search on sub path | `flam` matches `src/flag/mod.rs` 
| `rp/` | regex search on sub path | `rp/\d{3}.*txt` matches `dir/a123/b.txt`
| `t/` | tokens search on sub path | `t/help,doc` matches `website/docs/help.md`
| `c/` | exact string search on file content | `c/find(` matches a file containing `a.find(b);`
| `cr/` | regex search on file content | `cr/find/i` matches a file containing `A::Find(b)`

* You can combine searches with logical operators.
* For example, to search all toml or rs files containing `tomat`, you may type `(/toml/|/rs$/)&c/tomat`.
* For efficiency, place content search last.
       
## Verbs

* To execute a verb, type a space or `:` then start of its name or shortcut.
* This table is searchable. Hit a few letters to filter it.

| name | shortcut | key | description |
|------|----------|-----|-------------|
| edit | e | ctrl-e | `$EDITOR {file}` |
| create |  |  | `$EDITOR {directory}/{subpath}` |
| git_diff | gd |  | `git difftool -y {file}` |
| backup |  | ctrl-b | `cp -r {file} {parent}/{file-stem}-{version}{file-dot-extension}` |
| terminal |  | ctrl-t | `$SHELL` |
| escape |  | Esc | escape from edition, completion, page, etc. |
| back |  |  | revert to the previous state (mapped to esc) |
| open_stay |  |  | open file or directory according to OS (stay in broot) |
| line_down |  | Down | move one line down |
| line_up |  | Up | move one line up |
| set_syntax_theme |  |  | set the theme of code preview |
| apply_flags |  |  | apply flags (eg `-sd` to show sizes and dates) |
| set_panel_width |  |  | set the width of a panel |
| default_layout |  |  | restore default panel sizes |
| open_leave | ol | alt-Enter | open file or directory according to OS (quit broot) |
| cd | ol | alt-Enter | change directory and quit |
| chmod |  |  | chmod {args} {file} |
| chmod |  |  | chmod -R {args} {file} |
| open_preview |  |  | open the preview panel |
| close_preview |  |  | close the preview panel |
| toggle_preview |  |  | open/close the preview panel |
| preview_image | img |  | preview the selection as image |
| preview_text | txt |  | preview the selection as text |
| preview_binary | hex |  | preview the selection as binary |
| close_panel_ok |  |  | close the panel, validating the selected path |
| close_panel_cancel |  | ctrl-w | close the panel, not using the selected path |
| copy | cp |  | `cp -r {file} {newpath:path-from-parent}` |
| copy_line |  | alt-c | copy selected line (in tree or preview) |
| copy_path |  |  | copy path to system clipboard |
| copy_to_panel | cpp |  | `cp -r {file} {other-panel-directory}` |
| trash |  |  | move file to system trash |
| open_trash | ot |  | show the content of the trash |
| restore_trashed_file | rt |  | restore a file which is in the trash |
| delete_trashed_file | dt |  | irreversibly delete a file which is in the trash |
| purge_trash | et |  | irreversibly delete the trash's content |
| filesystems | fs |  | list mounted filesystems |
| focus_staging_area_no_open |  |  | focus the staging area if already open |
| focus |  | ctrl-f | display the directory (mapped to enter) |
| help | ? | F1 | display broot's help |
| input_paste |  | ctrl-v | paste the clipboard content into the input |
| mkdir | md |  | `mkdir -p {subpath:path-from-directory}` |
| move | mv |  | `mv {file} {newpath:path-from-parent}` |
| move_to_panel | mvp |  | `mv {file} {other-panel-directory}` |
| rename |  | F2 | `mv {file} {parent}/{new_filename}` |
| start_end_panel |  | ctrl-p | either open or close an additional panel |
| mode_input |  |  | enter the input mode |
| previous_match |  | shift-BackTab, BackTab | select the previous match |
| next_match |  | Tab | select the next match |
| no_sort | ns |  | don't sort |
| open_stay | os | Enter | open file or directory according to OS (stay in broot) |
| open_stay_filter | osf |  | display the directory, keeping the current pattern |
| parent | p |  | move to the parent directory |
| page_down |  | ctrl-d, PageDown | scroll one page down |
| page_up |  | ctrl-u, PageUp | scroll one page up |
| panel_left_no_open |  | ctrl-Left | focus panel on left |
| panel_right |  | ctrl-Right | focus or open panel on right |
| print_path | pp |  | print path and leaves broot |
| print_relative_path | prp |  | print relative path and leaves broot |
| print_tree | pt |  | print tree and leaves broot |
| quit | q | ctrl-c, ctrl-q | quit Broot |
| refresh |  | F5 | refresh tree and clear size cache |
| root_up |  | ctrl-Up | move tree root up |
| root_down |  | ctrl-Down | move tree root down |
| select_first |  |  | select the first item |
| select_last |  |  | select the last item |
| select |  |  | select a file by path |
| show |  |  | reveal and select a file by path |
| clear_stage | cls |  | empty the staging area |
| stage |  |  | add selection to staging area |
| unstage |  |  | remove selection from staging area |
| stage_all_directories |  |  | stage all matching directories |
| stage_all_files |  | ctrl-a | stage all matching files |
| toggle_stage |  | ctrl-g | add or remove selection to staging area |
| open_staging_area | osa |  | open the staging area |
| close_staging_area | csa |  | close the staging area panel |
| toggle_staging_area | tsa |  | open/close the staging area panel |
| toggle_tree | tree |  | toggle showing more than one level of the tree |
| sort_by_count | sc |  | sort by count |
| sort_by_date | sd |  | sort by date |
| sort_by_size | ss |  | sort by size |
| sort_by_type | st |  | sort by type |
| rm |  |  | `rm -rf {file}` |
| toggle_counts | counts |  | toggle showing number of files in directories |
| toggle_dates | dates |  | toggle showing last modified dates |
| toggle_device_id | dev |  | toggle showing device id |
| toggle_files | files |  | toggle showing files (or just folders) |
| toggle_ignore | gi | alt-i | toggle use of .gitignore and .ignore |
| toggle_git_file_info | gf |  | toggle display of git file information |
| toggle_git_status | gs |  | toggle showing only files relevant for git status |
| toggle_root_fs | rfs |  | toggle showing filesystem info on top |
| toggle_hidden | h | alt-h | toggle showing hidden files |
| toggle_perm | perm |  | toggle showing file permissions |
| toggle_sizes | sizes |  | toggle showing sizes |
| toggle_trim_root |  |  | toggle removing nodes at first level too |
| total_search |  |  | search again but on all children |
| search_again |  | ctrl-s | either put back last search, or search deeper |
| up_tree | up |  | focus the parent of the current root |
| move_panel_divider |  | alt-> | move_panel_divider 0 1 |
| move_panel_divider |  | alt-< | move_panel_divider 0 -1 |
| clear_output |  |  | clear the --verb-output file |
| write_output |  |  | write the argument to the --verb-output file |

## Configuration

* Verbs, skin, and more, are configured in
  * `/home/{{user}}/.config/broot/conf.hjson`
  * `/home/{{user}}/.config/broot/verbs.hjson`
  * `/home/{{user}}/.config/broot/skins/dark-blue.hjson`
  (hit enter to open the main configuration file)

## Launch Arguments

* Some options can be set on launch:
  * `-h` or `--hidden` : show hidden files
  * `-i` : show files which are normally hidden due to .gitignore rules
  * `-d` or `--dates` : display last modified dates
  * `-w` : whale-spotting mode
  (for the complete list, run `broot --help`)

## Flags

* Flags are displayed at bottom right:
  * `h:y` or `h:n` : whether hidden files are shown
  * `gi:y`, `gi:n` : whether gitignore rules are active or not

## Special Features

* This release was compiled with those optional features enabled:
  * permissions: allow showing file mode, owner and group
  * clipboard: :copy_path (copying the current path), and :input_paste (pasting into the input)
  * trash: `:trash`, `:open_trash`, `:restore_trashed_file`, `:purge_trash`, `:delete_trashed_file`

# Command Details/Explanation

## Navigation Basics

* From here you may navigate using the following keys:
  * `↓` or `↑` : select the next or previous line
  * `ctrl←` or `ctrl→` : focus (or open) a panel to the left or to the right
    * Press again to move between panels. Also remove panel.
  * `⏎` on a file : open the file using xdg-open (or your OS equivalent)
  * `alt⏎` on a file : leave broot and open the file using xdg-open
  * `⏎` on a directory : focus the directory (i.e. make it the new root)
  * `alt⏎` on a directory : leave broot and cd the shell to that directory.
  * `⏎` on the first line : goes up one level (focus the parent directory)
  * `esc` gets you back to the previous state (or leave broot if there's none)
  * `?` brings you to the help screen

* There are also a few more shortcuts:
  * you can quit with `Ctrl+q`
  * you can select a line with a mouse click
  * you can open a line with a mouse double-click

* and you can define your own [shortcuts](https://dystroy.org/broot/conf_verbs/#shortcuts-and-verb-search) or triggering [keyboard keys](https://dystroy.org/broot/conf_verbs/#keyboard-key).

## Keybindings/Verbs/Commands

* Common
  * When first enter into Broot Program => Hit `enter` to go up, `?` for help, or a few letters to search
  * When search matches directory => Hit `enter` to focus, `esc` to clear the filter, `?` for help, or a space then a verb
  * When search matches file => Hit `alt-Enter` to open and quit, `esc` to clear the filter, `?` for help, or a space then a verb

* `ctrl-e` OR `edit` OR `e` : `$EDITOR {file}`
* `create file-1.txt` : `$EDITOR {directory}/{subpath}`
* `ctrl-b` OR `backup {{version}}` : `cp -r {file} {parent}/{file-stem}-{version}{file-dot-extension}`
* `ctrl-t` OR `terminal` : `$SHELL`
* `Esc` OR `escape` : escape from edition, completion, page, etc.
* `back` : revert to the previous state (mapped to esc)
* `open_stay` : open file or directory according to OS (stay in broot)
* `Down` OR `line_down` : move one line down
* `Up` OR `line_up` : move one line up
* `set_syntax_theme {{theme:theme}}` : set the theme of code preview
* `apply_flags sd` : apply flags (eg -sd to show sizes and dates)
* `alt-Enter` OR `open_leave` OR `ol` : open file or directory according to OS (quit broot)
* `alt-Enter` OR `cd` OR `ol` : change directory and quit
* `chmod a+rwx` : `chmod {args} {file}`. This applies to file when cursor is on file.
* `chmod a+rwx` : `chmod -R {args} {file}`. This applies to directory when curson is on directory.
* `ctrl→` OR `open_preview` : open the preview panel
* `ctrl←` OR `close_preview` : close the preview panel
* `toggle_preview` : open/close the preview panel
* `preview_image` OR `img` : preview the selection as image
* `preview_text` OR `txt` : preview the selection as text
* `preview_binary` OR `hex` : preview the selection as binary
* `close_panel_ok` : close the panel, validating the selected path
* `ctrl-w` OR `close_panel_cancel` : close the panel, not using the selected path
* `copy ~dir-1/` OR `cp ~/dir-1/` : Copy file/directory to `~/dir-1` [Create `~/dir-1`, if it does not exist. Copy directory contents, not directory itself]
* `alt-c` OR `copy_line` : copy selected line (in tree or preview)
* `copy_path` : copy path to system clipboard
* `copy_to_panel` OR `cpp` : `cp -r {file} {other-panel-directory}`
* `trash` : move file to system trash
* `open_trash` OR `ot` : show the content of the trash
* `restore_trashed_file` OR `rt` : restore a file which is in the trash
* `delete_trashed_file` OR `dt` : irreversibly delete a file which is in the trash
* `purge_trash` OR `et` : irreversibly delete the trash's content
* `filesystems` OR `fs` : list mounted filesystems
* `ctrl-f` OR `focus` : display the directory (mapped to enter)
* `?` OR `F1` OR `help` : display broot's help
  * Hit `esc` to get back, or a space to start a verb
* `ctrl-v` OR `input_paste` : paste the clipboard content into the input
* `mkdir dir-1` OR `md dir-1` : `mkdir -p {subpath:path-from-directory}`
* `move ../dir-2` OR `move ../dir-2` : `mv {file} {newpath:path-from-parent}`
* `move_to_panel` OR `mvp` : `mv {file} {other-panel-directory}`
* `F2` OR `rename` : `mv {file} {parent}/{new_filename}`
* `ctrl-p` OR `start_end_panel` : either open or close an additional panel
* `shift-BackTab, BackTab` OR `previous_match` : select the previous match
* `Tab` OR `next_match` : select the next match
* `no_sort` OR `ns` : don't sort
* `Enter` OR `open_stay` OR `os` : open file or directory according to OS (stay in broot)
* `open_stay_filter` OR `osf` : display the directory, keeping the current pattern
* `parent` OR `p` : move to the parent directory
* `ctrl-d` OR `PageDown` OR `page_down` : scroll one page down
* `ctrl-u` OR `PageUp` OR `page_up` : scroll one page up
* `ctrl-Left` OR `panel_left_no_open` : focus panel on left
* `ctrl-Right` OR `panel_right` : focus or open panel on right
* `print_path` OR `pp` : print path and leaves broot
* `print_relative_path` OR `prp` : print relative path and leaves broot
* `print_tree` OR `pt` : print tree and leaves broot
* `ctrl-c` OR `ctrl-q` OR `quit` OR `q` : quit Broot
* `F5` OR `refresh` : refresh tree and clear size cache
* `ctrl-Up` OR `root_up` : move tree root up. Go to parent directory.
* `ctrl-Down` OR `root_down` : move tree root down. Go to child directory, if child selected.
* `select_first` : select the first item
* `select_last` : select the last item
* `select` : select a file by path
* `show` : reveal and select a file by path
* `clear_stage` OR `cls` : empty the staging area
* `stage` : add selection to staging area
* `unstage` : remove selection from staging area
* `stage_all_directories` : stage all matching directories
* `ctrl-a` OR `stage_all_files` : stage all matching files
* `ctrl-g` OR `toggle_stage` : add or remove selection to staging area
* `open_staging_area` OR `osa` : open the staging area
* `close_staging_area` OR `csa` : close the staging area panel
* `toggle_staging_area` OR `tsa` : open/close the staging area panel
* `toggle_tree` OR `tree` : toggle showing more than one level of the tree
* `sort_by_count` OR `sc` : sort by count
* `sort_by_date` OR `sd` : sort by date
* `sort_by_size` OR `ss` : sort by size
* `sort_by_type` OR `st` : sort by type
* `rm` : `rm -rf {file}`
* `toggle_counts` OR `counts` : toggle showing number of files in directories
* `toggle_dates` OR `dates` : toggle showing last modified dates
* `toggle_device_id` OR `dev` : toggle showing device id
* `toggle_files` OR `files` : toggle showing files (or just folders)
* `alt-i` OR `toggle_ignore` OR `gi` : toggle use of .gitignore and .ignore
* `toggle_git_file_info` OR `gf` : toggle display of git file information
* `toggle_git_status` OR `gs` : toggle showing only files relevant for git status
* `toggle_root_fs` OR `rfs` : toggle showing filesystem info on top
* `alt-h` OR `toggle_hidden` OR `h` : toggle showing hidden files
* `toggle_perm` OR `perm` : toggle showing file permissions
* `toggle_sizes` OR `sizes` : toggle showing sizes
* `toggle_trim_root` : toggle removing nodes at first level too
* `total_search` : search again but on all children
* `ctrl-s` OR `search_again` : either put back last search, or search deeper
* `up` OR `up_tree` : focus the parent of the current root
* `alt->` OR `move_panel_divider` : move_panel_divider 0 1
* `alt-<` OR `move_panel_divider` : move_panel_divider 0 -1
* `clear_output` : clear the --verb-output file
* `write_output` : write the argument to the --verb-output file

## [Broot content search](https://dystroy.org/blog/broot-c-search/) <sup>{2}</sup>

* The command for such filtering is `c/Option<Option` (`c/` then the searched string).
* If I want to know more about a given file, I hit `ctrl→` (after that, I can close it with `ctrl←`)
  * Broot now shows me the matching lines in the chosen file.
* So I hit the `tab` key to navigate to other matched files. The preview is automatically updated
* Another `ctrl→` lets me focus the preview panel and then I navigate among matched lines using `↓` and `↑`
* Hitting `ctrl→` again dives in the file on the selected line so that I can see the context.
* I can go back to the list of matched lines with `ctrl←`.
* And if I want to open the file in the editor, I type `:e` (or a `space` and a `e`).
  * The command which is executed on enter is previewed in the status line at the bottom: `/Option<Option/ e`
  * and I hit enter to go to my favorite text editor on the relevant line

### Composing patterns

* It's possible to compose patterns using `|` (or), `&` (and), `!` (not), and parenthesis.
* For example, let's see how not to have the md file listed when searching for `Option<Option`.
* To see files whose name ends in "md", this regular expression can be typed in broot: `/md$/`.
* To not see them, you use `!/md$/`, that is you take the files which don't match the pattern.
* To see files matching both patterns, we combine the patterns with `&`. The composite pattern is thus `!/md$/&c/Option</Option`.
* This pattern is equivalent: `c/Option<Option/&!/md$/` but is a little slower as we first look into all files before filtering on their name
* As matching files are displayed as fast as I type, I just filter Cargo.toml files with `carto`: `carto&c/lazy-re`
* To go further, you may want to skim the documentation on [patterns](https://dystroy.org/broot/input/#the-filtering-pattern)

# Commands From

* Help From `?` Keybinding
* [dystroy.org/broot => Better way to navigate directories, find files, and launch commands](https://dystroy.org/broot/) <sup>{1}</sup>
* [Broot content search](https://dystroy.org/blog/broot-c-search/) <sup>{2}</sup>
* [Use broot and meld to diff before commit](https://dystroy.org/blog/gg/) <sup>{3}</sup>

# Keybind-Broot.md

## Websites

* [dystroy.org/broot => Better way to navigate directories, find files, and launch commands](https://dystroy.org/broot/) <sup>{1}</sup>
* [Broot content search](https://dystroy.org/blog/broot-c-search/) <sup>{2}</sup>
* [Use broot and meld to diff before commit](https://dystroy.org/blog/gg/) <sup>{3}</sup>

## Notes

# Error and Solution

## `broot` not support `:cd`

**Error Message**

> Launch Broot with `broot` command
> Execute `:cd` verb/command
> Shows Error:
> this verb needs `broot` to be launched as `br`. Try `broot --install` if necessary.

**Solution**

* `broot --install` : Install `br` command to shell. This command shows output

> You requested a clean (re)install.
> Removing `/home/{{user}}/.local/share/broot/launcher/bash/1`.
> Waiting `br` shell function in `/home/{{user}}/.local/share/broot/launcher/bash/1`.
> Creating link from `/home/{{user}}/.config/broot/launcher/bash/br` to `/home/{{user}}/.local/share/broot/launcher/bash/1`.
> `/home/{{user}}/.bashrc` successfully patched, you can make the function immediately available with `source /home/{{user}}/.bashrc`
> 
> The `br` function has been successfully installed.
> You may have to restart your shell or source your shell init files.
> Afterwards, you should start `broot` with `br` in order to use its full power.

# References

* next-sl: {8}

## Websites

* {1} [dystroy.org/broot => Better way to navigate directories, find files, and launch commands](https://dystroy.org/broot/)
* {2} [Broot content search](https://dystroy.org/blog/broot-c-search/)
* {3} [Use broot and meld to diff before commit](https://dystroy.org/blog/gg/)

## Guides

* {7} [Install broot](https://dystroy.org/broot/install/)
* {6} [Why Broot](https://dystroy.org/broot/)
* {4} [Broot Search and Navigate](https://dystroy.org/broot/navigation/)
* {5} [Broot Panels](https://dystroy.org/broot/panels/)
