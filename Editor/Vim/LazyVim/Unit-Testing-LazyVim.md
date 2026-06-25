# Unit-Testing-LazyVim.md

# Concept

> ChatGPT Question: 
> 
> For raw php file, phpunit setup in lazyvim

For a plain PHP project (not Laravel/Symfony), you just need PHPUnit installed and a `phpunit.xml` file.

***### 1. Install PHPUnit***

Using Composer:

```bash
composer require --dev phpunit/phpunit
```

---

***### 2. Project structure***

```text
project/
├── composer.json
├── phpunit.xml
├── src/
│   └── Calculator.php
└── tests/
    └── CalculatorTest.php
```

---

***### 3. Example source file***

`src/Calculator.php`

```php
<?php

class Calculator
{
    public function add(int $a, int $b): int
    {
        return $a + $b;
    }
}
```

---

***### 4. Example test***

`tests/CalculatorTest.php`

```php
<?php

use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../src/Calculator.php';

class CalculatorTest extends TestCase
{
    public function testAdd(): void
    {
        $calculator = new Calculator();

        $this->assertEquals(5, $calculator->add(2, 3));
    }
}
```

---

***### 5. Create `phpunit.xml`***

```xml
<?xml version="1.0" encoding="UTF-8"?>
<phpunit
    colors="true"
    bootstrap="vendor/autoload.php"
>
    <testsuites>
        <testsuite name="Application">
            <directory>tests</directory>
        </testsuite>
    </testsuites>
</phpunit>
```

---

***### 6. Run tests***

```bash
vendor/bin/phpunit
```

or

```bash
vendor/bin/phpunit tests/CalculatorTest.php
```

---

***### 7. Make Neotest detect PHPUnit***

For `neotest-phpunit`, the adapter typically looks for:

* `phpunit.xml`
* `phpunit.xml.dist`
* `vendor/bin/phpunit`

Make sure all three conditions are satisfied:

```text
project/
├── phpunit.xml
├── vendor/bin/phpunit
└── tests/
```

Then from Neovim:

```vim
:Neotest run
```

or use LazyVim test keymaps such as `<leader>tr` on a test method.

If Neotest still doesn't detect your project, share:

* your project tree,
* `phpunit.xml`,
* and your Neotest adapter config,

and I can help debug it.
