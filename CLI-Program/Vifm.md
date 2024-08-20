# Vifm.md

# Commands

* Notes
  * Trash directory path: `/home/{{user-name}}/.local/share/vifm/Trash`
  * `:view` : Enter/Exit into view mode.
  * `!` means overwrite/recursive in command.
  * `:!!{{command}}` : Execute command in terminal.
  * `"` : Display contents of registers.
  * `-skip` means skip already exist files.
  * `pushd . ./folder` : `pushd` current directory and sub-directory.
  * `:sort` ascending/descending change with `h` key.

* {20} [Tutorial Manual](https://wiki.vifm.info/index.php/Manual)
* {21} [Manual](https://vifm.info/manual.shtml)
* {22} [Vifm Doc](https://vifm.info/vimdoc.shtml)

* TODO Later
  * Commands
    * :[range]alink[!?] -skip ...
    * :apropos
    * :apropos keyword...
    * :autocmd
    * :au[tocmd] {event} {pat} {cmd}
    * :au[tocmd] [{event}] [{pat}]
    * :au[tocmd]! [{event}] [{pat}]
    * :apropos
    * :cds
    * :cds[!] pattern string
    * :keepsel
    * :keepsel [command...]
    * :normal
    * :norm[al][!] commands

* General keys
  * `Ctrl-C or Escape` : cancel most operations (see "Cancellation" section below), clear all selected files.
  * `Ctrl-L` : clear and redraw the screen. Can also reload file list in appropriate modes (like normal and visual).

* Basic Movement
  * The basic vi key bindings are used to move through the files and pop-up windows.
  * `k, gk, or Ctrl-P` : move cursor up one line.
  * `j, gj or Ctrl-N` : move cursor down one line.
  * `h` : when 'lsview' is off move up one directory (moves to parent directory node in tree view), otherwise move left one file.
  * `l` : when 'lsview' is off move into a directory or launch a file, otherwise move right one file. See "Selection" section below.
  * `gg` : move to the first line of the file list.
  * `G` : move to the last line in the file list.
  * `gh` : go up one directory regardless of view representation (regular, ls-like). Also can be used to leave custom views including tree view.
  * `gl or Enter` : enter directory or launch a file. See "Selection" section below.
  * `H` : move to the first file in the window.
  * `M` : move to the file in the middle of the window.
  * `L` : move to the last file in the window.
  * `Ctrl-F or Page Down` : move forward one page.
  * `Ctrl-B or Page Up` : move back one page.
  * `Ctrl-D` : jump back one half page.
  * `Ctrl-U` : jump forward one half page.
  * `n%` : move to the file that is n percent from the top of the list (for example 25%).
  * `0 or ^` : move cursor to the first column. See 'lsview' option description.
  * `$` : move cursor to the last column. See 'lsview' option description.
  * `Space` : switch file lists.
  * `gt` : switch to the next tab (wrapping around).
  * `{n}gt` : switch to the tab number {n} (wrapping around).
  * `gT` : switch to the previous tab (wrapping around).
  * `{n}gT` : switch to {n}-th previous tab.

* Movement with Count
  * Most movement commands also accept a count, 12j would move down 12 files.
  * `[count]%` : move to percent of the file list.
  * `[count]j` : move down [count] files.
  * `[count]k` : move up [count] files.
  * `[count]G or [count]gg` : move to list position [count].
  * `[count]h` : go up [count] directories.

* Scrolling panes
  * `zt` : redraw pane with file in top of list.
  * `zz` : redraw pane with file in center of list.
  * `zb` : redraw pane with file in bottom of list.
  * `Ctrl-E` : scroll pane one line down or column right (in transposed ls-like view).
  * `Ctrl-Y` : scroll pane one line up or column left (in transposed ls-like view).

* Pane manipulation
  * Second character can be entered with or without Control key.
  * `Ctrl-W H` : move the pane to the far left.
  * `Ctrl-W J` : move the pane to the very bottom.
  * `Ctrl-W K` : move the pane to the very top.
  * `Ctrl-W L` : move the pane to the far right.
  * `Ctrl-W h` : switch to the left pane.
  * `Ctrl-W j` : switch to the pane below.
  * `Ctrl-W k` : switch to the pane above.
  * `Ctrl-W l` : switch to the right pane.
  * `Ctrl-W b` : switch to bottom-right window.
  * `Ctrl-W t` : switch to top-left window.
  * `Ctrl-W p` : switch to previous window.
  * `Ctrl-W w` : switch to other pane.
  * `Ctrl-W o` : leave only one pane.
  * `Ctrl-W s` : split window horizontally.
  * `Ctrl-W v` : split window vertically.
  * `Ctrl-W x` : exchange panes.
  * `Ctrl-W z` : quit preview pane or view modes.
  * `Ctrl-W -` : decrease size of the view by count.
  * `Ctrl-W +` : increase size of the view by count.
  * `Ctrl-W <` : decrease size of the view by count.
  * `Ctrl-W >` : increase size of the view by count.
  * `Ctrl-W |` : set current view size to count. [For example: `Ctrl-W -> 10 -> |`]
  * `Ctrl-W _` : set current view size to count.
  * `Ctrl-W =` : make size of two views equal.
  * For Ctrl-W +, Ctrl-W -, Ctrl-W <, Ctrl-W >, Ctrl-W | and Ctrl-W _ commands count can be given before and/or after Ctrl-W. The resulting count is a multiplication of those two.
  * So "2 Ctrl-W 2 -" decreases window size by 4 lines or columns.
  * Ctrl-W | and Ctrl-W _ maximise current view by default.

* Marks
  * Marks are set the same way as they are in vi.
  * You can use these characters for marks `[a-z][A-Z][0-9]`.
  * `m[a-z][A-Z][0-9]` : set a mark for the file at the current cursor position.
  * `'[a-z][A-Z][0-9]` : navigate to the file set for the mark.
  * There are also several special marks that can't be set manually:
    * `' (single quote)` - previously visited directory of the view, thus hitting '' allows switching between two last locations
    * `<` - the first file of the last visually selected block
    * `>` - the last file of the last visually selected block

* Searching
  * `/regular expression pattern` : search for files matching regular expression in forward direction and advance cursor to next match.
  * `/` : perform forward search with top item of search pattern history.
  * `?regular expression pattern` : search for files matching regular expression in backward direction and advance cursor to previous match.
  * `?` : perform backward search with top item of search pattern history.
  * `[count]n` : go to the next file matching last search pattern. Takes last search direction into account.
  * `[count]N` : go to the previous file matching last search pattern. Takes last search direction into account.
  * `[count]f[character]` : search forward for file with [character] as first character in name. Search wraps around the end of the list.
  * `[count]F[character]` : search backward for file with [character] as first character in name. Search wraps around the end of the list.
  * `[count];` : find the next match of f or F.
  * `[count],` : find the previous match of f or F.

* File Filters
  * There are three basic file filters:
    * dot files filter (does not affect "." and ".." special directories, whose appearance is controlled by the 'dotdirs' option), see 'dotfiles' option;
    * permanent filter;
    * local filter (see description of the "=" normal mode command).
  * For the purposes of more deterministic editing permanent filter is split into two parts:
    * one edited explicitly via `:filter` command;
    * another one which is edited implicitly via `zf` shortcut.
  * " filter directories which names end with '.files' `:filter /^.*\.files\/$/`
  * " filter files which names end with '.d' `:filter {*.d}`
  * " filter files and directories which names end with '.o' `:filter /^.*\.o\/?$/`
  * The basic Vim folding key bindings are used for managing filters.
  * `za` : toggle visibility of dot files.
  * `zo` : show dot files.
  * `zm` : hide dot files.
  * `zf` : add selected files to permanent filter.
  * `zO` : reset permanent filter.
  * `zR` : save and reset all filters.
  * `zr` : clear local filter.
  * `zM` : restore all filters (undoes last `zR`).
  * `zd` : exclude selection or current file from a custom view.
  * `=regular expression pattern` : filter out files that don't match regular expression.

* Tree-related Keys
  * While some of the keys make sense outside of tree-view, they are most useful in trees.
  * `[z` : go to first sibling of current entry.
  * `]z` : go to last sibling of current entry.
  * `zj` : go to next directory sibling of current entry or do nothing.
  * `zk` : go to previous directory sibling of current entry or do nothing.
  * `zx` : toggle fold under the cursor or parent entry of the current file if cursor is not on a directory.

* Other Normal Mode Keys
  * `[count]:` : enter command line mode. [count] generates range.
  * `q:` : open external editor to prompt for command-line command. See "Command line editing" section for details.
  * `q/` : open external editor to prompt for search pattern to be searched in forward direction. See "Command line editing" section for details.
  * `q?` : open external editor to prompt for search pattern to be searched in backward direction. See "Command line editing" section for details.
  * `q=` : open external editor to prompt for filter pattern.
  * `[count]!! and [count]!<selector>` : enter command line mode with entered ! command. [count] modifies range.
  * `Ctrl-O` : go backwards through directory history of current view. Nonexistent directories are automatically skipped.
  * `Ctrl-I` : if 'cpoptions' contains "t" flag, <tab> and <c-i> switch active pane just like <space> does, otherwise it goes forward through directory history of current view.
  * `Ctrl-G` : show a dialog with detailed information about current file.
  * `Shift-Tab` : enter view mode (works only after activating view pane with :view command).
  * `ga` : calculate directory size. Uses cached directory sizes when possible for better performance.
  * `gA` : like ga, but force update. Ignores old values of directory sizes.
  * `gf` : find link destination (like l with 'followlinks' off, but also finds directories). On Windows additionally follows .lnk-files.
  * `gF` : Same as gf, but resolves final path of the chain of symbolic links.
  * `gr` : only for MS-Windows. same as l key, but tries to run program with administrative privileges.
  * `av` : go into visual mode for updating current selection, any existing selection is preserved.
  * `gv` : go into visual mode restoring last selection.
  * `[reg]gs` : if register is present, then all files listed in that register that are visible in current view are selected.
  * `gu<selector>` : make names of selected files lowercase.
  * `[count]guu and [count]gugu` : make names of [count] files starting from the current one lowercase. Without [count] only current file is affected.
  * `gU<selector>` : make names of selected files uppercase.
  * `[count]gUU and [count]gUgU` : make names of [count] files starting from the current one uppercase. Without [count] only current file is affected.
  * `e` : explore file in the current pane.
  * `i` : handle file (even if it's an executable and 'runexec' option is set).
  * `cw` : change word is used to rename a file or files. If multiple files are selected, behaves as :rename command run without arguments.
  * `cW` : change WORD is used to change only name of file (without extension).
  * `cl` : change link target. If multiple files are selected, an editor is spawn to edit paths.
  * `co` : change file owner. [only for `*nix`]
  * `cg` : change file group. [only for `*nix`]
  * `[count]cp` : change file attributes (permission on `*nix` and properties on Windows). If [count] is specified, it's treated as numerical argument for non-recursive ’chmod’ command (of the form [0-7]{3,4}).
  * `[count]C` : clone file [count] times.
  * `[count]dd or d[count]selector` : move selected file or files to trash directory (if 'trash' option is set, otherwise delete). See "Trash directory" section below.
  * `[count]DD or D[count]selector` : like dd and d<selector>, but omitting trash directory (even when 'trash' option is set).
  * `Y, [count]yy or y[count]selector` : yank selected files.
  * `p` : copy yanked files to the current directory or move the files to the current directory if they were deleted with dd or :d[elete] or if the files were yanked from trash directory.
  * `P` : move the last yanked files. The advantage of using P instead of d followed by p is that P moves files only once.
  * `al` : put symbolic links with absolute paths.
  * `rl` : put symbolic links with relative paths.
  * `t` : select or unselect (tag) the current file.
  * `u` : undo last change.
  * `Ctrl-R` : redo last change.
  * `dp` : in compare view of "ofboth grouppaths" kind makes corresponding entries of the other pane equal to the current one.
  * `do` : same as dp, but applies changes in the opposite direction.
  * `v or V` : enter visual mode, clears current selection.
  * `[count]Ctrl-A` : increment first number in file name by [count] (1 by default).
  * `[count]Ctrl-X` : decrement first number in file name by [count] (1 by default).
  * `ZQ` : same as :quit!.
  * `ZZ` : same as :quit.
  * `.` : repeat last command-line command (not normal mode command) of this run (does nothing right after startup or :restart command).
  * `(` : go to previous group.
  * `)` : go to next group.
  * `{` : speeds up navigation to closest previous entry of the opposite type by moving to the first file backwards when cursor is on a directory and to the first directory backwards when cursor is on a file.
  * `}` : same as {, but in forward direction.
  * `[c` : go to previous mismatched entry in directory comparison view or do nothing.
  * `]c` : go to next mismatched entry in directory comparison view or do nothing.
  * `[d` : go to previous directory entry or do nothing.
  * `]d` : go to next directory entry or do nothing.
  * `[r` : same as `:siblprev`.
  * `]r` : same as `:siblnext`.
  * `[R` : same as `:siblprev!`.
  * `]R` : same as `:siblnext!`.
  * `[s` : go to previous selected entry or do nothing.
  * `]s` : go to next selected entry or do nothing.

* Using Count
  * `[count]yy` : yank count files starting from current cursor position downward.
  * Or you can use count with motions passed to y, d or D.
  * `d[count]j` : delete (count + 1) files starting from current cursor position upward.

* Registers
  * `_` is black hole register. It can be used for writing, but its list is always empty.
  * `"a2yy` : puts names of two files to register a (and to the unnamed register),
  * `"Ad` : removes one file and append its name to register a (and to the unnamed register),
  * `p or "ap or "Ap` : inserts previously yanked and deleted files into current directory.

* Selectors
  * Most of selectors are like vi motions: j, k, gg, G, H, L, M, %, f, F, ;, comma, ', ^, 0 and $. But there are some additional ones.
    * `a` : all files in current view.
    * `s` : selected files.
    * `S` : all files except selected.
  * Examples:
    * `dj` - delete file under cursor and one below;
    * `d2j` - delete file under cursor and two below;
    * `y6gg` - yank all files from cursor position to 6th file in the list.
  * When you pass a count to whole command and its selector they are multiplied. So:
    * `2d2j` - delete file under cursor and four below;
    * `2dj` - delete file under cursor and two below;
    * `2y6gg` - yank all files from cursor position to 12th file in the list.

* Visual Mode
  * In turn, selection editing supports three types of editing (look at status bar to know which one is currently active):
    * append - amend selection by selecting elements in selection region;
    * remove - amend selection by deselecting elements in selection region;
    * invert - amend selection by inverting selection of elements in selection region.
  * No matter how you activate selection editing it starts in "append". One can switch type of operation (in the order given above) via "Ctrl-G" key.
  * Almost all normal mode keys work in visual mode, but instead of accepting selectors they operate on selected items.
  * `Enter` : save selection and go back to normal mode not moving cursor.
  * `av` : leave visual mode if in amending mode (restores previous selection), otherwise switch to amending selection mode.
  * `gv` : restore previous visual selection.
  * `v, V, Ctrl-C or Escape` : leave visual mode if not in amending mode, otherwise switch to normal visual selection.
  * `Ctrl-G` : switch type of amending by round robin scheme: append -> remove -> invert.
  * `:` : enter command line mode. Selection is cleared on leaving the mode.
  * `o` : switch active selection bound.
  * `O` : switch active selection bound.
  * `gu, u` : make names of selected files lowercase.
  * `gU, U` : make names of selected files uppercase.
  * `cl` : change target of symbolic link(s).
  * `cw` : same as running :rename command without arguments.

* View Mode
  * This mode tries to imitate the less program.
  * `Shift-Tab, Tab, q, Q, ZZ` : return to normal mode.
  * `[count]e, [count]Ctrl-E, [count]j, [count]Ctrl-N, [count]Enter` : scroll forward one line (or [count] lines).
  * `[count]y, [count]Ctrl-Y, [count]k, [count]Ctrl-K, [count]Ctrl-P` : scroll backward one line (or [count] lines).
  * `[count]f, [count]Ctrl-F, [count]Ctrl-V, [count]Space` : scroll forward one window (or [count] lines).
  * `[count]b, [count]Ctrl-B, [count]Alt-V` : scroll backward one window (or [count] lines).
  * `[count]z` : scroll forward one window (and set window to [count]).
  * `[count]w` : scroll backward one window (and set window to [count]).
  * `[count]Alt-Space` : scroll forward one window, but don't stop at end-of-file.
  * `[count]d, [count]Ctrl-D` : scroll forward one half-window (and set half-window to [count]).
  * `[count]u, [count]Ctrl-U` : scroll backward one half-window (and set half-window to [count]).
  * `r, Ctrl-R, Ctrl-L` : repaint screen.
  * `R` : reload view preserving scroll position.
  * `F` : toggle automatic forwarding. Roughly equivalent to periodic file reload and scrolling to the bottom. The behaviour is similar to ’tail -F’ or F key in less.
  * `a` : switch to the next viewer. Does nothing for preview constructed via %q macro.
  * `A` : switch to the previous viewer. Does nothing for preview constructed via %q macro.
  * `i` : toggle raw mode (ignoring of defined viewers). Does nothing for preview constructed via %q macro.
  * `[count]/pattern` : search forward for ([count]-th) matching line.
  * `[count]?pattern` : search backward for ([count]-th) matching line.
  * `[count]n` : repeat previous search (for [count]-th occurrence).
  * `[count]N` : repeat previous search in reverse direction (for [count]-th occurrence).
  * `[count]g, [count]<, [count]Alt-<` : scroll to the first line of the file (or line [count]).
  * `[count]G, [count]>, [count]Alt->` : scroll to the last line of the file (or line [count]).
  * `[count]p, [count]%` : scroll to the beginning of the file (or N percent into file).
  * `v` : invoke an editor to edit the current file being viewed.

* Command line Mode
  * These keys are available in all submodes of the command line mode: command, search, prompt and filtering.
  * Down, Up, Left, Right, Home, End and Delete are extended keys and they are not available if vifm is compiled with --disable-extended-keys option.
  * `Esc, Ctrl-C` : leave command line mode, cancels input. Cancelled input is saved into appropriate history and can be recalled later.
  * `Ctrl-M, Enter` : execute command and leave command line mode.
  * `Ctrl-I, Tab` : complete command or its argument.
  * `Shift-Tab` : complete in reverse order.
  * `Ctrl-_` : stop completion and return original input.
  * `Ctrl-B, Left` : move cursor to the left.
  * `Ctrl-F, Right` : move cursor to the right.
  * `Ctrl-A, Home` : go to line beginning.
  * `Ctrl-E, End` : go to line end.
  * `Alt-B` : go to the beginning of previous word.
  * `Alt-F` : go to the end of next word.
  * `Ctrl-U` : remove characters from cursor position till the beginning of line.
  * `Ctrl-K` : remove characters from cursor position till the end of line.
  * `Ctrl-H, Backspace` : remove character before the cursor.
  * `Ctrl-D, Delete` : remove character under the cursor.
  * `Ctrl-W` : remove characters from cursor position till the beginning of previous word.
  * `Alt-D` : remove characters from cursor position till the beginning of next word.
  * `Ctrl-T` : swap the order of current and previous character and move cursor forward or, if cursor past the end of line, swap the order of two last characters in the line.
  * `Alt-.` : insert last part of previous command to current cursor position. Each next call will insert last part of older command.
  * `Ctrl-G` : edit command-line content in external editor. See "Command line editing" section for details.
  * `Ctrl-N` : recall more recent command-line from history.
  * `Ctrl-P` : recall older command-line from history.
  * `Up` : recall more recent command-line from history, that begins as the current command-line.
  * `Down` : recall older command-line from history, that begins as the current command-line.
  * `Ctrl-]` : trigger abbreviation expansion.
  * `Ctrl-R =` : insert result of evaluating an expression. Expression is to be entered via nested command-line prompt (where this key does nothing).

* Fast navigation
  * `Ctrl-Y` : enter navigation mode. Works only for search and local filter started from a normal mode and only when 'incsearch' is set ('wrapscan' is also nice to have set for search).
  * `Ctrl-Y` : return to a regular command-line mode.
  * `Enter, Right` : either enter a directory under the cursor without leaving the mode and clear the prompt or leave the mode for files. If 'navoptions' specifies "open:all" a file under the cursor is opened after leaving the mode.
  * `Ctrl-O, Left` : go to parent directory.
  * `Ctrl-J` : leave the mode without undoing cursor position or filter state.
  * `Ctrl-N, Down` : move view cursor down.
  * `Ctrl-P, Up` : move view cursor up.
  * `Page Down` : scroll view down.
  * `Page Up` : scroll view up.
  * `Home` : move view cursor to the first item.
  * `End` : move view cursor to the last item.

* Pasting special values
  * The shortcuts listed below insert specified values into current cursor position. Last key of every shortcut references value that it inserts:
    * c - [c]urrent file
    * d - [d]irectory path
    * e - [e]xtension of a file name
    * r - [r]oot part of a file name
    * t - [t]ail part of directory path
    * a - [a]utomatic filter
    * m - [m]anual filter
    * = - local filter, which is bound to "=" in normal mode
  * `Ctrl-X c` : name of the current file of the active pane.
  * `Ctrl-X d` : path to the current directory of the active pane.
  * `Ctrl-X e` : extension of the current file of the active pane.
  * `Ctrl-X r` : name root of current file of the active pane.
  * `Ctrl-X t` : the last component of path to the current directory of the active pane.
  * `Ctrl-X Ctrl-X c` : name of the current file of the inactive pane.
  * `Ctrl-X Ctrl-X d` : path to the current directory of the inactive pane.
  * `Ctrl-X Ctrl-X e` : extension of the current file of the inactive pane.
  * `Ctrl-X Ctrl-X r` : name root of current file of the inactive pane.
  * `Ctrl-X Ctrl-X t` : the last component of path to the current directory of the inactive pane.
  * `Ctrl-X a` : value of implicit permanent filter (old name "automatic") of the active pane.
  * `Ctrl-X m` : value of explicit permanent filter (old name "manual") of the active pane.
  * `Ctrl-X =` : value of local filter of the active pane.
  * `Ctrl-X /` : last pattern from search history.

* Command line editing
  * Editing command-line using external editor is activated by the `Ctrl-G` shortcut.
  * It's also possible to do almost the same from Normal and Visual modes using q:, q/ and q? commands.

* More Mode
  * This is the mode that appears when status bar content is so big that it doesn't fit on the screen. One can identify the mode by "-- More --" message at the bottom.
  * `Enter, Ctrl-J, j or Down` : scroll one line down.
  * `Backspace, k or Up` : scroll one line up.
  * `d` : scroll one page (half of a screen) down.
  * `u` : scroll one page (half of a screen) up.
  * `Space, f or PageDown` : scroll down a screen.
  * `b or PageUp` : scroll up a screen.
  * `G` : scroll to the bottom.
  * `g` : scroll to the top.
  * `q, Escape or Ctrl-C` : quit the mode.
  * `:` : switch to command-line mode.

* Commands
  * `:[count]` || `:number`
    * move to the file number.
    * :12 would move to the 12th file in the list.
    * :0 move to the top of the list.
    * :$ move to the bottom of the list.
  * `:[count]command` : The only builtin :[count]command are :[count]d[elete] and :[count]y[ank].
  * `:d3` : would delete three files starting at the current file position moving down.
  * `:3d` : would delete one file at the third line in the list.
  * `:command [args]` || `:[range]!program` : execute command via shell. Accepts macros.
  * `:[range]!command &` : 
    * same as above, but the command is run in the background using vifm's means.
    * Programs that write to stderr create error dialogs showing errors of the command.
    * Note the space before ampersand symbol, if you omit it, command will be run in the background using job control of your shell.
    * Accepts macros.
  * `:!!` || `:[range]!!command` : same as :!, but pauses before returning.
  * `:!!` : repeat the last command.
  * `:alink` || `:[range]alink[!?]` : create absolute symbolic links to files in directory of inactive view. With "?" prompts for destination file names in an editor. "!" forces overwrite.
  * `:[range]alink[!] path` : create absolute symbolic links to files in directory specified by the path (absolute or relative to directory of inactive view).
  * `:[range]alink[!] name1 name2...` : create absolute symbolic links of files in directory of other view giving each next link a corresponding name from the argument list.
  * `:[range]alink[!?] -skip ...` : see "-skip parameter" section below.
  * `:apropos` || `:apropos keyword...` : create a menu of items returned by the apropos command. Selecting an item in the menu opens corresponding man page. By default the command relies on the external "apropos" utility, which can be customized by altering value of the 'aproposprg' option. See "Menus and dialogs" section for controls.
  * `:autocmd` || `:au[tocmd] {event} {pat} {cmd}` : register autocommand for the {event},
  * `:au[tocmd] [{event}] [{pat}]` : list those autocommands that match given event-pattern combination. {event} and {pat} can be omitted to list all autocommands. To list any autocommands for specific pattern one can use * placeholder in place of {event}.
  * `:au[tocmd]! [{event}] [{pat}]` : remove autocommands that match given event-pattern combination. Syntax is the same as for listing above.
  * `:apropos` : repeat last :apropos command.
  * 
 
* Change ColorScheme
  * Download colorschemes from [colorschemes.shtml](https://vifm.info/colorschemes.shtml) and save to `~/.config/vifm/colors/`
  * Choose colorscheme: `:colorscheme`

# Contents of Vifm.md

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

## Preview Test Files

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

# References

* next-sl: {23}

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
