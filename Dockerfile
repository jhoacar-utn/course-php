FROM php:8.1-apache

# This text enable /public directory as main
ENV PUBLIC_DIRECTORY="\/var\/www\/html\/public\n\tDirectoryIndex \/index.php\n"

# Using 'sed' we add the content between <VirtualHost> directives
RUN sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ s/\/var\/www\/html/$PUBLIC_DIRECTORY/" /etc/apache2/sites-available/000-default.conf

