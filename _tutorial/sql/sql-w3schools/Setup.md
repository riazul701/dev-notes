# Setup.md

## Notes

* `usql "database-url" --command ` option does not support multi-line input. To solve this issue convert "new-line" into "space".

## W3Schools SQL Tutorial Database

* [uwla/sample_mysql_database GitHub => W3Schools MySQL Tutorials Database CSV & SQL files](https://github.com/uwla/sample_mysql_database)

# Installation

## Windows-OS

* Open powershell in administrator mode to install scoop apps globally for all windows users.

* `scoop install main/git --global`

* `scoop install main/fzf --global`

* `scoop install main/usql --global`

# Instruction

## Command Changing

* Initial

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }' queries.sql | 
fzf --read0 --preview 'echo "{}"' | 
sed '/^#/d' | 
xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}
```

* Change-1

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }' queries.sql | 
fzf --read0 --preview 'echo "{}"' | 
sed '/^#/d' | 
tr '\n' ' ' | 
xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}
```

* Change-2 => Problem: Makes fzf first preview loading continuously

```bash
ls | 
fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | 
xargs -I{} awk 'BEGIN { RS=""; ORS="\0" } { print }' {} | 
fzf --read0 --preview 'echo "{}"' | 
sed '/^#/d' | 
tr '\n' ' ' | 
xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}
```

* Change-3 => Problem: On second `fzf` preview window, where single sql query is previewed, `bat` command thinks this sql query is a file name.

```bash
#!/bin/bash

file=$(
    ls |
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
) || exit

query=$(
    awk 'BEGIN { RS=""; ORS="\0" } { print }' "$file" |
    fzf --read0 --preview 'bat --color=always --style=numbers --line-range=:500 {}'
) || exit

echo "$query" |
sed '/^#/d' |
tr '\n' ' ' |
xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}
```

* Change-4 => Problem: `usql --command` single/double quote issue.

```bash
#!/bin/bash

file=$(
    ls |
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
) || exit

query=$(
    awk 'BEGIN { RS=""; ORS="\0" } { print }' "$file" |
    fzf --read0 --preview 'bat --language=sql --color=always --paging=never <<< {}'
) || exit

echo "$query" |
sed '/^#/d' |
tr '\n' ' ' |
xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}
```

