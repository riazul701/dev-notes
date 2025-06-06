# Commands/Usage

* `sudo apt install vim` : Install "vim" and "vimdiff"

* `vimdiff <file> <file>` OR `vim –d <file> <file>` : Show differences between files <sup>{1}</sup>

* `:diffsplit filename` : Perform horizontal split <sup>{1}</sup>

* `:vert diffsplit <filename>` : Perform vertical split <sup>{1}</sup>

* `:set scrollbind` : When you scroll text from one window then text from adjacent window also scrolled. This is called scrollbind. To enable this use command <sup>{1}</sup>

* `:set noscrollbind` : Disable scrollbind <sup>{1}</sup>

* `:diffupdate` : If you edit file in this mode then use following command to update diff <sup>{1}</sup>. If you've recently undone a change, you won't be able to see the highlighted changes as before. You'll need to refresh to see the changes once again. You can do this by using the command <sup>{3}</sup>

* `Ctrl + w Ctrl + w` : To switch between diff windows execute following command. Please note that, we have to press `Ctrl + w` 2 times. <sup>{1}</sup>

* `[c` : In diff window, execute following command to jump to previous change <sup>{1}</sup>

* `]c` : In diff window, execute following command to jump to next change <sup>{1}</sup>

* `:diffget` : To apply change from adjacent diff window to current diff windows execute <sup>{1}</sup>
  * `do` or `:diffg[et]` - obtain (get) difference (from other buffer) <sup>{5}</sup>

* `:diffput` : To apply change from current diff window to adjacent diff window execute <sup>{1}</sup>
  * `dp` or `:diffpu[t]` - put difference (to other buffer) <sup>{5}</sup>

* `:diffthis` - make current window part of diff <sup>{5}</sup>

* `:dif[fupdate]` - update differences <sup>{5}</sup>

* `:diffo[ff]` - switch off diff mode for current window <sup>{5}</sup>

* `:set number` : In Vim, This will reveal the line numbers for the current session. <sup>{3}</sup>

* `z+c` AND `z+o` : Uncollapsed lines, These are the lines of codes that have not been changed. these are wrapped and can be uncollapsed using a combination of these keys. <sup>{3}</sup>
  * `z + o` : To open the folds <sup>{3}</sup>
  * `z + c` : To close the folds <sup>{3}</sup>

* `zf` - manually define a fold up to motion <sup>{5}</sup>

* `zd` - delete fold under the cursor <sup>{5}</sup>

* `za` - toggle fold under the cursor <sup>{5}</sup>

* `zr` - reduce (open) all folds by one level <sup>{5}</sup>

* `zm` - fold more (close) all folds by one level <sup>{5}</sup>

* `zi` - toggle folding functionality <sup>{5}</sup>

* Tip The commands for folding (e.g. `za`) operate on one level. To operate on all levels, use uppercase letters (e.g. `zA`). <sup>{5}</sup>

* `vimrc` file -> append `set number` : Now whenever you open Vim, the line numbers will be there by default. <sup>{3}</sup>

* By default, `vimdiff` splits the screen vertically <sup>{3}</sup>
* `vimdiff -o index.js index.js.bkp` : If you like to see the files split horizontally, you can use the flag `-o` like this <sup>{3}</sup>

* `u` : When you are in the command mode press `u` to undo the last change. <sup>{3}</sup>

* Exit the diff window depending on the end result <sup>{3}</sup>
  * `:qa` to exit all the files without saving.
  * `:q` to exit the files one by one without saving.
  * `:wq!` to save and exit files one by one.

* `:TOhtml | w ~/Desktop/diff.html` : Export the diff to an HTML web page <sup>{4}</sup>

# vimdiff.md

## Websites

* [Vim documentation: diff](https://vimdoc.sourceforge.net/htmldoc/diff.html)

* Configure Vimdiff Theme
  * [Load different colorscheme when using vimdiff](https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff)
  * [Vim Color Schemes: How to Configure](https://phoenixnap.com/kb/vim-color-schemes)
  * [vimcolorschemes.com](https://vimcolorschemes.com/i/trending) || [vimcolorschemes/vimcolorschemes GitHub](https://github.com/vimcolorschemes/vimcolorschemes)

* Vimdiff Theme Collection
  * [morhetz/gruvbox GitHub](https://github.com/morhetz/gruvbox)

## Three-Way Merge

**["More than two buffers in diff mode" - How do you turn off diff on the buffers?](https://stackoverflow.com/questions/13264514/more-than-two-buffers-in-diff-mode-how-do-you-turn-off-diff-on-the-buffers)**

* You should switch off diff mode for the unwanted buffer with `:diffoff` before quitting it with `:q`. Depending on your settings (e.g. `:set hidden`), the buffer will persist in the buffer list (`:ls`), and Vim will consider it when doing a diff.

* A `:bufdo diffoff` should turn off diff for all existing buffers, though I usually just quit Vim and relaunch it with `vimdiff ...` should such a situation arise.

# References

* next-sl: {6}

## Commands From

* {1} [Vim - Diff => tutorialspoint.com](https://www.tutorialspoint.com/vim/vim_diff.htm)
* {3} [Linux `Vimdiff` Command – How to Compare Two Files in the Command Line](https://www.freecodecamp.org/news/compare-two-files-in-linux-using-vim/)
* {4} [Using Vim as a Diff Tool](https://www.baeldung.com/linux/vim-diff-tool)
* {5} [Vim Cheat Sheet - Rtorr](https://vim.rtorr.com/)

## Guides
  
* {1} [Vim - Diff => tutorialspoint.com](https://www.tutorialspoint.com/vim/vim_diff.htm)
* {3} [Linux `Vimdiff` Command – How to Compare Two Files in the Command Line](https://www.freecodecamp.org/news/compare-two-files-in-linux-using-vim/)
* {4} [Using Vim as a Diff Tool](https://www.baeldung.com/linux/vim-diff-tool)

## YouTube Tutorials
  
* {2} [Vim (43) vimdiff BY MichaelsTechTutorials](https://www.youtube.com/watch?v=Eb8S_KkmLS8)
