# Vim/Vim-Tutorial.md

# "vimtutor" command

* Lesson 1 SUMMARY

  1. The cursor is moved using either the arrow keys or the hjkl keys.
         h (left)       j (down)       k (up)       l (right)

  2. To start Vim from the shell prompt type:  vim FILENAME <ENTER>

  3. To exit Vim type:     <ESC>   :q!   <ENTER>  to trash all changes.
           OR type:      <ESC>   :wq   <ENTER>  to save the changes.

  4. To delete the character at the cursor type:  x

  5. To insert or append text type:
         i   type inserted text   <ESC>         insert before the cursor
         A   type appended text   <ESC>         append after the line

  NOTE: Pressing <ESC> will place you in Normal mode or will cancel
      an unwanted and partially completed command.

* Lesson 2 SUMMARY
  1. To delete from the cursor up to the next word type:    dw
  2. To delete from the cursor to the end of a line type:    d$
  3. To delete a whole line type:    dd

  4. To repeat a motion prepend it with a number:   2w
  5. The format for a change command is:
               operator   [number]   motion
     where:
       operator - is what to do, such as  d  for delete
       [number] - is an optional count to repeat the motion
       motion   - moves over the text to operate on, such as  w (word),
                  $ (to the end of line), etc.

  6. To move to the start of the line use a zero:  0

  7. To undo previous actions, type:           u  (lowercase u)
     To undo all the changes on a line, type:  U  (capital U)
     To undo the undo's, type:                 CTRL-R

* Lesson 3 SUMMARY
  1. To put back text that has just been deleted, type   p .  This puts the
     deleted text AFTER the cursor (if a line was deleted it will go on the
     line below the cursor).

  2. To replace the character under the cursor, type   r   and then the
     character you want to have there.

  3. The change operator allows you to change from the cursor to where the
     motion takes you.  eg. Type  ce  to change from the cursor to the end of
     the word,  c$  to change to the end of a line.

  4. The format for change is:

         c   [number]   motion

* Lesson 4 SUMMARY
  1. CTRL-G  displays your location in the file and the file status.
             G  moves to the end of the file.
     number  G  moves to that line number.
            gg  moves to the first line.

  2. Typing  /  followed by a phrase searches FORWARD for the phrase.
     Typing  ?  followed by a phrase searches BACKWARD for the phrase.
     After a search type  n  to find the next occurrence in the same direction
     or  N  to search in the opposite direction.
     CTRL-O takes you back to older positions, CTRL-I to newer positions.

  3. Typing  %  while the cursor is on a (,),[,],{, or } goes to its match.

  4. To substitute new for the first old in a line type    :s/old/new
     To substitute new for all 'old's on a line type       :s/old/new/g
     To substitute phrases between two line #'s type       :#,#s/old/new/g
     To substitute all occurrences in the file type        :%s/old/new/g
     To ask for confirmation each time add 'c'             :%s/old/new/gc

* Lesson 5 SUMMARY
  1.  :!command  executes an external command.

      Some useful examples are:
         (Windows)        (Unix)
          :!dir            :!ls            -  shows a directory listing.
          :!del FILENAME   :!rm FILENAME   -  removes file FILENAME.

  2.  :w FILENAME  writes the current Vim file to disk with name FILENAME.

  3.  v  motion  :w FILENAME  saves the Visually selected lines in file
      FILENAME.

  4.  :r FILENAME  retrieves disk file FILENAME and puts it below the
      cursor position.

  5.  :r !dir  reads the output of the dir command and puts it below the
      cursor position.

* Lesson 6 SUMMARY
  1. Type  o  to open a line BELOW the cursor and start Insert mode.
     Type  O  to open a line ABOVE the cursor.

  2. Type  a  to insert text AFTER the cursor.
     Type  A  to insert text after the end of the line.

  3. The  e  command moves to the end of a word.

  4. The  y  operator yanks (copies) text,  p  puts (pastes) it.

  5. Typing a capital  R  enters Replace mode until  <ESC>  is pressed.

  6. Typing ":set xxx" sets the option "xxx".  Some options are:
        'ic' 'ignorecase'       ignore upper/lower case when searching
        'is' 'incsearch'        show partial matches for a search phrase
        'hls' 'hlsearch'        highlight all matching phrases
     You can either use the long or the short option name.

  7. Prepend "no" to switch an option off:   :set noic

