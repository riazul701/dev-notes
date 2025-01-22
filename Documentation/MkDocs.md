# Documentation/MkDocs.md

## Websites

* [mkdocs.org => Project documentation with Markdown](https://www.mkdocs.org/)
* [mkdocs/mkdocs GitHub](https://github.com/mkdocs/mkdocs)

## Guides
* [How to document a project with MkDocs](https://www.youtube.com/watch?v=X-LbOBAd-xg)


# MkDocs Setup

## Linux MkDocs Setup

* [Getting Started with MkDocs](https://www.mkdocs.org/getting-started/)
* python --version
* pip --version
  * If shows "pip command not found": `sudo apt install pip`
* pip install mkdocs
 > WARNING: The script watchmedo is installed in '/home/<user-name>/.local/bin' which is not on PATH.
 > Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
 > WARNING: The script markdown_py is installed in '/home/<user-name>/.local/bin' which is not on PATH.
 > Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
 > WARNING: The script ghp-import is installed in '/home/<user-name>/.local/bin' which is not on PATH.
 > Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
 > WARNING: The script mkdocs is installed in '/home/<user-name>/.local/bin' which is not on PATH.
 > Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
* /home/<user-name>/.local/bin/mkdocs new Self-Project
* /home/<user-name>/.local/bin/mkdocs serve
* Contents of "mkdocs.yml" file
```yml
site_name: MkDocs-Test
docs_dir: Self-Project
```
* Note: Do not add to ".bashrc" file, because "mkdocs" command does not work outside of "bash" shell.
* [How to create a symbolic link in Linux](https://linuxhint.com/create-symbolic-link-linux/)
  * echo $PATH
  * ln -s original_file_name symbolic_file_name
  * sudo ln -s /home/<user-name>/.local/bin/mkdocs /usr/local/bin/mkdocs
  * mkdocs --help

* Add "mkdocs" to PATH using "~/.bashrc"
  * [How to permanently set $PATH on Linux/Unix [closed]](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux-unix)
  * [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * echo $PATH
  * echo 'export PATH="$PATH:/home/<user-name>/.local/bin"' >> ~/.bashrc
  * source ~/.bashrc
