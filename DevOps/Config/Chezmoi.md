# Commands & Usage

## Websites

* [Chezmoi Commands Reference](https://www.chezmoi.io/reference/commands/)

## Commands

* `sudo snap install chezmoi --classic` : Install Chezmoi using Snap package manager. 

* `chezmoi --help` : Chezmoi help.

* `chezmoi init` : Setup the source directory, generate the config file, and optionally update the destination directory to match the target state.

* chezmoi add
  * Examples
    * `chezmoi add ~/.bashrc` : Add plain `~/.bashrc` to source directory.
    * `chezmoi add ~/.gitconfig --template` : Add `~/.gitconfig` file as template.
    * `chezmoi add ~/.vim --recursive` : Add `~/.vim` folder.
    * `chezmoi add ~/.oh-my-zsh --exact --recursive` : Add exact `~/.oh-my-zsh` folder.
  * `chezmoi add {{file-name}} --autotemplate` : Automatically generate a template by replacing strings that match variable values from the data section of the config file.
  * `chezmoi add {{file}} --create` : Add files that should exist, irrespective of their contents.
  * `chezmoi add {{file}} --encrypt` : Encrypt files using the defined encryption method. [Configuration: `add.encrypt`]
  * `chezmoi add {{directory}} --exact` : Set the exact attribute on added directories.
  * `chezmoi add {{file/directory}} --follow` : If the last part of a target is a symlink, add the target of the symlink instead of the symlink itself.
  * `chezmoi add {{directory}} --prompt` : Interactively prompt before adding each file.
  * `chezmoi add {{directory}} --quiet` : Suppress warnings about adding ignored entries.
  * `chezmoi add {{directory}} --secrets {{ignore|warning|error}}` : Action to take when a secret is found when adding a file. The default is `warning`. [Configuration: `add.secrets`]
  * `chezmoi add {{directory}} --template` : Set the `template` attribute on added files and symlinks.
  * `chezmoi add {{directory}} --template-symlinks` : When adding symlink to an absolute path in the source directory or destination directory, create a symlink template with `.chezmoi.sourceDir` or `.chezmoi.homeDir`.
  * Common flags
    * `chezmoi add {{directory}} --exclude {{types}}` : Exclude target state entries of specific types. The default is `none`.
      * `--exclude=scripts` will cause the command to not run scripts and `--exclude=encrypted` will exclude encrypted files.
    * `chezmoi add {{directory}} --force` : Add targets, even if doing so would cause a source template to be overwritten.
    * `chezmoi add {{directory}} --include {{types}}` : Include target state entries of specific types. The default is `all`.
      * `--include=files` specifies all files.
    * `chezmoi add {{directory}} --recursive` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.

* Chezmoi add encryption
* `chezmoi add ~/.ssh/id_rsa --encrypt`
  * [age encryption](https://www.chezmoi.io/user-guide/encryption/age/)
  * `age-keygen -o $HOME/key.txt`
  * Contents of : `~/.config/chezmoi/chezmoi.toml`
  ```shell
  encryption = "age"
  [age]
    identity = "/home/{{user-name}}/key.txt"
    recipient = "age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p"
  ```
  * [How do I configure chezmoi to encrypt files but only request a passphrase the first time chezmoi init is run?](https://www.chezmoi.io/user-guide/frequently-asked-questions/encryption/)

* `chezmoi cat ~/.bashrc` : Write the target contents of targets to stdout. Show contents from source directory.
* `chezmoi cat-config` : Print the configuration file.

* chezmoi cd
  * `chezmoi cd` : Go to source directory root.
  * `chezmoi cd ~` : Go to source directory root.
  * `chezmoi cd ~/.config` : Go to source `~/.config` directory.

* chezmoi chattr
  * `chezmoi chattr template ~/.bashrc` : Convert `executable_dot_bashrc` to `executable_dot_bashrc.tmpl` in source directory.
  * `chezmoi chattr noempty ~/.profile` : No change in source directory.
  * `chezmoi chattr private,template ~/.netrc` : Convert `executable_dot_netrc` to `private_executable_dot_netrc.tmpl` in source directory.
  * `chezmoi chattr -- -x ~/.zshrc` : Convert `executable_dot_zshrc` to `dot_zshrc` in source directory.
  * `chezmoi chattr +create,+private ~/.kube/config` : Convert `dot_kube/executable_dot_config` to `dot_kube/create_private_executable_dot_config` in source directory.

* chezmoi completion
  * `chezmoi completion bash` : Print chezmoi bash completion to stdout.
  * `chezmoi completion fish --output=~/.config/fish/completions/chezmoi.fish` : Write chezmoi fish completion to `~/.config/fish/completions/chezmoi.fish` file.

* chezmoi data
  * `chezmoi data` : Print chezmoi settings to stdout in plain text.
  * `chezmoi data --format=yaml` : Print chezmoi settings to stdout in yaml format.
  * `chezmoi data --format=json` : Print chezmoi settings to stdout in json format.

* chezmoi decrypt
  * For decryption use public key from `/home/{{user-name}}/.config/chezmoi/chezmoi.toml` file and private key from `/home/{{user-name}}/key.txt` file.
  * `chezmoi decrypt ~/.local/share/chezmoi/encrypted_dot_config.age` : Decrypt previously encrypted file and print to stdout.
  * `chezmoi decrypt ~/.local/share/chezmoi/encrypted_dot_config.age --output=~/decrypted_config` : Decrypt previously encrypted file and write to `~/decrypted_config` file.

* chezmoi destroy
  * `chezmoi destroy ~/{{file-name}}` : Remove file from both source and destination directory with prompt.
  * `chezmoi destroy --force ~/{{file-name}}` : Remove file from both source and destination directory without prompt.

* chezmoi diff
  * "diff" output shows in terminal/stdout
  * `chezmoi diff` : Prints all diff in stdout from source to destination directory.
  * `chezmoi diff --reverse` : Prints all diff in stdout from destination to source directory directory.
  * `chezmoi diff | less` : Shows all diff using "less" program.
  * `chezmoi diff ~/.bashrc` : Prints `~/.bashrc` file diff in stdout from source to destination directory.
  * `chezmoi diff --reverse ~/.bashrc` : Prints `~/.bashrc` file diff in stdout from destination to source directory.

* chezmoi doctor
  * `chezmoi doctor` : Check for potential problems.
  * `chezmoi doctor --no-network` : Do not use any network connections.

* chezmoi dump
  * Dump the target state of targets (from source directory). If no targets are specified, then the entire target state.
  * `chezmoi dump ~/.bashrc` : Dump contents of `~/.bashrc` from source directory.
  * `chezmoi dump --format=yaml` : Dump all files in yaml format.
  * `chezmoi dump --format=yaml | less` : Dump all files in yaml format using "less" pager program.
  * `chezmoi dump --format=json` : Dump all files in json format.

* `chezmoi dump-config` : Dump the configuration.

* chezmoi edit
  * `chezmoi edit ~/.bashrc` : Edit `~/.bashrc` file in source directory.
  * `chezmoi edit ~/.bashrc --apply` : Edit `~/.bashrc` file in source directory and apply to destination directory.
  * `chezmoi edit` : Open vim `netrw` file picker.

* `chezmoi edit-config` : Edit the configuration file.

* `chezmoi edit-config-template` : Edit the configuration file template. If no configuration file template exists, then a new one is created with the contents of the current config file.

* chezmoi encrypt
  * `chezmoi encrypt ~/.config` : Prints `~/.config` file's encrypted content to stdout.
  * `chezmoi encrypt ~/.config --output=~/encrypted-config` : Write `~/.config` file's encrypted content to `~/encrypted-config`.

* chezmoi execute-template

# Chezmoi.md

## Websites

* [chezmoi.io => Chezmoi Site](https://www.chezmoi.io/)
* [twpayne/chezmoi](https://github.com/twpayne/chezmoi)
* [FiloSottile/age](https://github.com/FiloSottile/age)
* [gpg => GNU Privacy Guard](https://www.gnupg.org/)
* [str4d/rage GitHub](https://github.com/str4d/rage)
* [text/template documentation](https://pkg.go.dev/text/template)
* [sprig documentation](https://masterminds.github.io/sprig/)
* [twpayne/dotfiles](https://github.com/twpayne/dotfiles)
* [felipecrs/dotfiles => Bootstrap your Ubuntu in a single command!](https://github.com/felipecrs/dotfiles)

## Paths

* Default source directory: `/home/{{user-name}}/.local/share/chezmoi`
* Default destination directory: `/home/{{user-name}}`
* Default cache directory: `/home/{{user-name}}/.cache/chezmoi`

# Install Chezmoi

## Install using Snap

* [chezmoi BY Tom Payne (twpayne) => snapcraft.io/chezmoi](https://snapcraft.io/chezmoi)
  * Install Chezmoi: `sudo snap install chezmoi --classic`

## Antix-Linux

* One-line binary install
  * `sh -c "$(curl -fsLS get.chezmoi.io)"`
  * Chezmoi is install in `~/bin/chezmoi`
  * Move to `$PATH`: `sudo mv ~/bin/chezmoi /usr/local/bin/chezmoi`
  * Check version: `chezmoi --version`

## KeePassXC CLI

* [Request for an AppImage build for the KeepassXC CLI #10234](https://github.com/keepassxreboot/keepassxc/issues/10234)
  * Download our normal appimage and use command line variable cli to run the cli.
  * `./KeePassXC-2.7.6-x86_64.AppImage cli`

# Configuration

## Set Binary/Tool

* Set "diff" command
```shell
[diff]
    command = "vimdiff"
    pager = "less"
```

## Encryption

* Chezmoi add encryption
* `chezmoi add ~/.ssh/id_rsa --encrypt`
  * [age encryption](https://www.chezmoi.io/user-guide/encryption/age/)
  * `age-keygen -o $HOME/key.txt`
  * Contents of : `~/.config/chezmoi/chezmoi.toml`
  ```shell
  encryption = "age"
  [age]
    identity = "/home/{{user-name}}/key.txt"
    recipient = "age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p"
  ```

# Templates

## Websites (Templates)

* [Templating](https://www.chezmoi.io/user-guide/templating)
* [Templates Reference](https://www.chezmoi.io/reference/templates/)

## Notes (Templates)

* Removing whitespace: `{{-` for the left brackets and `-}}` for the right brackets

## Variables

* `chezmoi execute-template '{{ VARIABLE-NAME }}'`

# Error and Solution

## Package Installation

* Error_1: `which vimdiff` command not found

  * Message_1:
    * `chezmoi doctor` comamnd shows `vimdiff` not in $PATH

  * Solution_1:
    * [vimdiff is not available as 'vim'](https://stackoverflow.com/questions/55418145/vimdiff-is-not-available-as-vim)
    * Actually, it turns out the answer is that vim is not shipped with Ubuntu 18.04 and other versions,
    * even though I've been using `vim.tiny` for months via the `vi` command, which is in the `PATH` on installation.
    * Installing `vim` via `apt install vim` will also install `vimdiff`, among other utilities.
    * Now the mergetool can be configured to `vimdiff`.

# References

* next-sl: {3}

* Installation
  * {1} [Chezmoi Install](https://www.chezmoi.io/install/)

* Tutorials
  * [Chezmoi Commands Reference](https://www.chezmoi.io/reference/commands/)

* Guides
  * [Templating](https://www.chezmoi.io/user-guide/templating)

* Error and Solution

  * Package Installation
    * {2} [vimdiff is not available as 'vim'](https://stackoverflow.com/questions/55418145/vimdiff-is-not-available-as-vim)

* YouTube Tutorials
  * [Easily moving Linux installs BY Chris Titus Tech](https://www.youtube.com/watch?v=x6063EuxfEA)
