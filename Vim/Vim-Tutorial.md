# Commands

* `sudo apt install vim` : In many Linux distribution, "vim-tiny" is installed by default. Which does not have `vimtutor` command and online-manual. Install full `vim` with this command.

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

* Help
  * `:help` : Manual has all the references you will ever need.
  * `vimtutor` : is a great place to start

* More Help
  * `:h CTRL-P` : If you merely search for, you will be directed to normal mode's `Ctrl-P`
  * `:h i_CTRL-P` : The appended `i_` represents the insert mode.

* vimrc
  * `:h vimrc` : To see where you should put yours, check out
  * Inside `~/.vimrc`, add set number `set number`. Save it `(:w)`, then source it `(:source %)`. You should now see line numbers displayed on the left side.
  * `:set number` : See line numbers displayed on the left side. The downside of this approach is that this setting is temporary. When you close Vim, the option disappears.
  * Since we are learning about Vim and not Vi, a setting that you must have is the `nocompatible` option. Add set `nocompatible` in your vimrc. Many Vim-specific features are disabled when it is running on `compatible` option.

## [Ch01. Starting Vim](https://github.com/iggredible/Learn-Vim/blob/master/ch01_starting_vim.md)

* The Vim Command
  * `vim` : You should see an intro screen. Vim is a modal editor. If you want to type "hello", you need to switch to insert mode with `i`. Press `ihello<Esc>` to insert the text "hello".

* Exiting Vim
  * `:quit` : Exiting Vim
  * `:q` : Exiting Vim

* Saving a File
  * `:write` : To save your changes
  * `:w` : To save your changes
  * `:w file.txt` : If this is a new file, you need to give it a name before you can save it.
  * `:wq` : To save and quit, you can combine the `:w` and `:q` commands.
  * `:q!` : To quit without saving any changes, add `!` after `:q` to force quit.

* Help
  * `:help {some-command}` : (`:h` for short). You can pass to the `:h` command a topic or a command name as an argument.
  * `:h write-quit` : To learn about different ways to quit Vim. 
  * I just typed `:h`, then "quit", then `<Tab>`.

* Opening a File
  * `vim hello1.txt` : To open a file (hello1.txt) on Vim from the terminal.
  * `vim hello1.txt hello2.txt hello3.txt` : You can also open multiple files at once [in separate buffers]

* Arguments
  * `vim --version` : To check the current Vim version.
  * `:history` : Explore Vim's command-line history. Vim needs to have `+cmdline_history` feature for the command to work.
  * `:version` : To see the version from inside Vim.
  * `:s` command (short for `:substitute`) : In Vim, you can substitute strings.
  * `vim +%s/pancake/bagel/g hello.txt` : If you want to open hello.txt and substitute all "pancake" with "bagel". 
  * `vim +%s/pancake/bagel/g +%s/bagel/egg/g +%s/egg/donut/g hello.txt` : These Vim commands can be stacked.
  * You can also pass the -c option followed by a Vim command instead of the + syntax:
    * `vim -c %s/pancake/bagel/g hello.txt`
    * `vim -c %s/pancake/bagel/g -c %s/bagel/egg/g -c %s/egg/donut/g hello.txt`

* Opening Multiple Windows
  * You can launch Vim on split horizontal and vertical windows with the -o and -O options, respectively.
  * `vim -o2` : To open Vim with two horizontal windows.
  * `vim -o5` : To open Vim with 5 horizontal windows.
  * `vim -o5 hello1.txt hello2.txt` : To open Vim with 5 horizontal windows and fill up the first two with hello1.txt and hello2.txt. 
  * To open Vim with two vertical windows, 5 vertical windows, and 5 vertical windows with 2 files:
    * `vim -O2`
    * `vim -O5`
    * `vim -O5 hello1.txt hello2.txt`

* Suspending
  * `Ctrl-z` : If you need to suspend Vim while in the middle of editing, you can press.
  * `:stop` or `:suspend` : You can also run either of two commands.
  * `fg` : To return to the suspended Vim, run this command from the terminal.

* Starting Vim the Smart Way
  * `+{cmd}` and `-c cmd` : Two options allow you to pass a Vim command as a parameter.
  * `ls -l | vim -` : Redirect the output of the ls command to be edited in Vim.
  * `man vim` : To learn more about `vim` command in the terminal. 
  * `:help` : Continue reading this guide along with this command.

