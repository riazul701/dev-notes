# Commands

* `sudo apt install vim` : In many Linux distribution, "vim-tiny" is installed by default. Which does not have `vimtutor` command and online-manual. Install full `vim` with this command.

# [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)

## [Ch00. Read This First](https://github.com/iggredible/Learn-Vim/blob/master/ch00_read_this_first.md)

* Ch00. Read This First

* Why This Guide Was Written
  * `vimtutor` : is a great place to start
  * `:help` : Manual has all the references you will ever need.

* How to Transition to Vim From Using a Different Text Editor
  * [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)  

* How to Read This Guide
  * `:s` : substitute command

* More Help
  * `:h CTRL-P` : If you merely search for, you will be directed to normal mode's `Ctrl-P`
  * `:h i_CTRL-P` : The appended `i_` represents the insert mode.

* Syntax
  * Vim commands can be abbreviated. For example, `:join` can be abbreviated as `:j`.

* Vimrc
  * `:h vimrc` : To see where you should put yours, check out. It is usually placed in your home directory and named `.vimrc`
  * Inside `~/.vimrc`, add set number `set number`. Save it `(:w)`, then source it `(:source %)`. You should now see line numbers displayed on the left side.
  * `:set number` : See line numbers displayed on the left side. The downside of this approach is that this setting is temporary. When you close Vim, the option disappears.
  * Since we are learning about Vim and not Vi, a setting that you must have is the `nocompatible` option. Add `set nocompatible` in your vimrc. Many Vim-specific features are disabled when it is running on `compatible` option.
  * In general, whenever a passage mentions a vimrc option, just add that option into vimrc, save it, and source it.

* Future, Errors, Questions

* I Want More Vim Tricks

* Thank Yous

## [Ch01. Starting Vim](https://github.com/iggredible/Learn-Vim/blob/master/ch01_starting_vim.md)

* Ch01. Starting Vim

