# Laravel/Laravel.md

## Definition and Concepts
* Artisan
* Controller
* Eloquent
* Model
* Passport
* Request
* Resources
* Rules
* Service Provider
* Tinker
* View

# Error and Solution

## Composer - Error & Solution

* Your lock file does not contain a compatible set of packages. Please run composer update.
  * [Laravel composer install giving error "Your lock file does not contain a compatible set of packages please run composer update"](https://stackoverflow.com/questions/65495849/laravel-composer-install-giving-error-your-lock-file-does-not-contain-a-compati)
  * `composer update`

* Script @php artisan package:discover --ansi handling the post-autoload-dump event returned with error code 255
  * [Script @php artisan package:discover handling the post-autoload-dump event returned with error code 255](https://stackoverflow.com/questions/50840960/script-php-artisan-packagediscover-handling-the-post-autoload-dump-event-retur)
  * `composer update`
  
## (blocked:mixed-content) http:// OR https:// problem

* {3} [Load Blade assets with https in Laravel](https://stackoverflow.com/questions/34378122/load-blade-assets-with-https-in-laravel)

* I had a problem with asset function when it's loaded resources through HTTP protocol when the website was using HTTPS, which is caused the "Mixed content" problem.
* To fix that you need to add `\URL::forceScheme('https')` into your `AppServiceProvider` file.
* So mine looks like this (Laravel 5.4):
```php
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if(config('app.env') === 'production') {
            \URL::forceScheme('https');
        }
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
```
* This is helpful when you need https only on server `(config('app.env') === 'production')` and not locally, so don't need to force asset function to use https.

# References

* next-sl: {6}

* Data To View
  * {1} [4 Ways to Pass Data to All Views in Laravel](https://laracoding.com/4-ways-to-pass-data-to-all-views-in-laravel/)
  * {2} [Sharing Data With All Views](https://laravel.com/docs/11.x/views#sharing-data-with-all-views)
   
* Error and Solution
  * {3} [Load Blade assets with https in Laravel](https://stackoverflow.com/questions/34378122/load-blade-assets-with-https-in-laravel)
  