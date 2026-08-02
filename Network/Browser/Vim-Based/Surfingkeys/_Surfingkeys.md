# Surfingkeys.md

# Concept

> ChatGPT Question: 
> 
> surfingkeys visual mode usage explained

Surfingkeys' **Visual mode** is the equivalent of Vim's visual mode for web pages. It lets you move a text cursor, select text entirely from the keyboard, copy it, and search with it. Press **`v`** to enter Visual mode. The first press enters **Caret** mode (move the cursor), and pressing **`v`** again switches to **Range** mode (extend a selection). Press **`Esc`** to exit. ([Gitee][1])

***## Two states: Caret vs. Range***

* **Caret**: Moving the cursor does **not** select text.
* **Range**: Every movement extends or shrinks the current selection.

You can toggle between them by pressing **`v`** again while already in Visual mode. ([Gitee][1])

***## Basic movement***

Most motions are intentionally Vim-like:

| Key | Action               |
| --- | -------------------- |
| `h` | Left one character   |
| `l` | Right one character  |
| `j` | Down one visual line |
| `k` | Up one visual line   |
| `w` | Next word            |
| `b` | Previous word        |
| `0` | Beginning of line    |
| `$` | End of line          |

Example:

1. Press `v` (Caret).
2. Press `w w l` to move the cursor.
3. Press `v` again (Range).
4. Use `w` repeatedly to select words. ([Gitee][2])

***## Copy text***

Once text is selected:

* **`y`** — yank (copy) the selected text to the clipboard. ([DarkMatter in Cyberspace][3])

Typical workflow:

```
v      enter Caret
w w    move to start
v      switch to Range
w w w  extend selection
y      copy
Esc
```

***## Find text and enter Visual mode***

Press:

```
/
```

Type a search term and press **Enter**.

Surfingkeys highlights matches and automatically places you into **Caret Visual mode** at the first match.

Then:

* `n` → next match
* `N` → previous match

You can immediately start selecting from the match by pressing `v`. ([Gitee][1])

***## Search the word under the cursor***

While in Visual mode:

```
*
```

Searches for the word currently under the cursor, similar to Vim. ([Gitee][1])

***## Select a paragraph***

From Normal mode:

```
zv
```

Selects the current paragraph directly, which is handy before copying or searching. ([DarkMatter in Cyberspace][3])

***## Swap the active end of a selection***

```
o
```

Moves the cursor to the opposite end of the current selection, allowing you to adjust either end without starting over. ([DarkMatter in Cyberspace][3])

***## Open links from Visual mode***

If the caret is positioned on a hyperlink:

```
Enter
```

(or the mapped action for following links, depending on your configuration) activates the link without leaving keyboard navigation. ([DarkMatter in Cyberspace][3])

***## Practical examples***

**Copy one sentence**

```
v
w
v
e e e
y
```

**Search for a word on the page**

```
/
function
Enter
n
N
```

**Copy an entire paragraph**

```
zv
y
```

***## Visual mode mappings***

If you're customizing Surfingkeys, mappings specific to Visual mode use:

```javascript
vmapkey(...)
vmap(...)
vunmap(...)
```

These are the Visual-mode equivalents of `mapkey`, `map`, and `unmap` for Normal mode. ([Gitee][1])

If you're already comfortable with Vim, Visual mode in Surfingkeys feels very familiar: use Vim motions (`hjkl`, `w`, `b`, `0`, `$`) to navigate, press `v` to toggle between moving and selecting, `y` to copy, `/` to search, `n`/`N` to jump through matches, and `*` to search for the word under the cursor.

[1]: https://gitee.com/voghost/Surfingkeys/blob/master/README.md?utm_source=chatgpt.com "README.md · edgar Liu/Surfingkeys - Gitee.com"
[2]: https://gitee.com/xiongxinmanman/Surfingkeys/blob/master/README_CN.md?utm_source=chatgpt.com "README_CN.md · xx/Surfingkeys - Gitee.com"
[3]: https://leetschau.github.io/surfingkeys-notes.html?utm_source=chatgpt.com "Surfingkeys Notes · DarkMatter in Cyberspace"


# References

## Websites

* [brookhong/Surfingkeys GitHub](https://github.com/brookhong/Surfingkeys)
* [Surfingkeys Chrome Extension](https://chromewebstore.google.com/detail/surfingkeys/gfbliohnnapiefjpjlpjnehglfpaknnc)
