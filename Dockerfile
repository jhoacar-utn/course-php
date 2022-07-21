FROM php:7.2.6-apache

COPY --from=composer:2.3 /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install mysqli

# This text enable /public directory as main
ENV PUBLIC_DIRECTORY="\/var\/www\/html\/public\n\tDirectoryIndex \/index.php\n"
# This text enable dynamic routing
ENV DYNAMIC_ROUTING="<Directory \/var\/www\/html\/public>\n\t\tAllowOverride None\n\t\tOrder Allow,Deny\n\n\t\tFallbackResource \/index.php\n\t\tAllow from All\n\t<\/Directory>\n"

RUN sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ s/\/var\/www\/html/$PUBLIC_DIRECTORY\n$DYNAMIC_ROUTING/" /etc/apache2/sites-available/000-default.conf