* Lesson 7 SUMMARY
  1. Type  :help  or press <F1> or <HELP>  to open a help window.

  2. Type  :help cmd  to find help on  cmd .

  3. Type  CTRL-W CTRL-W  to jump to another window.

  4. Type  :q  to close the help window.

  5. Create a vimrc startup script to keep your preferred settings.

  6. When typing a  :  command, press CTRL-D to see possible completions.
     Press <TAB> to use one completion.

# [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)

## [Ch00. Read This First](https://github.com/iggredible/Learn-Vim/blob/master/ch00_read_this_first.md)

## [Ch01. Starting Vim](https://github.com/iggredible/Learn-Vim/blob/master/ch01_starting_vim.md)

* Exiting Vim
  * Exiting Vim: `:quit`

* Saving a File
  * To save your changes, type: :write
  * If this is a new file, you need to give it a name before you can save it: `:w file.txt`
  * To save and quit, you can combine the :w and :q commands: `:wq`
  * To quit without saving any changes, add ! after :q to force quit: `:q!`
  * Help
    * To learn about different ways to quit Vim, type: `:h write-quit`

* Opening a File
  * To open a file (hello1.txt) on Vim from the terminal, run: `vim hello1.txt`
  * You can also open multiple files at once [in separate buffers]: `vim hello1.txt hello2.txt hello3.txt`

* Arguments
  * To check the current Vim version, run: `vim --version`
  * To see the version from inside Vim, you can run this: `:version`
  * In Vim, you can substitute strings with the :s command (short for :substitute).
  * If you want to open hello.txt and substitute all "pancake" with "bagel", run: `vim +%s/pancake/bagel/g hello.txt`
  * These Vim commands can be stacked: `vim +%s/pancake/bagel/g +%s/bagel/egg/g +%s/egg/donut/g hello.txt`
  * You can also pass the -c option followed by a Vim command instead of the + syntax:
    * `vim -c %s/pancake/bagel/g hello.txt`
    * `vim -c %s/pancake/bagel/g -c %s/bagel/egg/g -c %s/egg/donut/g hello.txt`

* Opening Multiple Windows
  * You can launch Vim on split horizontal and vertical windows with the -o and -O options, respectively.
  * To open Vim with two horizontal windows, run: `vim -o2`
  * To open Vim with 5 horizontal windows, run: `vim -o5`
  * To open Vim with 5 horizontal windows and fill up the first two with hello1.txt and hello2.txt, run: `vim -o5 hello1.txt hello2.txt`
  * To open Vim with two vertical windows, 5 vertical windows, and 5 vertical windows with 2 files:
    * `vim -O2`
    * `vim -O5`
    * `vim -O5 hello1.txt hello2.txt`

* Suspending
  * If you need to suspend Vim while in the middle of editing, you can press `Ctrl-z`.
  * You can also run either the `:stop` or `:suspend` command.
  * To return to the suspended Vim, run `fg` from the terminal.

* Starting Vim the Smart Way
  * You can redirect the output of the ls command to be edited in Vim with `ls -l | vim -`
  * To learn more about vim command in the terminal, check out `man vim`
  * Continue reading this guide along with the `:help` command.

## [Ch02. Buffers, Windows, and Tabs](https://github.com/iggredible/Learn-Vim/blob/master/ch02_buffers_windows_tabs.md)

 * If you don't have a vimrc, create one. It is usually placed in your home directory and is named `.vimrc`

 * Buffers
   * Open two new files: `vim file1.js file2.js`
   * Run `:buffers` to see all the buffers (alternatively, you can use `:ls` or `:files` too).
   * There are several ways you can traverse buffers:
     * `:bnext` to go to the next buffer (`:bprevious` to go to the previous buffer).
     * `:buffer + filename`. Vim can autocomplete filename with `<Tab>`.
     * `:buffer + n`, where n is the buffer number. For example, typing :buffer 2 will take you to buffer #2.
     * Jump to the older position in the jump list with `Ctrl-O` and to the newer position with `Ctrl-I`. These are not buffer specific methods, but they can be used to jump between different buffers.
     * Go to the previously edited buffer with `Ctrl-^`.
     * Once Vim creates a buffer, it will remain in your buffers list. To remove it, you can type `:bdelete`.
     * It can also accept a buffer number as a parameter (`:bdelete 3` to delete buffer #3) or a filename (`:bdelete` then use `<Tab>` to autocomplete).

* Exiting Vim
  * By the way, if you have multiple buffers opened, you can close all of them with quit-all: `:qall`
  * If you want to close without saving your changes, just add ! at the end: `:qall!`
  * To save and quit all, run: `:wqall`