## [Ch02. Buffers, Windows, and Tabs](https://github.com/iggredible/Learn-Vim/blob/master/ch02_buffers_windows_tabs.md)

* `~/.vimrc` : Vim's configuration "vimrc" usually placed in your home directory.
  * `set hidden` option in vimrc. Without it, whenever you switch buffers and your current buffer is not saved, Vim will prompt you to save the file.
  * Save it, then source it (run `:source %` from inside the vimrc).

* Buffers
  * `vim file1.js` : Open "file1.js" in vim.
  * `vim file1.js file2.js` : Open two new files.
  * `:buffers` : To see all the buffers.
    * `:ls` or `:files` : Alternatively, you can use to see all the buffers.
  * There are several ways you can traverse buffers:
    * `:bnext` : To go to the next buffer.
    * `:bprevious` : To go to the previous buffer.
    * `:buffer + filename` : Vim can autocomplete filename with `<Tab>`.
    * `:buffer + n` : Where `n `is the buffer number. For example, typing `:buffer 2` will take you to buffer #2.
    * `Ctrl-O` : Jump to the older position in the jump list.
    * `Ctrl-I` : Jump to the newer position in the jump list. [These are not buffer specific methods, but they can be used to jump between different buffers.]
    * `Ctrl-^` : Go to the previously edited buffer.
    * `:bdelete` : To remove buffer, you can type.
    * `:bdelete 3` : To delete buffer #3
    * `:bdelete` then use `<Tab>` to autocomplete filename.

* Exiting Vim
  * `:qall` : If you have multiple buffers opened, you can close all of them with quit-all.
  * `:qall!` : If you want to close all buffers without saving your changes, just add `!` at the end: 
  * `:wqall` : To save and quit all buffers. 

* Windows
  * `vim file1.js` : Open `file1.js` in vim.
  * `:split file2.js` : You are looking at two buffers through two windows. The top window displays `file2.js` buffer. The bottom window displays `file1.js` buffer.
  * If you want to navigate between windows, use these shortcuts:
    * `Ctrl-W H` : Moves the cursor to the left window
    * `Ctrl-W J` : Moves the cursor to the window below
    * `Ctrl-W K` : Moves the cursor to the window upper
    * `Ctrl-W L` : Moves the cursor to the right window
  * `:vsplit file3.js` : You are now seeing three windows displaying three buffers.
  * `:buffer file2.js` : You can have multiple windows displaying the same buffer. Now both two windows are displaying `file2.js` buffer.
  * `Ctrl-W C` or type `:quit` : To close the current window. When you close a window, the buffer will still be there (run `:buffers` to confirm this).
  * Here are some useful normal-mode window commands:
    * `Ctrl-W V` : Opens a new vertical split
    * `Ctrl-W S` : Opens a new horizontal split
    * `Ctrl-W C` : Closes a window
    * `Ctrl-W O` : Makes the current window the only one on screen and closes other windows
  * And here is a list of useful window command-line commands:
    * `:vsplit filename` : Split window vertically
    * `:split filename` : Split window horizontally
    * `:new filename` : Create new window

* Tabs
  * `vim file1.js` : Open `file1.js` in vim.
  * `:tabnew file2.js` : To open `file2.js` in a new tab. Vim autocomplete the file in a new tab by pressing `<Tab>`
  * Below is a list of useful tab navigations:
    * `:tabnew file.txt` : Open file.txt in a new tab
    * `:tabclose` : Close the current tab
    * `:tabnext` : Go to next tab
    * `:tabprevious` : Go to previous tab
    * `:tablast` : Go to last tab
    * `:tabfirst` : Go to first tab
  * `gt` : Go to next tab page.
  * `gT` : Go to previous tab.
  * `3gt` : Go to the third tab. Pass count as argument to `{{count}}gt`.
  * `vim -p file1.js file2.js file3.js` : To start Vim with multiple tabs.

## [Ch03. Searching Files](https://github.com/iggredible/Learn-Vim/blob/master/ch03_searching_files.md)