* Change-5

  * [Configuration](https://github.com/xo/usql#configuration)
  * `usql` config file path
    * Windows: `%AppData%/usql/config.yaml`
      * `C:\Users\{{user-name}}\AppData\Roaming\usql\config.yaml`
    * Linux/Unix: `$HOME/.config/usql/config.yaml`
    * macOS: `$HOME/Library/Application Support/usql/config.yaml`

```yaml
connections:
    w3schools: mysql://username:password@localhost:3306/database_name
```

```bash
#!/bin/bash

file=$(
    ls | 
    grep '\.sql$' | 
    grep -v -- '-sample\.sql$' | 
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
) || exit

query=$(
    grep -v '^[[:space:]]*$' "$file" | 
    awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { print }' |
    fzf --read0 --delimiter=$'\r\n' --with-nth=1 --preview 'bat --language=sql --color=always --paging=never <<< {}'
) || exit

sql=$(
    echo "$query" |
    sed '/^#/d' |
    tr '\n' ' ' | 
    tr '"' "'"
)

usql w3schools --command "$sql"
```

# Concept

> ChatGPT Question: 
> 
> Write 100 sql queries on a text file with comment starting with "#". Then 
> using fzf, select one sql query and send it to usql program for execution. Sql 
> qurey can be multi-line.

You can store queries in a text file where each query is preceded by a `#` comment header, and use a blank line as the separator between query blocks. Then use `awk` to extract blocks, `fzf` to choose one, strip the comment lines, and pipe the SQL to `usql`.

Example `queries.sql`:

```sql
# List all users
SELECT *
FROM users
LIMIT 10;

# Count orders by status
SELECT status, COUNT(*)
FROM orders
GROUP BY status;

# Recent transactions
SELECT id, amount, created_at
FROM transactions
WHERE created_at > NOW() - INTERVAL '7 days'
ORDER BY created_at DESC;
```

Generate 100 queries similarly.

Then:

```bash id="fzf-usql"
awk '
BEGIN { RS=""; ORS="\0" }
{ print }
' queries.sql |
fzf --read0 --preview 'echo "{}"' |
sed '/^#/d' |
usql "$DATABASE_URL"
```

A more robust version that shows only the comment title in `fzf` while executing the full multi-line query:

```bash id="fzf-usql-title"
awk '
BEGIN { RS=""; FS="\n" }
{
    title = $1
    sub(/^#[[:space:]]*/, "", title)

    printf "%s\t", title
    gsub(/\n/, "\034")
    print
}
' queries.sql |
fzf --delimiter=$'\t' \
    --with-nth=1 \
    --preview '
        echo {} |
        cut -f2 |
        tr "\034" "\n"
    ' |
cut -f2 |
tr '\034' '\n' |
sed '/^#/d' |
usql "$DATABASE_URL"
```

This approach supports:

* Multi-line SQL queries
* Comments starting with `#`
* Query selection by human-readable title
* Sending the selected query directly to `usql`
* Any number of query blocks (100+ is fine)

================================================================================

> ChatGPT Question: 
> 
> on a bash command: list file -> fzf file preview -> awk -> fzf file content preview
> makes fzf first preview loading continuously

What you're describing sounds like a pipeline where:

```bash
find . -type f |
fzf --preview 'cat {}' |
awk '...' |
fzf --preview '...'
```

or something similar.

The issue is usually that **the first `fzf` preview command keeps running/reloading while downstream commands (`awk` and the second `fzf`) are waiting for output**, so the first preview pane appears to be "loading continuously".

A few common causes:

***### 1. Preview command is expensive***

If your preview is something like:

```bash
fzf --preview 'bat {}'
```

or

```bash
fzf --preview 'grep ... {}'
```

and you're moving through many files, `fzf` continuously restarts the preview process.

Try:

```bash
fzf --preview 'head -100 {}'
```

to see if the problem disappears.

---

***### 2. First `fzf` doesn't terminate before `awk`***

In a pipeline:

```bash
list_files |
fzf --preview 'cat {}' |
awk '...' |
fzf ...
```

`awk` receives output only after the first `fzf` selection is accepted. Until then, the rest of the pipeline is blocked.

This is normal behavior.

If you want a two-stage picker, it's often cleaner to use command substitution:

```bash
file=$(
    list_files |
    fzf --preview 'bat --color=always {}'
)

awk '...' "$file" |
fzf --preview '...'
```

---

***### 3. Preview command reads stdin***

A very common mistake:

```bash
fzf --preview 'awk ...'
```

where `awk` reads from stdin instead of the selected file.

Then the preview process competes with the pipeline for input and can appear to hang forever.

Use:

```bash
fzf --preview 'awk ... {}'
```

or explicitly redirect:

```bash
fzf --preview 'awk ... < {}'
```

---

***### 4. Nested `fzf` inside preview***

If your preview contains another command that eventually invokes `fzf`, you'll get recursive behavior and endless refreshes.

For example:

```bash
fzf --preview 'some_script'
```

where `some_script` launches `fzf`.

That generally won't work properly.

---

If you post the exact command, I can pinpoint why the first preview pane keeps showing a loading spinner and suggest the correct structure.

=================================================================================

> ChatGPT Question: 
> 
> ```bash
> ls | 
> fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | 
> xargs -I{} awk 'BEGIN { RS=""; ORS="\0" } { print }' {} | 
> fzf --read0 --preview 'echo "{}"' | 
> sed '/^#/d' | 
> tr '\n' ' ' | 
> xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}
> ```

The problem is likely not `bat` itself. It's the way the pipeline is structured.

Your first `fzf`:

```bash
ls |
fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
```

does **not produce any output until you press Enter** on a file. While you're browsing, `fzf` repeatedly launches and kills `bat` as the selection changes. That's expected.

The more subtle issue is that your downstream pipeline is waiting for the selected file:

```bash
... |
xargs -I{} awk ...
```

So the entire pipeline is blocked behind the first `fzf` until a selection is made.

A few things I'd change:

***### Use `find` instead of `ls`***

`ls` breaks on spaces, tabs, and other special characters in filenames.

```bash
find . -maxdepth 1 -type f -print0 |
fzf --read0 --preview 'bat --color=always --style=numbers --line-range=:500 {}'
```

---

***### Avoid `xargs` for the first stage***

Capture the selected file first:

```bash
file=$(
    find . -maxdepth 1 -type f |
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
) || exit
```

Then process it:

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }' "$file" |
fzf --read0 --preview 'printf "%s\n" "{}"' |
sed '/^#/d' |
tr '\n' ' ' |
xargs -I{} usql \
  "mysql://username:password@localhost:3306/database_name" \
  --command "{}"
```

This removes one whole layer of pipeline complexity and often fixes odd interactive behavior.

---

***### Another possible cause: huge files***

Your `awk`:

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }'
```

reads the file as paragraph records (`RS=""`).

If the selected SQL file is very large or contains few blank lines, `awk` may spend a long time building giant records before producing output for the second `fzf`.

That can make it *look* like the first preview is stuck loading when the actual bottleneck is later.

Try testing with:

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print NR }'
```

to see whether record generation is the slow part.

---

***### One more thing***

If your intent is:

1. Select SQL file.
2. Preview file contents.
3. Select a SQL block separated by blank lines.
4. Preview the selected block.
5. Execute it with `usql`.

then a cleaner version is:

```bash
file=$(
    find . -type f |
    fzf --preview 'bat --color=always --style=numbers {}'
) || exit

query=$(
    awk 'BEGIN { RS=""; ORS="\0" } { print }' "$file" |
    fzf --read0 --preview 'printf "%s\n" {}'
) || exit

