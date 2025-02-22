# Commands/Usage

# Commands Collected From

* "#", "##" Headings Collected From : 
  * {1} [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)

* "**" Topics Collected From : 
  * {1} [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)

# Installation

* `sudo apt install vim` : In many Linux distribution, "vim-tiny" is installed by default. Which does not have `vimtutor` command and online-manual. Install full `vim` with this command.

# General Command

* Open left file explorer: :Lexplore
* To switch between file opened windows : ctrl + ww (double w) or ctrl + w + (h/j/k/l)

# help

* `vimtutor` : is a great place to start <sup>{1}</sup>

* `:help` : Manual has all the references you will ever need. <sup>{1}</sup>

* `:h CTRL-P` : If you merely search for, you will be directed to normal mode's `Ctrl-P` <sup>{1}</sup>

* `:h i_CTRL-P` : The appended `i_` represents the insert mode. <sup>{1}</sup>

* Vim commands can be abbreviated. For example, `:join` can be abbreviated as `:j`. <sup>{1}</sup>

* `:help {some-command}` : (`:h` for short). You can pass to the `:h` command a topic or a command name as an argument. <sup>{1}</sup>

* `:h write-quit` : To learn about different ways to quit Vim. <sup>{1}</sup>

* I just typed `:h`, then "quit", then `<Tab>`.  Vim displayed relevant keywords to choose from.

# config

* `:h vimrc` : To see where you should put yours, check out. It is usually placed in your home directory and named `.vimrc` <sup>{1}</sup>

* Inside `~/.vimrc`, add set number `set number`. Save it `(:w)`, then source it `(:source %)`. You should now see line numbers displayed on the left side. <sup>{1}</sup>

* `:set number` : See line numbers displayed on the left side. The downside of this approach is that this setting is temporary. When you close Vim, the option disappears. <sup>{1}</sup>

* Since we are learning about Vim and not Vi, a setting that you must have is the `nocompatible` option. Add `set nocompatible` in your vimrc. Many Vim-specific features are disabled when it is running on `compatible` option. <sup>{1}</sup>

* In general, whenever a passage mentions a vimrc option, just add that option into vimrc, save it, and source it. <sup>{1}</sup>

# Starting vim

* `vim` : You should see an intro screen. Vim is a modal editor. If you want to type "hello", you need to switch to insert mode with `i`. Press `ihello<Esc>` to insert the text "hello". <sup>{1}</sup>

* Exiting Vim <sup>{1}</sup>
  * Type `<Esc>` to switch to normal mode. 
  * `:quit` : Exiting Vim
  * `:q` : Exiting Vim

## Arguments

* You can pass the vim terminal command with different flags and options. <sup>{1}</sup>

* `vim --version` : To check the current Vim version. And all available features marked with either `+` or `-`. <sup>{1}</sup>

* `:history` : Explore Vim's command-line history. Vim needs to have `+cmdline_history` feature for the command to work. <sup>{1}</sup>

* Many things you do from the terminal can also be done from inside Vim. <sup>{1}</sup>

* `:version` : To see the version from inside Vim. <sup>{1}</sup>

* If you want to open the file `hello.txt` and immediately execute a Vim command, you can pass to the `vim` command the `+{cmd}` option. <sup>{1}</sup>

* `:s` command (short for `:substitute`) : In Vim, you can substitute strings. <sup>{1}</sup>

* `vim +%s/pancake/bagel/g hello.txt` : If you want to open hello.txt and substitute all "pancake" with "bagel". <sup>{1}</sup>

* `vim +%s/pancake/bagel/g +%s/bagel/egg/g +%s/egg/donut/g hello.txt` : These Vim commands can be stacked. Vim will replace all instances of "pancake" with "bagel", then replace "bagel" with "egg", then replace "egg" with "donut" <sup>{1}</sup>

* You can also pass the -c option followed by a Vim command instead of the + syntax: <sup>{1}</sup>
  * `vim -c %s/pancake/bagel/g hello.txt`
  * `vim -c %s/pancake/bagel/g -c %s/bagel/egg/g -c %s/egg/donut/g hello.txt`

## Opening Multiple Windows

* You can launch Vim on split horizontal and vertical windows with the `-o` and `-O` options, respectively. <sup>{1}</sup>
  
* `vim -o2` : To open Vim with two horizontal windows. <sup>{1}</sup>
  
* `vim -o5` : To open Vim with 5 horizontal windows. <sup>{1}</sup>
  
* `vim -o5 hello1.txt hello2.txt` : To open Vim with 5 horizontal windows and fill up the first two with hello1.txt and hello2.txt. <sup>{1}</sup>
  
* To open Vim with two vertical windows, 5 vertical windows, and 5 vertical windows with 2 files: <sup>{1}</sup>
  * `vim -O2`
  * `vim -O5`
  * `vim -O5 hello1.txt hello2.txt`

## Suspending
  
* `Ctrl-z` : If you need to suspend Vim while in the middle of editing, you can press. <sup>{1}</sup>
  
* `:stop` or `:suspend` : You can also run either of two commands to suspend. <sup>{1}</sup>
  
* `fg` : To return to the suspended Vim, run this command from the terminal. <sup>{1}</sup>

## Starting Vim the Smart Way

* The `vim` command can take many different options, just like any other terminal command. <sup>{1}</sup>
  
* `+{cmd}` and `-c cmd` : Two options allow you to pass a Vim command as a parameter. <sup>{1}</sup>
  
* Also being a terminal command, you can combine vim with many other terminal commands. <sup>{1}</sup>
  
* `ls -l | vim -` : Redirect the output of the `ls` command to be edited in `Vim`. <sup>{1}</sup>
  
* `man vim` : To learn more about `vim` command in the terminal, check out.  <sup>{1}</sup>
  
* `:help` : To learn more about the Vim editor, continue reading this guide along with the this command. <sup>{1}</sup>

# file management

## Saving a File

* `:write` : To save your changes <sup>{1}</sup>

* `:w` : To save your changes <sup>{1}</sup>

* `:w file.txt` : If this is a new file, you need to give it a name before you can save it. <sup>{1}</sup>

* `:wq` : To save and quit, you can combine the `:w` and `:q` commands. <sup>{1}</sup>

* `:q!` : To quit without saving any changes, add `!` after `:q` to force quit. <sup>{1}</sup>

## Opening a File

* `vim hello1.txt` : To open a file (hello1.txt) on Vim from the terminal. <sup>{1}</sup>

* `vim hello1.txt hello2.txt hello3.txt` : You can also open multiple files at once [in separate buffers] <sup>{1}</sup>

# Buffers, Windows, and Tabs

* Vim uses three display abstractions instead of two: buffers, windows, and tabs. <sup>{1}</sup>

* Before you start, make sure you have the `set hidden` option in vimrc. Without it, whenever you switch buffers and your current buffer is not saved, Vim will prompt you to save the file <sup>{1}</sup>
  
* `~/.vimrc` : Vim's configuration "vimrc" usually placed in your home directory. I have mine on `~/.vimrc`. <sup>{1}</sup>

