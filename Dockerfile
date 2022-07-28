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

# Le agregamos un php.ini para cargar configuraciones personalizadas para PHP
COPY php.ini /usr/local/etc/php/custom-php.ini

# Instalamos Python y su package manager 'pip'
RUN apt-get update && apt-get install -y pip

# Configuramos python3 como python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Instalamos PyTube
RUN pip install pytube

# Instalamos el convertidor de video a mp3
RUN pip install moviepy