printf '%s\n' "$query" |
sed '/^#/d' |
tr '\n' ' ' |
usql "mysql://username:password@localhost:3306/database_name" --command "$(cat)"
```

This sequential approach is usually much more reliable than chaining multiple interactive programs in a single pipeline.

==================================================================================

> ChatGPT Question: 
> 
> Using {f} in fzf preview argument, shows bat command error, not `\` or `/` in file path

Right — this is the key misunderstanding:

***### ❌ `{f}` is NOT what you think it is***

In `fzf 0.67.0`, `{f}` is **not a real placeholder that gives you a temp file of the selected item**.

So when you write:

```bash
fzf --preview 'bat {f}'
```

`fzf` does **not create a file**, and `bat` receives a literal broken string (your SQL block or weird interpreted text), which leads to errors like invalid path or escaping issues.

---

***## ✔️ Correct mental model***

You currently have:

```
fzf input = multiline SQL blocks (NOT filenames)
```

So:

* `{}` = the actual SQL block (BUT shell-escaped → painful)
* `{f}` = ❌ not valid for this purpose
* bat = expects a file path OR stdin

---

***## ✔️ Correct solution (use stdin, no filename)***

This is the clean working version:

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }' queries.sql |
fzf --read0 \
  --preview 'printf "%s" {} | bat --language=sql --color=always --paging=never --style=numbers'
```

---

***## ✔️ If quoting breaks (very common with SQL)***

Use `bash -c` so the preview never breaks on special characters:

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }' queries.sql |
fzf --read0 \
  --preview 'bash -c "printf \"%s\" \"$1\" | bat --language=sql --color=always --paging=never --style=numbers" _ {}'
```

This avoids:

* `'` breaking shell
* `"` breaking shell
* `$()` breaking shell
* multiline issues

---

***## ✔️ Why your earlier error happens***

Your preview content:

```sql
# List all users
SELECT *
FROM users
LIMIT 10;
```

If passed as `{}` directly, `fzf` effectively runs:

```bash
bat "# List all users
SELECT *
FROM users
LIMIT 10;"
```

So `bat` thinks that whole SQL block is a **filename**, which fails.

---

***## ✔️ Best practical setup (recommended)***

This is the most stable version for SQL browsing:

```bash
awk 'BEGIN { RS=""; ORS="\0" } { print }' queries.sql |
fzf --read0 \
  --preview 'bat --language=sql --color=always --paging=never <<< {}'
```

(or equivalent stdin form depending on shell support)

---

***## If you want __perfect UX__***

If your goal is:

* browse SQL blocks
* preview nicely
* later pipe into `usql`

then the most robust architecture is:

```bash
block=$(
  awk 'BEGIN { RS=""; ORS="\0" } { print }' queries.sql |
  fzf --read0 --preview 'printf "%s" {} | bat --language=sql --color=always --paging=never'
)

printf "%s" "$block" | usql ...
```

---

If you want, I can help you build a **3-stage SQL fzf tool (file → query block → execute)** that behaves like a mini SQL IDE in terminal.

===================================================================================

> ChatGPT Question: 
> 
> In fzf, show only first line from multi-line standard input

If your input items are multi-line records (for example, separated by NULs with `--read0`), you can tell `fzf` to display only the first line while still returning the full record:

```bash
awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { print }' file.md |
fzf --read0 --with-nth=1
```

For more control, use a delimiter and transform the display:

```bash
awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" }
{
    first = $0
    sub(/\n.*/, "", first)
    print first "\t" $0
}' file.md |
fzf --read0 --delimiter=$'\t' --with-nth=1
```

A cleaner solution is often to use `--preview`:

```bash
awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { print }' file.md |
fzf --read0 \
    --preview 'printf "%s" {}'
```

This shows only the first line of each record in the selection list:

```bash
... | fzf --read0 --preview 'printf "%s" {}' \
          --preview-window=down:70% \
          --nth=1
```

Or explicitly collapse each record to its first line for display:

```bash
... | fzf --read0 \
          --preview 'printf "%s" {}' \
          --with-nth='{1}'
```

The most reliable pattern is:

```bash
records -> fzf list shows first line only
        -> preview shows full multi-line record
        -> selected output is the full record
```

using `--preview` rather than trying to make `fzf` itself render only part of a multi-line entry.

==================================================================================

> ChatGPT Question: 
> 
> In bash, remove empty line that contains tabs and spaces inside pipe redirection

The simplest and fastest solution is usually to filter before `awk`:

```bash id="k7cp1i"
grep -v '^[[:space:]]*$' "$file" |
awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { print }'
```

Or if you want to keep it entirely in `awk` (one process instead of two), use:

```bash id="4mpq56"
awk '
BEGIN { RS="\n==================================================\n"; ORS="\0" }
{
    gsub(/\n[[:space:]]*\n/, "\n")
    print
}' "$file"
```

However, this only collapses a single whitespace-only line between content. For removing **all** whitespace-only lines, the `grep` solution is both simpler and typically faster:

```bash id="fuvrzr"
grep -v '^[[:space:]]*$' "$file"
```

then pipe to whatever comes next.
