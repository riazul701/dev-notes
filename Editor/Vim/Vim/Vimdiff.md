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

* `:diffput` : To apply change from current diff window to adjacent diff window execute <sup>{1}</sup>

* `:set number` : In Vim, This will reveal the line numbers for the current session. <sup>{3}</sup>

* `z+c` AND `z+o` : Uncollapsed lines, These are the lines of codes that have not been changed. these are wrapped and can be uncollapsed using a combination of these keys. <sup>{3}</sup>
  * `z + o` : To open the folds
  * `z + c` : To close the folds

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

# References

* next-sl: {5}

* Guides
  * {1} [Vim - Diff => tutorialspoint.com](https://www.tutorialspoint.com/vim/vim_diff.htm)
  * {3} [Linux `Vimdiff` Command – How to Compare Two Files in the Command Line](https://www.freecodecamp.org/news/compare-two-files-in-linux-using-vim/)
  * {4} [Using Vim as a Diff Tool](https://www.baeldung.com/linux/vim-diff-tool)

* YouTube Tutorials
  * {2} [Vim (43) vimdiff BY MichaelsTechTutorials](https://www.youtube.com/watch?v=Eb8S_KkmLS8)
