<h1>Laravel homestead - apache development</h1>
The customisations are as folows:
<ul>    
    <li>Apache multi site</li>
    <li>SSL True for https developing</li>    
    <li>Changed guest root to /var/www/html</li>
    <li>Root is mapped in host share folder, inside homestead-adev folder - Can be changed to any absolue path: D:/www</li>
    <li>PhpMyAdmin - latest version</li>
</ul>

Make sure you have the vagrant nfs plugin installed if using nfs on windows for shared folders.

```
vagrant plugin install vagrant-winnfsd
```
Edit your C:\Windows\System32\drivers\etc hosts file with entries for each of you websites
Example:
```
192.168.33.49 homestead.test
192.168.33.49 phpmyadmin.test
192.168.33.49 mysite.test
```

If home folder does not contain a .ssh folder, run the folowing command in cmd, and keep default options
(no passphrase, id_rsa, id_rsa.pub)
```
ssh-keygen
```



<p align="center"><img src="https://laravel.com/assets/img/components/logo-homestead.svg"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/homestead"><img src="https://travis-ci.org/laravel/homestead.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/homestead"><img src="https://poser.pugx.org/laravel/homestead/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/homestead"><img src="https://poser.pugx.org/laravel/homestead/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/homestead"><img src="https://poser.pugx.org/laravel/homestead/license.svg" alt="License"></a>
</p>

## Introduction

Laravel Homestead is an official, pre-packaged Vagrant box that provides you a wonderful development environment without requiring you to install PHP, a web server, and any other server software on your local machine. No more worrying about messing up your operating system! Vagrant boxes are completely disposable. If something goes wrong, you can destroy and re-create the box in minutes!

Homestead runs on any Windows, Mac, or Linux system, and includes the Nginx web server, PHP 7.3, MySQL, Postgres, Redis, Memcached, Node, and all of the other goodies you need to develop amazing Laravel applications.

Official documentation [is located here](https://laravel.com/docs/homestead).

## Developing Homestead

To keep any in-development changes separate from other Homestead installations, create a new project and install
Homestead from composer, forcing it to use a git checkout.

```
$ mkdir homestead && \
    cd homestead && \
    composer require --prefer-source laravel/homestead:dev-master
```

After it's complete, `vendor/laravel/homestead` will be a git checkout and can be used normally.
