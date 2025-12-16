#!/bin/bash
# Output Current FrankenPHP Version
frankenphp -v

if [ -f composer.json ]; then
    echo "Verifying Composer dependencies..."
    composer install --no-interaction --ansi --no-dev --optimize-autoloader

    echo "Executing Octane installation..."
    php artisan octane:install --server=frankenphp

    php artisan optimize
fi

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":$HOME$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}