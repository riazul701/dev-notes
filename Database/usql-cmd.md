# Commands/Usage

* `usql "mysql://username:password@localhost:3306/database_name"` : Connect to MySQL database.

* `usql "mysql://username:password@localhost:3306/database_name"  --command 'SELECT * FROM Category'` : Run only single command (SQL or internal) and exit.

* `echo "SELECT * FROM Category;" | xargs -I{} usql "mysql://username:password@localhost:3306/database_name" --command {}` (Works In Bash, Not PowerShell) : Pipe (redirection) single command input to usql from another command.

* `echo "SELECT * FROM Category;" | ForEach-Object {
    usql "mysql://username:password@localhost:3306/database_name" --command $_
}` (PowerShell) : Pipe (redirection) single command input to usql from another command.
  * `"SELECT * FROM Category;" | % {
    usql "mysql://username:password@localhost:3306/database_name" --command $_
}` : Short alias version of previous command.

# usql-cmd.md

## Notes

* `usql "database-url" --command ` option does not support multi-line input. To solve this issue convert "new-line" into "space".

# References

## Websites

* [xo/usql GitHub](https://github.com/xo/usql)
