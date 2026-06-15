# Shell-Redirection.md

# Concept

> ChatGPT Question: 
> 
> All types of shell redirection explanation for both bash and powershell.

Below is a **complete, practical map of shell redirection types in Bash and PowerShell**, showing what exists, what it means, and how they differ.

---

# 1. Core idea (both shells)

Every command has streams:

## Bash

* `stdin` (0) → input
* `stdout` (1) → normal output
* `stderr` (2) → errors

## PowerShell

* Success output (1)
* Error output (2)
* Warning (3)
* Verbose (4)
* Debug (5)
* Information (6)

---

# 2. BASh Redirection Types (complete set)

## 2.1 Output redirection (stdout)

### Overwrite file

```bash
cmd > file.txt
```

### Append file

```bash
cmd >> file.txt
```

---

## 2.2 Input redirection (stdin)

```bash
cmd < input.txt
```

Meaning:

* File becomes input instead of keyboard

---

## 2.3 Error redirection (stderr)

### Save errors only

```bash
cmd 2> error.txt
```

### Append errors

```bash
cmd 2>> error.txt
```

---

## 2.4 Redirect stdout + stderr separately

```bash
cmd > out.txt 2> error.txt
```

---

## 2.5 Merge stdout + stderr

### Modern preferred way

```bash
cmd > all.txt 2>&1
```

Meaning:

* stderr goes to where stdout is going

---

## 2.6 Discard output (null device)

```bash
cmd > /dev/null
cmd 2> /dev/null
cmd &> /dev/null
```

* `/dev/null` = trash bin for output

---

## 2.7 Here document (multi-line input)

```bash
cat << EOF
Hello
World
EOF
```

Used for feeding multiple lines as stdin.

---

## 2.8 Here string

```bash
grep foo <<< "foo bar baz"
```

---

## 2.9 File descriptor duplication

```bash
cmd 2>&1
```

* “send stderr to same place as stdout”

---

## 2.10 Pipe (special redirection)

```bash
cmd1 | cmd2
```

* stdout of cmd1 → stdin of cmd2

---

# 3. PowerShell Redirection Types (complete set)

PowerShell is more advanced because it has **multiple streams**.

---

## 3.1 Success output redirection (stdout equivalent)

### Overwrite file

```powershell
cmd > file.txt
```

### Append

```powershell
cmd >> file.txt
```

---

## 3.2 Error redirection (stream 2)

```powershell
cmd 2> error.txt
```

Append:

```powershell
cmd 2>> error.txt
```

---

## 3.3 All output streams together

### Everything (success + error + more)

```powershell
cmd *> all.txt
```

---

## 3.4 Merge streams

### Merge error into success stream

```powershell
cmd 2>&1
```

Same concept as Bash, but PowerShell treats streams as richer data.

---

## 3.5 Suppress output

### Null output (like /dev/null)

```powershell
cmd > $null
cmd 2> $null
```

---

## 3.6 Redirect specific streams

PowerShell supports multiple streams:

| Stream | Meaning     |
| ------ | ----------- |
| 1      | Success     |
| 2      | Errors      |
| 3      | Warning     |
| 4      | Verbose     |
| 5      | Debug       |
| 6      | Information |

### Examples

#### Redirect warnings

```powershell
cmd 3> warnings.txt
```

#### Redirect verbose output

```powershell
cmd 4> verbose.txt
```

#### Redirect debug output

```powershell
cmd 5> debug.txt
```

---

## 3.7 Combine multiple streams

### Merge all streams into one file

```powershell
cmd *> all.txt
```

---

## 3.8 Pipe in PowerShell

```powershell
Get-Process | Where-Object CPU -gt 10
```

Important:

* pipes pass **objects, not text**

---

## 3.9 Out-* cmdlets (PowerShell-specific redirection system)

PowerShell often uses cmdlets instead of symbols:

### Send to file

```powershell
cmd | Out-File file.txt
```

### Show in terminal (force formatting)

```powershell
cmd | Out-Host
```

### Grid view (GUI)

```powershell
cmd | Out-GridView
```

---

## 3.10 Tee (split output)

Send output to file AND screen:

```powershell
cmd | Tee-Object file.txt
```

---

# 4. Side-by-side comparison

| Feature          | Bash        | PowerShell              |
| ---------------- | ----------- | ----------------------- |
| Output overwrite | `>`         | `>`                     |
| Append           | `>>`        | `>>`                    |
| Input            | `<`         | pipeline / some `<` use |
| Error redirect   | `2>`        | `2>`                    |
| Merge streams    | `2>&1`      | `2>&1`                  |
| All output       | `&>`        | `*>`                    |
| Null output      | `/dev/null` | `$null`                 |
| Pipe behavior    | text        | objects                 |
| Extra streams    | none        | warning/debug/info      |

---

# 5. Key conceptual difference (VERY important)

## Bash:

> Redirection = moving text between files and processes

## PowerShell:

> Redirection = moving structured streams of objects, errors, logs, and metadata

---

# 6. Mental model summary

### Bash pipeline:

```
text → text → text
```

### PowerShell pipeline:

```
objects → filtered objects → formatted output
```

---

# 7. Practical takeaway

* Bash redirection is simpler but low-level (text-based)
* PowerShell redirection is richer (multi-stream + object-aware)

---

If you want next step, I can show:

* real-world admin examples (logs, system monitoring)
* tricky interview questions on redirection
* or a diagram showing how streams flow internally in both shells
