# Concept-Kitty.md

# Concept

> ChatGPT Question: 
> 
> Copy mode in kitty terminal

Kitty doesn't have a dedicated **copy mode** like `tmux`, but it has a very similar feature called **scrollback mode**.

***### Enter scrollback mode***

By default:

```text
Ctrl+Shift+H
```

This opens the terminal's entire scrollback in a pager (by default, `less`). From there, you're no longer interacting with the running shell—you're browsing the output history. ([Unix & Linux Stack Exchange][1])

***### What you can do***

Once in `less`:

* Scroll with `j`, `k`, arrow keys, `PageUp`, `PageDown`
* Search with `/pattern`
* Jump to next/previous match with `n`/`N`
* Go to the top with `g`
* Go to the bottom with `G`
* Select and copy using your pager's capabilities or your terminal's mouse selection. ([Unix & Linux Stack Exchange][1])

***### View only the last command's output***

Kitty also has a shortcut to open just the output of the most recent shell command:

```text
Ctrl+Shift+G
```

This is useful when the terminal contains a lot of history but you only want the last command's output. ([Unix & Linux Stack Exchange][1])

***### Configure a different pager***

You can replace `less` with another program (such as `nvim`) in `kitty.conf`:

```conf
scrollback_pager nvim
```

Many users configure Neovim as the scrollback pager so they get full Vim motions, visual mode, searching, and yanking over the terminal history. ([Unix & Linux Stack Exchange][1])

***### How this compares to tmux copy mode***

| Feature                 | Kitty scrollback                        | tmux copy mode                         |
| ----------------------- | --------------------------------------- | -------------------------------------- |
| Browse terminal history | ✅                                       | ✅                                      |
| Keyboard navigation     | Depends on pager (`less`, `nvim`, etc.) | Built in                               |
| Vim motions             | Via pager                               | Built in                               |
| Search                  | Via pager                               | Built in                               |
| Copy to clipboard       | Via Kitty or pager                      | Via tmux buffers/clipboard integration |

If you're coming from `tmux`, the closest equivalent is:

```
tmux:  Ctrl+b [
kitty: Ctrl+Shift+H
```

The main difference is that **tmux implements copy mode itself**, while **Kitty delegates it to a pager**, making it highly customizable.

[1]: https://unix.stackexchange.com/questions/500072/how-do-i-copy-and-paste-with-kitty?utm_source=chatgpt.com "terminal - How do I copy and paste with Kitty? - Unix & Linux Stack Exchange"

