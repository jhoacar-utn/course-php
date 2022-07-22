FROM php:8.1-apache

# Usando el parametro -j le decimos la velocidad de instalacion y que sera de
# acuerdo a la cantidad de numero de procesamiento que tenga que sera $(nproc)
# Instalamos entonces las extensiones mysqli, pdo y pdo_mysql para poder comunicarnos
# con la base de datos de MySQL
RUN docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo \
        pdo_mysql


# Dejamos un archivo de configuracion por defecto
COPY apache.conf /etc/apache2/sites-available/000-default.conf