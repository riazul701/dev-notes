# Commands & Usage

* [chezmoi.io](https://www.chezmoi.io/)
* `chezmoi --help` : Chezmoi help.

## Paths

* Default source directory: `/home/{{user-name}}/.local/share/chezmoi`
* Default destination directory: `/home/{{user-name}}`
* Default cache directory: `/home/{{user-name}}/.cache/chezmoi`

## Commands

* `chezmoi init` : Setup the source directory, generate the config file, and optionally update the destination directory to match the target state.

* chezmoi add
  * `chezmoi add ~/.bashrc` : Add plain `~/.bashrc` to source directory.
  * `chezmoi add ~/.gitconfig --template` : Add `~/.gitconfig` file as template.
  * `chezmoi add ~/.vim --recursive` : Add `~/.vim` folder.
  * `chezmoi add ~/.oh-my-zsh --exact --recursive` : Add exact `~/.oh-my-zsh` folder.

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

* [Chezmoi Site](https://www.chezmoi.io/)
* [twpayne/chezmoi](https://github.com/twpayne/chezmoi)
* [FiloSottile/age](https://github.com/FiloSottile/age)
* [gpg => GNU Privacy Guard](https://www.gnupg.org/)
* [text/template documentation](https://pkg.go.dev/text/template)
* [sprig documentation](https://masterminds.github.io/sprig/)
* [twpayne/dotfiles](https://github.com/twpayne/dotfiles)
* [felipecrs/dotfiles => Bootstrap your Ubuntu in a single command!](https://github.com/felipecrs/dotfiles)

# Installation

## Antix

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

* [Templates Reference](https://www.chezmoi.io/reference/templates/)

## Variables

* **`chezmoi execute-template '{{ VARIABLE-NAME }}'`**

* 

# Error and Solution

* next-error: {{error-1}}

## Package Installation

**{{error-1}}: `which vimdiff` command not found**

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

* Error and Solution

  * Package Installation
    * {2} [vimdiff is not available as 'vim'](https://stackoverflow.com/questions/55418145/vimdiff-is-not-available-as-vim)

* YouTube Tutorials
  * [Easily moving Linux installs BY Chris Titus Tech](https://www.youtube.com/watch?v=x6063EuxfEA)
