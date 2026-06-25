# Debugging-LazyVim.md

# Concept

> ChatGPT Question: 
> 
> For raw php file, debugger setup in lazyvim

For a **raw PHP file** (not a framework), debugging in **LazyVim** is basically:

1. Enable DAP support.
2. Install the PHP debug adapter.
3. Install and configure Xdebug.
4. Add a PHP DAP configuration. ([LazyVim][1])

***### 1. Enable DAP in LazyVim***

Run:

```vim
:LazyExtras
```

Enable:

* `dap.core`
* `lang.php`

The PHP extra already registers a PHP DAP adapter using `php-debug-adapter`. ([LazyVim][2])

---

***### 2. Install the PHP debug adapter***

Open Mason:

```vim
:Mason
```

Install:

```text
php-debug-adapter
```

LazyVim's PHP extra expects this adapter. ([LazyVim][2])

Verify:

```bash
php-debug-adapter --help
```

---

***### 3. Install Xdebug***

Check whether Xdebug is loaded:

```bash
php -v
```

or

```bash
php -m | grep xdebug
```

You should see `xdebug` in the output. Xdebug is required for PHP debugging. ([emacs-lsp.github.io][3])

---

***### 4. Configure Xdebug (CLI PHP)***

Find your php.ini:

```bash
php --ini
```

Add something like:

```ini
zend_extension=xdebug

xdebug.mode=debug
xdebug.start_with_request=yes
xdebug.client_host=127.0.0.1
xdebug.client_port=9003
```

Port `9003` is the default for Xdebug 3. Community reports frequently mention mismatches between Xdebug 2 and Xdebug 3 ports/configuration as a cause of failures. ([Reddit][4])

Verify:

```bash
php -i | grep xdebug.client_port
```

Should show:

```text
9003
```

---

***### 5. Add DAP configuration***

Create:

```text
~/.config/nvim/lua/plugins/php-dap.lua
```

```lua
return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
      }
    end,
  },
}
```

This is the standard configuration used with Xdebug. ([Reddit][5])

---

***### 6. Debug a standalone PHP file***

Example:

```php
<?php

$a = 1;
$b = 2;

$c = $a + $b;

echo $c;
```

Set a breakpoint:

```vim
<leader>db
```

Start listening:

```vim
<leader>dc
```

Choose:

```text
Listen for Xdebug
```

Then run the script from a terminal:

```bash
php test.php
```

Because `xdebug.start_with_request=yes`, Xdebug will connect to Neovim automatically and stop at your breakpoint. ([LazyVim][2])

---

***### Useful DAP keys in LazyVim***

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue / Start  |
| `<leader>di` | Step into         |
| `<leader>do` | Step over         |
| `<leader>dO` | Step out          |
| `<leader>dr` | Open REPL         |

Provided by the DAP Core extra. ([LazyVim][1])

If you're getting "breakpoint never hits", send:

* output of `php -v`
* output of `php -m | grep xdebug`
* your `php.ini` Xdebug section
* whether you're running plain PHP or Docker

and I can help pinpoint the issue.

[1]: https://www.lazyvim.org/extras/dap/core?utm_source=chatgpt.com "DAP Core | LazyVim"
[2]: https://www.lazyvim.org/extras/lang/php?utm_source=chatgpt.com "PHP | LazyVim"
[3]: https://emacs-lsp.github.io/lsp-mode/tutorials/php-guide/?utm_source=chatgpt.com "Configuring Emacs as a PHP IDE - LSP Mode - LSP support for Emacs"
[4]: https://www.reddit.com/r/neovim/comments/16pf3ze?utm_source=chatgpt.com "How to make php xdebug work with mason-nvim-dap?"
[5]: https://www.reddit.com/r/lunarvim/comments/14t8kz5?utm_source=chatgpt.com "Debug Adapter config file location?"
