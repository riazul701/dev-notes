# Setup.md

## PHP Web Server

* `cd "$HOME/tmp/code/php"` (bash, powershell) : Go to `$HOME/tmp/code/php` directory.

* `php -S localhost:9000` (powershell) : Start php web server.

* Open web browser and enter address : `http://localhost:9000/`
  * After running `app.sh` script every time, reload web browser.

# Installation

## Windows-OS

* Open powershell in administrator mode to install scoop apps globally for all windows users.

* `scoop install main/git --global`

* `scoop install main/fzf --global`

* `scoop install main/php --global`

# Concept

> ChatGPT Question: 
> 
> using sed, remove leading blank lines contain spaces and tabs

A concise `sed` solution to remove **leading lines that contain only spaces and/or tabs** is:

```bash
sed '/[^[:space:]]/,$!d'
```

Example:

Input:

```text
    
      
   
First sentence
Second sentence

```

Output:

```text
First sentence
Second sentence

```

If you want a version that explicitly removes only leading whitespace-only lines and stops once it reaches the first non-blank line:

```bash
sed '1{/^[[:space:]]*$/{
:loop
N
s/^\([[:space:]]*\n\)*//
}}'
```

But for most cases, the first command is the simplest and most readable:

```bash
sed '/[^[:space:]]/,$!d'
```
