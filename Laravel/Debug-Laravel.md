# Laravel/Debug-Laravel.md

# Eloquent

## Laravel Log SQL

### Guides

* DB::connection()->enableQueryLog()
  * [Laravel Eloquent display query log](https://stackoverflow.com/questions/41140975/laravel-eloquent-display-query-log)
  * [How to Get Query Log in Laravel Eloquent?](https://www.itsolutionstuff.com/post/how-to-get-last-executed-mysql-query-in-laravel-example.html)
  * [How to Log Query in Laravel](https://artisansweb.net/how-to-log-query-in-laravel/)
  * [Laravel 8 Query Log Example](https://codeanddeploy.com/blog/laravel/laravel-8-query-log-example)
  * [Laravel DB Facade](https://laravel.com/api/10.x/Illuminate/Support/Facades/DB.html)

* Listening Query Events
  * [listening-for-query-events](https://laravel.com/docs/10.x/database#listening-for-query-events)
  * [Log All Executed SQL Queries to File in Laravel](https://lindevs.com/log-all-executed-sql-queries-to-file-in-laravel)

### Instructions
* [Laravel Eloquent display query log](https://stackoverflow.com/questions/41140975/laravel-eloquent-display-query-log)
  * DB::connection()->enableQueryLog();
  * $queries = DB::getQueryLog();
  * $last_query = end($queries);

# Laravel DebugBar

## Websites (DebugBar)
* [barryvdh/laravel-debugbar](https://github.com/barryvdh/laravel-debugbar)
* [PHP Debug Bar](http://phpdebugbar.com/) || [PHP Debug Bar GitHub](https://github.com/maximebf/php-debugbar)

## Installation (DebugBar)
* composer require barryvdh/laravel-debugbar --dev
* The Debugbar will be enabled when APP_DEBUG is true.

# Telescope

## Websites (Telescope)
* [Laravel Telescope](https://laravel.com/docs/10.x/telescope)

## Guides (Telescope)
* Setup
  * [Full guide to install and set up Laravel Telescope](https://medium.com/@Zerquix18/full-guide-to-install-and-set-up-laravel-telescope-daf558f734f2)
  * [Laravel 8 Install Telescope Tutorial Example](https://www.nicesnippets.com/blog/laravel-8-install-telescope-tutorial-example)

* Error and Solution
  * [Laravel Telescope not working on a fresh install (wrong path)](https://stackoverflow.com/questions/56129344/laravel-telescope-not-working-on-a-fresh-install-wrong-path)

## Installation (Telescope)

* Common Instruction
  * composer require laravel/telescope
  * php artisan telescope:install
  * php artisan vendor:publish --tag=telescope-migrations

* If "index.php" file is inside of "public" folder
  * Follow normal procedure.

* If "index.php" file is outside of "public" folder
   [Laravel Telescope not working on a fresh install (wrong path)](https://stackoverflow.com/questions/56129344/laravel-telescope-not-working-on-a-fresh-install-wrong-path)
  * Copy "<project-root>/public/vendor/telescope" folder to "<project-root>/vendor/telescope" folder.
  * Open file "vendor/laravel/telescope/resources/views/layout.blade.php" and add code:
  ```javascript
  <script>
    window.Telescope = @json($telescopeScriptVariables);
    window.Telescope.path = '<project-name>/telescope';
  </script>
  ```
  * Next ToDo
    * File "vendor/laravel/telescope/resources/views/layout.blade.php" will be lost, if run command "composer update"
    * Find a workaround of Copying "<project-root>/public/vendor/telescope" folder, because it will be lost if run command "composer update".
