# Commands

## Installation

* `sudo apt install vim` : In many Linux distribution, "vim-tiny" is installed by default. Which does not have `vimtutor` command and online-manual. Install full `vim` with this command.

## General Command

* Open left file explorer: :Lexplore
* To switch between file opened windows : ctrl + ww (double w) or ctrl + w + (h/j/k/l)

# VIM Editor

## Websites

* VIMTUTOR: Learn VIM (If GVIM (from www.vim.org) in installed in Windows8.1 then press "Windows key + S" and enter text "vimtutor")
* [GitHub: philc/vimium](https://github.com/philc/vimium) || [Vimium: Vim Keybindings](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
* [Vim Cheat Sheet - Rtorr](https://vim.rtorr.com/)
* [Learn X in Y minutes: Where X=vim](https://learnxinyminutes.com/docs/vim/)
* [Vim cheatsheet - Devhints.io](https://devhints.io/vim)
* [iggredible/Learn-Vim](https://github.com/iggredible/Learn-Vim)
* [vim-adventures.com](https://vim-adventures.com/)

## Plugin List

* Database
  * [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod)
  * [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)
  * [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion)

## Notes

* Run Vim in Verbose/Debug mode: vim -V9vim.log

# Plugins

## Netrw

### Resize Netrw ":Lexplore" window

[https://vi.stackexchange.com/questions/10988/toggle-explorer-window]()
[https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/]()
* Open file: ~/.vimrc
* Enter Text: let g:netrw_winsize = 20
* Save and quit by using command ":wq"

## NERDTree

[https://github.com/preservim/nerdtree](NERDTree GitHub)

### Tab Navigation

[https://stackoverflow.com/questions/2413005/switching-between-tabs-in-nerdtree]()

gt = next tab
gT = previous tab

### Switching Windows

[https://stackoverflow.com/questions/4446062/two-basic-questions-with-nerdtree-switching-windows-and-finding-files]()

Thus, if your edit window is to the right of the NERDTree window, you would use: ctrl + Wl to go to right window and ctrl + Wh to go to left window. or ctrl + w twice to toggle between the two.

### Close Tab

[https://vi.stackexchange.com/questions/9967/how-do-i-open-and-close-nerdtree-toggle-nerdtree-view-using-a-single-keystroke]()

To open NerdTree :
:NERDTreeFocus
To switch beetween nerdtree and file opened windows :
ctrl + ww (double w)
or
ctrl + w + (h/j/k/l)
To close NerdTree (in nerdtree window) :
:q

## Vim-Gist

** [https://github.com/mattn/vim-gist](Vim-Gist GitHub)

### Guides - Vim-Gist

* [https://gist.github.com/typebrook/b0d2e7e67aa50298fdf8111ae7466b56]() {Use this script to get Gist ID by filtering description/tag. Then use it in Vim-Gist.}
* [https://github.com/defunkt/gist]()
* [https://superuser.com/questions/486532/how-to-open-files-in-vertically-horizontal-split-windows-in-vim-from-the-command]()
* Install Plugin in Git Bash Vim
	* [https://superuser.com/questions/280331/vim-not-loading-vimrc-file-when-launched-from-git-bash]()
	* [https://www.reddit.com/r/vim/comments/6w3jmc/installing_plugins_for_the_vim_in_git_bash_for/]()

### Vim-Plug "~/.vimrc" content - Vim-Gist

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
call plug#end()
let g:netrw_winsize = 20
let g:gist_get_multiplefile = 1

* Relaod Vim Configuration: After adding the above to the top of your Vim configuration file, reload it (:source ~/.vimrc) or restart Vim. Now run :PlugInstall to install the plugins.

### Setup Vim-Gist

* $ git config --global github.user Username
* In ~/.gist-vim file: token xxxxx

### Setup Vim-Gist in Git Bash (Windows OS)

* Open Git Bash.
* Show vim details: vim --version
* Go to user Home directory: cd ~
* Download Vim-Plug:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* Check .vimrc file exists: cat .vimrc [If not exist create it by command "touch .vimrc"]
* Edit "~/.vimrc" file and install plugin by using ":PlugInstall" command

### Commands - Vim-Gist

* Help Command: :help gist-setup
* Show Gist List: :Gist -l  [Press "Enter" or "o" to open gist from list] [:Gist -l | grep "text" command does not work, implement it in source code]
* Edit the gist:   :Gist -e  [You can update the gist with the ":w" command within the gist buffer.]
* Edit the gist with name 'foo.js': :Gist -e foo.js
* Post/Edit with the description: 
	* :Gist -s something
	* :Gist -e -s something
* Post current buffer to gist (single file): :Gist
* Create a gist with all open buffers (multiple file - both tab and split): 
	* :Gist -m  [Open multiple file with horizontal split: vim -o file_1.txt file_2.txt file_3.txt]
	* :Gist -m -s "Gist with multiple files"  [Create gist with description]
	* Note: [Open Netrw: "vim ."] [Open left file tree: ":Lexplore"] [Press "t" to open file in tab] [Press "gt" to switch tab]
* 

# Gist Management Bash Script

[gist - Manage your gist like a pro](https://gist.github.com/typebrook/b0d2e7e67aa50298fdf8111ae7466b56)

## Guides

* [Install "tput" command in Alpine Linux](https://github.com/opencollective/opencollective/issues/1443)

## Setup

* Install Python3 on Alpine Linux: sudo apk add python3
* Check Python Version: python --version
* Download gist-script: curl -L https://git.io/J3DXe -o gist
* Install gist-script: sudo install -m755 gist /usr/local/bin/gist
* Error "tput command not found": sudo apk add ncurses  [This package will install "tput" command of line 332 in gist source code]

## Setup in Git Bash (Windows OS)

* Download "gist" script using curl: curl -L https://git.io/J3DXe -o gist [If download from Browser then choose "Save as type: All Files"]
* Move "gist" script to "C:\Program Files\Git\usr\bin" folder.
* Restart Git Bash and enter command "gist help"
* Download Python from https://www.python.org/ and during installation choose "Add python.exe to PATH".
* Restart Git Bash and check python version using command "python --version"

## Commands

  * Configurations
  * Configuration file location: ~/.config/gist.conf
  * Set key with a given value: gist config <key> <value>
  * Remove current value from a key: gist config <key>
  * Or just modify ~/.config/gist.conf directly: gist config
  * Set "user": gist config user <your-github-username>
  * Set "token": gist config token <your-github-api-token>
  * Set "folder": gist config folder <prefered-directory>
  * Set "auto_sync": gist config auto_sync true [Automatically clone/update your gists and starred gists as git repos when doing gist fetch. Default to be true.]
  * Set "action": gist config action 'tail -n +1 *'
  * Set "EDITOR": gist config EDITOR vim
  * Set "protocol": gist config protocol https [Default to be HTTPS]
  * Set "show_untagged": gist config show_untagged false [Default to be true]
* Show Help: gist help
* Update and clone gists from Github: gist fetch
* Clean unnecessary local repos: gist clean
* List your gists: gist [Use "gist star" to show your starred gists] [Use "gist all" to show your and starred gists]
* Create new gist by entering text into terminal (single file gist): gist new [Type a gist. <Ctrl-C> to cancel, <Ctrl-D> when done] ["Type file name:", "Type description:"]
* Create new gist using existing files (multiple files gist): gist new <file1> <file2>... ["Type description:"]
* Create new private gist using existing files (multiple files gist): gist new -p <file1> <file2>... ["Type description:"]
* Create new gist by providing description in command (single file gist): gist new --file new --desc 'a new gist'
* Create new gist from STDIN (single file gist): <command> | gist new ["Type file name:", "Type description:"]
* Modify a gist: gist <INDEX> [<INDEX> is serial number from "gist all" command] [You are inside subshell now, press <CTRL-D> to exit]
* Push changes in your gist to the remote repo: gist push <INDEX> [<INDEX> is serial number from "gist all" command]
* Update the description of your gist: gist edit <INDEX>
* Delete single gist: gist delete <INDEX>
* Delete multiple gist using index: gist delete <INDEX-1> <INDEX-2> <INDEX-3>
* Delete multiple gist using index range: gist delete {<INDEX-From>..<INDEX-To>}
* Check information of gist: gist detail <INDEX>


# References

* next-sl: {}

* Tutorials

* YouTube Tutorials
  * [Vim Beginners Guide BY Learn Linux TV](https://www.youtube.com/playlist?list=PLT98CRl2KxKHy4A5N70jMRYAROzzC2a6x)
  * [Vimium Is Vim For Your Browser BY NeuralNine](https://www.youtube.com/watch?v=yuUHMekx_zQ)
