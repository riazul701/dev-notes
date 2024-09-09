# Commands

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
  * `~/.config/chezmoi/chezmoi.toml`
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

# Chezmoi.md

## Websites

* [Chezmoi Site](https://www.chezmoi.io/)
* [twpayne/chezmoi](https://github.com/twpayne/chezmoi)
* [FiloSottile/age](https://github.com/FiloSottile/age)
* [gpg => GNU Privacy Guard](https://www.gnupg.org/)

# Installation

## Antix

* One-line binary install
  * `sh -c "$(curl -fsLS get.chezmoi.io)"`
  * Chezmoi is install in `~/bin/chezmoi`
  * Move to `$PATH`: `sudo mv ~/bin/chezmoi /usr/local/bin/chezmoi`
  * Check version: `chezmoi --version`

# References

* Installation
  * [Chezmoi Install](https://www.chezmoi.io/install/)
