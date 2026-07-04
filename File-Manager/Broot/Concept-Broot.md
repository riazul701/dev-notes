# Concept-Broot.md

# Concept

> ChatGPT Question: 
> 
> In broot, execute custom commands on selected files

In **broot**, you can execute custom commands on the currently selected file(s) by defining **verbs** in your configuration. Verbs can invoke external programs, internal broot commands, or sequences of commands. ([Dystroy][1])

For example, add a custom verb to your `~/.config/broot/conf.toml`:

```toml
[[verbs]]
invocation = "edit"
shortcut = "e"
external = "nvim {file}"
leave_broot = false
```

With a file selected:

1. Press `Space` (or `:`).
2. Type `edit` (or the shortcut `e`).
3. Press `Enter`.

`{file}` is replaced with the full path of the selected file. Other useful placeholders include:

* `{file-name}` – filename only
* `{parent}` – parent directory
* `{directory}` – nearest directory
* `{line}` – selected line in the preview
* `{other-panel-file}` – selection in the other panel ([Dystroy][1])

### Running commands on multiple selected files

You can stage multiple files and invoke the same verb. By default, broot runs the external command **once per selected file**. If you want a **single command** that receives all selected files, use one of the merging flags (`space-separated` or `comma-separated`) in the `external` pattern. ([Dystroy][1])

Example (zip all staged files together):

```toml
[[verbs]]
invocation = "zip {archive}"
external = "zip -r {archive}.zip {space-separated-files}"
```

(Consult the verb documentation for the exact merge placeholders and flags supported by your broot version.) ([Dystroy][1])

### Other useful options

* `leave_broot = false` — execute the command and stay in broot.
* `working_dir = "{directory}"` — run the command from the selected file's directory.
* `key = "F2"` — bind the verb to a function key.
* `apply_to = "text_file"` or `"directory"` — restrict where the verb is available. ([Dystroy][1])

[1]: https://dystroy.org/broot/conf_verbs/?utm_source=chatgpt.com "Verbs and shortcuts - broot"