* `set hidden` option in vimrc. Without it, whenever you switch buffers and your current buffer is not saved, Vim will prompt you to save the file (you don't want that if you want to move quickly). Save it, then source it (run `:source %` from inside the vimrc). <sup>{1}</sup>

## Buffers

* When you open a file in Vim, the data is bound to a buffer. <sup>{1}</sup>
  
* `vim file1.js` : Open "file1.js" in vim. Whenever you open a new file, Vim creates a new buffer. <sup>{1}</sup>
  
* `vim file1.js file2.js` : Open two new files. Vim currently displays `file1.js` buffer, but it actually creates two buffers: `file1.js` buffer and `file2.js` buffer. <sup>{1}</sup>
  
* `:buffers` : To see all the buffers. You should see both `file1.js` and `file2.js` listed. <sup>{1}</sup>
  * `:ls` or `:files` : Alternatively, you can use to see all the buffers. <sup>{1}</sup>
  
* Running `vim file1 file2 file3 ...` filen creates n amount of buffers. <sup>{1}</sup>
  
* Each time you open a new file, Vim create a new buffer for that file. <sup>{1}</sup>
  
* There are several ways you can traverse buffers: <sup>{1}</sup>
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

## Exiting Vim

* `:qall` : If you have multiple buffers opened, you can close all of them with quit-all. <sup>{1}</sup>
  
* `:qall!` : If you want to close all buffers without saving your changes, just add `!` at the end:  <sup>{1}</sup>
  
* `:wqall` : To save and quit all buffers. <sup>{1}</sup>

## Windows

* `vim file1.js` : Open `file1.js` in vim. You are looking at the `file1.js` buffer, displayed through a window. A window is how you are viewing a buffer through. <sup>{1}</sup>
  
* `:split file2.js` : You are looking at two buffers through two windows. The top window displays `file2.js` buffer. The bottom window displays `file1.js` buffer. <sup>{1}</sup>
  
* If you want to navigate between windows, use these shortcuts: <sup>{1}</sup>
  * `Ctrl-W H` : Moves the cursor to the left window
  * `Ctrl-W J` : Moves the cursor to the window below
  * `Ctrl-W K` : Moves the cursor to the window upper
  * `Ctrl-W L` : Moves the cursor to the right window

* `:vsplit file3.js` : You are now seeing three windows displaying three buffers. One window displays `file3.js` buffer, another window displays `file2.js` buffer, and another window displays `file1.js` buffer. <sup>{1}</sup>

* `:buffer file2.js` : You can have multiple windows displaying the same buffer. While you're on the top left window, type this. Now both two windows are displaying `file2.js` buffer. <sup>{1}</sup>
  * If you start typing on a `file2.js` window, you will see that both windows that display `file2.js` buffers are being updated in real-time. <sup>{1}</sup>

* `Ctrl-W C` or type `:quit` : To close the current window. When you close a window, the buffer will still be there (run `:buffers` to confirm this). <sup>{1}</sup>

* Here are some useful normal-mode window commands: <sup>{1}</sup>
  * `Ctrl-W V` : Opens a new vertical split
  * `Ctrl-W S` : Opens a new horizontal split
  * `Ctrl-W C` : Closes a window
  * `Ctrl-W O` : Makes the current window the only one on screen and closes other windows

* And here is a list of useful window command-line commands: <sup>{1}</sup>
  * `:vsplit filename` : Split window vertically
  * `:split filename` : Split window horizontally
  * `:new filename` : Create new window

## Tabs

* A tab is a collection of windows. Think of it like a layout for windows. <sup>{1}</sup>

* When you close a tab in Vim, you are not closing a file. You are only closing the layout. The files opened in that layout are still not closed, they are still opened in their buffers. <sup>{1}</sup>

* `vim file1.js` : Open `file1.js` in vim. <sup>{1}</sup>

* `:tabnew file2.js` : To open `file2.js` in a new tab. Vim autocomplete the file in a new tab by pressing `<Tab>` <sup>{1}</sup>

* Below is a list of useful tab navigations: <sup>{1}</sup>
  * `:tabnew file.txt` : Open file.txt in a new tab
  * `:tabclose` : Close the current tab
  * `:tabnext` : Go to next tab
  * `:tabprevious` : Go to previous tab
  * `:tablast` : Go to last tab
  * `:tabfirst` : Go to first tab

* `gt` : Go to next tab page. <sup>{1}</sup>

* `gT` : Go to previous tab. <sup>{1}</sup>

* `3gt` : Go to the third tab. Pass count as argument to `gt`, where count is tab number. <sup>{1}</sup>

* One advantage of having multiple tabs is you can have different window arrangements in different tabs. Maybe you want your first tab to have 3 vertical windows and second tab to have a mixed horizontal and vertical windows layout. Tab is the perfect tool for the job! <sup>{1}</sup>

* `vim -p file1.js file2.js file3.js` : To start Vim with multiple tabs. <sup>{1}</sup>

## Moving in 3D
  
* Moving between windows is like traveling two-dimensionally along the X-Y axis in Cartesian coordinates. <sup>{1}</sup>

* Moving between buffers is like traveling across the Z axis in Cartesian coordinates.

**Using Buffers, Windows, and Tabs the Smart Way**

* First, I use buffers to store all the required files for the current task. <sup>{1}</sup>
  
* I use multiple windows to view multiple buffers at once, usually when diffing files, reading docs, or following a code flow. <sup>{1}</sup>
  
* Instead of tabs, I use `tmux` windows. I usually use multiple tmux windows at once. For example, one tmux window for client-side codes and another for backend codes. <sup>{1}</sup>
  * [tmux](https://github.com/tmux/tmux/wiki) <sup>{1}</sup>

# Searching Files

## Opening and Editing Files

* `:edit file.txt` : If `file.txt` exists, it opens the `file.txt` buffer. If `file.txt` doesn't exist, it creates a new buffer for `file.txt`. <sup>{1}</sup>

* `:edit a<Tab>c<Tab>u<Tab>` : Autocomplete with `<Tab>` works with `:edit`. For directory `./app/controllers/users_controllers.rb`, you can use `<Tab>` to expand the terms quickly <sup>{1}</sup>

* `:edit *.yml<Tab>` : `:edit` accepts wildcards arguments. `*` matches any file in the current directory. Vim will give you a list of all .yml files in the current directory to choose from. <sup>{1}</sup>

* `:edit **/*.md<Tab>` : You can use `**` to search recursively. If you want to look for all `*.md` files in your project, but you are not sure in which directories, you can do this. <sup>{1}</sup>

* `:edit` can be used to run `netrw`, Vim's built-in file explorer. To do that, give `:edit` a directory argument instead of file: <sup>{1}</sup>
  * `:edit .`
  * `:edit test/unit/`

## Searching Files With Find

* You can find files with :find. For example: <sup>{1}</sup>
  * `:find package.json`
  * `:find app/controllers/users_controller.rb`

* Autocomplete also works with `:find`: <sup>{1}</sup>
  * `:find p<Tab>` : " to find package.json
  * `:find a<Tab>c<Tab>u<Tab>` : " to find app/controllers/users_controller.rb

## Find and Path

* The difference is that `:find` finds file in path, `:edit` doesn't. <sup>{1}</sup>

* `:set path?` : To check what your paths are, do <sup>{1}</sup>

* `path=.,/usr/include,,` : By default, yours probably look like this <sup>{1}</sup>
  * `.` means to search in the directory of the currently opened file. <sup>{1}</sup>
  * `,` means to search in the current directory. <sup>{1}</sup>
  * `/usr/include` is the typical directory for C libraries header files. <sup>{1}</sup>

* you can modify your own paths, where Vim will look for files. <sup>{1}</sup>

* `:set path+=app/controllers/` : You need to add the `app/controllers/` to the current path. Here is how you can do it. when you type `:find u<Tab>`, Vim will now search inside `app/controllers/` directory for files starting with "u". <sup>{1}</sup>

* `:set path+=app/controllers/**` : If you have a nested `controllers/` directory, like `app/controllers/account/users_controller.rb`, Vim won't find `users_controllers`. Instead, you need to add this in order for autocompletion will find `users_controller.rb`. <sup>{1}</sup>

* `:set path+=$PWD/**` : You might be thinking to add the entire project directories so when you press tab, Vim will search everywhere for that file, like this. [this will slow down your search significantly if you have a large number of files in your project. I recommend adding only the `path` of your most visited files / directories.] <sup>{1}</sup>

* `set path+={your-path-here}` : You can add this in your vimrc. <sup>{1}</sup>

## Searching in Files With Grep

* If you need to find in files (find phrases in files), you can use grep. Vim has two ways of doing that: <sup>{1}</sup>
  * Internal grep (`:vim`. Yes, it is spelled `:vim`. It is short for `:vimgrep`). <sup>{1}</sup>
  * External grep (`:grep`). <sup>{1}</sup>

* `:vim /pattern/ file` : Let's go through internal grep first. `:vim` has the following syntax. <sup>{1}</sup>
  * `/pattern/` is a regex pattern of your search term. <sup>{1}</sup>
  * `file` is the file argument. You can pass multiple arguments. Similar to `:find`, you can pass it `*` and `**` wildcards <sup>{1}</sup>

* `:vim /breakfast/ app/controllers/**/*.rb` : To look for all occurrences of "breakfast" string inside all ruby files (`.rb`) inside `app/controllers/` directory. <sup>{1}</sup>

* Vim's `vim` search command uses `quickfix` operation. Here are some useful quickfix commands: <sup>{1}</sup>
  * `:copen` : Open the quickfix window
  * `:cclose` : Close the quickfix window
  * `:cnext` : Go to the next error
  * `:cprevious` : Go to the previous error
  * `:colder` : Go to the older error list
  * `:cnewer` : Go to the newer error list

* `:h quickfix` : To learn more about quickfix, check out. <sup>{1}</sup>

* You may notice that running internal grep (`:vim`) can get slow if you have a large number of matches. This is because Vim loads each matching file into memory, as if it were being edited. <sup>{1}</sup>

* `:grep -R "lunch" app/controllers/` : To search for "lunch" inside a ruby file inside `app/controllers/` directory. It also displays all matches using `quickfix`. <sup>{1}</sup>

* Vim defines the `grepprg` variable to determine which external program to run when running the `:grep`. <sup>{1}</sup>

## Browsing Files With Netrw

* `netrw` is Vim's built-in file explorer. It is useful to see a project's hierarchy. <sup>{1}</sup>

* To run `netrw`, you need these two settings in your `.vimrc`: <sup>{1}</sup>
  * `set nocp`
  * `filetype plugin on`

* You can start `netrw` when you launch Vim by passing it a directory as a parameter instead of a file: <sup>{1}</sup>
  * `vim .`
  * `vim src/client/`
  * `vim app/controllers/`

* To launch `netrw` from inside Vim, you can use the `:edit` command and pass it a directory parameter instead of a filename: <sup>{1}</sup>
  * `:edit .`
  * `:edit src/client/`
  * `:edit app/controllers/`

* There are other ways to launch `netrw` window without passing a directory: <sup>{1}</sup>
  * `:Explore` : Starts netrw on current file
  * `:Sexplore` : No kidding. Starts netrw on split top half of the screen
  * `:Vexplore` : Starts netrw on split left half of the screen

* You can navigate `netrw` with Vim motions. <sup>{1}</sup>

* Here is a list of useful netrw commands: <sup>{1}</sup>
  * `%` : Create a new file
  * `d` : Create a new directory
  * `R` : Rename a file or directory
  * `D` : Delete a file or directory

* `:h netrw` : is very comprehensive <sup>{1}</sup>

* `netrw` related plugins <sup>{1}</sup>
  * [vim-vinegar](https://github.com/tpope/vim-vinegar)
  * [NERDTree](https://github.com/preservim/nerdtree)

## Fzf

* how to use fzf.vim to make searching in Vim easy and powerful <sup>{1}</sup>

## Fzf Setup

* Plugins
  * [vim-plug](https://github.com/junegunn/vim-plug)
  * [fzf](https://github.com/junegunn/fzf)
    * [FZF Vim integration](https://github.com/junegunn/fzf/blob/master/README-VIM.md)
  * [ripgrep](https://github.com/BurntSushi/ripgrep)
  * [fzf.vim](https://github.com/junegunn/fzf.vim)

* In my .zshrc (.bashrc if you use bash), I have these: <sup>{1}</sup>
```shell
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi
```

* Pay attention to `-m` in `FZF_DEFAULT_OPTS`. This option allows us to make multiple selections with `<Tab>` or `<Shift-Tab>`. <sup>{1}</sup>
  * `man fzf` : The fzf command accepts many more options <sup>{1}</sup>

* Add these inside your `.vimrc` plugins. You need to use fzf.vim plugin (created by the same fzf author): <sup>{1}</sup>
```shell
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
```

* After adding these lines, you will need to open `vim` and run `:PlugInstall`. <sup>{1}</sup>

## Fzf Syntax

* To use fzf efficiently, you should learn some basic fzf syntax. Fortunately, the list is short: <sup>{1}</sup>
  * `^` : is a prefix exact match. To search for a phrase starting with "welcome": `^welcome`.
  * `$` : is a suffix exact match. To search for a phrase ending with "my friends": `friends$`.
  * `'` : is an exact match. To search for the phrase "welcome my friends": `'welcome my friends`.
  * `|` : is an "or" match. To search for either "friends" or "foes": `friends | foes`.
  * `!` : is an inverse match. To search for phrase containing "welcome" and not "friends": `welcome !friends`

* `^hello | ^welcome friends$` : will search for the phrase starting with either "welcome" or "hello" and ending with "friends". <sup>{1}</sup>

## Finding Files

* `:Files` : Search for files inside Vim using fzf.vim plugin. Run this from Vim and you will be prompted with fzf search prompt. <sup>{1}</sup>

* Since you will be using this command frequently, it is good to have this mapped to a keyboard shortcut. I map mine to `Ctrl-f`. In my vimrc, I have this: <sup>{1}</sup>
  * `nnoremap <silent> <C-f> :Files<CR>`

## Finding in Files

* `:Rg` : To search inside files, you can use this command. <sup>{1}</sup>

* Again, since you will probably use this frequently, let's map it to a keyboard shortcut. I map mine to `<Leader>f`. The `<Leader>` key is mapped to `\` by default. <sup>{1}</sup>
  * `nnoremap <silent> <Leader>f :Rg<CR>`

## Other Searches

* Fzf.vim provides many other search [commands](https://github.com/junegunn/fzf.vim#commands). <sup>{1}</sup>

* Here's what my fzf maps look like: <sup>{1}</sup>
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

## Replacing Grep With Rg

* Now let's setup `grepprg` so that the `:grep` Vim command uses `ripgrep`. Add this in your vimrc: <sup>{1}</sup>
  * `set grepprg=rg\ --vimgrep\ --smart-case\ --follow`
    * After you updated `grepprg`, now when you run `:grep`, it runs `rg --vimgrep --smart-case --follow` instead of grep.
    * Just like the old `:grep`, this new `:grep` also uses quickfix to display results.
    * `man rg`

## Search and Replace in Multiple Files

* If you want to replace all instances of "pizza" with "donut", here's what you do: <sup>{1}</sup>
  * `:grep "pizza"` : uses ripgrep to search for all instances of "pizza".  (by the way, this would still work even if you didn't reassign `grepprg` to use ripgrep. You would have to do `:grep "pizza" . -R` instead of :grep "pizza"). <sup>{1}</sup>
  * `:cfdo %s/pizza/donut/g | update` : `:cfdo` executes any command you pass to all files in your quickfix list. In this case, your command is the substitution command `%s/pizza/donut/g`. The pipe (`|`) is a chain operator. The `update` command saves each file after substitution. <sup>{1}</sup>

* The second method is to search and replace in selected files. <sup>{1}</sup>
  * `:%bd | e#` : Clear your buffers first. You can either restart Vim or run this command (`%bd` deletes all the buffers and `e#` opens the file you were just on). <sup>{1}</sup>
  * Run `:Files`. <sup>{1}</sup>
  * To select multiple files, use `<Tab>` / `<Shift-Tab>`. This is only possible if you have the multiple flag (`-m`) in `FZF_DEFAULT_OPTS`. <sup>{1}</sup>
  * Run `:bufdo %s/pizza/donut/g | update`. <sup>{1}</sup>
    * The command `:bufdo %s/pizza/donut/g | update` looks similar to the earlier `:cfdo %s/pizza/donut/g | update` command. <sup>{1}</sup>
    * The difference is instead of substituting all quickfix entries (`:cfdo`), you are substituting all buffer entries (`:bufdo`). <sup>{1}</sup>

# Vim Grammar

## How to Learn a Language

* Learn grammar rules.
* Increase vocabulary.
* Practice, practice, practice.

## Grammar Rule
  
* `verb + noun` : There is only one grammar rule in Vim language. <sup>{1}</sup>
  * This is like saying these English phrases:
    * "Eat (verb) a donut (noun)"
    * "Kick (verb) a ball (noun)"
    * "Learn (verb) the Vim editor (noun)"

## Nouns (Motions)

* Nouns are Vim motions. Motions are used to move around in Vim. Below is a list of some of Vim motions: <sup>{1}</sup>
  * `h` : Left
  * `j` : Down
  * `k` : Up
  * `l` : Right
  * `w` : Move forward to the beginning of the next word
  * `}` : Jump to the next paragraph
  * `$` : Go to the end of the line

## Verbs (Operators)

* According to `:h operator`, Vim has 16 operators. <sup>{1}</sup>

* learning these 3 operators is enough for 80% of my editing needs: <sup>{1}</sup>
  * `y` : Yank text (copy)
  * `d` : Delete text and save to register
  * `c` : Delete text, save to register, and start insert mode

## Verb and Noun

* let's apply the grammar rule, verb + noun! <sup>{1}</sup>
  * `y$` : To yank everything from your current location to the end of the line
  * `dw` : To delete from your current location to the beginning of the next word
  * `c}` : To change from your current location to the end of the current paragraph

* Motions also accept count number as arguments. Count works with Vim grammar. <sup>{1}</sup>
  * `3k` : If you need to go up 3 lines, instead of pressing `k` 3 times, you can do this.
  * `y2h` : To yank two characters to the left
  * `d2w` : To delete the next two words
  * `c2j` : To change the next two lines

* `dd`, `yy`, and `cc` perform deletion, yank, and change on the entire line <sup>{1}</sup>

* Vim has one more type of noun: text objects. <sup>{1}</sup>

## More Nouns (Text Objects)

* There are two types of text objects: inner and outer text objects. <sup>{1}</sup>
  * `i + object` : Inner text object
  * `a + object` : Outer text object
  * Inner text object selects the object inside without the white space or the surrounding objects.
  * Outer text object selects the object inside including the white space or the surrounding objects.

* If your cursor is somewhere inside the parentheses in the expression `(hello Vim)` <sup>{1}</sup>
  * `di(` : To delete the text inside the parentheses without deleting the parentheses
  * `da(` : To delete the parentheses and the text inside

* Example <sup>{1}</sup>
```javascript
const hello = function() {
  console.log("Hello Vim");
  return true;
}
```
  * `di(` : To delete the entire "Hello Vim" <sup>{1}</sup>
  * `di{` : To delete the content of function (surrounded by `{}`) <sup>{1}</sup>
  * `diw` : To delete the "Hello" string <sup>{1}</sup>

* These HTML tags: <sup>{1}</sup>
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

* Below is a list of common text objects: <sup>{1}</sup>
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
  * \` : A pair of \` \`

* `:h text-objects` : To learn more text objects, check out this. <sup>{1}</sup>

## Composability and Grammar

* Suppose you have this messy text below and you want to tabularize it: <sup>{1}</sup>
```shell
Id|Name|Cuteness
01|Puppy|Very
02|Kitten|Ok
03|Bunny|Ok
```

* With your cursor on "Id", run `!}column -t -s "|"` <sup>{1}</sup>
  * The verb was `!` (filter operator) and the noun was `}` (go to next paragraph). The filter operator `!` accepted another argument, a terminal command, so I gave it `column -t -s "|"`.

* Now you have this pretty tabular data with just one quick command: <sup>{1}</sup>
```shell
Id  Name    Cuteness
01  Puppy   Very
02  Kitten  Ok
03  Bunny   Ok
```
  
* Suppose you want to not only tabularize your text, but to display only the rows with "Ok". You know that awk can do the job easily. You can do this instead: <sup>{1}</sup>
  * `!}column -t -s "|" | awk 'NR > 1 && /Ok/ {print $0}'`
  * Result
  ```shell
  02  Kitten  Ok
  03  Bunny   Ok
  ```

* The external command operator can also use pipe (`|`). <sup>{1}</sup>

* Plugins <sup>{1}</sup>
  * [vim-textobj-user](https://github.com/kana/vim-textobj-user)
  * [vim-textobj-user list](https://github.com/kana/vim-textobj-user/wiki)

## Learn Vim Grammar the Smart Way

* `gUiw` : uppercase the current word <sup>{1}</sup>

# Moving in a File

* `:h motion.txt` : If you need to learn more motion, check out <sup>{1}</sup>

## Character Navigation

* The most basic motion unit is moving one character left, down, up, and right. <sup>{1}</sup>
  * `h` : Left
  * `j` : Down
  * `k` : Up
  * `l` : Right
  * `gj` : Down in a soft-wrapped line
  * `gk` : Up in a soft-wrapped line

* Plugins <sup>{1}</sup>
  * [vim-hardtime](https://github.com/takac/vim-hardtime)

## Relative Numbering

* You can do it by having this on `.vimrc`: <sup>{1}</sup>
  * `set relativenumber number`
  * `d12j` : With relative numbering, I can easily spot that my target text is 12 lines below me so I can do this command to delete them.

## Count Your Move

* `12j` :  you can go down 12 lines with <sup>{1}</sup>

* `[count] + motion` : The syntax to use count with your motion is <sup>{1}</sup>

* `9l` :  If you want to move 9 characters to the right, instead of pressing `l` 9 times, you can do <sup>{1}</sup>

## Word Navigation

* WORD uses the same letters as word, only uppercased. <sup>{1}</sup>
  * `w` : Move forward to the beginning of the next word
  * `W` : Move forward to the beginning of the next WORD
  * `e` : Move forward one word to the end of the next word
  * `E` : Move forward one word to the end of the next WORD
  * `b` : Move backward to beginning of the previous word
  * `B` : Move backward to beginning of the previous WORD
  * `ge` : Move backward to end of the previous word
  * `gE` : Move backward to end of the previous WORD

* So what are the similarities and differences between a word and a WORD? <sup>{1}</sup>
  * A word is a sequence of characters containing only `a-zA-Z0-9_`.
  * A WORD is a sequence of all characters except white space (a white space means either space, tab, and EOL).
  * To learn more, check out 
    * `:h word` : Help about "word"
    * `:h WORD` : Help about "WORD"

* For example, suppose you have: <sup>{1}</sup>
```javascript
const hello = "world";
```
  * `l` : With your cursor at the start of the line, to go to the end of the line with, it will take you 21 key presses.
  * `w` : it will take 6 key presses.
  * `W`, it will only take 4 key presses.

## Current Line Navigation

* Navigation commands <sup>{1}</sup>
  * `0` : Go to the first character in the current line
  * `^` : Go to the first nonblank char in the current line
  * `g_` : Go to the last non-blank char in the current line
  * `$` : Go to the last char in the current line
  * `n|` : Go the column n in the current line

* Search commands <sup>{1}</sup>
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

* Back at the previous example: <sup>{1}</sup>
```javascript
const hello = "world";
```
  * `$` : With your cursor at the start of the line, you can go to the last character in current line (";") with one keypress
  * `fw` : If you want to go to "w" in "world", you can use this
  
## Sentence and Paragraph Navigation

* A sentence ends with either `. ! ?` followed by an EOL, a space, or a tab. <sup>{1}</sup>

* Sentence navigation <sup>{1}</sup>
  * `(` : Jump to the previous sentence
  * `)` : Jump to the next sentence

* Which phrases do you think are sentences and which aren't? Try navigating with ( and ) in Vim! <sup>{1}</sup>
```shell
I am a sentence. I am another sentence because I end with a period. I am still a sentence when ending with an exclamation point! What about question mark? I am not quite a sentence because of the hyphen - and neither semicolon ; nor colon :

There is an empty line above me.
```

* By the way, if you're having a problem with Vim not counting a sentence for phrases separated by `.` followed by a single line, you might be in `'compatible'` mode. Add `set nocompatible` into vimrc. In Vi, a sentence is a `.` followed by two spaces. You should have `nocompatible` set at all times. <sup>{1}</sup>

* Paragraph navigation <sup>{1}</sup>
  * `{` : Jump to the previous paragraph
  * `}` : Jump to the next paragraph

* Try navigating around with } and { (also, play around with sentence navigations ( ) to move around too!) <sup>{1}</sup>
```shell
Hello. How are you? I am great, thanks!
Vim is awesome.
It may not easy to learn it at first...- but we are in this together. Good luck!

Hello again.

Try to move around with ), (, }, and {. Feel how they work.
You got this.
```

* Check out `:h sentence` and `:h paragraph` to learn more. <sup>{1}</sup>

## Match Navigation

* You can also use this to find out whether you have matching parentheses, braces, and brackets. <sup>{1}</sup>
  * `%` : Navigate to another match, usually works for (), [], {}

* I personally like to complement % with visual indicators plugins like [vim-rainbow](https://github.com/frazrepo/vim-rainbow). For more, check out `:h %`. <sup>{1}</sup>

## Line Number Navigation

* Commands <sup>{1}</sup>
  * `gg` : Go to the first line
  * `G` : Go to the last line
  * `nG` : Go to line n
  * `n%` : Go to n% in file

* `Ctrl-g` : If you want to see total lines in a file, you can use <sup>{1}</sup>

## Window Navigation

* Commands <sup>{1}</sup>
  * `H` : Go to top of screen
  * `M` : Go to medium screen
  * `L` : Go to bottom of screen
  * `nH` : Go n line from top
  * `nL` : Go n line from bottom

## Scrolling

* Commands <sup>{1}</sup>
  * `Ctrl-E` : Scroll down a line
  * `Ctrl-D` : Scroll down half screen
  * `Ctrl-F` : Scroll down whole screen
  * `Ctrl-Y` : Scroll up a line
  * `Ctrl-U` : Scroll up half screen
  * `Ctrl-B` : Scroll up whole screen

* Scroll relatively to the current line (zoom screen sight): <sup>{1}</sup>
  * `zt`    Bring the current line near the top of your screen
  * `zz`    Bring the current line to the middle of your screen
  * `zb`   Bring the current line near the bottom of your screen

## Search Navigation

* Commands <sup>{1}</sup>
  * `/`    Search forward for a match
  * `?`    Search backward for a match
  * `n`    Repeat last search in same direction of previous search
  * `N`    Repeat last search in opposite direction of previous search

* `set hlsearch` : You can enable search highlight with this. <sup>{1}</sup>
  * Now when you search for `/let`, it will highlight all matching phrases in the file.

* `set incsearch` : you can set incremental search with this <sup>{1}</sup>
  * This will highlight the pattern while typing. By default, your matching phrases will remain highlighted until you search for another phrase.

* `:nohlsearch` or simply `:noh` To disable highlight, you can run this. <sup>{1}</sup>

* Because I use this no-highlight feature frequently, I created a map in `vimrc`: <sup>{1}</sup>
  * `nnoremap <esc><esc> :noh<return><esc>`

* Word search commands <sup>{1}</sup>
  * `*` : Search for whole word under cursor forward
  * `#` : Search for whole word under cursor backward
  * `g*` : Search for word under cursor forward
  * `g#`    Search for word under cursor backward

## Marking Position

* Commands <sup>{1}</sup>
  * `ma`    Mark position with mark "a"
  * `` `a ``   Jump to line and column "a"
  * `'a`    Jump to line "a"

* Lowercase alphabets are local marks and uppercase alphabets are global marks (sometimes known as file marks). <sup>{1}</sup>

* Global marks can travel across files. <sup>{1}</sup>

* `:marks` : To view all marks, use this <sup>{1}</sup>

* You may notice from the marks list there are more marks other than `a-zA-Z`. Some of them are: <sup>{1}</sup>
```shell
''    Jump back to the last line in current buffer before jump
``    Jump back to the last position in current buffer before jump
`[    Jump to beginning of previously changed / yanked text
`]    Jump to the ending of previously changed / yanked text
`<    Jump to the beginning of last visual selection
`>    Jump to the ending of last visual selection
`0    Jump back to the last edited file when exiting vim
```
  
* `:h marks` : check out all marks <sup>{1}</sup>

## Jump

* Here are the commands Vim consider as "jump" commands: <sup>{1}</sup>
```shell
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

* `:jumps` : Vim keeps track of where you've been when you move around and you can see this list inside this. <sup>{1}</sup>

* `:h jump-motions` : For more jumps, check out this. <sup>{1}</sup>

* `Ctrl-O` : you can navigate the jump list with this to move up the jump list <sup>{1}</sup>

* `Ctrl-I` : to move down the jump list. <sup>{1}</sup>

* you can manually add the current location to jump list with `m'` before movement. <sup>{1}</sup>

* `m'5j` : adds current location to jump list and goes down 5 lines <sup>{1}</sup>

## Learn Navigation the Smart Way

* Watch for repeated actions: Use `l` -> `w` -> `f` for faster movement. <sup>{1}</sup>

# Insert Mode

## Ways to Go to Insert Mode

* There are many ways to get into insert mode from the normal mode. Here are some of them: <sup>{1}</sup>
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

## Different Ways to Exit Insert Mode

* There are a few different ways to return to the normal mode while in the insert mode: <sup>{1}</sup>
  * `<Esc>` : Exits insert mode and go to normal mode
  * `Ctrl-[` : Exits insert mode and go to normal mode
  * `Ctrl-C` : Like Ctrl-[ and <Esc>, but does not check for abbreviation

* I find `<Esc>` key too far to reach, so I map my computer `<Caps-Lock>` to behave like `<Esc>`. <sup>{1}</sup>

* Another common convention I have seen Vim users do is mapping `<Esc>` to `jj` or `jk` in insert mode. <sup>{1}</sup>
  * If you prefer this option add this one of those lines (or both) in your vimrc file.
  ```shell
  inoremap jj <Esc>
  inoremap jk <Esc>
  ```

## Repeating Insert Mode

* `10i` : You can pass a count parameter before entering insert mode. If you type "hello world!" and exit insert mode, Vim will repeat the text 10 times. <sup>{1}</sup>
  * This will work with any insert mode method (ex: `10I`, `11a`, `12o`).

## Deleting Chunks in Insert Mode

* It may make more sense to go to normal mode and delete your mistake. <sup>{1}</sup>

* You can also delete several characters at a time while in insert mode. <sup>{1}</sup>
  * `Ctrl-h` : Delete one character
  * `Ctrl-w` : Delete one word
  * `Ctrl-u` : Delete the entire line

## Insert From Register

* Vim registers can store texts for future use. <sup>{1}</sup>

* `"ayiw` : first you need to yank a word to register a. Move your cursor on any word. Then type this. <sup>{1}</sup>
  * `"a` tells Vim that the target of your next action will go to register `a`.
  * `yiw` yanks inner word. Review the chapter on Vim grammar for a refresher.

* `Ctrl-R a` : While in insert mode, to paste the text stored in register `a` <sup>{1}</sup>

## Scrolling

* While in insert mode, if you go to Ctrl-X sub-mode, you can do additional operations. Scrolling is one of them. <sup>{1}</sup>
  * `Ctrl-X Ctrl-Y` : Scroll up
  * `Ctrl-X Ctrl-E` : Scroll down

## Autocompletion

* if you press `Ctrl-X` from insert mode, Vim will enter a sub-mode. <sup>{1}</sup>
  
* Here are some useful autocomplete commands to get started: <sup>{1}</sup>
  * `Ctrl-X Ctrl-L` : Insert a whole line
  * `Ctrl-X Ctrl-N` : Insert a text from current file
  * `Ctrl-X Ctrl-I` : Insert a text from included files
  * `Ctrl-X Ctrl-F` : Insert a file name

* When you trigger autocompletion, Vim will display a pop-up window. To navigate up and down the pop-up window, use `Ctrl-N` and `Ctrl-P`. <sup>{1}</sup>

* Vim also has two autocompletion shortcuts that don't involve the Ctrl-X sub-mode: <sup>{1}</sup>
  * `Ctrl-N` : Find the next word match
  * `Ctrl-P` : Find the previous word match

## Executing a Normal Mode Command

* `Ctrl-O` : While in insert mode, if you press this, you'll be in insert-normal sub-mode. <sup>{1}</sup>

* Centering and jumping <sup>{1}</sup>
  * `Ctrl-O zz` : Center window
  * `Ctrl-O H/M/L` : Jump to top/middle/bottom window
  * `Ctrl-O 'a` : Jump to mark a

* Repeating text <sup>{1}</sup>
  * `Ctrl-O 100ihello` : Insert "hello" 100 times

* Executing terminal commands <sup>{1}</sup>
  * `Ctrl-O !! curl https://google.com` : Run curl
  * `Ctrl-O !! pwd` : Run pwd

* Deleting faster <sup>{1}</sup>
  * `Ctrl-O dtz` : Delete from current location till the letter "z"
  * `Ctrl-O D` : Delete from current location to the end of the line

## Learn Insert Mode the Smart Way
 
* Develop a habit to go to normal mode when your fingers aren't typing new text. <sup>{1}</sup>

# Dot Command

* use the dot command to easily redo the previous change. <sup>{1}</sup>

## Usage
  
* For example, if you want to replace all "let" with "const" in the following expressions: <sup>{1}</sup>
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

* Here the dot command repeated the `cwconst<Esc>` sequence. <sup>{1}</sup>

**What Is a Change?**
 
* `:h .` : look at the definition of the dot command by this, it says that the dot command repeats the last change. <sup>{1}</sup>

* Any time you update (add, modify, or delete) the content of the current buffer, you are making a change. <sup>{1}</sup>

* Now suppose you have this text: <sup>{1}</sup>
  * `pancake, potatoes, fruit-juice,`
  * To delete the text from the start of the line to the next occurrence of a comma, first delete to the comma, then repeat twice it with `df,..`

* Let's try another example: <sup>{1}</sup>
  * `pancake, potatoes, fruit-juice,`
  * After you run `f`, then `x`, go to the next comma with `;` to repeat the latest `f`. Finally, use `.` to delete the character under the cursor. Repeat `; . ; .` until everything is deleted. The full command is `f,x;.;.`

* Let's try another one: <sup>{1}</sup>
```shell
pancake
potatoes
fruit-juice
```
  * Let's add a comma at the end of each line. Starting at the first line, do `A,<Esc>j`. By now, you realize that j does not cause a change. The change here is only `A,`. You can move and repeat the change with `j . j ..` The full command is `A,<Esc>j.j.` <sup>{1}</sup>

## Multi-line Repeat

* Suppose you have this text: <sup>{1}</sup>
```js
let one = "1";
let two = "2";
let three = "3";
const foo = "bar";
let four = "4";
let five = "5";
let six = "6";
let seven = "7";
let eight = "8";
let nine = "9";
```
  * Your goal is to delete all lines except the "foo" line. First, delete the first three lines with `d2j`, then to the line below the "foo" line. On the next line, use the dot command twice. The full command is `d2jj..` <sup>{1}</sup>

* Let's look at another example: <sup>{1}</sup>
```js
zlet zzone = "1";
zlet zztwo = "2";
zlet zzthree = "3";
let four = "4";
```
  * Let's remove all the z's. Starting from the first character on the first line, visually select only the first z from the first three lines with blockwise visual mode (`Ctrl-Vjj`). delete them with the delete operator (`d`). Then move to the next word (`w`) to the next z. Repeat the change two more times (`..`). The full command is `Ctrl-vjjdw..` <sup>{1}</sup>

## Including a Motion in a Change
 
* replaced all "let" with "const" in the following expressions: <sup>{1}</sup>
```js
let one = "1";
let two = "2";
let three = "3";
```
  * After you searched `/let`, run `cgnconst<Esc>` then `. .` <sup>{1}</sup>
  * `gn` is a motion that searches forward for the last search pattern (in this case, `/let`) and automatically does a visual highlight. To replace the next occurrence, you no longer have to move and repeat the change ( `n . n .`), but only repeat (`. .`). <sup>{1}</sup>

## Learn the Dot Command the Smart Way

* The dot command is a versatile command for automating single changes. <sup>{1}</sup>

* automate more complex actions with Vim macros. <sup>{1}</sup>

# Registers

* You've probably used Vim registers when you yanked or deleted a text then pasted it with `p` or `P`. <sup>{1}</sup>

* Vim has 10 different types of registers <sup>{1}</sup>

## The Ten Register Types <sup>{1}</sup>
  
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

## Register Operators

* To use registers, you need to first store them with operators. Here are some operators that store values to registers: <sup>{1}</sup>
  * `y` : Yank (copy)
  * `c` : Delete text and start insert mode
  * `d` : Delete text

* To paste a text from registers, you can use: <sup>{1}</sup>
  * `p` : Paste the text after the cursor
  * `P` : Paste the text before the cursor

* `10"ap` : To paste the text from register a ten times, do  this <sup>{1}</sup>

## Calling Registers From Insert Mode

* `Ctrl-R a` : The syntax to call registers from insert mode is <sup>{1}</sup>

## The Unnamed Register

* `""p` : To get the text from the unnamed register, do this. It stores the last text you yanked, changed, or deleted. <sup>{1}</sup>

## The Numbered Registers

**The Yanked Register**

* If you yank an entire line of text (`yy`), Vim actually saves that text in two registers: <sup>{1}</sup>
  * The unnamed register (`p`).
  * The yanked register (`"0p`).

* For example, if you: <sup>{1}</sup>
  * Yank a line (`yy`)
  * Delete a line (`dd`)
  * Delete another line (`dd`)
  * The yanked register will have the text from step one.

* If you: <sup>{1}</sup>
  * Yank a line (`yy`)
  * Delete a line (`dd`)
  * Yank another line (`yy`)
  * The yanked register will have the text from step three.

* `Ctrl-R 0` : while in insert mode, you can quickly paste the text you just yanked using this <sup>{1}</sup>

**The Non-zero Numbered Registers**

* When you change or delete a text that is at least one line long, that text will be stored in the numbered registers 1-9 sorted by the most recent. <sup>{1}</sup>

* For example, if you have these lines: <sup>{1}</sup>
```shell
line three
line two
line one
```
  * With your cursor on "line three", delete them one by one with `dd`. Once all lines are deleted, register 1 should contain "line one" (most recent), register two "line two" (second most recent), and register three "line three" (oldest). To get the content from register one, do `"1p`. <sup>{1}</sup>
  
  * these numbered registers are automatically incremented when using the dot command. <sup>{1}</sup>
    * Do `"1P` to paste the content from the numbered register one ("1).
    * Do `.` to paste the content from the numbered register two ("2).
    * Do `.` to paste the content from the numbered register three ("3).

**The Small Delete Register**

* Changes or deletions less than one line are not stored in the numbered registers 0-9, but in the small delete register (`"-`). <sup>{1}</sup>

* For example: <sup>{1}</sup>
  * Delete a word (`diw`)
  * Delete a line (`dd`)
  * Delete a line (`dd`)
  * `"-p` gives you the deleted word from step one.

* Another example: <sup>{1}</sup>
  * I delete a word (`diw`)
  * I delete a line (`dd`)
  * I delete a word (`diw`)
  * `"-p` gives you the deleted word from step three. `"1p` gives you the deleted line from step two.

## The Named Register

* The named registers are Vim's most versatile register. It can store yanked, changed, and deleted texts into registers a-z. <sup>{1}</sup>

* To yank a word into register a, you can do it with `"ayiw`. <sup>{1}</sup>
  * `"a` tells Vim that the next action (delete / change / yank) will be stored in register a.
  * `yiw` yanks the word.

* To get the text from register a, run `"ap` <sup>{1}</sup>

## The Read-only Registers

* Vim has three read-only registers: `.`, `:`, and `%`. They are pretty simple to use: <sup>{1}</sup>
  * `.` : Stores the last inserted text
  * `:` : Stores the last executed command-line
  * `%` : Stores the name of current file
    * If the last text you wrote was "Hello Vim", running `".p` will print out the text "Hello Vim". 
    * If you want to get the name of current file, run `"%p`. 
    * If you run `:s/foo/bar/g` command, running `":p` will print out the literal text "s/foo/bar/g".

## The Alternate File Register

* An alternative file is the last file you opened. To insert the name of the alternate file, you can use `"#p`. <sup>{1}</sup>

## The Expression Register

* Vim has an expression register, `"=`, to evaluate expressions. <sup>{1}</sup>

* To evaluate mathematical expressions `1 + 1`, run: <sup>{1}</sup>
  * `"=1+1<Enter>p`

* To evaluate mathematical expression from insert mode, you can do: <sup>{1}</sup>
  * `Ctrl-R =1+1`

* If you wish to get the text from register a: <sup>{1}</sup>
  * `"=@a`
  * Then press `<Enter>`, then `p`.

* Similarly, to get values from register a while in insert mode: <sup>{1}</sup>
  * `Ctrl-r =@a`

## The Selection Registers

* Vim has two selection registers: `quotestar` (`"*`) and quoteplus (`"+`). You can use them to access copied text from external programs. <sup>{1}</sup>

* If you are on an external program (like Chrome browser) and you copy a block of text with `Ctrl-C` (or `Cmd-C`, depending on your OS), normally you wouldn't be able to use `p` to paste the text in Vim. However, both Vim's `"+` and `"*` are connected to your clipboard, so you can actually paste the text with  `"+p` or `"*p`. Conversely, if you yank a word from Vim with `"+yiw` or `"*yiw`, you can paste that text in the external program with `Ctrl-V` (or `Cmd-V`). Note that this only works if your Vim program comes with the `+clipboard` option (to check it, run `:version`). <sup>{1}</sup>

* I find doing `=*p` or `=+p` (or `"*p` or `"+p`) to be cumbersome. To make Vim to paste copied text from the external program with just `p`, you can add this in your vimrc: <sup>{1}</sup>
```shell
set clipboard=unnamed
```
  * Now when I copy a text from an external program, I can paste it with the unnamed register, `p`. I can also copy a text from Vim and paste it to an external program. If you have `+xterm_clipboard` on, you may want to use both `unnamed` and `unnamedplus` clipboard options. <sup>{1}</sup>

## The Black Hole Register

* `"_dd` : To delete a line and not have Vim store the deleted line into any register, use this. <sup>{1}</sup>

## The Last Search Pattern Register
  
* To paste your last search (`/` or `?`), you can use the last search pattern register (`"/`). To paste the last search term, use `"/p`. <sup>{1}</sup>

## Viewing the Registers

* To view all your registers, use the `:register` command. To view only registers "a, "1, and "-, use `:register a 1 -`. <sup>{1}</sup>

* There is a plugin called [vim-peekaboo](https://github.com/junegunn/vim-peekaboo) that lets you to peek into the contents of the registers when you hit `"` or `@` in normal mode and `Ctrl-R` in insert mode. <sup>{1}</sup>

## Executing a Register

* named registers can also execute macros with `@`. <sup>{1}</sup>

## Clearing a Register

* if you run `qaq`, Vim will record an empty macro in the register a. <sup>{1}</sup>

* Another alternative is to run the command `:call setreg('a', 'hello register a')` where a is the register a and "hello register a" is the text that you want to store. <sup>{1}</sup>

* One more way to clear register is to set the content of "a register to an empty string with the expression `:let @a = ''`. <sup>{1}</sup>

## Putting the Content of a Register

* if you run `:put a`, Vim will print the content of register a below the current line. <sup>{1}</sup>

* `:10put a` will paste text from register a to below line 10. <sup>{1}</sup>

* to insert blank lines below all lines that contain the text "end", run `:g/end/put _`. <sup>{1}</sup>

# Macros

## Basic Macros

* Here is the basic syntax of a Vim macro: <sup>{1}</sup>
  * `qa` : Start recording a macro in register `a`
  * `q (while recording)` : Stop recording macro

* You can choose any lowercase letters (a-z) to store macros. Here is how you can execute a macro: <sup>{1}</sup>
  * `@a` : Execute macro from register `a`
  * `@@` : Execute the last executed macros

* Suppose you have this text and you want to uppercase everything on each line: <sup>{1}</sup>
```shell
hello
vim
macros
are
awesome
```
  * `qa0gU$jq` : With your cursor at the start of the line "hello", run this
  * The breakdown:
    * `qa` : starts recording a macro in the a register.
    * `0` : goes to beginning of the line.
    * `gU$` : uppercases the text from your current location to the end of the line.
    * `j` : goes down one line.
    * `q` : stops recording.
  * To replay it, run `@a`. Just like many other Vim commands, you can pass a count argument to macros. For example, running `3@a` executes the macro three times.

## Safety Guard

* Macro execution automatically ends when it encounters an error. Suppose you have this text: <sup>{1}</sup>
```shell
a. chocolate donut
b. mochi donut
c. powdered sugar donut
d. plain donut
```
  * `qa0W~jq` : If you want to uppercase the first word on each line, this macro should work
  * Here's the breakdown of the command above:
    * `qa` : starts recording a macro in the a register.
    * `0` : goes to the beginning of the line.
    * `W` : goes to the next WORD.
    * `~` : toggles the case of the character under the cursor.
    * `j` : goes down one line.
    * `q` : stops recording.

  * I prefer to overcount my macro execution than undercount it, so I usually call it ninety-nine times (`99@a`). With this command, Vim does not actually run this macro ninety-nine times. When Vim reaches the last line and runs `j` motion, it finds no more line to go down to, throws an error, and stops the macro execution. <sup>{1}</sup>

  * The fact that macro execution stops upon the first error encounter is a good feature, otherwise Vim will continue to execute this macro ninety-nine times even though it already reaches the end of the line. <sup>{1}</sup>

## Command Line Macro

* Running `@a` in normal mode is not the only way you can execute macros in Vim. <sup>{1}</sup>

* You can also run `:normal` `@a` command line. `:normal` allows the user to execute any normal mode command passed as argument. In the case above, it is the same as running `@a` from normal mode. <sup>{1}</sup>

* The `:normal` command accepts range as arguments. You can use this to run macro in select ranges. If you want to execute your macro between lines 2 and 3, you can run `:2,3 normal @a`. <sup>{1}</sup>

**Executing a Macro Across Multiple Files**

* Suppose you have multiple `.txt` files, each contains some texts. Your task is to uppercase the first word only on lines containing the word "donut". Assume you have `0W~j` in register a (the same macro as before). <sup>{1}</sup>

  * Here is how you can do it:
    * `:args *.txt` : to find all .txt files in your current directory.
    * `:argdo g/donut/normal @a` executes the global command `g/donut/normal @a` on each file inside `:args`.
    * `:argdo update` executes update command to save each file inside `:args` when the buffer has been modified.

## Recursive Macro

* `qaqqa0W~j@aq` : Let's do it recursively <sup>{1}</sup>

* Here is the breakdown of the steps: <sup>{1}</sup>
  * `qaq` : records an empty macro `a`. It is necessary to start with an empty register because when you recursively call the macro, it will run whatever is in that register.
  * `qa` : starts recording on register` a`.
  * `0` : goes to the first character in the current line.
  * `W` : goes to the next WORD.
  * `~` : toggles the case of the character under the cursor.
  * `j` : goes down one line.
  * `@a` : executes macro `a`.
  * `q` : stops recording.

* Now you can just run @a and watch Vim execute the macro recursively. <sup>{1}</sup>

* How did the macro know when to stop? When the macro was on the last line, it triedto run `j`, since there was no more line to go to, it stopped the macro execution. <sup>{1}</sup>

## Appending a Macro

* `qAA.<Esc>q` : Record a macro in register a: `qa0W~q` (this sequence toggles the case of the next WORD in a line). If you want to append a new sequence to also add a dot at the end of the line, run: <sup>{1}</sup>
  * The breakdown: <sup>{1}</sup>
    * `qA` : starts recording the macro in register A. <sup>{1}</sup>
    * `A.<Esc>` : inserts at the end of the line (here `A` is the insert mode command, not to be confused with the macro A) a dot, then exits insert mode. <sup>{1}</sup>
    * `q` : stops recording macro. <sup>{1}</sup>
  * Now when you execute `@a`, it not only toggles the case of the next WORD, it also adds a dot at the end of the line. <sup>{1}</sup>

## Amending a Macro

* `0W~A.<Esc>` : Assume that you have a macro that toggles the first actual word and adding a period at the end of the line, `0W~A.<Esc>` in register a. <sup>{1}</sup>

* `0W~A.^[` : First, let's call the existing macro (assume you have kept the macro from the previous section in register a) with `:put a`: <sup>{1}</sup>

* What is this `^[`? Didn't you do `0W~A.<Esc>`? Where is the `<Esc>`? `^[` is Vim's *internal code* representation of `<Esc>`. With certain special keys, Vim prints the representation of those keys in the form of internal codes. Some common keys that have internal code representations are `<Esc>`, `<Backspace>`, and `<Enter>`. There are more special keys, but they are not within the scope of this chapter.

* Back to the macro, right after the toggle case operator (`~`), let's add the instructions to go to the end of the line (`$`), go back one word (`b`), go to the insert mode (`i`), type "deep fried " (don't forget the space after "fried "), and exit insert mode (`<Esc>`).

* Here is what you will end up with: 
```
0W~$bideep fried <Esc>A.^[
```

* There is a small problem. Vim does not understand `<Esc>`. You can't literally type `<Esc>`. You will have to write the internal code representation for the `<Esc>` key. While in insert mode, you press `Ctrl-V` followed by `<Esc>`. Vim will print `^[`.` Ctrl-V` is an insert mode operator to insert the next non-digit character *literally*. Your macro code should look like this now:
```
0W~$bideep fried ^[A.^[
```

* To add the amended instruction into register a, you can do it the same way as adding a new entry into a named register. At the start of the line, run `"ay$` to store the yanked text in register a.

* Now when you execute `@a`, your macro will toggle the case of the first word, add "deep fried " before "donut", and add a "." at the end of the line. Yum!

* An alternative way to amend a macro is to use a command line expression. Do `:let @a="`, then do `Ctrl-R a`, this will literally paste the content of register a. Finally, don't forget to close the double quotes (`"`). You might have something like `:let @a="0W~$bideep fried ^[A.^["`.

## Macro Redundancy

* You can easily duplicate macros from one register to another. For example, to duplicate a macro in register a to register z, you can do `:let @z = @a`. `@a` represents the content of register a. Now if you run `@z`, it does the exact same actions as `@a`.

**Series vs Parallel Macro**

* Vim can execute macros in series and parallel. Suppose you have this text:
```
import { FUNC1 } from "library1";
import { FUNC2 } from "library2";
import { FUNC3 } from "library3";
import { FUNC4 } from "library4";
import { FUNC5 } from "library5";
```

* If you want to record a macro to lowercase all the uppercased "FUNC", this macro should work:
```
qa0f{gui{jq
```

* The breakdown:
  * `qa` starts recording in register a.
  * `0` goes to first line.
  * `f{` finds the first instance of "{".
  * `gui{` lowercases (`gu`) the text inside the bracket text-object (`i{`).
  * `j` goes down one line.
  * `q` stops macro recording.

* Now you can run `99@a` to execute it on the remaining lines. However, what if you have this import expression inside your file?
```
import { FUNC1 } from "library1";
import { FUNC2 } from "library2";
import { FUNC3 } from "library3";
import foo from "bar";
import { FUNC4 } from "library4";
import { FUNC5 } from "library5";
```

* Running `99@a`, only executes the macro three times. It does not execute the macro on last two lines because the execution fails to run `f{` on the "foo" line. This is expected when running the macro in series. You can always go to the next line where "FUNC4" is and replay that macro again. But what if you want to get everything done in one go?

* Run the macro in parallel.

* Recall from earlier section that macros can be executed using the  command line command `:normal` (ex: `:3,5 normal @a` executes macro a on lines 3-5). If you run `:1,$ normal @a`, you will see that the macro is being executed on all lines except the "foo" line. It works!

* Although internally Vim does not actually run the macros in parallel, outwardly, it behaves like it. Vim executes `@a` *independently* on each line from the first to the last line (`1,$`). Since Vim executes these macros independently, each line does not know that one of the macro executions had failed on the "foo" line.

# Undo

## Undo, Redo, and UNDO

* press `u` OR run `:undo` : To perform a basic undo

* press `Ctrl-R` or run `:redo` : To redo the last change

* press `U` : It undoes all latest changes.

* Vim sets a maximum number of how many times you can undo in `undolevels` option variable.

* You can check it with `:echo &undolevels`.

* To change yours to 1000, run `:set undolevels=1000`.

## Breaking the Blocks

* pressing `Ctrl-G u` : When you are typing in insert mode, this creates an undo breakpoint.

* It is also useful to create an undo breakpoint when deleting chunks in insert mode with `Ctrl-W` (delete the word before the cursor) and `Ctrl-U` (delete all text before the cursor).

## Undo Tree

* To traverse each undo tree nodes, you can use `g+` to go to a newer state and `g-` to go to an older state.

* The difference between `u`, `Ctrl-R`, `g+`, and `g-` is that both `u` and `Ctrl-R` traverse only the main nodes in undo tree while `g+` and `g-` traverse all nodes in the undo tree.

* I find [vim-mundo](https://github.com/simnalamburt/vim-mundo) plugin to be very useful to help visualize Vim's undo tree.

## Persistent Undo

* `:wundo! mynumbers.undo` : create your undo file with `:wundo {my-undo-file}`. If you need to overwrite an existing undo file, you can add `!` after `wundo`.

* `:rundo mynumbers.undo` : load your undo history by reading the undo file with `:rundo`

* If you want to have an automatic undo persistence, one way to do it is by adding these in `vimrc`:
```shell
set undodir=~/.vim/undo_dir
set undofile
```
  * `set undofile` tells Vim to turn on undofile feature because it is off by default.
  * make sure that you create the actual `undo_dir` directory inside `~/.vim` directory before running this

## Time Travel

* `:earlier 10s` : If you had typed "two" less than ten seconds ago, you can go back to the state where "two" didn't exist ten seconds ago with

* You can use :undolist to see when the last change was made. :earlier also accepts different arguments:
```shell
:earlier 10s    Go to the state 10 seconds before
:earlier 10m    Go to the state 10 minutes before
:earlier 10h    Go to the state 10 hours before
:earlier 10d    Go to the state 10 days before
```

* In addition, it also accepts a regular `count` as argument to tell Vim to go to the older state `count` times. For example, if you do `:earlier 2`, Vim will go back to an older text state two changes ago. It is the same as doing `g-` twice. You can also tell it to go to the older text state 10 saves ago with `:earlier 10f`.

* The same set of arguments work with `:earlier` counterpart: `:later`.
```shell
:later 10s    go to the state 10 seconds later
:later 10m    go to the state 10 minutes later
:later 10h    go to the state 10 hours later
:later 10d    go to the state 10 days later
:later 10     go to the newer state 10 times
:later 10f    go to the state 10 saves later
```

# Visual Mode

## The Three Types of Visual Modes

* Vim has three different visual modes. They are:
  * `v` : Character-wise visual mode
  * `V` : Line-wise visual mode
  * `Ctrl-V` : Block-wise visual mode

* Try moving around with `h/j/k/l` and watch the cursor move.

* `gU` : Vim uppercases the highlighted characters

* On the bottom left of your Vim window, you will see either `-- VISUAL --`, `-- VISUAL LINE --`, or `-- VISUAL BLOCK --` displayed to indicate which visual mode you are in.

* While you are inside a visual mode, you can switch to another visual mode by pressing either `v`, `V`, or `Ctrl-V`.

* `<Esc>`, `Ctrl-C`, `V`, `v`: There are three ways to exit the visual mode like this and the same key as your current visual mode. What the latter means is if you are currently in the line-wise visual mode (`V`), you can exit it by pressing `V` again. If you are in the character-wise visual mode, you can exit it by pressing `v`.

* `gv` : Go to the previous visual mode

## Visual Mode Navigation

* `o` or `O` : You can toggle the cursor location with either by this.
  * `k` : Now when you press this, it no longer reduces the selection, but expands it upward.

## Visual Mode Grammar

* `d` : Pressing this will delete the selection, similar to normal mode.
  * Notice the grammar rule from normal mode, verb + noun, does not apply. 
  * The grammar rule in visual mode is noun + verb, where noun is the highlighted text. Select the text block first, then the command follows.

* `x` : Running this deletes all highlighted texts.

* `r=` : A first-level header is a series of "=" below a text. Run this, voila! This saves you from typing "=" manually.

* `:h visual-operators` : To learn more about operators in visual mode, check out this.

## Visual Mode and Command-line Commands

* `:s/const/let/g` : Highlight the first two lines with any visual mode and run the substitute command

## Adding Text on Multiple Lines

* If you need to add a semicolon at the end of each line:
  * `Ctrl-V jj` : Run block-wise visual mode and go down two lines.
  * `$` : Highlight to the end of the line.
  * Append (`A`) then type ";".
  * `<Esc>` : Exit visual mode.
  * Alternatively, you can also use the `:normal` command to add text on multiple lines:
    * `vjj` : Highlight all lines.
    * Type `:normal! A;`.
    * Remember, `:normal` command executes normal mode commands. You can instruct it to run `A;` to append text ";" at the end of the line.

## Incrementing Numbers

* Vim has `Ctrl-X` and `Ctrl-A` commands to decrement and increment numbers.

* Let's increment them to make them unique:
  * Move your cursor to the "1" on the second line.
  * Start block-wise visual mode and go down 3 lines (`Ctrl-V 3j`). This highlights the remaining "1"s. Now all "1" should be highlighted (except the first line).
  * Run `g Ctrl-A`.
    * `g Ctrl-A` increments numbers on multiple lines.

* `Ctrl-X/Ctrl-A` can increment letters too, with the number formats option:
  * `set nrformats+=alpha`
  * The `nrformats` option instructs Vim which bases are considered as "numbers" for `Ctrl-A` and `Ctrl-X` to increment and decrement.
  * By adding `alpha`, an alphabetical character is now considered as a number.

* Put your cursor on the second "app-a". Use the same technique as above (`Ctrl-V 3j` then `g Ctrl-A`) to increment the ids.

## Selecting the Last Visual Mode Area

* `gv` : can quickly highlight the last visual mode highlight.
```shell
`<    Go to the first place of the previous visual mode highlight
`>    Go to the last place of the previous visual mode highlight
```

* `:s/const/let/g` : you can selectively execute command-line commands on a highlighted text, like this.
  * When you did that, you'd see this below:
  ```shell
  :`<,`>s/const/let/g
  ```
  * You were actually executing a ranged `s/const/let/g` command (with the two marks as the addresses).

* If instead you needed to substitute from the start of the highlighted text to the end of the file, you just change the command to:
```shell
:`<,$s/const/let/g
```

## Entering Visual Mode From Insert Mode

* `Ctrl-O v` : You can also enter visual mode from the insert mode. To go to character-wise visual mode while you are in insert mode
  * Recall that running `Ctrl-O` while in the insert mode lets you execute a normal mode command.
  * Notice that on the bottom left of the screen, it says `--(insert) VISUAL--`. This trick works with any visual mode operator: `v`, `V`, and `Ctrl-V`.

## Select Mode

* Vim has a mode similar to visual mode called the select mode. Like the visual mode, it also has three different modes:
  * `gh` : Character-wise select mode
  * `gH` : Line-wise select mode
  * `gCtrl-h` : Block-wise select mode

* Select mode emulates a regular editor's text highlighting behavior closer than Vim's visual mode does.

* Contrast this select mode with visual mode: if you highlight a line of text with line-wise visual mode (`V`) and type "y", the highlighted text will not be deleted and replaced by the literal letter "y", it will be yanked. You can't execute normal mode commands on highlighted text in select mode.

## Learn Visual Mode the Smart Way

* `viwd` : visually highlight an inner word then delete

* `diw` : delete an inner word

# Search and Substitute

* Everything you can do with `/` can also be done with `?`

## Smart Case Sensitivity

* Just add `set ignorecase` in your `vimrc` and all your search terms become case insensitive.

* One way to do that is to turn off `ignorecase` option by running `set noignorecase`

* You can combine both `ignorecase` and `smartcase` to perform a case insensitive search when you enter all lowercase characters and a case sensitive search when you enter one or more uppercase characters.
  * Inside your vimrc, add: `set ignorecase smartcase`

* You can use `\C` pattern anywhere in your search term to tell Vim that the subsequent search term will be case sensitive. If you do `/\Chello`, it will strictly match "hello", not "HELLO" or "Hello".

## First and Last Character in a Line

* You can use `^` to match the first character in a line and `$` to match the last character in a line.

* You can target the first "hello" with `/^hello`.

* To target the last "hello", run `/hello$`.

## Repeating Search

* Repeat the previous search with `//`. If you have just searched for `/hello`, running `//` is equivalent to running `/hello`.

* Use `n` and `N` to repeat the last search with the same direction and opposite direction, respectively.

* Quickly traverse the search history by first pressing `/`, then press `up/down` arrow keys (or `Ctrl-N`/`Ctrl-P`) until you find the search term

* `:history /` : see all your search history, you can run this.

* Use the `set wrapscan` option to make Vim to search back at the top of the file when you reach the end of the file. To turn this feature off, do `set nowrapscan`.

## Searching for Alternative Words

* `/hello\|hola` : To match both "hello" and "hola", you can do this.
  * You have to escape (`\`) the or (`|`) operator, otherwise Vim will literally search for the string "|".

* If you don't want to type `\|` every time, you can use the magic syntax (`\v`) at the start of the search: `/\vhello|hola`.

* with `\v`, you don't have to escape special characters anymore.

* `:h \v` : To learn more about `\v`, feel free to check out this.

## Setting the Start and End of a Match

* `/11\zsvim\ze22` : use `\zs` (starting match) and `\ze` (ending match) operators. Run this
  * Vim still has to match the entire pattern "11vim22", but only highlights the pattern sandwiched between `\zs` and `\ze`.

* `/foo\zebaz` : If you need to match the "foo" in "foobaz" but not in "foobar", run this

## Searching Character Ranges

* `/[0-9]` : use this to match for a single digit.

* `/[1-5]` : if you are looking for digits between 1 to 5 instead, use this.

* `/[a-z]` :  do this to search for lowercase alphas

* `/[A-Z]` :  do this to search for uppercase alphas.

* `/[0-9a-fA-F]` : If you need to search for digits 0-9 and both lowercase and uppercase alphas from "a" to "f" (like a hex), you can do this.

* To do a negative search, you can add `^` inside the character range brackets.

* `/[^0-9]` : To search for a non-digit, run this. Vim will match any character as long as it is not a digit.

* `/^abc` matches the first "abc" in a line and `/[^abc]` matches any character except for an "a", "b", or "c".

## Searching for Repeating Characters

* Here are the four different variations of the count syntax:
  * `{n}` is an exact match. `/[0-9]\{2\}`  matches the two digit numbers: "11" and the "11" in "111".
  * `{n,m}` is a range match. `/[0-9]\{2,3\}` matches between 2 and 3 digit numbers: "11"  and "111".
  * `{,m}` is an up-to match. `/[0-9]\{,3\}` matches up to 3 digit numbers: "1", "11", and "111".
  * `{n,}` is an at-least match. `/[0-9]\{2,\}` matches at least a 2 or more digit numbers: "11" and "111".

* If you do `/[0-9]*`, it is the same as `/[0-9]\{0,\}`. It searches for zero or more digits. It will match "", "1", "123". By the way, it will also match non-digits like "a", because there is technically zero digit in the letter "a".

* If you do `/[0-9]\+`, it is the same as `/[0-9]\{1,\}`. It searches for one or more digits. It will match "1" and "12".

## Predefined Character Ranges

* Vim has predefined ranges for common characters like digits and alphas. you can find the full list inside `:h /character-classes`. Here are the useful ones:
```shell
\d    Digit [0-9]
\D    Non-digit [^0-9]
\s    Whitespace character (space and tab)
\S    Non-whitespace character (everything except space and tab)
\w    Word character [0-9A-Za-z_]
\l    Lowercase alphas [a-z]
\u    Uppercase character [A-Z]
```

* To search for any single digit, instead of using `/[0-9]`, you can use `/\d` for a more concise syntax.

## Search Example: Capturing a Text Between a Pair of Similar Characters

* If you want to search for a phrase surrounded by a pair of double quotes:
```shell
"Vim is awesome!"
```

* Run this:
```shell
/"[^"]\+"
```
* Let's break it down:
  * `"` is a literal double quote. It matches the first double quote.
  * `[^"]` means any character except for a double quote. It matches any alphanumeric and whitespace character as long as it is not a double quote.
  * `\+` means one or more. Since it is preceded by `[^"]`, Vim looks for one or more character that is not a double quote.
  * `"` is a literal double quote. It matches the closing double quote.

* `/'[^']\+'` : To capture a phrase surrounded by single quotes, you can use this.

* `/0[^0]\+0` : To capture a phrase surrounded by zeroes, you can use this.

## Search Example: Capturing a Phone Number

* If you want to match a US phone number separated by a hyphen (`-`), like `123-456-7890`, you can use:
```shell
/\d\{3\}-\d\{3\}-\d\{4\}
```
* Let's break it down:
  * `\d\{3\}` matches a digit repeated exactly three times
  * `-` is a literal hyphen

* You can avoid typing escapes with `\v`:
```shell
/\v\d{3}-\d{3}-\d{4}
```

## Basic Substitution

* `:s/{old-pattern}/{new-pattern}/` : Vim's substitute command is a useful command to quickly find and replace any pattern. The substitution syntax is this.

## Repeating the Last Substitution

* You can repeat the last substitute command with either the normal command `&` or by running `:s`. If you have just run `:s/good/awesome/`, running either `&` or `:s` will repeat it.

* If `/good` was done recently and you leave the first substitute pattern argument blank, like in `:s//awesome/`, it works the same as running `:s/good/awesome/`.

## Substitution Range

* `:[range]s/old/new/` : Just like many Ex commands, you can pass a range argument into the substitute command. The syntax is this

* `:3,5s/let/const/` : To substitute the "let" into "const" on lines three to five, you can do this

* Here are some range variations you can pass:
  * `:,3s/let/const/` - if nothing is given before the comma, it represents the current line. Substitute from current line to line 3.
  * `:1,s/let/const/` - if nothing is given after the comma, it also represents the current line. Substitute from line 1 to current line.
  * `:3s/let/const/` - if only one value is given as range (no comma), it does substitution on that line only.

* In Vim, `%` usually means the entire file.

* `:%s/let/const/` : If you run this, it will do substitution on all lines.

## Pattern Matching

* `:%s/\d/"\0"/` : To add a pair of double quotes around the digits
  * Let's break down the command:
  * `:%s` targets the entire file to perform substitution.
  * `\d` is Vim's predefined range for digits (similar to using `[0-9]`).
  * `"\0"` here the double quotes are literal double quotes. `\0` is a special character representing "the whole matched pattern". The matched pattern here is a single digit number, `\d`.

**Given these expressions and you need to swap all the "let" with the variable names.**

```shell
one let = "1";
two let = "2";
```

* To do that, run: `:%s/\(\w\+\) \(\w\+\)/\2 \1/`

* The command above contains too many backslashes and is hard to read. In this case it is more convenient to use the `\v` operator: `:%s/\v(\w+) (\w+)/\2 \1/`
  
* Let's break down that command:
  * `:%s` targets all the lines in the file to perform substitution.
  * `(\w+) (\w+)` is a group match. `\w` is one of Vim's predefined ranges for a word character (`[0-9A-Za-z_]`). The `( )` surrounding it captures a word character match in a group. Notice the space between the two groupings. `(\w+) (\w+)` captures two groups. The first group captures "one" and the second group captures "two".
  * `\2 \1` returns the captured group in a reversed order. `\2` contains the captured string "let" and `\1` the string "one". Having `\2 \1` returns the string "let one".

**break the matched string into smaller groups**

* Recall that `\0` represents the entire matched pattern. You can break the matched string into smaller groups with `( )`. Each group is represented by `\1`, `\2`, `\3`, etc.

* Let's do one more example to solidify this group match concept. If you have these numbers:
```shell
123
456
789
```

* To reverse the order, run: `:%s/\v(\d)(\d)(\d)/\3\2\1/`

* The result is:
```shell
321
654
987
```

* Each `(\d)` matches each digit and creates a group. On the first line, the first `(\d)` has a value of 1, the second `(\d)` has a value of 2, and the third `(\d)` has a value of 3. They are stored in the variables `\1`, `\2`, and `\3`. In the second half of your substitution, the new pattern `\3\2\1` results in the "321" value on line one.

* If you had run this instead: `:%s/\v(\d\d)(\d)/\2\1/`

* You would have gotten a different result:
```shell
312
645
978
```

* This is because you now only have two groups. The first group, captured by `(\d\d)`, is stored within `\1` and has the value of 12. The second group, captured by `(\d)`, is stored inside `\2` and has the value of 3. `\2\1` then, returns 312.

## Substitution Flags

* You can either run the substitute command twice more or you can pass it a global (`g`) flag to substitute all of the matches in a line.

* You pass flags at the end of the substitute command. Here is a list of useful flags:
```shell
&    Reuse the flags from the previous substitute command.
g    Replace all matches in the line.
c    Ask for substitution confirmation.
e    Prevent error message from displaying when substitution fails.
i    Perform case insensitive substitution.
I    Perform case sensitive substitution.
```

* `:h s_flags` : To read about all the flags, check out this.

* By the way, the repeat-substitution commands (`&` and `:s`) do not retain the flags. Running `&` will only repeat `:s/pancake/donut/` without `g`. To quickly repeat the last substitute command with all the flags, run `:&&`.

## Changing the Delimiter

* If you need to replace a URL with a long path: `https://mysite.com/a/b/c/d/e`

* To substitute it with the word "hello", run: `:s/https:\/\/mysite.com\/a\/b\/c\/d\/e/hello/`

* However, it is hard to tell which forward slashes (`/`) are part of the substitution pattern and which ones are the delimiters. You can change the delimiter with any single-byte characters (except for alphabets, numbers, or `"`, `|`, and `\`). Let's replace them with `+`. The substitution command above then can be rewritten as:
```shell
:s+https:\/\/mysite.com\/a\/b\/c\/d\/e+hello+
```

## Special Replace

**You can also modify the case of the text you are substituting.**

* Given the following expressions and your task is to uppercase the variables "one", "two", etc.
```shell
let one = "1";
let two = "2";
```
* Run: `:%s/\v(\w+) (\w+)/\1 \U\2/`

* You will get:
```shell
let ONE = "1";
let TWO = "2";
```

* The breakdown:
  * `(\w+) (\w+)` captures the first two matched groups, such as "let" and "one".
  * `\1` returns the value of the first group, "let".
  * `\U\2` uppercases (`\U`) the second group (`\2`).

**capitalize the first letter of each word in a line**

* Let's do one more example.
```shell
vim is the greatest text editor in the whole galaxy
```

* You can run: `:s/\<./\U&/g`

* The result:
```shell
Vim Is The Greatest Text Editor In The Whole Galaxy
```

* Here is the breakdowns:
  * `:s` substitutes the current line.
  * `\<.` is comprised of two parts: `\<` to match the start of a word and `.` to match any character. `\<` operator makes the following character to be the first character of a word. Since `.` is the next character, it will match the first character of any word.
  * `\U&`  uppercases the subsequent symbol, `&`. Recall that `&` (or `\0`) represents the whole match. It matches the first character of any word.
  * `g` the global flag. Without it, this command only substitutes the first match. You need to substitute every match on this line.

* `:h sub-replace-special` : To learn more of substitution's special replace symbols like `\U`, check out this.

## Alternative Patterns

**Sometimes you need to match multiple patterns simultaneously.**

* If you have the following greetings:
```
hello vim
hola vim
salve vim
bonjour vim
```

* You need to substitute the word "vim" with "friend" but only on the lines containing the word "hello" or "hola". Recall from earlier this chapter, you can use `|` for multiple alternative patterns.
```shell
:%s/\v(hello|hola) vim/\1 friend/g
```

* The result:
```shell
hello friend
hola friend
salve vim
bonjour vim
```

* Here is the breakdown:
  * `%s` runs the substitute command on each line in a file.
  * `(hello|hola)` matches *either* "hello" or "hola" and consider it as a group.
  * `vim` is the literal word "vim".
  * `\1` is the first group, which is either the text "hello" or "hola".
  * `friend` is the literal word "friend".

## Substituting the Start and the End of a Pattern

* Recall that you can use `\zs` and `\ze` to define the start and the end of a match. This technique works in substitution too. If you have:
```shell
chocolate pancake
strawberry sweetcake
blueberry hotcake
```

* To substitute the "cake" in "hotcake" with "dog" to get a "hotdog":
```shell
:%s/hot\zscake/dog/g
```

* Result:
```shell
chocolate pancake
strawberry sweetcake
blueberry hotdog
```

## Greedy and Non-greedy

* You can substitute the nth match in a line with this trick:
```
One Mississippi, two Mississippi, three Mississippi, four Mississippi, five Mississippi.
```

* To substitute the third "Mississippi" with "Arkansas", run:
```
:s/\v(.{-}\zsMississippi){3}/Arkansas/g
```

* The breakdown:
  * `:s/` the substitute command.
  * `\v` is the magic keyword so you don't have to escape special keywords.
  * `.` matches any single character.
  * `{-}` performs non-greedy match of 0 or more of the preceding atom.
  * `\zsMississippi` makes "Mississippi" the start of the match.
  * `(...){3}` looks for the third match.

* You have seen the `{3}` syntax earlier in this chapter. In this case, `{3}` will match exactly the third match. The new trick here is `{-}`. It is a non-greedy match. It finds the shortest match of the given pattern. In this case, `(.{-}Mississippi)` matches the least amount of "Mississippi" preceded by any character. Contrast this with `(.*Mississippi)` where it finds the longest match of the given pattern.

* If you use `(.{-}Mississippi)`, you get five matches: "One Mississippi", "Two Mississippi", etc. If you use `(.*Mississippi)`, you get one match: the last "Mississippi". `*` is a greedy matcher and `{-}` is a non-greedy matcher. To learn more check out `:h /\{-` and `:h non-greedy`.

* Let's do a simpler example. If you have the string:
```
abc1de1
```

* You can match "abc1de1" (greedy) with:
```
/a.*1
```

* You can match "abc1" (non-greedy) with:
```
/a.\{-}1
```

* So if you need to uppercase the longest match (greedy), run:
```
:s/a.*1/\U&/g
```

* To get:
```
ABC1DEFG1
```

* If you need to uppercase the shortest match (non-greedy), run:
```
:s/a.\{-}1/\U&/g
```

* To get:
```
ABC1defg1
```

## Substituting Across Multiple Files

* assume that you have two files: `food.txt` and `animal.txt`.

* First, capture both `food.txt` and `animal.txt` inside `:args`.
```
:args *.txt                  captures all txt files in current location
```

* To test it, when you run `:args`, you should see:
```
[food.txt] animal.txt
```

* Now that all the relevant files are stored inside the argument list, you can perform a multi-file substitution with the `:argdo` command. Run:
```
:argdo %s/dog/chicken/
```

* This performs substitution against the all files inside the `:args` list. Finally, save the changed files with:
```
:argdo update
```

* `:args` and `:argdo` are  useful tools to apply command line commands across multiple files.

## Substituting Across Multiple Files With Macros

* Alternatively, you can also run the substitute command across multiple files with macros. Run:
```
:args *.txt
qq
:%s/dog/chicken/g
:wnext
q
99@q
```

* The breakdown:
  * `:args *.txt` adds all text files into the `:args` list.
  * `qq` starts the macro in the "q" register.
  * `:%s/dog/chicken/g` substitutes "dog" with "chicken" on all lines in the current file.
  * `:wnext` saves the file then go to the next file on the `args` list.
  * `q` stops the macro recording.
  * `99@q` executes the macro ninety-nine times. Vim will stop the macro execution after it encounters the first error, so Vim won't actually execute the macro ninety-nine times.

# the Global Command

* Repeat the last change with the dot command (`.`), to replay actions with macros (`q`), and to store texts in the registers (`"`).

## Global Command Overview

* Vim's global command is used to run a command-line command on multiple lines simultaneously.

* `:h ex-cmd-index` : For a full list of Ex commands, check out this.

* `:g/pattern/command` : The global command has the following syntax

* `:g/console/d` : To remove all lines containing "console", you can run this
  * The global command executes the delete command (`d`) on all lines that match the "console" pattern.

* `:g/const/d` : If you want to delete all lines containing "const" instead, run this


## Inverse Match

* `:g!/pattern/command` OR `:v/pattern/command` : To run the global command on non-matching lines, you can run this

* `:v/console/d` : If you run this, it will delete all lines *not* containing "console".

## Pattern

* `:g/one\|two/d` : To delete the lines containing either "one" or "two", run this

* `:g/[0-9]/d` OR `:g/\d/d` : To delete the lines containing any single digits, run either

* `:g/0\{3,6\}/d` : To match the lines containing between three to six zeroes, run this

## Passing a Range

* You can pass a range before the `g` command. Here are some ways you can do it:
  * `:1,5g/console/d`  matches the string "console" between lines 1 and 5 and deletes them.
  * `:,5g/console/d` if there is no address before the comma, then it starts from the current line. It looks for the string "console" between the current line and line 5 and deletes them.
  * `:3,g/console/d` if there is no address after the comma, then it ends at the current line. It looks for the string "console" between line 3 and the current line and deletes them.
  * `:3g/console/d` if you only pass one address without a comma, it executes the command only on line 3. It looks on line 3 and deletes it if has the string "console".

* In addition to numbers, you can also use these symbols as range:
  * `.` means the current line. A range of `.,3` means between the current line and line 3.
  * `$` means the last line in the file. `3,$` range means between line 3 and the last line.
  * `+n` means n lines after the current line. You can use it with `.` or without. `3,+1` or `3,.+1` means between line 3 and the line after the current line.

* If you don't give it any range, by default it affects the entire file. This is actually not the norm. Most of Vim's command-line commands run on only the current line if you don't pass it any range. The two notable exceptions are the global (`:g`) and the save (`:w`) commands.

## Normal Command

* You can run a normal command with the global command with `:normal` command-line command.

* `:g/./normal A;` : To add a ";" to the end of each line, run this

* Let's break it down:
  * `:g` is the global command.
  * `/./` is a pattern for "non-empty lines". It matches the lines with at least one character, so it matches the lines with "const" and "console" and it does not match empty lines.
  * `normal A;` runs the `:normal` command-line command. `A;` is the normal mode command to insert a ";" at the end of the line.

## Executing a Macro

* A macro can be executed with the `normal` command.

* `qaA;<Esc>q` : Let's create a macro to add a comma to the end of those lines in the register `a`

* `:g/const/normal @a` : Now all lines with "const" will have a ";" at the end.

* If you followed this step-by-step, you will have two semi-colons on the first line. To avoid that, run the global command on line two onward, `:2,$g/const/normal @a`.

## Recursive Global Command

* The global command itself is a type of a command-line command, so you can technically run the global command inside a global command.

* `:g/console/g/two/d` : First, `g` will look for the lines containing the pattern "console" and will find 3 matches. Then the second `g` will look for the line containing the pattern "two" from those three matches. Finally, it will delete that match.

* `:g/console/v/two/d` : You can also combine `g` with `v` to find positive and negative patterns. Instead of looking for the line containing the pattern "two", it will look for the lines *not* containing the pattern "two".

## Changing the Delimiter

* You can change the global command's delimiter like the substitute command. The rules are the same: you can use any single byte character except for alphabets, numbers, `"`, `|`, and `\`.

* `:g@console@d` : To delete the lines containing "console"

* `g@one@s+const+let+g` : If you are using the substitute command with the global command, you can have two different delimiters.
  * Here the global command will look for all lines containing "one". The substitute command will substitute, from those matches, the string "const" with "let".

## The Default Command

* `:g/console` : The global command will use the print (`:p`) command to print the current line's text.
  * It will print at the bottom of the screen all the lines containing "console".

* `:g/re/p` : Because the default command used by the global command is `p`, this makes the `g` syntax to be:
  * `g` = the global command
  * `re` = the regex pattern
  * `p` = the print command
  * It spells *"grep"*, the same `grep` from the command line.

## Reversing the Entire Buffer

* `:g/^/m 0` : To reverse the entire file, run

* `^` is a pattern for the beginning of a line. Use `^` to match all lines, including empty lines.

* `:5,10g/^/m 0` : If you need to reverse only a few lines, pass it a range. To reverse the lines between line five to line ten, run

* `:h :move` : To learn more about the move command, check out this.

## Aggregating All Todos

* Vim has a `:t` (copy) method to copy all matches to an address.
 
* `:h :copy` : To learn more about the copy method, check out this.

* `:g/TODO/t $` : To copy all TODOs to the end of the file for easier introspection, run

* `:g/TODO/m $` : If instead of copying them you want to move all the TODOs to the end, use the move command, `:m`

## Black Hole Delete

* Whenever you run `:g/console/d`, Vim stores the deleted lines in the numbered registers. If you delete many lines, you can quickly fill up all the numbered registers. To avoid this, you can always use the black hole register (`"_`) to *not* store your deleted lines into the registers. Run:
```
:g/console/d_
```

* By passing `_` after `d`, Vim won't use up your scratch registers.

## Reduce Multiple Empty Lines to One Empty Line

* `:g/^$/,/./-1j` : You can quickly reduce the empty lines into one empty line with

* Normally the global command accepts the following form: `:g/pattern/command`. However, you can also run the global command with the following form: `:g/pattern1/,/pattern2/command`. With this, Vim will apply the `command` within `pattern1` and `pattern2`.

* With that in mind, let's break down the command `:g/^$/,/./-1j` according to `:g/pattern1/,/pattern2/command`:
  * `/pattern1/` is `/^$/`. It represents an empty line (a line with zero character).
  * `/pattern2/` is `/./` with `-1` line modifier. `/./` represents a non-empty line (a line with at least one character). The `-1` means the line above that.
  * `command` is `j`, the join command (`:j`). In this context, this global command joins all the given lines.

* `:g/^$/,/./j` : By the way, if you want to reduce multiple empty lines to no lines, run this instead
  * `:g/^$/-j` : A simpler alternative

## Advanced Sort

* Vim has a `:sort` command to sort the lines within a range.
  * If you give it a range, it will sort only the lines within that range. For example, `:3,5sort` only sorts lines three and five.

* `:g/\[/+1,/\]/-1sort` : If you need to sort the elements inside the arrays, but not the arrays themselves, you can run this

* This is great! But the command looks complicated. Let's break it down. This command also follows the form `:g/pattern1/,/pattern2/command`.

  * `:g` is the global command pattern.
  * `/\[/+1` is the first pattern. It matches a literal left square bracket "[". The `+1` refers to the line below it.
  * `/\]/-1` is the second pattern. It matches a literal right square bracket "]". The `-1` refers to the line above it.
  * `/\[/+1,/\]/-1` then refers to any lines between "[" and "]".
  * `sort` is a command-line command to sort.

# References

* next-sl: {}

## Commands From

* {1} [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)
