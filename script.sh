#!/bin/bash

# Run Composer install to get the dependencies
composer update  --no-interaction
composer install --no-interaction --prefer-dist

php artisan optimize:clear
php artisan key:generate

# Run database migrations
php artisan migrate:fresh
php artisan migrate

# Seed the database
php artisan db:seed
php-fpm
