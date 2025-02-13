# Gist Management Bash Script
[https://gist.github.com/typebrook/b0d2e7e67aa50298fdf8111ae7466b56](gist - Manage your gist like a pro)

## Guides
* [https://github.com/opencollective/opencollective/issues/1443](Install "tput" command in Alpine Linux)

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
* 
