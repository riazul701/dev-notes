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

# References

* next-sl: {}

## Commands From

* {1} [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)