* Installing
  * To download more information about Vim installation process, check out Vim's official download website or Vim's official github repository:
    * [Vim website](https://www.vim.org/download.php)
    * [Vim github](https://github.com/vim/vim)

* The Vim Command
  * `vim` : You should see an intro screen. Vim is a modal editor. If you want to type "hello", you need to switch to insert mode with `i`. Press `ihello<Esc>` to insert the text "hello".

* Exiting Vim
  * Type `<Esc>` to switch to normal mode. 
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
  * I just typed `:h`, then "quit", then `<Tab>`.  Vim displayed relevant keywords to choose from.

* Opening a File
  * `vim hello1.txt` : To open a file (hello1.txt) on Vim from the terminal.
  * `vim hello1.txt hello2.txt hello3.txt` : You can also open multiple files at once [in separate buffers]

* Arguments
  * You can pass the vim terminal command with different flags and options.
  * `vim --version` : To check the current Vim version. And all available features marked with either `+` or `-`.
  * `:history` : Explore Vim's command-line history. Vim needs to have `+cmdline_history` feature for the command to work.
  * Many things you do from the terminal can also be done from inside Vim.
  * `:version` : To see the version from inside Vim.
  * If you want to open the file `hello.txt` and immediately execute a Vim command, you can pass to the `vim` command the `+{cmd}` option.
  * `:s` command (short for `:substitute`) : In Vim, you can substitute strings.
  * `vim +%s/pancake/bagel/g hello.txt` : If you want to open hello.txt and substitute all "pancake" with "bagel". 
  * `vim +%s/pancake/bagel/g +%s/bagel/egg/g +%s/egg/donut/g hello.txt` : These Vim commands can be stacked. Vim will replace all instances of "pancake" with "bagel", then replace "bagel" with "egg", then replace "egg" with "donut"
  * You can also pass the -c option followed by a Vim command instead of the + syntax:
    * `vim -c %s/pancake/bagel/g hello.txt`
    * `vim -c %s/pancake/bagel/g -c %s/bagel/egg/g -c %s/egg/donut/g hello.txt`

* Opening Multiple Windows
  * You can launch Vim on split horizontal and vertical windows with the `-o` and `-O` options, respectively.
  * `vim -o2` : To open Vim with two horizontal windows.
  * `vim -o5` : To open Vim with 5 horizontal windows.
  * `vim -o5 hello1.txt hello2.txt` : To open Vim with 5 horizontal windows and fill up the first two with hello1.txt and hello2.txt.
  * To open Vim with two vertical windows, 5 vertical windows, and 5 vertical windows with 2 files:
    * `vim -O2`
    * `vim -O5`
    * `vim -O5 hello1.txt hello2.txt`

* Suspending
  * `Ctrl-z` : If you need to suspend Vim while in the middle of editing, you can press.
  * `:stop` or `:suspend` : You can also run either of two commands to suspend.
  * `fg` : To return to the suspended Vim, run this command from the terminal.

* Starting Vim the Smart Way
  * The `vim` command can take many different options, just like any other terminal command.
  * `+{cmd}` and `-c cmd` : Two options allow you to pass a Vim command as a parameter.
  * Also being a terminal command, you can combine vim with many other terminal commands.
  * `ls -l | vim -` : Redirect the output of the `ls` command to be edited in `Vim`.
  * `man vim` : To learn more about `vim` command in the terminal, check out. 
  * `:help` : To learn more about the Vim editor, continue reading this guide along with the this command.

## [Ch02. Buffers, Windows, and Tabs](https://github.com/iggredible/Learn-Vim/blob/master/ch02_buffers_windows_tabs.md)

* Ch02. Buffers, Windows, and Tabs
  * Vim uses three display abstractions instead of two: buffers, windows, and tabs.
  * Before you start, make sure you have the `set hidden` option in vimrc. Without it, whenever you switch buffers and your current buffer is not saved, Vim will prompt you to save the file
  * `~/.vimrc` : Vim's configuration "vimrc" usually placed in your home directory. I have mine on `~/.vimrc`.
  * `set hidden` option in vimrc. Without it, whenever you switch buffers and your current buffer is not saved, Vim will prompt you to save the file (you don't want that if you want to move quickly). Save it, then source it (run `:source %` from inside the vimrc).

* Buffers
  * When you open a file in Vim, the data is bound to a buffer.
  * `vim file1.js` : Open "file1.js" in vim. Whenever you open a new file, Vim creates a new buffer.
  * `vim file1.js file2.js` : Open two new files. Vim currently displays `file1.js` buffer, but it actually creates two buffers: `file1.js` buffer and `file2.js` buffer.
  * `:buffers` : To see all the buffers. You should see both `file1.js` and `file2.js` listed.
    * `:ls` or `:files` : Alternatively, you can use to see all the buffers.
  * Running `vim file1 file2 file3 ...` filen creates n amount of buffers.
  * Each time you open a new file, Vim create a new buffer for that file.
  * There are several ways you can traverse buffers:
    * `:bnext` : To go to the next buffer.
    * `:bprevious` : To go to the previous buffer.
    * `:buffer + filename` : Vim can autocomplete filename with `<Tab>`.
    * `:buffer + n` : Where `n `is the buffer number. For example, typing `:buffer 2` will take you to buffer #2.
    * `Ctrl-O` : Jump to the older position in the jump list.
    * `Ctrl-I` : Jump to the newer position in the jump list. [These are not buffer specific methods, but they can be used to jump between different buffers.]
    * `Ctrl-^` : Go to the previously edited buffer.
    * `:bdelete` : To remove buffer, you can type.
    * `:bdelete 3` : To delete buffer #3. Accept a buffer number as a parameter
    * `:bdelete` then use `<Tab>` to autocomplete filename.

* Exiting Vim
  * `:qall` : If you have multiple buffers opened, you can close all of them with quit-all.
  * `:qall!` : If you want to close all buffers without saving your changes, just add `!` at the end: 
  * `:wqall` : To save and quit all buffers. 

* Windows
  * `vim file1.js` : Open `file1.js` in vim. You are looking at the `file1.js` buffer, displayed through a window. A window is how you are viewing a buffer through.
  * `:split file2.js` : You are looking at two buffers through two windows. The top window displays `file2.js` buffer. The bottom window displays `file1.js` buffer.
  * If you want to navigate between windows, use these shortcuts:
    * `Ctrl-W H` : Moves the cursor to the left window
    * `Ctrl-W J` : Moves the cursor to the window below
    * `Ctrl-W K` : Moves the cursor to the window upper
    * `Ctrl-W L` : Moves the cursor to the right window
  * `:vsplit file3.js` : You are now seeing three windows displaying three buffers. One window displays `file3.js` buffer, another window displays `file2.js` buffer, and another window displays `file1.js` buffer.
  * `:buffer file2.js` : You can have multiple windows displaying the same buffer. While you're on the top left window, type this. Now both two windows are displaying `file2.js` buffer.
    * If you start typing on a `file2.js` window, you will see that both windows that display `file2.js` buffers are being updated in real-time.
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
  * A tab is a collection of windows. Think of it like a layout for windows.
  * When you close a tab in Vim, you are not closing a file. You are only closing the layout. The files opened in that layout are still not closed, they are still opened in their buffers.
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
  * `3gt` : Go to the third tab. Pass count as argument to `gt`, where count is tab number.
  * One advantage of having multiple tabs is you can have different window arrangements in different tabs. Maybe you want your first tab to have 3 vertical windows and second tab to have a mixed horizontal and vertical windows layout. Tab is the perfect tool for the job!
  * `vim -p file1.js file2.js file3.js` : To start Vim with multiple tabs.

* Moving in 3D
  * Moving between windows is like traveling two-dimensionally along the X-Y axis in Cartesian coordinates.
  * Moving between buffers is like traveling across the Z axis in Cartesian coordinates.

* Using Buffers, Windows, and Tabs the Smart Way
  * First, I use buffers to store all the required files for the current task.
  * I use multiple windows to view multiple buffers at once, usually when diffing files, reading docs, or following a code flow.
  * Instead of tabs, I use `tmux` windows. I usually use multiple tmux windows at once. For example, one tmux window for client-side codes and another for backend codes.
    * [tmux](https://github.com/tmux/tmux/wiki)

## [Ch03. Searching Files](https://github.com/iggredible/Learn-Vim/blob/master/ch03_searching_files.md)

* Ch03. Searching Files
  * search without plugins
  *  search with [fzf.vim](https://github.com/junegunn/fzf.vim) plugin

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
  * The difference is that `:find` finds file in path, `:edit` doesn't.
  * `:set path?` : To check what your paths are, do
  * `path=.,/usr/include,,` : By default, yours probably look like this
    * `.` means to search in the directory of the currently opened file.
    * `,` means to search in the current directory.
    * `/usr/include` is the typical directory for C libraries header files.
  * you can modify your own paths, where Vim will look for files.
  * `:set path+=app/controllers/` : You need to add the `app/controllers/` to the current path. Here is how you can do it. when you type `:find u<Tab>`, Vim will now search inside `app/controllers/` directory for files starting with "u".
  * `:set path+=app/controllers/**` : If you have a nested `controllers/` directory, like `app/controllers/account/users_controller.rb`, Vim won't find `users_controllers`. Instead, you need to add this in order for autocompletion will find `users_controller.rb`.
  * `:set path+=$PWD/**` : You might be thinking to add the entire project directories so when you press tab, Vim will search everywhere for that file, like this. [this will slow down your search significantly if you have a large number of files in your project. I recommend adding only the `path` of your most visited files / directories.]
  * `set path+={your-path-here}` : You can add this in your vimrc.

* Searching in Files With Grep
  * If you need to find in files (find phrases in files), you can use grep. Vim has two ways of doing that:
    * Internal grep (`:vim`. Yes, it is spelled `:vim`. It is short for `:vimgrep`).
    * External grep (`:grep`).
  * `:vim /pattern/ file` : Let's go through internal grep first. `:vim` has the following syntax.
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
  * You may notice that running internal grep (`:vim`) can get slow if you have a large number of matches. This is because Vim loads each matching file into memory, as if it were being edited.
  * `:grep -R "lunch" app/controllers/` : To search for "lunch" inside a ruby file inside `app/controllers/` directory. It also displays all matches using `quickfix`.
  * Vim defines the `grepprg` variable to determine which external program to run when running the `:grep`.

  * Browsing Files With Netrw
    * `netrw` is Vim's built-in file explorer. It is useful to see a project's hierarchy.
    * To run `netrw`, you need these two settings in your `.vimrc`:
      * `set nocp`
      * `filetype plugin on`
    * You can start `netrw` when you launch Vim by passing it a directory as a parameter instead of a file:
      * `vim .`
      * `vim src/client/`
      * `vim app/controllers/`
    * To launch `netrw` from inside Vim, you can use the `:edit` command and pass it a directory parameter instead of a filename:
      * `:edit .`
      * `:edit src/client/`
      * `:edit app/controllers/`
    * There are other ways to launch `netrw` window without passing a directory:
      * `:Explore` : Starts netrw on current file
      * `:Sexplore` : No kidding. Starts netrw on split top half of the screen
      * `:Vexplore` : Starts netrw on split left half of the screen
    * You can navigate `netrw` with Vim motions.
    * Here is a list of useful netrw commands:
      * `%` : Create a new file
      * `d` : Create a new directory
      * `R` : Rename a file or directory
      * `D` : Delete a file or directory
    * `:h netrw` : is very comprehensive
    * `netrw` related plugins
      * [vim-vinegar](https://github.com/tpope/vim-vinegar)
      * [NERDTree](https://github.com/preservim/nerdtree)

* Fzf
  * how to use fzf.vim to make searching in Vim easy and powerful

* Fzf Setup

  * Plugins
    * [vim-plug](https://github.com/junegunn/vim-plug)
    * [fzf](https://github.com/junegunn/fzf)
      * [FZF Vim integration](https://github.com/junegunn/fzf/blob/master/README-VIM.md)
    * [ripgrep](https://github.com/BurntSushi/ripgrep)
    * [fzf.vim](https://github.com/junegunn/fzf.vim)
  * In my .zshrc (.bashrc if you use bash), I have these:
  ```shell
  if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m'
  fi
  ```
    * Pay attention to `-m` in `FZF_DEFAULT_OPTS`. This option allows us to make multiple selections with `<Tab>` or `<Shift-Tab>`.
    * `man fzf` : The fzf command accepts many more options
  * Add these inside your `.vimrc` plugins. You need to use fzf.vim plugin (created by the same fzf author):
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
  * `:Files` : Search for files inside Vim using fzf.vim plugin. Run this from Vim and you will be prompted with fzf search prompt.
  * Since you will be using this command frequently, it is good to have this mapped to a keyboard shortcut. I map mine to `Ctrl-f`. In my vimrc, I have this:
    * `nnoremap <silent> <C-f> :Files<CR>`

* Finding in Files
  * `:Rg` : To search inside files, you can use this command.
  * Again, since you will probably use this frequently, let's map it to a keyboard shortcut. I map mine to `<Leader>f`. The `<Leader>` key is mapped to `\` by default.
    * `nnoremap <silent> <Leader>f :Rg<CR>`

* Other Searches
  * Fzf.vim provides many other search [commands](https://github.com/junegunn/fzf.vim#commands).
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
  * Now let's setup `grepprg` so that the `:grep` Vim command uses `ripgrep`. Add this in your vimrc:
    * `set grepprg=rg\ --vimgrep\ --smart-case\ --follow`
      * After you updated `grepprg`, now when you run `:grep`, it runs `rg --vimgrep --smart-case --follow` instead of grep.
      * Just like the old `:grep`, this new `:grep` also uses quickfix to display results.
      * `man rg`

* Search and Replace in Multiple Files
  * If you want to replace all instances of "pizza" with "donut", here's what you do:
    * `:grep "pizza"` : uses ripgrep to search for all instances of "pizza".  (by the way, this would still work even if you didn't reassign `grepprg` to use ripgrep. You would have to do `:grep "pizza" . -R` instead of :grep "pizza").
    * `:cfdo %s/pizza/donut/g | update` : `:cfdo` executes any command you pass to all files in your quickfix list. In this case, your command is the substitution command `%s/pizza/donut/g`. The pipe (`|`) is a chain operator. The `update` command saves each file after substitution.
  * The second method is to search and replace in selected files.
    * `:%bd | e#` : Clear your buffers first. You can either restart Vim or run this command (`%bd` deletes all the buffers and `e#` opens the file you were just on).
    * Run `:Files`.
    * To select multiple files, use `<Tab>` / `<Shift-Tab>`. This is only possible if you have the multiple flag (`-m`) in `FZF_DEFAULT_OPTS`.
    * Run `:bufdo %s/pizza/donut/g | update`.
      * The command `:bufdo %s/pizza/donut/g | update` looks similar to the earlier `:cfdo %s/pizza/donut/g | update` command.
      * The difference is instead of substituting all quickfix entries (`:cfdo`), you are substituting all buffer entries (`:bufdo`).

* Learn Search the Smart Way

## [Ch04. Vim Grammar](https://github.com/iggredible/Learn-Vim/blob/master/ch04_vim_grammar.md)

* Ch04. Vim Grammar

* How to Learn a Language
  * Learn grammar rules.
  * Increase vocabulary.
  * Practice, practice, practice.

* Grammar Rule
  * `verb + noun` : There is only one grammar rule in Vim language.
    * This is like saying these English phrases:
      * "Eat (verb) a donut (noun)"
      * "Kick (verb) a ball (noun)"
      * "Learn (verb) the Vim editor (noun)"

* Nouns (Motions)
  * Nouns are Vim motions. Motions are used to move around in Vim. Below is a list of some of Vim motions:
    * `h` : Left
    * `j` : Down
    * `k` : Up
    * `l` : Right
    * `w` : Move forward to the beginning of the next word
    * `}` : Jump to the next paragraph
    * `$` : Go to the end of the line

* Verbs (Operators)
  * According to `:h operator`, Vim has 16 operators.
  * learning these 3 operators is enough for 80% of my editing needs:
    * `y` : Yank text (copy)
    * `d` : Delete text and save to register
    * `c` : Delete text, save to register, and start insert mode

* Verb and Noun
  * let's apply the grammar rule, verb + noun!
    * `y$` : To yank everything from your current location to the end of the line
    * `dw` : To delete from your current location to the beginning of the next word
    * `c}` : To change from your current location to the end of the current paragraph
  * Motions also accept count number as arguments. Count works with Vim grammar.
    * `3k` : If you need to go up 3 lines, instead of pressing `k` 3 times, you can do this.
    * `y2h` : To yank two characters to the left
    * `d2w` : To delete the next two words
    * `c2j` : To change the next two lines
  * `dd`, `yy`, and `cc` perform deletion, yank, and change on the entire line
  * Vim has one more type of noun: text objects.

* More Nouns (Text Objects)
  * There are two types of text objects: inner and outer text objects.
    * `i + object` : Inner text object
    * `a + object` : Outer text object
    * Inner text object selects the object inside without the white space or the surrounding objects.
    * Outer text object selects the object inside including the white space or the surrounding objects.
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
  * `:h text-objects` : To learn more text objects, check out this.

* Composability and Grammar
  * Suppose you have this messy text below and you want to tabularize it:
  ```shell
  Id|Name|Cuteness
  01|Puppy|Very
  02|Kitten|Ok
  03|Bunny|Ok
  ```
  * With your cursor on "Id", run `!}column -t -s "|"`
    * The verb was `!` (filter operator) and the noun was `}` (go to next paragraph). The filter operator `!` accepted another argument, a terminal command, so I gave it `column -t -s "|"`.
  * Now you have this pretty tabular data with just one quick command:
  ```shell
  Id  Name    Cuteness
  01  Puppy   Very
  02  Kitten  Ok
  03  Bunny   Ok
  ```
  * Suppose you want to not only tabularize your text, but to display only the rows with "Ok". You know that awk can do the job easily. You can do this instead:
    * `!}column -t -s "|" | awk 'NR > 1 && /Ok/ {print $0}'`
    * Result
    ```shell
    02  Kitten  Ok
    03  Bunny   Ok
    ```
  * The external command operator can also use pipe (`|`).
  * Plugins
    * [vim-textobj-user](https://github.com/kana/vim-textobj-user)
    * [vim-textobj-user list](https://github.com/kana/vim-textobj-user/wiki)

* Learn Vim Grammar the Smart Way
  * `gUiw` : uppercase the current word

## [Ch05. Moving in a File](https://github.com/iggredible/Learn-Vim/blob/master/ch05_moving_in_file.md)

* Ch05. Moving in a File

  * `:h motion.txt` : If you need to learn more motion, check out 

* Character Navigation

  * The most basic motion unit is moving one character left, down, up, and right.
    * `h` : Left
    * `j` : Down
    * `k` : Up
    * `l` : Right
    * `gj` : Down in a soft-wrapped line
    * `gk` : Up in a soft-wrapped line
  * Plugins
    * [vim-hardtime](https://github.com/takac/vim-hardtime)

* Relative Numbering

  * You can do it by having this on `.vimrc`:
    * `set relativenumber number`
    * `d12j` : With relative numbering, I can easily spot that my target text is 12 lines below me so I can do this command to delete them.

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
  * So what are the similarities and differences between a word and a WORD?
    * A word is a sequence of characters containing only `a-zA-Z0-9_`.
    * A WORD is a sequence of all characters except white space (a white space means either space, tab, and EOL).
    * To learn more, check out 
      * `:h word` : Help about "word"
      * `:h WORD` : Help about "WORD"
  * For example, suppose you have:
  ```javascript
  const hello = "world";
  ```
    * `l` : With your cursor at the start of the line, to go to the end of the line with, it will take you 21 key presses.
    * `w` : it will take 6 key presses.
    * `W`, it will only take 4 key presses.

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
    * Examples
      * `fh` : if you want to search for "h" and land on "h", use this
      * `th` : If you want to search for first "h" and land right before the match, use this
      * `Fh` : To search backwards for "h", run this. To keep searching for "h" in the same direction, use `;`. Note that `;` after a Fh searches backward and `,` after `Fh` searches forward.
  * Back at the previous example:
  ```javascript
  const hello = "world";
  ```
    * `$` : With your cursor at the start of the line, you can go to the last character in current line (";") with one keypress
    * `fw` : If you want to go to "w" in "world", you can use this
  
* Sentence and Paragraph Navigation

  * A sentence ends with either `. ! ?` followed by an EOL, a space, or a tab.
  * Sentence navigation
    * `(` : Jump to the previous sentence
    * `)` : Jump to the next sentence
  * Which phrases do you think are sentences and which aren't? Try navigating with ( and ) in Vim!
    ```shell
    I am a sentence. I am another sentence because I end with a period. I am still a sentence when ending with an exclamation point! What about question mark? I am not quite a sentence because of the hyphen - and neither semicolon ; nor colon :

    There is an empty line above me.
    ```
  * By the way, if you're having a problem with Vim not counting a sentence for phrases separated by `.` followed by a single line, you might be in `'compatible'` mode. Add `set nocompatible` into vimrc. In Vi, a sentence is a `.` followed by two spaces. You should have `nocompatible` set at all times.
  * Paragraph navigation
    * `{` : Jump to the previous paragraph
    * `}` : Jump to the next paragraph
  * Try navigating around with } and { (also, play around with sentence navigations ( ) to move around too!)
  ```shell
Hello. How are you? I am great, thanks!
Vim is awesome.
It may not easy to learn it at first...- but we are in this together. Good luck!

Hello again.

Try to move around with ), (, }, and {. Feel how they work.
You got this.
  ```
  * Check out `:h sentence` and `:h paragraph` to learn more.

* Match Navigation

  * You can also use this to find out whether you have matching parentheses, braces, and brackets.
    * `%` : Navigate to another match, usually works for (), [], {}
  * I personally like to complement % with visual indicators plugins like [vim-rainbow](https://github.com/frazrepo/vim-rainbow). For more, check out `:h %`.

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
  * `set hlsearch` : You can enable search highlight with this.
    * Now when you search for `/let`, it will highlight all matching phrases in the file.
  * `set incsearch` : you can set incremental search with this
    * This will highlight the pattern while typing. By default, your matching phrases will remain highlighted until you search for another phrase.
  * `:nohlsearch` or simply `:noh` To disable highlight, you can run this.
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
  * Lowercase alphabets are local marks and uppercase alphabets are global marks (sometimes known as file marks).
  * Global marks can travel across files.
  * `:marks` : To view all marks, use this
  * You may notice from the marks list there are more marks other than `a-zA-Z`. Some of them are:
  ```
''    Jump back to the last line in current buffer before jump
``    Jump back to the last position in current buffer before jump
`[    Jump to beginning of previously changed / yanked text
`]    Jump to the ending of previously changed / yanked text
`<    Jump to the beginning of last visual selection
`>    Jump to the ending of last visual selection
`0    Jump back to the last edited file when exiting vim
  ```
  * `:h marks` : check out all marks

* Jump

  * Here are the commands Vim consider as "jump" commands:
  ```
'       Go to the marked line
`       Go to the marked position
G       Go to the line
/       Search forward
?       Search backward
n       Repeat the last search, same direction
N       Repeat the last search, opposite direction
%       Find match
(       Go to the last sentence
)       Go to the next sentence
{       Go to the last paragraph
}       Go to the next paragraph
L       Go to the the last line of displayed window
M       Go to the middle line of displayed window
H       Go to the top line of displayed window
[[      Go to the previous section
]]      Go to the next section
:s      Substitute
:tag    Jump to tag definition
```
  * `:jumps` : Vim keeps track of where you've been when you move around and you can see this list inside this.
  * `:h jump-motions` : For more jumps, check out this.
  * `Ctrl-O` : you can navigate the jump list with this to move up the jump list
  * `Ctrl-I` : to move down the jump list.
  * you can manually add the current location to jump list with `m'` before movement.
  * `m'5j` : adds current location to jump list and goes down 5 lines

* Learn Navigation the Smart Way

  * Watch for repeated actions: Use `l` -> `w` -> `f` for faster movement.

## [Ch06. Insert Mode](https://github.com/iggredible/Learn-Vim/blob/master/ch06_insert_mode.md)

* Ch06. Insert Mode
  
* Ways to Go to Insert Mode

  * There are many ways to get into insert mode from the normal mode. Here are some of them:
    * `i` : Insert text before the cursor
    * `I` : Insert text before the first non-blank character of the line
    * `a` : Append text after the cursor
    * `A` : Append text at the end of line
    * `o` : Starts a new line below the cursor and insert text
    * `O` : Starts a new line above the cursor and insert text
    * `s` : Delete the character under the cursor and insert text
    * `S` : Delete the current line and insert text, synonym for "cc"
    * `gi` : Insert text in same position where the last insert mode was stopped
    * `gI` : Insert text at the start of line (column 1)

* Different Ways to Exit Insert Mode

  * There are a few different ways to return to the normal mode while in the insert mode:
    * `<Esc>` : Exits insert mode and go to normal mode
    * `Ctrl-[` : Exits insert mode and go to normal mode
    * `Ctrl-C` : Like Ctrl-[ and <Esc>, but does not check for abbreviation
  * I find `<Esc>` key too far to reach, so I map my computer `<Caps-Lock>` to behave like `<Esc>`.
  * Another common convention I have seen Vim users do is mapping `<Esc>` to `jj` or `jk` in insert mode.
    * If you prefer this option add this one of those lines (or both) in your vimrc file.
    ```shell
inoremap jj <Esc>
inoremap jk <Esc>
    ```

* Repeating Insert Mode
  * `10i` : You can pass a count parameter before entering insert mode. If you type "hello world!" and exit insert mode, Vim will repeat the text 10 times.
    * This will work with any insert mode method (ex: `10I`, `11a`, `12o`).

* Deleting Chunks in Insert Mode
  * It may make more sense to go to normal mode and delete your mistake.
  * You can also delete several characters at a time while in insert mode.
    * `Ctrl-h` : Delete one character
    * `Ctrl-w` : Delete one word
    * `Ctrl-u` : Delete the entire line

* Insert From Register
  * Vim registers can store texts for future use.
  * `"ayiw` : first you need to yank a word to register a. Move your cursor on any word. Then type this.
    * `"a` tells Vim that the target of your next action will go to register a.
    * `yiw` yanks inner word. Review the chapter on Vim grammar for a refresher.
  * `Ctrl-R a` : While in insert mode, to paste the text stored in register a

* Scrolling

  * While in insert mode, if you go to Ctrl-X sub-mode, you can do additional operations. Scrolling is one of them.
    * `Ctrl-X Ctrl-Y` : Scroll up
    * `Ctrl-X Ctrl-E` : Scroll down

* Autocompletion

  * if you press `Ctrl-X` from insert mode, Vim will enter a sub-mode.
  * Here are some useful autocomplete commands to get started:
    * `Ctrl-X Ctrl-L` : Insert a whole line
    * `Ctrl-X Ctrl-N` : Insert a text from current file
    * `Ctrl-X Ctrl-I` : Insert a text from included files
    * `Ctrl-X Ctrl-F` : Insert a file name
  * When you trigger autocompletion, Vim will display a pop-up window. To navigate up and down the pop-up window, use `Ctrl-N` and `Ctrl-P`.
  * Vim also has two autocompletion shortcuts that don't involve the Ctrl-X sub-mode:
    * `Ctrl-N` : Find the next word match
    * `Ctrl-P` : Find the previous word match

* Executing a Normal Mode Command

  * `Ctrl-O` : While in insert mode, if you press this, you'll be in insert-normal sub-mode.
  * Centering and jumping
    * `Ctrl-O zz` : Center window
    * `Ctrl-O H/M/L` : Jump to top/middle/bottom window
    * `Ctrl-O 'a` : Jump to mark a
  * Repeating text
    * `Ctrl-O 100ihello` : Insert "hello" 100 times
  * Executing terminal commands
    * `Ctrl-O !! curl https://google.com` : Run curl
    * `Ctrl-O !! pwd` : Run pwd
  * Deleting faster
    * `Ctrl-O dtz` : Delete from current location till the letter "z"
    * `Ctrl-O D` : Delete from current location to the end of the line

* Learn Insert Mode the Smart Way
 
  * Develop a habit to go to normal mode when your fingers aren't typing new text.

* [Ch07. the Dot Command](https://github.com/iggredible/Learn-Vim/blob/master/ch07_the_dot_command.md)

* Ch07. the Dot Command
  * use the dot command to easily redo the previous change.

* Usage
  
  * For example, if you want to replace all "let" with "const" in the following expressions:
  ```shell
let one = "1";
let two = "2";
let three = "3";
  ```
    * Search with `/let` to go to the match.
    * Change with `cwconst<Esc>` to replace "let" with "const".
    * Navigate with `n` to find the next match using the previous search.
    * Repeat what you just did with the dot command (`.`).
    * Continue pressing `n . n .` until you replace every word.
  * Here the dot command repeated the `cwconst<Esc>` sequence.

* What Is a Change?
 
  * `:h .` : look at the definition of the dot command by this, it says that the dot command repeats the last change.
  * Any time you update (add, modify, or delete) the content of the current buffer, you are making a change.
  * Now suppose you have this text:
    * `pancake, potatoes, fruit-juice,`
    * To delete the text from the start of the line to the next occurrence of a comma, first delete to the comma, then repeat twice it with `df,..`
  * Let's try another example:
    * `pancake, potatoes, fruit-juice,`
    * After you run `f`, then `x`, go to the next comma with `;` to repeat the latest `f`. Finally, use `.` to delete the character under the cursor. Repeat `; . ; .` until everything is deleted. The full command is `f,x;.;.`
  * Let's try another one:
    ```shell
pancake
potatoes
fruit-juice
    ```
    * Let's add a comma at the end of each line. Starting at the first line, do `A,<Esc>j`. By now, you realize that j does not cause a change. The change here is only `A,`. You can move and repeat the change with `j . j ..` The full command is `A,<Esc>j.j.`

* Multi-line Repeat

  * Suppose you have this text:
    ```js
let one = "1";
let two = "2";
let three = "3";
const foo = "bar';
let four = "4";
let five = "5";
let six = "6";
let seven = "7";
let eight = "8";
let nine = "9";
    ```
    * Your goal is to delete all lines except the "foo" line. First, delete the first three lines with `d2j`, then to the line below the "foo" line. On the next line, use the dot command twice. The full command is `d2jj..`
  * Let's look at another example:
    ```js
zlet zzone = "1";
zlet zztwo = "2";
zlet zzthree = "3";
let four = "4";
    ```
    * Let's remove all the z's. Starting from the first character on the first line, visually select only the first z from the first three lines with blockwise visual mode (`Ctrl-Vjj`). delete them with the delete operator (`d`). Then move to the next word (`w`) to the next z. Repeat the change two more times (`..`). The full command is `Ctrl-vjjdw..`

* Including a Motion in a Change
 
  * replaced all "let" with "const" in the following expressions:
    ```js
let one = "1";
let two = "2";
let three = "3";
    ```
    * After you searched `/let`, run `cgnconst<Esc>` then `. .`
    * `gn` is a motion that searches forward for the last search pattern (in this case, `/let`) and automatically does a visual highlight. To replace the next occurrence, you no longer have to move and repeat the change ( `n . n .`), but only repeat (`. .`).

* Learn the Dot Command the Smart Way

  * The dot command is a versatile command for automating single changes.
  * automate more complex actions with Vim macros.

## [Ch08. Registers](https://github.com/iggredible/Learn-Vim/blob/master/ch08_registers.md)

* Ch08. Registers
  
  * You've probably used Vim registers when you yanked or deleted a text then pasted it with `p` or `P`.
  * Vim has 10 different types of registers

* The Ten Register Types
  
  * The unnamed register ("").
  * The numbered registers ("0-9).
  * The small delete register ("-).
  * The named registers ("a-z).
  * The read-only registers (":, ".,and "%).
  * The alternate file register ("#).
  * The expression register ("=).
  * The selection registers ("* and "+).
  * The black hole register ("_).
  * The last search pattern register ("/).

* Register Operators

  * To use registers, you need to first store them with operators. Here are some operators that store values to registers:
    * `y` : Yank (copy)
    * `c` : Delete text and start insert mode
    * `d` : Delete text
  * To paste a text from registers, you can use:
    * `p` : Paste the text after the cursor
    * `P` : Paste the text before the cursor
  * `10"ap` : To paste the text from register a ten times, do  this

* Calling Registers From Insert Mode

  * `Ctrl-R a` : The syntax to call registers from insert mode is

* The Unnamed Register

  * `""p` : To get the text from the unnamed register, do this. It stores the last text you yanked, changed, or deleted.

* The Numbered Registers

  * The Yanked Register
  * If you yank an entire line of text (`yy`), Vim actually saves that text in two registers:
    * The unnamed register (`p`).
    * The yanked register (`"0p`).
  * For example, if you:
    * Yank a line (`yy`)
    * Delete a line (`dd`)
    * Delete another line (`dd`)
    * The yanked register will have the text from step one.
  * If you:
    * Yank a line (`yy`)
    * Delete a line (`dd`)
    * Yank another line (`yy`)
    * The yanked register will have the text from step three.
  * `Ctrl-R 0` : while in insert mode, you can quickly paste the text you just yanked using this

  * The Non-zero Numbered Registers
  * When you change or delete a text that is at least one line long, that text will be stored in the numbered registers 1-9 sorted by the most recent.
  * For example, if you have these lines:
    ```shell
line three
line two
line one
    ```
    * With your cursor on "line three", delete them one by one with `dd`. Once all lines are deleted, register 1 should contain "line one" (most recent), register two "line two" (second most recent), and register three "line three" (oldest). To get the content from register one, do `"1p`.
    * these numbered registers are automatically incremented when using the dot command.
      * Do `"1P` to paste the content from the numbered register one ("1).
      * Do `.` to paste the content from the numbered register two ("2).
      * Do `.` to paste the content from the numbered register three ("3).

* The Small Delete Register

  * Changes or deletions less than one line are not stored in the numbered registers 0-9, but in the small delete register (`"-`).
  * For example:
    * Delete a word (`diw`)
    * Delete a line (`dd`)
    * Delete a line (`dd`)
    * `"-p` gives you the deleted word from step one.
  * Another example:
    * I delete a word (`diw`)
    * I delete a line (`dd`)
    * I delete a word (`diw`)
    * `"-p` gives you the deleted word from step three. `"1p` gives you the deleted line from step two.

* The Named Register

  * The named registers are Vim's most versatile register. It can store yanked, changed, and deleted texts into registers a-z.
  * To yank a word into register a, you can do it with `"ayiw`.
    * `"a` tells Vim that the next action (delete / change / yank) will be stored in register a.
    * `yiw` yanks the word.
  * To get the text from register a, run `"ap`

* The Read-only Registers

  * Vim has three read-only registers: `.`, `:`, and `%`. They are pretty simple to use:
    * `.` : Stores the last inserted text
    * `:` : Stores the last executed command-line
    * `%` : Stores the name of current file
      * If the last text you wrote was "Hello Vim", running `".p` will print out the text "Hello Vim". 
      * If you want to get the name of current file, run `"%p`. 
      * If you run `:s/foo/bar/g` command, running `":p` will print out the literal text "s/foo/bar/g".

* The Alternate File Register

  * An alternative file is the last file you opened. To insert the name of the alternate file, you can use `"#p`.

* The Expression Register

  * Vim has an expression register, `"=`, to evaluate expressions.
  * To evaluate mathematical expressions `1 + 1`, run:
    * `"=1+1<Enter>p`
  * To evaluate mathematical expression from insert mode, you can do:
    * `Ctrl-R =1+1`
  * If you wish to get the text from register a:
    * `"=@a`
    * Then press `<Enter>`, then `p`.
  * Similarly, to get values from register a while in insert mode:
    * `Ctrl-r =@a`

* The Selection Registers

  * Vim has two selection registers: `quotestar` (`"*`) and quoteplus (`"+`). You can use them to access copied text from external programs.
  * If you are on an external program (like Chrome browser) and you copy a block of text with `Ctrl-C` (or `Cmd-C`, depending on your OS), normally you wouldn't be able to use `p` to paste the text in Vim. However, both Vim's `"+` and `"*` are connected to your clipboard, so you can actually paste the text with  `"+p` or `"*p`. Conversely, if you yank a word from Vim with `"+yiw` or `"*yiw`, you can paste that text in the external program with `Ctrl-V` (or `Cmd-V`). Note that this only works if your Vim program comes with the `+clipboard` option (to check it, run `:version`).
  * I find doing `=*p` or `=+p` (or `"*p` or `"+p`) to be cumbersome. To make Vim to paste copied text from the external program with just `p`, you can add this in your vimrc:
  ```shell
set clipboard=unnamed
  ```
    * Now when I copy a text from an external program, I can paste it with the unnamed register, `p`. I can also copy a text from Vim and paste it to an external program. If you have `+xterm_clipboard` on, you may want to use both `unnamed` and `unnamedplus` clipboard options.

* The Black Hole Register

  * `"_dd` : To delete a line and not have Vim store the deleted line into any register, use this.

* The Last Search Pattern Register
  
  * To paste your last search (`/` or `?`), you can use the last search pattern register (`"/`). To paste the last search term, use `"/p`.

* Viewing the Registers

  * To view all your registers, use the `:register` command. To view only registers "a, "1, and "-, use `:register a 1 -`.
  * There is a plugin called [vim-peekaboo](https://github.com/junegunn/vim-peekaboo) that lets you to peek into the contents of the registers when you hit `"` or `@` in normal mode and `Ctrl-R` in insert mode.

* Executing a Register

  * named registers can also execute macros with `@`.

* Clearing a Register

  * if you run `qaq`, Vim will record an empty macro in the register a.
  * Another alternative is to run the command `:call setreg('a', 'hello register a')` where a is the register a and "hello register a" is the text that you want to store.
  * One more way to clear register is to set the content of "a register to an empty string with the expression `:let @a = ''`.

* Putting the Content of a Register

  * if you run `:put a`, Vim will print the content of register a below the current line.
  * `:10put a` will paste text from register a to below line 10.
  * to insert blank lines below all lines that contain the text "end", run `:g/end/put _`.

* Learning Registers the Smart Way

## [Ch09. Macros](https://github.com/iggredible/Learn-Vim/blob/master/ch09_macros.md)

* Ch09. Macros

* Basic Macros

  * 