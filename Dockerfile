FROM php:8.1-apache

# This text enable /public directory as main
ENV PUBLIC_DIRECTORY="\/var\/www\/html\/public\n\tDirectoryIndex \/index.php\n"

# Using 'sed' we add the content between <VirtualHost> directives
RUN sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ s/\/var\/www\/html/$PUBLIC_DIRECTORY/" /etc/apache2/sites-available/000-default.conf

# Usando el parametro -j le decimos la velocidad de instalacion y que sera de
# acuerdo a la cantidad de numero de procesamiento que tenga que sera $(nproc)
# Instalamos entonces las extensiones mysqli, pdo y pdo_mysql para poder comunicarnos
# con la base de datos de MySQL
RUN docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo \
        pdo_mysql \