# Commands & Usage

## Websites

* [Command overview](https://www.chezmoi.io/user-guide/command-overview/)
* [Chezmoi Commands Reference](https://www.chezmoi.io/reference/commands/)

## Notes

* By default, chezmoi will use your preferred editor as defined by the `$VISUAL` or `$EDITOR` environment variables, falling back to a default editor depending on your operating system (`vi` on UNIX-like operating systems, `notepad.exe` on Windows).

## Commands

* `sudo snap install chezmoi --classic` : Install Chezmoi using Snap package manager. 

* {D} `chezmoi --help` : Chezmoi help.

* `chezmoi init` : Setup the source directory, generate the config file, and optionally update the destination directory to match the target state.

* chezmoi add
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
  * Examples
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

* chezmoi age
  * `age encrypt [file...]` : Encrypt file or standard input.
  * `age encrypt [file...] --passphrase` OR `age encrypt [file...] --p` : Encrypt with a passphrase.
  * `age decrypt [file...]` : Decrypt file or standard input.
  * `age decrypt [file...] --passphrase` OR `age decrypt [file...] --p` : Decrypt with a passphrase.
  * Examples
    * `chezmoi age encrypt --passphrase plaintext.txt > ciphertext.txt`
    * `chezmoi age decrypt --passphrase ciphertext.txt > decrypted-ciphertext.txt`

* chezmoi apply
  * `chezmoi apply --exclude={{types}}` OR `chezmoi apply -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi apply --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi apply --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi apply --include={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi apply --include=files` : Specifies all files.
  * `chezmoi apply --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi apply --parent-dirs` OR `chezmoi apply -P` : Execute the command on target and all its parent directories.
  * `chezmoi apply --recursive` OR `chezmoi apply -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.
  * `chezmoi apply --source-path` : Specify targets by source path, rather than target path. This is useful for applying changes after editing.
  * Examples
    * `chezmoi apply`
    * `chezmoi apply --dry-run --verbose`
    * `chezmoi apply ~/.bashrc`

* chezmoi archive
  * `chezmoi archive --format` OR `chezmoi archive -f` : Write the archive in format. If `--output` is set the format is guessed from the extension, otherwise the default is `tar`.
  * `chezmoi archive --gzip` OR `chezmoi archive -z` : Compress the archive with gzip. This is automatically set if the format is `tar.gz` or `tgz` and is ignored if the format is `zip`.
  * `chezmoi archive --exclude={{types}}` OR `chezmoi archive -x={{types}}`
    * `chezmoi archive --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi archive --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi archive --include={{types}}` OR `chezmoi archive -i={{types}}`
    * `chezmoi archive --include=files` : Specifies all files.
  * `chezmoi archive --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi archive --parent-dirs` OR `chezmoi archive -P` : Execute the command on target and all its parent directories.
  * `chezmoi archive --recursive` OR `chezmoi archive -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.
  * Examples
    * `chezmoi archive | tar tvf -`
    * `chezmoi archive --output=dotfiles.tar.gz`
    * `chezmoi archive --output=dotfiles.zip`

* chezmoi cat
  * `chezmoi cat {{target}}` : Write the target contents of targets to stdout. targets must be files, scripts, or symlinks.
  * Examples
    * `chezmoi cat ~/.bashrc`

* `chezmoi cat-config` : Print the configuration file.

* chezmoi cd
  * `chezmoi cd {{path}}` : Launch a shell in the working tree (typically the source directory).
  * `cd $(chezmoi source-path)` : This does not change the current directory of the current shell. To do that, instead use
  * Examples
    * `chezmoi cd` : Go to source directory root.
    * `chezmoi cd ~` : Go to source directory root.
    * `chezmoi cd ~/.config` : Go to source `~/.config` directory.

* chezmoi chattr
  * `chezmoi chattr {{modifier}} {{target}}` : Change the attributes and/or type of targets. modifier specifies what to modify.
  * `chezmoi chattr --recursive` OR `chezmoi chattr -r` : Recurse into subdirectories.
  * Examples
    * `chezmoi chattr template ~/.bashrc` : Convert `executable_dot_bashrc` to `executable_dot_bashrc.tmpl` in source directory.
    * `chezmoi chattr noempty ~/.profile` : No change in source directory.
    * `chezmoi chattr private,template ~/.netrc` : Convert `executable_dot_netrc` to `private_executable_dot_netrc.tmpl` in source directory.
    * `chezmoi chattr -- -x ~/.zshrc` : Convert `executable_dot_zshrc` to `dot_zshrc` in source directory.
    * `chezmoi chattr +create,+private ~/.kube/config` : Convert `dot_kube/executable_dot_config` to `dot_kube/create_private_executable_dot_config` in source directory.

* chezmoi completion
  * `chezmoi completion shell` : Generate shell completion code for the specified shell (`bash`, `fish`, `powershell`, or `zsh`).
  * Examples
    * `chezmoi completion bash` : Print chezmoi bash completion to stdout.
    * `chezmoi completion fish --output=~/.config/fish/completions/chezmoi.fish` : Write chezmoi fish completion to `~/.config/fish/completions/chezmoi.fish` file.

* chezmoi data
  * `chezmoi data` : Write the computed template data to stdout.
  * `chezmoi data --format={{json|yaml}}` OR `chezmoi data -f={{json|yaml}}` : Set the output format, `json` by default.
  * Examples
    * `chezmoi data`
    * `chezmoi data --format=yaml`

* chezmoi decrypt
  * For decryption use public key from `/home/{{user-name}}/.config/chezmoi/chezmoi.toml` file and private key from `/home/{{user-name}}/key.txt` file.
  * `decrypt {{file}}` : Decrypt files using chezmoi's configured encryption. If no files are given, decrypt the standard input.
  * `decrypt {{file}} --output={{output-file}}` : The decrypted result is written to the standard output or a file if the `--output` flag is set.
  * Examples Test
    * `chezmoi decrypt ~/.local/share/chezmoi/encrypted_dot_config.age` : Decrypt previously encrypted file and print to stdout.
    * `chezmoi decrypt ~/.local/share/chezmoi/encrypted_dot_config.age --output=~/decrypted_config` : Decrypt previously encrypted file and write to `~/decrypted_config` file.

* chezmoi destroy
  * `chezmoi destroy {{target...}}` : Remove target from the source state, the destination directory, and the state. with prompt
  * `chezmoi destroy --force {{target...}}` : Destroy without prompting.
  * `chezmoi destroy --recursive {{target...}}` OR `chezmoi destroy -r {{target...}}` : Recurse into subdirectories.

* chezmoi diff
  * "diff" shows output in terminal/stdout
  * `chezmoi diff [target...]` : Print the difference between the target state and the destination state for targets.
  * `chezmoi diff` : If no targets are specified, print the differences for all targets. Prints all diff in stdout from source to destination directory.
  * `chezmoi diff --pager {{pager}}` : Pager to use for output. Configuration: `diff.pager`
    * `chezmoi diff --pager=less` : Shows all diff using "less" pager program.
    * `chezmoi diff | less` : Shows all diff using "less" pager program.
  * `chezmoi diff --reverse` : Prints all diff in stdout from destination to source directory directory. Configuration: `diff.reverse`
    * `chezmoi diff --reverse ~/.bashrc` : Prints `~/.bashrc` file diff in stdout from destination to source directory.
  * `chezmoi diff --script-contents` : Show script contents, defaults to `true`.
  * `chezmoi diff --exclude={{types}}` OR `chezmoi diff -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi diff --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi diff --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi diff --include={{types}}` OR `chezmoi diff -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi diff --include=files` : Specifies all files.
  * `chezmoi diff --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi diff --parent-dirs` OR `chezmoi diff -P` : Execute the command on target and all its parent directories.
  * `chezmoi diff --recursive` OR `chezmoi diff -r` : Recurse into subdirectories.
  * Examples
    * `chezmoi diff`
    * `chezmoi diff ~/.bashrc` : Prints `~/.bashrc` file diff in stdout from source to destination directory.

* chezmoi doctor
  * `chezmoi doctor` : Check for potential problems.
  * `chezmoi doctor --no-network` : Do not use any network connections.

* chezmoi dump
  * `chezmoi dump [target...]` : Dump the target state of targets (from source directory). If no targets are specified, then the entire target state.
  * `chezmoi dump --exclude={{types}}` OR `chezmoi dump -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi dump --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi dump --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi dump --include={{types}}` OR `chezmoi dump -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi dump --include=files` : Specifies all files.
  * `chezmoi dump --format={{json|yaml}}` OR `chezmoi dump -f={{json|yaml}}` : Set the output format, `json` by default.
    * `chezmoi dump --format=yaml` : Dump all files in yaml format.
    * `chezmoi dump --format=yaml | less` : Dump all files in yaml format using "less" pager program.
    * `chezmoi dump --format=json` : Dump all files in json format.
  * `chezmoi dump --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi dump --parent-dirs` OR `chezmoi dump -P` : Execute the command on target and all its parent directories.
  * `chezmoi dump --recursive` OR `chezmoi dump -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.
  * Examples Test
    * `chezmoi dump ~/.bashrc` : Dump contents of `~/.bashrc` from source directory.

* chezmoi dump-config
  * `chezmoi dump-config` : Dump the configuration.
  * `chezmoi dump-config --format={{json|yaml}}` OR `chezmoi dump-config -f={{json|yaml}}` : Set the output format, `json` by default.

* chezmoi edit
  * `chezmoi edit [target...]` : Edit the source state of targets, which must be files or symlinks. If no targets are given then the working tree of the source directory is opened.
  * `chezmoi edit [target...] --apply` OR `chezmoi edit [target...] -a` : Apply target immediately after editing. Ignored if there are no targets. Configuration: `edit.apply`
  * `chezmoi edit [target...] --hardlink={{bool}}` : Invoke the editor with a hard link to the source file with a name matching the target filename. This can help the editor determine the type of the file correctly. This is the default. Configuration: `edit.hardlink`
  * `chezmoi edit [target...] --watch` : Automatically apply changes when files are saved, with the following limitations. Configuration: `edit.watch`
  * `chezmoi edit --exclude={{types}}` OR `chezmoi edit -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi edit --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi edit --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi edit --include={{types}}` OR `chezmoi edit -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi edit --include=files` : Specifies all files.
  * `chezmoi edit --init` : Regenerate and reload the config file from its template before computing the target state.
  * Examples
    * `chezmoi edit ~/.bashrc` : Edit `~/.bashrc` file in source directory.
    * `chezmoi edit ~/.bashrc --apply` : Edit `~/.bashrc` file in source directory and apply to destination directory.
    * `chezmoi edit` : Open vim `netrw` file picker.

* chezmoi edit-config
  * `chezmoi edit-config` : Edit the configuration file.

* chezmoi edit-config-template
  * `chezmoi edit-config-template` : Edit the configuration file template. If no configuration file template exists, then a new one is created with the contents of the current config file.

* chezmoi encrypt
  * `chezmoi encrypt [file...]` : Encrypt files using chezmoi's configured encryption. If no files are given, encrypt the standard input. The encrypted result is written to the standard output.
  * `chezmoi encrypt [file...] --output={{file}}` : The encrypted result is written to the file.
  * Examples Test
  * `chezmoi encrypt ~/.config` : Prints `~/.config` file's encrypted content to stdout.
  * `chezmoi encrypt ~/.config --output=~/encrypted-config` : Write `~/.config` file's encrypted content to `~/encrypted-config`.

* chezmoi execute-template
  * `chezmoi execute-template [template...]` : Execute templates. If no templates are specified, the template is read from stdin.
  * `chezmoi execute-template [template...] --init` OR `chezmoi execute-template [template...] -i` : Include simulated functions only available during `chezmoi init`.
  * `chezmoi execute-template [template...] --left-delimiter={{delimiter}}` : Set the left template delimiter.
  * `chezmoi execute-template [template...] --promptBool={{pairs}}` : Simulate the `promptBool` template function with a function that returns values from pairs. pairs is a comma-separated list of `prompt=value` pairs.
  * `chezmoi execute-template [template...] --promptChoice={{pairs}}` : Simulate the promptChoice template function with a function that returns values from pairs.
  * `chezmoi execute-template [template...] --promptInt={{pairs}}` : Simulate the `promptInt` template function with a function that returns values from pairs.
  * `chezmoi execute-template [template...] --promptString={{pairs}}` OR `chezmoi execute-template [template...] -p={{pairs}}` : Simulate the `promptString` template function with a function that returns values from pairs.
  * `chezmoi execute-template [template...] --right-delimiter={{delimiter}}` : Set the right template delimiter.
  * `chezmoi execute-template [template...] --stdinisatty={{bool}}` : Simulate the `stdinIsATTY` function by returning bool.
  * `chezmoi execute-template [template...] --with-stdin` : If run with arguments, then set `.chezmoi.stdin` to the contents of the standard input.
  * Examples
    * `chezmoi execute-template '{{ .chezmoi.sourceDir }}'`
    * `chezmoi execute-template '{{ .chezmoi.os }}' / '{{ .chezmoi.arch }}'`
    * `echo '{{ .chezmoi | toJson }}' | chezmoi execute-template`
    * `chezmoi execute-template --init --promptString email=me@home.org < ~/.local/share/chezmoi/.chezmoi.toml.tmpl`

* chezmoi forget
  * `chezmoi forget {{target...}}` : Remove targets from the source state, i.e. stop managing them. targets must have entries in the source state.
  * Examples
    * `chezmoi forget ~/.bashrc`

* chezmoi generate
  * `chezmoi generate {{output}}` : Generates output for use with chezmoi.
    * `chezmoi generate git-commit-message` : A git commit message, describing the changes to the source directory.
    * `chezmoi generate install.sh` : An install script, suitable for use with GitHub Codespaces
  * Examples
    * `chezmoi generate install.sh > install.sh`
    * `chezmoi git commit -m "$(chezmoi generate git-commit-message)"`

* chezmoi git
  * `chezmoi git [arg...]` : Run `git` args in the working tree (typically the source directory).
  * Note: Flags in args must occur after `--` to prevent chezmoi from interpreting them.
  * Examples
    * `chezmoi git add .`
    * `chezmoi git add dot_gitconfig`
    * `chezmoi git -- commit -m "Add .gitconfig"`

* chezmoi help
  * `help [command...]` : Print the help associated with command, or general help if no command is given.

* chezmoi ignored
  * `chezmoi ignored` : Print the list of entries ignored by chezmoi.
  * `chezmoi ignored --tree` OR `chezmoi ignored -t` : Print paths as a tree instead of a list.

* chezmoi import
  * `chezmoi import {{filename}}` : Import the source state from an archive file in to a directory in the source state.
  * `chezmoi import {{filename}} --destination` OR `chezmoi import {{filename}} -d` : Set the destination (in the source state) where the archive will be imported.
  * `chezmoi import {{filename}} --exact` : Set the `exact` attribute on all imported directories.
  * `chezmoi import {{filename}} --remove-destination` OR `chezmoi import {{filename}} -r` : Remove destination (in the source state) before importing.
  * `chezmoi import {{filename}} --strip-components={{n}}` : Strip n leading components from paths.
  * `chezmoi import {{filename}} --exclude={{types}}` OR `chezmoi import {{filename}} -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi import {{filename}} --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi import {{filename}} --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi import {{filename}} --include={{types}}` OR `chezmoi import {{filename}} -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi import {{filename}} --include=files` : Specifies all files.
  * Examples
    * `curl -s -L -o ${TMPDIR}/oh-my-zsh-master.tar.gz https://github.com/ohmyzsh/ohmyzsh/archive/master.tar.gz`
    * `mkdir -p $(chezmoi source-path)/dot_oh-my-zsh`
    * `chezmoi import --strip-components 1 --destination ~/.oh-my-zsh ${TMPDIR}/oh-my-zsh-master.tar.gz`

* chezmoi init
  * `chezmoi init [repo]` : Setup the source directory, generate the config file, and optionally update the destination directory to match the target state.
  * `chezmoi init [repo] --apply` OR `chezmoi init [repo] -a` : Run `chezmoi apply` after checking out the repo and creating the config file.
  * `chezmoi init [repo] --branch={{branch}}` : Check out branch instead of the default branch.
  * `chezmoi init [repo] --config-path={{path}}` OR `chezmoi init [repo] -C={{path}}` : Write the generated config file to path instead of the default location.
  * `chezmoi init [repo] --data={{bool}}` : Include existing template data when creating the config file. This defaults to `true`. Set this to `false` to simulate creating the config file with no existing template data.
  * `chezmoi init [repo] --depth={{depth}}` OR `chezmoi init [repo] -d={{depth}}` : Clone the repo with depth depth.
  * `chezmoi init [repo] --git-lfs={{bool}}` : Run `git lfs pull` after cloning the repo.
  * `chezmoi init [repo] --guess-repo-url={{bool}}` OR `chezmoi init [repo] -g={{bool}}` : Guess the repo URL from the repo argument. This defaults to `true`.
  * `chezmoi init [repo] --one-shot` : `--one-shot` is the equivalent of `--apply`, `--depth=1`, `--force`, `--purge`, and `--purge-binary`. It attempts to install your dotfiles with chezmoi and then remove all traces of chezmoi from the system. This is useful for setting up temporary environments (e.g. Docker containers).
  * `chezmoi init [repo] --promptBool={{pairs}}` : Populate the `promptBool` template function with values from pairs. pairs is a comma-separated list of `prompt=value` pairs. If `promptBool` is called with a prompt that does not match any of pairs, then it prompts the user for a value.
  * `chezmoi init [repo] --promptChoice={{pairs}}` : Populate the `promptChoice` template function with values from pairs. pairs is a comma-separated list of `prompt=value` pairs. If `promptChoice` is called with a prompt that does not match any of pairs, then it prompts the user for a value.
  * `chezmoi init [repo] --promptDefaults` : Make all `prompt*` template function calls with a default value return that default value instead of prompting.
  * `chezmoi init [repo] --promptInt={{pairs}}` : Populate the `promptInt` template function with values from pairs. pairs is a comma-separated list of `prompt=value` pairs. If `prompInt` is called with a prompt that does not match any of pairs, then it prompts the user for a value.
  * `chezmoi init [repo] --promptString={{pairs}}` : Populate the `promptString` template function with values from pairs. pairs is a comma-separated list of `prompt=value` pairs. If `promptString` is called with a prompt that does not match any of pairs, then it prompts the user for a value.
  * `chezmoi init [repo] --purge` OR `chezmoi init [repo] -p` : Remove the source and config directories after applying.
  * `chezmoi init [repo] --purge-binary` OR `chezmoi init [repo] -P` : Attempt to remove the chezmoi binary after applying.
  * `chezmoi init [repo] --recurse-submodules={{bool}}` : Recursively clone submodules. This defaults to `true`.
  * `chezmoi init [repo] --ssh` : Guess an SSH repo URL instead of an HTTPS repo.
  * `chezmoi init [repo] --exclude={{types}}` OR `chezmoi init [repo] -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi init [repo] --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi init [repo] --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi init [repo] --include={{types}}` OR `chezmoi init [repo] -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi init [repo] --include=files` : Specifies all files.
  * Examples
    * `chezmoi init user`
    * `chezmoi init user --apply`
    * `chezmoi init user --apply --purge`
    * `chezmoi init user/dots`
    * `chezmoi init codeberg.org/user`
    * `chezmoi init gitlab.com/user`

* chezmoi license
  * `chezmoi license` : Print chezmoi's license.

* chezmoi list
  * `list` is an alias for `managed`.

* chezmoi manage
  * `manage {{target...}}` : `manage` is an alias for `add` for symmetry with `unmanage`.

* chezmoi managed
  * `chezmoi managed [path...]` : List all managed entries in the destination directory under all paths in alphabetical order. When no paths are supplied, list all managed entries in the destination directory in alphabetical order.
  * `chezmoi managed [path...] --exclude={{types}}` OR `chezmoi managed [path...] -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi managed [path...] --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi managed [path...] --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi managed [path...] --include={{types}}` OR `chezmoi managed [path...] -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi managed [path...] --include=files` : Specifies all files.
  * `chezmoi managed [path...] --path-style={{style}}` OR `chezmoi managed [path...] -p={{style}}` : Print paths in the given style. The default is `relative`.
  * `chezmoi managed [path...] --tree` OR `chezmoi managed [path...] -t` : Print paths as a tree instead of a list.
  * Examples
    * `chezmoi managed`
    * `chezmoi managed --include=files`
    * `chezmoi managed --include=files,symlinks`
    * `chezmoi managed -i dirs`
    * `chezmoi managed -i dirs,files`
    * `chezmoi managed -i files ~/.config`
    * `chezmoi managed --exclude=encrypted --path-style=source-relative`

* chezmoi merge
  * `chezmoi merge {{target...}}` : Perform a three-way merge between the destination state, the target state, and the source state for each target. The merge tool is defined by the `merge.command` configuration variable, and defaults to `vimdiff`.
  * Examples
    * `chezmoi merge ~/.bashrc`

* chezmoi merge-all
  * `chezmoi merge-all` : Perform a three-way merge for file whose actual state does not match its target state. The merge is performed with `chezmoi merge`.
  * `chezmoi merge-all --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi merge-all --recursive` OR `chezmoi merge-all -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.

* chezmoi purge
  * `chezmoi purge` : Remove chezmoi's configuration, state, and source directory, but leave the target state intact.
  * `chezmoi purge --binary` OR `chezmoi purge -P` : Purge chezmoi binary.
  * `chezmoi purge --force` : Remove without prompting.

* chezmoi re-add
  * `chezmoi re-add [target...]` : Re-add modified files in the target state, preserving any `encrypted_` attributes. chezmoi will not overwrite templates, and all entries that are not files are ignored. Directories are recursed into by default.
  * `chezmoi re-add [target...] --exclude={{types}}` OR `chezmoi re-add [target...] -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi re-add [target...] --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi re-add [target...] --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi re-add [target...] --include={{types}}` OR `chezmoi re-add [target...] -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi re-add [target...] --include=files` : Specifies all files.
  * `chezmoi re-add [target...] --recursive` OR `chezmoi re-add [target...] -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.
  * Examples
    * `chezmoi re-add`
    * `chezmoi re-add ~/.bashrc`
    * `chezmoi re-add --recursive=false ~/.config/git`
  * Notes: If you want to re-add a single file unconditionally, use `chezmoi add --force` instead.

* chezmoi remove
  * The `remove` command has been removed. Use the `forget command` or the `destroy command` instead.

* chezmoi rm
  * The `rm` command has been removed. Use the `forget command` or the `destroy command` instead.

* chezmoi secret
  * `chezmoi secret` : Run a secret manager's CLI, passing any extra arguments to the secret manager's CLI.
  * Note: If you need to pass flags to the secret manager's CLI you must separate them with `--` to prevent chezmoi from interpreting them.
  * `secret keyring delete`
    * `secret keyring delete --service={{string}}` : Name of the service.
    * `secret keyring delete --user={{string}}` : Name of the user.
  * `secret keyring get`
    * `secret keyring get --service={{string}}` : Name of the service.
    * `secret keyring get --user={{string}}` : Name of the user.
  * `secret keyring set`
    * `secret keyring set --service={{string}}` : Name of the service.
    * `secret keyring set --user={{string}}` : Name of the user.
    * `secret keyring set --value={{string}}` : New value.
  * Examples
    * `chezmoi secret keyring set --service=service --user=user --value=password`
    * `chezmoi secret keyring get --service=service --user=user`
    * `chezmoi secret keyring delete --service=service --user=user`

* chezmoi source-path
  * `source-path [target...]` : Print the path to each target's source state. If no targets are specified then print the source directory.
  * Examples
    * `chezmoi source-path`
    * `chezmoi source-path ~/.bashrc`

* chezmoi state
  * `chezmoi state` : Manipulate the persistent state.
  * `chezmoi state help` : To get a full list of subcommands run
  * `chezmoi state data` : Print the raw data in the persistent state.
  * `chezmoi state delete` : Delete a value from the persistent state.
  * `chezmoi state delete-bucket` : Delete a bucket from the persistent state.
  * `chezmoi state dump` : Generate a dump of the persistent state.
  * `chezmoi state get` : Get a value from the persistent state.
  * `chezmoi state get-bucket` : Get a bucket from the persistent state.
  * `chezmoi state reset` : Reset the persistent state.
  * `chezmoi state set` : Set a value from the persistent state
  * Examples
    * `chezmoi state data`
    * `chezmoi state delete --bucket=$BUCKET --key=$KEY`
    * `chezmoi state delete-bucket --bucket=$BUCKET`
    * `chezmoi state dump`
    * `chezmoi state get --bucket=$BUCKET --key=$KEY`
    * `chezmoi state get-bucket --bucket=$BUCKET`
    * `chezmoi state set --bucket=$BUCKET --key=$KEY --value=$VALUE`
    * `chezmoi state reset`

* chezmoi status
  * `chezmoi status` : Print the status of the files and scripts managed by chezmoi in a format similar to `git status`.
  * `chezmoi status --exclude={{types}}` OR `chezmoi status -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi status --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi status --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi status --include={{types}}` OR `chezmoi status -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi status --include=files` : Specifies all files.
  * `chezmoi status --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi status --parent-dirs` OR `chezmoi status -P` : Execute the command on target and all its parent directories.
  * `chezmoi status --path-style={{style}}` OR `chezmoi status -p={{style}}` : Print paths in the given style. The default is `relative`.
  * `chezmoi status --recursive` OR `chezmoi status -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.

* chezmoi target-path
  * `chezmoi target-path [source-path...]` : Print the target path of each source path. If no source paths are specified then print the target directory.
  * Examples
    * `chezmoi target-path`
    * `chezmoi target-path ~/.local/share/chezmoi/dot_zshrc`

* chezmoi unmanage
  * `chezmoi unmanage {{target...}}` : `unmanage` is an alias for `forget` for symmetry with `manage`.

* chezmoi unmanaged
  * `chezmoi unmanaged [path...]` : List all unmanaged files in paths. When no paths are supplied, list all unmanaged files in the destination directory.
  * `chezmoi unmanaged [path...] --path-style={{style}}` OR `chezmoi unmanaged [path...] -p={{style}}` : Print paths in the given style. The default is `relative`.
  * `chezmoi unmanaged [path...] --tree` OR `chezmoi unmanaged [path...] -t` : Print paths as a tree instead of a list.
  * Examples
    * `chezmoi unmanaged`
    * `chezmoi unmanaged ~/.config/chezmoi ~/.ssh`

* chezmoi update
  * `chezmoi update` : Pull changes from the source repo and apply any changes.
  * `chezmoi update --apply` OR `chezmoi update -a` : Apply changes after pulling, `true` by default. Can be disabled with `--apply=false`.
  * `chezmoi update --recurse-submodules` : Update submodules recursively. This defaults to `true`. Can be disabled with `--recurse-submodules=false`.
  * `chezmoi update --exclude={{types}}` OR `chezmoi update -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi update --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi update --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi update --include={{types}}` OR `chezmoi update -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi update --include=files` : Specifies all files.
  * `chezmoi update --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi update --parent-dirs` OR `chezmoi update -P` : Execute the command on target and all its parent directories.
  * `chezmoi update --recursive` OR `chezmoi update -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.

* chezmoi upgrade
  * `chezmoi upgrade` : Upgrade chezmoi by downloading and installing the latest released version.
  * Note: If you installed chezmoi using a package manager, the upgrade command might have been removed by the package maintainer.
  * `chezmoi upgrade --executable={{filename}}` : Set name of executable to replace.
  * `chezmoi upgrade --method={{method}}` : Override the upgrade method that was automatically detected by chezmoi.
  * Methods
    * `brew-upgrade` : Run `brew upgrade chezmoi`.
    * `replace-executable` : Download the latest released executable from Github.
    * `snap-refresh` : Run `snap refresh chezmoi`.
    * `sudo-upgrade-package` : Same as `upgrade-package` but use `sudo`.
    * `upgrade-package` : Download and install `.apk`, `.deb` or `.rpm` package. Run `pacman` on Arch Linux.

* chezmoi verify
  * `chezmoi verify [target...]` : Verify that all targets match their target state. chezmoi exits with code 0 (success) if all targets match their target state, or 1 (failure) otherwise. If no targets are specified then all targets are checked.
  * `chezmoi verify [target...] --exclude={{types}}` OR `chezmoi verify [target...] -x={{types}}` : Exclude target state entries of specific types. The default is `none`.
    * `chezmoi verify [target...] --exclude=scripts` : Will cause the command to not run scripts
    * `chezmoi verify [target...] --exclude=encrypted` : Will exclude encrypted files.
  * `chezmoi verify [target...] --include={{types}}` OR `chezmoi verify [target...] -i={{types}}` : Include target state entries of specific types. The default is `all`.
    * `chezmoi verify [target...] --include=files` : Specifies all files.
  * `chezmoi verify [target...] --init` : Regenerate and reload the config file from its template before computing the target state.
  * `chezmoi verify [target...] --parent-dirs` OR `chezmoi verify [target...] -P` : Execute the command on target and all its parent directories.
  * `chezmoi verify [target...] --recursive` OR `chezmoi verify [target...] -r` : Recurse into subdirectories. Enabled by default. Can be disabled with `--recursive=false`.
  * Examples
    * `chezmoi verify`
    * `chezmoi verify ~/.bashrc`

# Chezmoi.md

## Websites

* [chezmoi.io => Chezmoi Site](https://www.chezmoi.io/)
* [twpayne/chezmoi GitHub](https://github.com/twpayne/chezmoi)

* Encryption
  * [FiloSottile/age GitHub](https://github.com/FiloSottile/age)
  * [gpg => GNU Privacy Guard](https://www.gnupg.org/)
  * [str4d/rage GitHub](https://github.com/str4d/rage)

* Editor
  * Vi / Vim / notepad.exe (defined by `$VISUAL` or `$EDITOR` environment variables)
  * [Visual Studio Code => Use as chezmoi editor](https://code.visualstudio.com/)
  * [alker0/chezmoi.vim GitHub => Highlight dotfiles you manage with chezmoi](https://github.com/alker0/chezmoi.vim)
  * [Lilja/vim-chezmoi GitHub => Let's you apply files on write to chezmoi](https://github.com/Lilja/vim-chezmoi)
  * [xvzc/chezmoi.nvim GitHub => Chezmoi plugin for neovim](https://github.com/xvzc/chezmoi.nvim)
  * [tuh8888/chezmoi.el GitHub => An emacs package for interacting with chezmoi.](https://github.com/tuh8888/chezmoi.el)

* Diff/Merger/Pager
  * [Meld => Visual diff and merge tool](https://meldmerge.org/)
  * [Visual Studio Code => Use as chezmoi diff and merge tool](https://code.visualstudio.com/)
  * [dandavison.github.io/delta](https://dandavison.github.io/delta/) || [dandavison/delta GitHub](https://github.com/dandavison/delta)
  * [so-fancy/diff-so-fancy GitHub](https://github.com/so-fancy/diff-so-fancy)
  * Vimdiff
  * [neovim's diff mode](https://neovim.io/doc/user/diff.html)
  * "less" command
  * "more" command (scroll down but not up) <sup>{3}</sup>
  * "most" command

* Other Tools
  * [jqlang/jq GitHub](https://github.com/jqlang/jq)

* Dotfiles
  * [twpayne/dotfiles](https://github.com/twpayne/dotfiles)
  * [felipecrs/dotfiles => Bootstrap your Ubuntu in a single command!](https://github.com/felipecrs/dotfiles)

* Documentation
  * [text/template documentation](https://pkg.go.dev/text/template)
  * [sprig documentation](https://masterminds.github.io/sprig/)

## Notes

* Chezmoi has built-in "git", "age" command, these are used if not found on operating system's path.
* Chezmoi uses "vimdiff" as merge tool by default.

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

* next-sl: {4}

* Installation
  * {1} [Chezmoi Install](https://www.chezmoi.io/install/)

* Tutorials
  * [Chezmoi Commands Reference](https://www.chezmoi.io/reference/commands/)

* Guides
  * [Templating](https://www.chezmoi.io/user-guide/templating)
  * {3} [What are the differences between most, more and less?](https://unix.stackexchange.com/questions/81129/what-are-the-differences-between-most-more-and-less)

* Error and Solution

  * Package Installation
    * {2} [vimdiff is not available as 'vim'](https://stackoverflow.com/questions/55418145/vimdiff-is-not-available-as-vim)

* YouTube Tutorials
  * [Easily moving Linux installs BY Chris Titus Tech](https://www.youtube.com/watch?v=x6063EuxfEA)
