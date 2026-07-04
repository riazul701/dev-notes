# Go.md

## Notes

* Execute scripts
  * First write scripts : `main.go`, `other-script.go`
  * `go mode init {{init-name}}` : Create dependencies list
  * `go get {{package-url}}` : This is manual setup and not required, instead use `go mod tidy`
  * `go mod tidy` : Get dependencies list and downloads them from `main.go` script
  * `go build .`
  * `go run .`
  * `go run .\main.go` : Run single script

## PATH

* Go package installation path: `C:\Users\{{user-name}}\go\pkg`

## Programming Rules

**Go Package (Multiple Files Inside A Folder)**

* All `.go` files in the same folder (with the same package line) are compiled together as one unit.

* Package namespace is shared. Inside a package:
  * All function names must be unique
  * All files contribute to the same namespace

* Only functions starting with CAPITAL letters are accessible outside the package. This is allowed, if multiple files define load() (lowercase), both are private to the package.

```go
Load()   ✅ exported, usable
load()   ❌ private, only inside same package
```
* No conflict, when different functions with same names in different packages.

# Concept

> ChatGPT Question: 
> 
> Add these packages in go program
> import (
>  	"fmt"
> 	"os"
> 	"charm.land/bubbles/v2/spinner"
> 	tea "charm.land/bubbletea/v2"
> 	"charm.land/lipgloss/v2"
> )

That error means you're **not inside a Go module** yet.

***### 1. Go to your project folder***

```bash
cd /path/to/your/project
```

***### 2. Initialize a Go module***

If your project is named `myapp`:

```bash
go mod init myapp
```

Or use your GitHub path if you'll publish it:

```bash
go mod init github.com/yourusername/myapp
```

This creates a `go.mod` file.

***### 3. Install the dependencies***

```bash
go get charm.land/bubbletea/v2
go get charm.land/bubbles/v2
go get charm.land/lipgloss/v2
```

Then:

```bash
go mod tidy
```

***### Example project***

```
myapp/
├── go.mod
├── go.sum
└── main.go
```

***### If you're starting from scratch***

```bash
mkdir myapp
cd myapp

go mod init myapp

go get charm.land/bubbletea/v2 charm.land/bubbles/v2 charm.land/lipgloss/v2

go mod tidy
```

If you're still getting errors, paste the output of:

```bash
pwd
ls
go version
```

(or on Windows:)

```cmd
cd
dir
go version
```

That will help determine whether you're in the correct directory and whether `go.mod` exists.

=====================================================================================

> ChatGPT Question: 
> 
> Go build/run is slow, it takes more than 10 minutes

More than **10 minutes** is **not normal** for a Fyne app. Even the first build should rarely take that long on a typical development machine.

Here are the most likely causes:

1. **Go is downloading modules very slowly**
   Check whether it's hanging while downloading dependencies:

   ```bash
   go build -x
   ```

   If you see lots of `go: downloading...` messages for a long time, it may be a network or module proxy issue.

2. **Your antivirus is scanning every compiled file (Windows)**
   Windows Defender or another antivirus can dramatically slow Go builds because Go creates many intermediate files. As a test, temporarily disable real-time protection or add exclusions for:

   * Your project folder
   * The Go build cache (`go env GOCACHE`)
   * The Go module cache (`go env GOMODCACHE`)

3. **Your project is on a slow drive**
   Building from an HDD, USB drive, or network share can be much slower than from an SSD.

4. **Your CPU or RAM is heavily constrained**
   If your machine is low on RAM and starts swapping to disk, build times can become extremely long.

5. **Your Go installation or module cache is corrupted**
   Try:

   ```bash
   go clean -cache
   go clean -modcache
   go mod tidy
   go build
   ```

   Note that cleaning the module cache means dependencies will be downloaded again.

6. **Your IDE is doing extra work**
   To isolate the problem, build from a terminal instead of using an IDE:

   ```bash
   go build -v
   ```

### Please share these outputs

Run these commands and paste the results:

```bash
go version
go env GOOS GOARCH GOMOD GOCACHE GOMODCACHE
go build -x
```

Also tell me:

* Your operating system (Windows 10/11, Linux, or macOS)
* Your CPU
* How much RAM you have
* Whether you're running `go run`, `go build`, or `fyne package`

With that information, I can help pinpoint why your builds are taking over 10 minutes.
