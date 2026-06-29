# Setup.md

## Windows-OS

* Open powershell in administrator mode to install scoop apps globally for all windows users.

* `scoop install main/git --global`

* `scoop install main/fzf --global`

* `scoop install main/fd --global`

* `scoop install main/eza --global`

* `scoop install main/php --global`
  * `php -v` command shows output:

```markdown
PHP 8.5.2 (cli) (built: Jan 13 2026 21:54:57) (ZTS Visual C++ 2022 x64)
Copyright (c) The PHP Group
Built by The PHP Group
Zend Engine v4.5.2, Copyright (c) Zend Technologies
    with Zend OPcache v8.5.2, Copyright (c), by Zend Technologies
```

* `scoop install main/composer --global`

# Concept

> ChatGPT Question: 
> 
> using bash script, send/copy all files inside a folder to specific directory 
> location where location is written inside file

You can do this with a Bash script by **reading the destination path from each file**, then copying the file to that path.

Below are a few common ways depending on how the “location is written inside file” is formatted.

---

***## ✅ Case 1: Destination path is inside the file (first line)***

Assume each file contains something like:

```
/home/user/target-folder/
```

***### Bash script:***

```bash
#!/bin/bash

SRC_DIR="/path/to/source"

for file in "$SRC_DIR"/*; do
    # read first line = destination path
    dest=$(head -n 1 "$file")

    # ensure destination exists
    mkdir -p "$dest"

    # copy file
    cp "$file" "$dest/"
done
```

---

***## ✅ Case 2: File contains a label like `DEST=...`***

Example file content:

```
DEST=/home/user/target-folder/
```

***### Script:***

```bash
#!/bin/bash

SRC_DIR="/path/to/source"

for file in "$SRC_DIR"/*; do
    dest=$(grep '^DEST=' "$file" | cut -d= -f2)

    if [ -n "$dest" ]; then
        mkdir -p "$dest"
        cp "$file" "$dest/"
    else
        echo "No destination found in $file"
    fi
done
```

---

***## ✅ Case 3: Destination path is somewhere in file (more flexible parsing)***

If the path appears anywhere in the file:

```bash
dest=$(grep -oE '/[a-zA-Z0-9_./-]+' "$file" | head -n 1)
```

Then copy the same way.

---

***## ⚠️ Important notes***

* Always quote variables: `"$file"` and `"$dest"` to avoid path issues
* Use `mkdir -p` so missing folders are created
* Test first with:

  ```bash
  echo cp "$file" "$dest/"
  ```

  before actually copying

---

***## 👍 Optional safer version (dry run mode)***

```bash
echo cp "$file" "$dest/"
```

---

If you tell me **exactly how the destination is written inside your files** (example content), I can tailor the script perfectly for your case.

==================================================================================

> ChatGPT Question: 
> 
> `composer create-project laravel/laravel:^13.8.0 "$destination_root"` shows error
> The openssl extension is required for SSL/TLS protection but is not available. 
> If you can not enable the openssl extension, you
> can disable this error, at your own risk, by setting the 'disable-tls' option to true.

That error means **PHP used by Composer does not have the OpenSSL extension enabled**, and Composer refuses to download packages securely.

***### ✅ Fix (recommended): enable OpenSSL in PHP***

***#### 1. Check if OpenSSL is installed***

```bash
php -m | grep openssl
```

If nothing shows up → it’s missing or disabled.

---

***## 🐧 Linux (Ubuntu / Debian)***

Install the extension:

```bash
sudo apt update
sudo apt install php-openssl
```

Or for a specific PHP version:

```bash
sudo apt install php8.3-openssl
```

Then restart PHP (if using FPM/Apache):

```bash
sudo systemctl restart apache2
# or
sudo systemctl restart php8.3-fpm
```

---

***## 🧩 CentOS / RHEL / Fedora***

```bash
sudo dnf install php-openssl
```

---

***## 🍎 macOS (Homebrew PHP)***

OpenSSL is usually bundled, but you may need to reinstall PHP:

```bash
brew reinstall php
```

Then ensure correct PHP is used:

```bash
which php
php -v
```

---

***## 🪟 Windows (XAMPP/WAMP)***

1. Open `php.ini`
2. Uncomment this line:

```ini
extension=openssl
```

3. Restart Apache / PHP

---

***## ⚠️ Temporary workaround (NOT recommended)***

You *can* bypass SSL check (unsafe):

```bash
composer config -g disable-tls true
```

or

```bash
composer create-project laravel/laravel --no-secure-http
```

But this exposes you to insecure downloads (MITM attacks), so avoid unless absolutely necessary.

---

***## 🔍 After fixing, verify***

```bash
php -m | grep openssl
composer diagnose
```

---

If you tell me your OS (Ubuntu, WSL, Windows, etc.), I can give exact commands for your setup.
