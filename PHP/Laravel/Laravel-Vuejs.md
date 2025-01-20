# Laravel/Laravel-VueJS.md

## Notes
* Clear Cache
  * `php artisan cache:clear`
  * `php artisan config:clear`

## Tools
* ThunderClient VSCode Extension
  * [Thunder Client](https://www.thunderclient.com/) || [Thunder Client VSCode](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client) || [Thunder Client GitHub](https://github.com/rangav/thunder-client-support)
  * [Thunder Client CLI — A new way to test APIs inside VS Code](https://rangav.medium.com/thunder-client-cli-a-new-way-to-test-apis-inside-vscode-d91eb5c71d8e)

## Tutorials
* [Laravel 9 Vue JS CRUD App using Vite Example](https://dev.to/laraveltuts/laravel-9-vue-js-crud-app-using-vite-example-7n5)

## Guides
* [How To Install Vue 3 in Laravel 10 From Scratch
](https://onlinecode.org/how-to-install-vue-3-in-laravel-10-from-scratch-3/)

## Admin Templates - Laravel-Vue

### Free
* [AnowarCST/laravel-vue-crud-starter](https://github.com/AnowarCST/laravel-vue-crud-starter)
* [coreui/coreui-free-vue-laravel-admin-template](https://github.com/coreui/coreui-free-vue-laravel-admin-template)
* [balajidharma/laravel-vue-admin-panel](https://github.com/balajidharma/laravel-vue-admin-panel)
* [themeselection/materio-vuetify-vuejs-laravel-admin-template-free](https://github.com/themeselection/materio-vuetify-vuejs-laravel-admin-template-free)
* [hbakouane/adminlte-laravel-vue](https://github.com/hbakouane/adminlte-laravel-vue)

### Paid
* [Laravel React Admin Template & Projects 2023](https://themeselection.com/laravel-react-admin-template/)
* [Metronic | Bootstrap HTML, VueJS, React, Angular, Asp.Net, Django & Laravel Admin Dashboard Theme](https://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469)
* [Vuexy - Vuejs, React - Next.js, HTML, Laravel & Asp.Net Admin Dashboard Template](https://themeforest.net/item/vuexy-vuejs-html-laravel-admin-dashboard-template/23328599)

### Paid - Nulled Download
* [VUInsider](https://www.vuinsider.com/)
* [NulledTemplates](https://www.nulledtemplates.com/)

# Setup

## Laravel8-Vue2 Laravel-UI Setup
* [AnowarCST/laravel-vue-crud-starter](https://github.com/AnowarCST/laravel-vue-crud-starter)

### Websites (Laravel-UI)
* [Laravel-UI GitHub](https://github.com/laravel/ui)

### Tutorials (Laravel-UI)
* [Build Crud App with Laravel and Vue.js](https://techvblogs.com/blog/build-crud-app-with-laravel-and-vuejs)
* [Laravel 8 REST API with Passport Authentication Tutorial](https://www.itsolutionstuff.com/post/laravel-8-rest-api-with-passport-authentication-tutorialexample.html)

### Guides (Laravel-UI)
* Coding
  * [Laravel 9 Vue JS Auth Scaffolding Tutorial](https://www.itsolutionstuff.com/post/laravel-9-vue-js-auth-scaffolding-tutorialexample.html)
  * [Laravel 9 Vuejs api Authentication using Passport Tutorial Example](https://codingdriver.com/laravel-vuejs-api-authentication-using-passport.html)

* Error and Solution
  * [Laravel - Class "Fideloper\Proxy\TrustProxies" not found - Fixed](https://www.itsolutionstuff.com/post/laravel-class-fideloperproxytrustproxies-not-found-fixedexample.html)
  * [Auth guard [:api] is not defined?](https://stackoverflow.com/questions/58454148/auth-guard-api-is-not-defined)

* Dependency Installation
  * [Specifying dependencies and devDependencies in a package.json file](https://docs.npmjs.com/specifying-dependencies-and-devdependencies-in-a-package-json-file)
    * To add an entry to the "dependencies" attribute: `npm install <package-name> [--save-prod]`
    * To add an entry to the "devDependencies" attribute: `npm install <package-name> --save-dev`
  * [How to fix the error "You may need an appropriate loader to handle this file type"](https://stackoverflow.com/questions/65607153/how-to-fix-the-error-you-may-need-an-appropriate-loader-to-handle-this-file-typ)

* Project Runtime Setup
  * [How to configure virtual host for laravel](https://medium.com/@laravelguy/how-to-configure-virtual-host-for-laravel-2e55e23219a)
  * [vue.js and Laravel - How do we run vue-laravel project on localhost without using "php artisan serve" ?](https://laracasts.com/discuss/channels/laravel/vuejs-and-laravel-how-do-we-run-vue-laravel-project-on-localhost-without-using-php-artisan-serve)
  * [Laravel with Vuejs run project without php artisan serve](https://stackoverflow.com/questions/59951901/laravel-with-vuejs-run-project-without-php-artisan-serve)
  * [Getting Started - LaraDock](https://laradock.io/getting-started/)
  * [Laradock.io | Simple way to setup multiple projects in local environment in Mac/Windows](https://xmxxrxl.medium.com/laradock-io-simple-way-to-setup-multiple-projects-in-local-environment-in-mac-windows-1bb13487208)

### Instructions (Laravel-UI)
* Laravel-UI package is used to create Vue/React Scaffolding: `composer require laravel/ui`
* Generate Vue auth scaffolding: `php artisan ui vue --auth`
  * Please run "npm install && npm run dev" to compile your fresh scaffolding.
  * Shows Error:
    > Additional dependencies must be installed. This will only take a moment.
    > Running: npm install vue-loader@^15.9.8 --save-dev --legacy-peer-deps
    > Finished. Please run Mix again.
  * `npm install vue-loader@^15.9.8 --save-dev --legacy-peer-deps`
* Install additional npm dependencies
  * npm install cross-env jquery --save-dev
  * npm install @fortawesome/fontawesome-free @johmun/vue-tags-input admin-lte laravel-vue-pagination moment sweetalert2 vform vue-progressbar vue-router --save-prod
* If shows conflict, then execute: `npm install --legacy-peer-deps`
* Database migration: `php artisan migrate`
* `composer require fideloper/proxy`
* `composer require laravel/passport`
* `php artisan passport:install --force` [`php artisan migrate`]

### Docker-Xampp Configuration (Laravel-UI)
* `docker container exec -it e_xampp_743_php-apache_1 bash`
* Edit file: "/etc/apache2/sites-available/000-default.conf" [Make A Backup First]. Add these entry at the end of file
  ```shellscript
  <VirtualHost *:80>
    DocumentRoot /var/www/html/lara8vue2-snippet/public
    ServerName lara8vue2-snippet.test
  </VirtualHost>
  ```
* Edit file: "/etc/hosts" [Make A Backup First]. Add these entry
  ```shellscript
  127.0.0.1 lara8vue2-snippet.test
  ```
* `service apache2 status`
* `docker-compose stop`
* `docker-compose ps`
* `docker-compose up -d`

# Laravel10-Vue3