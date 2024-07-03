# Textualize-Textual.md

## Websites
* [Official Site](https://textual.textualize.io/)
* [Textual GitHub](https://github.com/Textualize/textual)
* [mitosch/textual-terminal](https://github.com/mitosch/textual-terminal)
* [selectel/pyte](https://github.com/selectel/pyte)

## Notes
* For Layout Desing: Use Container(), Horizontal(), HorizontalScroll(), Vertical(), VerticalScroll(), Grid(), Header(), Footer()
* Use "TITLE" for header and "SUB_TITLE" for footer.
* Import [mitosch/textual-terminal](https://github.com/mitosch/textual-terminal) code into user-defined Textual script.

# Installation

* Install Textual: `pip install textual`
* Install Textual-Dev: `pip install textual-dev`
* Install Textual-Terminal: `pip install textual-terminal` <sup>{53}</sup>

# Commands

## Run Script

* Only show defined debug message "logging.debug()": `textual console -x SYSTEM -x EVENT -x DEBUG -x INFO` <sup>{52}</sup>
* Run script: `textual run --dev gjjkk.py`

# Problem and Solution

## WSL Auto Start

* WSL = Windows Subsystem for Linux
* Problem: When using "subprocess.Popen()" function in Windows-OS and executing command "bash -c 'ls -la'", this auto starts default WSL machine.
  * Solution
  * For Windows-OS in "subprocess.Popen()" function use argument "shell=True".
  * For Linux-OS in "subprocess.Popen()" function DO NOT USE argument "shell=True". Because it breaks the application.
  * Detect operating system (windows/linux) using statement: `if sys.platform.startswith("win"):` OR `if sys.platform.startswith("linux"):` <sup>{116}</sup>
  * If problem exists, Set "SHELL" Env-Var (Windows-OS). Follow Instructions Below: <sup>{152} {153}</sup>

## Set "SHELL" Env-Var (Windows-OS)

* Windows Command Prompt "SHELL" Env-Var <sup>{152}</sup>
  * Open "cmd" in Administrator mode
  * To get all the values of system variable open CMD and type: `Set`
  * Set environment variable "$SHELL" (Bash): `setx SHELL bash /M` ["/M" means set for system-wide] [Open "cmd" in Administrator mode]
  * Set environment variable "$SHELL" (PowerShell-7): `setx SHELL pwsh /M` {{New Version Powershell-7, installed from [GitHub-PowerShell](https://github.com/PowerShell/PowerShell)}}
  * Set environment variable "$SHELL" (PowerShell-5): `setx SHELL powershell /M` [Old Version PowerShell. Built-in inside Windows-OS]
  * Set environment variable "$EDITOR": `setx EDITOR vim /M`

* PowerShell "SHELL" Env-Var <sup>{153}</sup>
  * Open PowerShell in Administrator mode
  * Shows all environment variables: `dir env:`
  * Set environment variable "EDITOR": `$env:EDITOR = 'vim'`
  * Set environment variable "SHELL": `$env:SHELL = '/bin/bash'`

# References

* Tutorial
  * {1} [Textual for beginners](https://mathspp.com/blog/textual-for-beginners)
  * {2} [Textual tutorial – build a TODO app in Python](https://mathspp.com/blog/textual-tutorial-build-a-todo-app-in-python)

* Textual Code
  * {51} [Container of Other Element](https://github.com/Textualize/textual/blob/fb81ee9562b5fa737462dac1f75c61f831ffb1d7/docs/examples/guide/dom4.py#L15)
  * {52} [Devtools](https://textual.textualize.io/guide/devtools/)
  * {53} [mitosch/textual-terminal](https://github.com/mitosch/textual-terminal)

* Python Code
  * {101} [subprocess — Subprocess management](https://docs.python.org/3/library/subprocess.html)
  * {102} [asyncio — Asynchronous I/O](https://docs.python.org/3/library/asyncio.html)
  * {103} [threading — Thread-based parallelism](https://docs.python.org/3/library/threading.html)
  * {104} [Getting realtime output using Python Subprocess](https://www.endpointdev.com/blog/2015/01/getting-realtime-output-using-python/)
  * {105} [Gist - Getting realtime output using Python Subprocess](https://gist.github.com/almoore/c6fd2d041ad4f4bf2719a89c9b454f7e)
  * {106} [StackOverflow - Getting realtime output using subprocess](https://stackoverflow.com/questions/803265/getting-realtime-output-using-subprocess)
  * {107} [What does the 'b' character do in front of a string literal?](https://stackoverflow.com/questions/6269765/what-does-the-b-character-do-in-front-of-a-string-literal)
  * {108} [Python String decode() Method](https://www.tutorialspoint.com/python/string_decode.htm)
  * {109} [How to Convert Bytes to String in Python ?](https://www.geeksforgeeks.org/how-to-convert-bytes-to-string-in-python/)
  * {110} [How can I access global variable inside class in Python](https://stackoverflow.com/questions/10814452/how-can-i-access-global-variable-inside-class-in-python)
  * {111} [Read JSON file using Python](https://www.geeksforgeeks.org/read-json-file-using-python/)
  * {112} [with statement in Python](https://www.geeksforgeeks.org/with-statement-in-python/)
  * {113} [Get all object attributes in Python? [duplicate]](https://stackoverflow.com/questions/6886493/get-all-object-attributes-in-python)
  * {114} [frozenset() in Python](https://www.geeksforgeeks.org/frozenset-in-python/)
  * {115} [Using absolute unix paths in windows with python](https://stackoverflow.com/questions/13162372/using-absolute-unix-paths-in-windows-with-python)
  * {116} [How to offer platform-specific implementations of a module?](https://stackoverflow.com/questions/791098/how-to-offer-platform-specific-implementations-of-a-module)
  * {117} [Static methods in Python?](https://stackoverflow.com/questions/735975/static-methods-in-python)

* Shell/Command-Prompt
  * {151} [How to Make Output Overwrite the Same Line in a Terminal](https://www.baeldung.com/linux/echo-printf-overwrite-terminal-line)
  * {152} [Setting and getting Windows environment variables from the command prompt?](https://superuser.com/questions/79612/setting-and-getting-windows-environment-variables-from-the-command-prompt)
  * {153} [How to Set environment variables using PowerShell?](https://www.tutorialspoint.com/how-to-set-environment-variables-using-powershell)
