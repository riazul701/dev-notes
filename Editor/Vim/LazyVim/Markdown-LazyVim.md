# Markdown-Lazyvim.md

## Markdown Shown As Interpreted In Neovim

* Markdown rendering is often done through Neovim's conceal feature.

* Run: `:set conceallevel?`, If it returns something like: `conceallevel=2`, set it to: `:set conceallevel=0`

* To make it permanent: `vim.opt.conceallevel = 0`

* or specifically for Markdown:

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
```

# Concept

> ChatGPT Question:
> 
> markdown files are shown in lazyvim as interpreted, show as plain text

If Markdown files are being **rendered/interpreted** in LazyVim instead of displayed as plain text, it's usually caused by a plugin such as a Markdown preview or rendering plugin.

Here are the most common fixes:

### 1. Check if `render-markdown.nvim` is enabled

LazyVim often includes or recommends `render-markdown.nvim`.

Run:

```vim
:Lazy
```

Search for:

* `render-markdown.nvim`
* `markview.nvim`
* `headlines.nvim`

If `render-markdown.nvim` is active, disable it by creating:

```lua
-- ~/.config/nvim/lua/plugins/disable-markdown.lua
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
}
```

Then restart Neovim and run:

```vim
:Lazy sync
```

---

### 2. Check conceal level

Markdown rendering is often done through Neovim's conceal feature.

Run:

```vim
:set conceallevel?
```

If it returns something like:

```
conceallevel=2
```

set it to:

```vim
:set conceallevel=0
```

To make it permanent:

```lua
vim.opt.conceallevel = 0
```

or specifically for Markdown:

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
```

---

### 3. Check Treesitter highlighting

If it's syntax highlighting (not rendering) you can test with:

```vim
:TSBufDisable highlight
```

If that fixes it, then it's a Treesitter-related issue.

---

### 4. Identify the plugin

Run:

```vim
:Inspect
```

or

```vim
:verbose set conceallevel?
```

or

```vim
:Lazy
```

to see which plugin is responsible.

---

### 5. If it's Glow or Markdown Preview

These only render in a separate window/browser and should not affect editing. If they are automatically launching, disable the corresponding plugin.

---

### To help diagnose

Can you describe what you mean by "interpreted"?

For example, are you seeing:

* `# Heading` displayed as a large heading (without the `#`)?
* Checkboxes like `- [ ]` shown as fancy icons?
* Bold markers `**text**` hidden?
* Tables rendered with special borders?
* Something else?

Also, please share the output of:

```vim
:Lazy
```

filtered for anything containing "markdown", or the output of:

```vim
:set conceallevel?
```
# References