* Opening and Editing Files
  * `:edit file.txt` : If `file.txt` exists, it opens the `file.txt` buffer. If `file.txt` doesn't exist, it creates a new buffer for `file.txt`.
  * `:edit a<Tab>c<Tab>u<Tab>` : Autocomplete with `<Tab>` works with `:edit`. For directory `./app/controllers/users_controllers.rb`, you can use `<Tab>` to expand the terms quickly
  * `:edit *.yml<Tab>` : `:edit` accepts wildcards arguments. `*` matches any file in the current directory. Vim will give you a list of all .yml files in the current directory to choose from.
  * `:edit **/*.md<Tab>` : You can use `**` to search recursively. If you want to look for all `*.md` files in your project, but you are not sure in which directories, you can do this.
  * `:edit` can be used to run `netrw`, Vim's built-in file explorer. To do that, give `:edit` a directory argument instead of file:
    * `:edit .`
    * `:edit test/unit/`

* Searching Files With Find
  * You can find files with :find. For example:
    * `:find package.json`
    * `:find app/controllers/users_controller.rb`
  * Autocomplete also works with `:find`:
    * `:find p<Tab>` : " to find package.json
    * `:find a<Tab>c<Tab>u<Tab>` : " to find app/controllers/users_controller.rb

* Find and Path
  * `:set path?` : To check what your paths are, do
  * `path=.,/usr/include,,` : By default, yours probably look like this
    * `.` means to search in the directory of the currently opened file.
    * `,` means to search in the current directory.
    * `/usr/include` is the typical directory for C libraries header files.
  * `:set path+=app/controllers/` : You need to add the `app/controllers/` to the current path. Here is how you can do it.
  * `:set path+=$PWD/**` : You might be thinking to add the entire project directories so when you press tab, Vim will search everywhere for that file, like this. [this will slow down your search significantly if you have a large number of files in your project]
  * `set path+={your-path-here}` : You can add this in your vimrc.

* Searching in Files With Grep
  * If you need to find in files (find phrases in files), you can use grep. Vim has two ways of doing that:
    * Internal grep (`:vim`. Yes, it is spelled `:vim`. It is short for `:vimgrep`).
    * External grep (`:grep`).
  * `:vim /pattern/ file` : `:vim` has the following syntax.
    * `/pattern/` is a regex pattern of your search term.
    * `file` is the file argument. You can pass multiple arguments. Similar to `:find`, you can pass it `*` and `**` wildcards
  * `:vim /breakfast/ app/controllers/**/*.rb` : To look for all occurrences of "breakfast" string inside all ruby files (`.rb`) inside `app/controllers/` directory.
  * Vim's `vim` search command uses `quickfix` operation. Here are some useful quickfix commands:
    * `:copen` : Open the quickfix window
    * `:cclose` : Close the quickfix window
    * `:cnext` : Go to the next error
    * `:cprevious` : Go to the previous error
    * `:colder` : Go to the older error list
    * `:cnewer` : Go to the newer error list
  * `:h quickfix` : To learn more about quickfix, check out.
  * `:grep -R "lunch" app/controllers/` : To search for "lunch" inside a ruby file inside `app/controllers/` directory.
  * Vim defines the `grepprg` variable to determine which external program to run when running the `:grep`.

  * Browsing Files With Netrw
    * `netrw` is Vim's built-in file explorer.
    * To run `netrw`, you need these two settings in your `.vimrc`:
      * `set nocp`
      * `filetype plugin on`
    * You can start `netrw` when you launch Vim by passing it a directory as a parameter instead of a file:
      * `vim .`
      * `vim src/client/`
      * `vim app/controllers/`
    * To launch netrw from inside Vim, you can use the :edit command and pass it a directory parameter instead of a filename:
      * `:edit .`
      * `:edit src/client/`
      * `:edit app/controllers/`
    * There are other ways to launch netrw window without passing a directory:
      * `:Explore` : Starts netrw on current file
      * `:Sexplore` : No kidding. Starts netrw on split top half of the screen
      * `:Vexplore` : Starts netrw on split left half of the screen
    * Here is a list of useful netrw commands:
      * `%` : Create a new file
      * `d` : Create a new directory
      * `R` : Rename a file or directory
      * `D` : Delete a file or directory
    * `:h netrw` : is very comprehensive

