#!/usr/bin/env bash

echo "Updating Composer..."
#composer self-update
#composer self-update --2
echo "Running composer"
#composer global require hirak/prestissimo
composer install --no-dev --working-dir=/var/www/html

echo "Installing Laravel Breeze..."
php artisan breeze:install

#echo "Generating application key..."
#php artisan key:generate --show
echo 'clearing'
php artisan config:clear
echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force