* Fzf
  * [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
  * [junegunn/fzf](https://github.com/junegunn/fzf)
  * [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
  * [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

* Fzf Setup
  * In my .zshrc (.bashrc if you use bash), I have these:
  ```shell
  if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m'
  fi
  ```
  * Add these inside your .vimrc plugins. You need to use fzf.vim plugin (created by the same fzf author):
  ```shell
  call plug#begin()
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  call plug#end()
  ```
  * After adding these lines, you will need to open `vim` and run `:PlugInstall`.

* Fzf Syntax
  * To use fzf efficiently, you should learn some basic fzf syntax. Fortunately, the list is short:
    * `^` : is a prefix exact match. To search for a phrase starting with "welcome": `^welcome`.
    * `$` : is a suffix exact match. To search for a phrase ending with "my friends": `friends$`.
    * `'` : is an exact match. To search for the phrase "welcome my friends": `'welcome my friends`.
    * `|` : is an "or" match. To search for either "friends" or "foes": `friends | foes`.
    * `!` : is an inverse match. To search for phrase containing "welcome" and not "friends": `welcome !friends`
  * `^hello | ^welcome friends$` : will search for the phrase starting with either "welcome" or "hello" and ending with "friends".

* Finding Files
  * `:Files` : Run this from Vim and you will be prompted with fzf search prompt.
  * Since you will be using this command frequently, it is good to have this mapped to a keyboard shortcut. I map mine to `Ctrl-f`. In my vimrc, I have this:
    * `nnoremap <silent> <C-f> :Files<CR>`

* Finding in Files
  * `:Rg` : To search inside files, you can use this command.
  * Again, since you will probably use this frequently, let's map it to a keyboard shortcut. I map mine to `<Leader>f`. The `<Leader>` key is mapped to `\` by default.
    * `nnoremap <silent> <Leader>f :Rg<CR>`

* Other Searches
  * Here's what my fzf maps look like:
  ```shell
  nnoremap <silent> <Leader>b :Buffers<CR>
  nnoremap <silent> <C-f> :Files<CR>
  nnoremap <silent> <Leader>f :Rg<CR>
  nnoremap <silent> <Leader>/ :BLines<CR>
  nnoremap <silent> <Leader>' :Marks<CR>
  nnoremap <silent> <Leader>g :Commits<CR>
  nnoremap <silent> <Leader>H :Helptags<CR>
  nnoremap <silent> <Leader>hh :History<CR>
  nnoremap <silent> <Leader>h: :History:<CR>
  nnoremap <silent> <Leader>h/ :History/<CR>
  ```

* Replacing Grep With Rg
  * Now let's setup grepprg so that the `:grep` Vim command uses `ripgrep`. Add this in your vimrc:
    * `set grepprg=rg\ --vimgrep\ --smart-case\ --follow`

* Search and Replace in Multiple Files
  * If you want to replace all instances of "pizza" with "donut", here's what you do:
    * `:grep "pizza"` : uses ripgrep to search for all instances of "pizza"
    * `:cfdo %s/pizza/donut/g | update` : `:cfdo` executes any command you pass to all files in your quickfix list. In this case, your command is the substitution command `%s/pizza/donut/g`. The pipe (`|`) is a chain operator. The `update` command saves each file after substitution.
  * The second method is to search and replace in selected files.
    * Clear your buffers first. You can either restart Vim or run `:%bd | e#` command (`%bd` deletes all the buffers and `e#` opens the file you were just on).
    * Run `:Files`.
    * To select multiple files, use `<Tab>` / `<Shift-Tab>`. This is only possible if you have the multiple flag (`-m`) in `FZF_DEFAULT_OPTS`.
    * Run `:bufdo %s/pizza/donut/g | update`.
      * The command `:bufdo %s/pizza/donut/g | update` looks similar to the earlier `:cfdo %s/pizza/donut/g | update` command.
      * The difference is instead of substituting all quickfix entries (`:cfdo`), you are substituting all buffer entries (`:bufdo`).

## [Ch04. Vim Grammar](https://github.com/iggredible/Learn-Vim/blob/master/ch04_vim_grammar.md)

* `verb + noun` : There is only one grammar rule in Vim language.

* Nouns (Motions)
  * `h` : Left
  * `j` : Down
  * `k` : Up
  * `l` : Right
  * `w` : Move forward to the beginning of the next word
  * `}` : Jump to the next paragraph
  * `$` : Go to the end of the line

* Verbs (Operators)
  * `y` : Yank text (copy)
  * `d` : Delete text and save to register
  * `c` : Delete text, save to register, and start insert mode

* Verb and Noun
  * `y$` : To yank everything from your current location to the end of the line
  * `dw` : To delete from your current location to the beginning of the next word
  * `c}` : To change from your current location to the end of the current paragraph
  * `3k` : If you need to go up 3 lines, instead of pressing `k` 3 times, you can do
  * `y2h` : To yank two characters to the left
  * `d2w` : To delete the next two words
  * `c2j` : To change the next two lines
  * `dd`, `yy`, and `cc` perform deletion, yank, and change on the entire line

* More Nouns (Text Objects)
  * `i + object` : Inner text object
  * `a + object` : Outer text object
  * If your cursor is somewhere inside the parentheses in the expression `(hello Vim)`
    * `di(` : To delete the text inside the parentheses without deleting the parentheses
    * `da(` : To delete the parentheses and the text inside
  * Example
  ```javascript
  const hello = function() {
    console.log("Hello Vim");
    return true;
  }
  ```
    * `di(` : To delete the entire "Hello Vim"
    * `di{` : To delete the content of function (surrounded by `{}`)
    * `diw` : To delete the "Hello" string
  * These HTML tags:
  ```html
  <div>
    <h1>Header1</h1>
    <p>Paragraph1</p>
    <p>Paragraph2</p>
  </div>
  ```
    * If your cursor is on "Header1" text:
      * `dit` : To delete "Header1"
      * `dat` : To delete `<h1>Header1</h1>`
    * If your cursor is on "div":
      * `dit` : To delete `h1` and both `p` lines
      * `dat` : To delete everything
      * `di<` : To delete "div"
  * Below is a list of common text objects:
    * `w` : A word
    * `p` : A paragraph
    * `s` : A sentence
    * `( or )` : A pair of ( )
    * `{ or }` : A pair of { }
    * `[ or ]` : A pair of [ ]
    * `< or >` : A pair of < >
    * `t` : XML tags
    * `"` : A pair of " "
    * `'` : A Pair of ' '
    * ` : A pair of ` `
  * To learn more, check out `:h text-objects`

* Composability and Grammar
  * Suppose you have this messy text below and you want to tabularize it:
  ```shell
  Id|Name|Cuteness
  01|Puppy|Very
  02|Kitten|Ok
  03|Bunny|Ok
  ```
  * With your cursor on "Id", run `!}column -t -s "|"`
  * Now you have this pretty tabular data with just one quick command:
  ```shell
  Id  Name    Cuteness
  01  Puppy   Very
  02  Kitten  Ok
  03  Bunny   Ok
  ```
  * You know that awk can do the job easily. You can do this instead: `!}column -t -s "|" | awk 'NR > 1 && /Ok/ {print $0}'`
  * Result
  ```shell
  02  Kitten  Ok
  03  Bunny   Ok
  ```

## [Ch05. Moving in a File](https://github.com/iggredible/Learn-Vim/blob/master/ch05_moving_in_file.md)

* If you need to learn more, check out `:h motion.txt`

* Character Navigation
  * The most basic motion unit is moving one character left, down, up, and right.
    * `h` : Left
    * `j` : Down
    * `k` : Up
    * `l` : Right
    * `gj` : Down in a soft-wrapped line
    * `gk` : Up in a soft-wrapped line

* Relative Numbering
  * You can do it by having this on `.vimrc`:
    * `set relativenumber number`

* Count Your Move
  * `12j` :  you can go down 12 lines with
  * `[count] + motion` : The syntax to use count with your motion is
  * `9l` :  If you want to move 9 characters to the right, instead of pressing `l` 9 times, you can do

* Word Navigation
  * WORD uses the same letters as word, only uppercased.
    * `w` : Move forward to the beginning of the next word
    * `W` : Move forward to the beginning of the next WORD
    * `e` : Move forward one word to the end of the next word
    * `E` : Move forward one word to the end of the next WORD
    * `b` : Move backward to beginning of the previous word
    * `B` : Move backward to beginning of the previous WORD
    * `ge` : Move backward to end of the previous word
    * `gE` : Move backward to end of the previous WORD
  * For example, suppose you have:
  ```javascript
  const hello = "world";
  ```
    * `l` : With your cursor at the start of the line, to go to the end of the line with

* Current Line Navigation
  * Navigation commands
    * `0` : Go to the first character in the current line
    * `^` : Go to the first nonblank char in the current line
    * `g_` : Go to the last non-blank char in the current line
    * `$` : Go to the last char in the current line
    * `n|` : Go the column n in the current line
  * Search commands
    * `f`    Search forward for a match in the same line
    * `F`    Search backward for a match in the same line
    * `t`    Search forward for a match in the same line, stopping before match
    * `T`    Search backward for a match in the same line, stopping before match
    * `;`    Repeat the last search in the same line using the same direction
    * `,`    Repeat the last search in the same line using the opposite direction
  * Back at the previous example:
  ```javascript
  const hello = "world";
  ```
    * `$` : With your cursor at the start of the line, you can go to the last character in current line (";") with one keypress
    * `fw` : If you want to go to "w" in "world", you can use
  * Sentence navigation
    * `(` : Jump to the previous sentence
    * `)` : Jump to the next sentence
  * Paragraph navigation
    * `{` : Jump to the previous paragraph
    * `}` : Jump to the next paragraph

* Match Navigation
  * `%` : Navigate to another match, usually works for (), [], {}

* Line Number Navigation
  * Commands
    * `gg` : Go to the first line
    * `G` : Go to the last line
    * `nG` : Go to line n
    * `n%` : Go to n% in file
  * `Ctrl-g` : If you want to see total lines in a file, you can use

* Window Navigation
  * Commands
    * `H` : Go to top of screen
    * `M` : Go to medium screen
    * `L` : Go to bottom of screen
    * `nH` : Go n line from top
    * `nL` : Go n line from bottom

* Scrolling
  * Commands
    * `Ctrl-E` : Scroll down a line
    * `Ctrl-D` : Scroll down half screen
    * `Ctrl-F` : Scroll down whole screen
    * `Ctrl-Y` : Scroll up a line
    * `Ctrl-U` : Scroll up half screen
    * `Ctrl-B` : Scroll up whole screen
  * Scroll relatively to the current line (zoom screen sight):
    * `zt`    Bring the current line near the top of your screen
    * `zz`    Bring the current line to the middle of your screen
    * `zb`   Bring the current line near the bottom of your screen

* Search Navigation
  * Commands
    * `/`    Search forward for a match
    * `?`    Search backward for a match
    * `n`    Repeat last search in same direction of previous search
    * `N`    Repeat last search in opposite direction of previous search
  * Because I use this no-highlight feature frequently, I created a map in `vimrc`:
    * `nnoremap <esc><esc> :noh<return><esc>`
  * Word search commands
    * `*` : Search for whole word under cursor forward
    * `#` : Search for whole word under cursor backward
    * `g*` : Search for word under cursor forward
    * `g#`    Search for word under cursor backward
  * Marking Position
    * Commands
      * `ma`    Mark position with mark "a"
      * `` `a ``   Jump to line and column "a"
      * `'a`    Jump to line "a"
    * Marks list commands
      * ''    Jump back to the last line in current buffer before jump
      * ``` `` ```    Jump back to the last position in current buffer before jump
      * `` `[ ``    Jump to beginning of previously changed / yanked text
      * `` `] ``    Jump to the ending of previously changed / yanked text
      * ` `< ``    Jump to the beginning of last visual selection
      * `` `> ``    Jump to the ending of last visual selection
      * `` `0 ``    Jump back to the last edited file when exiting vim
  * Jump
    * Here are the commands Vim consider as "jump" commands:
      * `'`       Go to the marked line
      * `` ` ``       Go to the marked position
      * `G`       Go to the line
      * `` /` ``       Search forward
      * `?`       Search backward
      * `n`       Repeat the last search, same direction
      * `N`       Repeat the last search, opposite direction
      * `%`       Find match
      * `(`       Go to the last sentence
      * `)`       Go to the next sentence
      * `{`       Go to the last paragraph
      * `}`       Go to the next paragraph
      * `L`       Go to the the last line of displayed window
      * `M`       Go to the middle line of displayed window
      * `H`       Go to the top line of displayed window
      * `[[`      Go to the previous section
      * `]]`      Go to the next section
      * `:s`      Substitute
      * `:tag`    Jump to tag definition
    * For more, check out `:h jump-motions`.

## [Ch06. Insert Mode](https://github.com/iggredible/Learn-Vim/blob/master/ch06_insert_mode.md)
