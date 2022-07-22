# Curso Programacion Web FullStack

![UTN BA Centro de e-Learning](https://www.frba.utn.edu.ar/wp-content/uploads/2016/08/logo-utn.ba-horizontal-e1471367724904.jpg)

<hr>
<details>

  <summary><h1>Clase 1 (Nivelacion)</h1></summary>

  <details>
    <summary><h2>Lenguajes de Programacion (Compilados e Interpretados)</h2></summary>

* Metafora: Recetas de Cocina
  </details>

  <details>
    <summary><h2>Comandos de Git</h2></summary>

  * `git clone`: Clona un repositorio remoto en la maquina local, ejemplo: `git clone https://github.com/jhoacar-utn/course-php`
  * `git status`: Muestra el estado actual del respositorio que se encuentra
  * `git branch`: Control de ramas en git, ejemplo: `git branch -a` (muestra todas las ramas del repositorio, tanto local como remotas)
    * `git branch un_nombre_cualquiera` Crea una rama con un nombre que se desee
    * `git branch -d un_nombre_cualquiera` Elimina una rama con un nombre que se desee
    * `git branch -D un_nombre_cualquiera` Elimina una rama a fuerza bruta con un nombre que se desee
    * `git branch -m otro_nombre_cualquiera` Cambia el nombre de la rama actual a otro_nombre_cualquiera.
  * `git checkout`: Control de cambios entre ramas, permite ir y volver entre ellas, ejemplo: `git checkout otra_rama`
    * `git checkout -b nueva_rama` Crea una rama y se mueve hacia ella en este solo comando
  * `git add`: Añade al **stage** un archivo, archivos o carpetas, ejemplo: `git add .` (añade toda la carpeta actual)
  * `git restore`: Regresa los cambios realizados en los archivos o carpetas, ejemplo: `git restore .` (restaura los cambios que no han ido al **stage** de toda la carpeta actual)
    * `--staged` Regresa los cambios que fueron guardados en el **stage**
  * `git commit`: Añade los cambios del **stage** al historial de commits, ejemplo: `git commit -m "mi primer commit"` (guarda en la linea de tiempo un commit por nombre "mi primer commit")
    * `-m` Se especifica un mensaje para el **commit**
  * `git push`: Sube los cambios que se han realizado al repositorio remoto hacia una rama especifica, ejemplo: `git push origin jhoan_carrero`
    * `-f` realiza un push por fuerza bruta, no recomendado, puede borrar commits no deseados
  * `git pull`: Actualiza los cambios que se han realizado en remoto con la maquina local, ejemplo: `git pull origin jhoan_carrero`

  </details>

  <details>
    <summary><h2>Instalacion de Docker</h2></summary>

  * [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  * Windows o Mac `virtualizacion del sistema operativo`
  </details>

  <details>
    <summary><h2>Protocolos de Comunicación y Servicios</h2></summary>
    
  * IP (Protocolo de Internet, Ubicacion en la red de una maquina)
  * Puertos (Servicios que brinda la maquina, ejemplo el puerto 80 es para servicio web)
  * TCP (Protocolo de Control de Transmision)
    * Comunicacion garantizada, ejemplo paginas web
  * UDP (Protocolo de Datagramas de Usuario)
    * Velocidad garantizada, ejemplo videollamadas
  * HTTP (Protocolo de Transferencia de HyperTexto)
    * Cabeceras
      * Cookies, Tokens, Informacion del Navegador,...
    * Verbos
      * Get, Post, Put,...
    * Body
      * Datos del usuario
  * DNS (Servicios de Nombres de Dominio)
  </details>

  <details>
    <summary><h2>Navegacion Web</h2></summary>

  * HTML,CSS,Javascript
  * Conocimientos del DOM
  </details>

  <details>
    <summary><h2>Trabajo Practico de Nivelacion</h2></summary>
  </details>


</details>

<hr>
<details>
  <summary><h1>Clase 2 (Introduccion a Docker)</h1></summary>

  <details>
    <summary><h2>¿Que es Docker? ¿Para que me puede servir? </h2></summary>

  * Diferencia entre **maquina virtual** y **contenedor**
  </details>

  <details>
    <summary><h2>Imagenes en Docker</h2></summary>

  * Comandos utiles
    * `docker images`: Lista todas las imagenes que se hayan descargado
    * `docker pull`: Descarga una imagen del repositorio de [docker hub](https://hub.docker.com/)
    * `docker build`: Permite construir una imagen con el uso de un archivo `Dockerfile`, ejemplo: `docker build .` (se especifica que en la carpeta actual hay un archivo `Dockerfile` para construir la imagen)
      * `docker build -t`: Se le especifica con el parametro `-t` el nombre de la imagen a contruir, ejemplo: `docker build -t mi-imagen:v1` (con el `:` le puedo especificar la version)
  </details>

  <details>
    <summary><h2>Contenedores</h2></summary>

  * Comandos utiles
    * `docker ps`: Lista todos los contenedores que se estan ejecutando
      * `-a` Lista todos los contenedores incluso aquellos que se han detenido
    * `docker run`: Levanta un **nuevo** contenedor con alguna imagen que se especifique, ejemplo: `docker run ubuntu echo "Hello World"` (el texto `echo "Hello World"` es un comando que se va a ejecutar en el contenedor apenas arranque)
      * `--name` Se le especifica un nombre al contenedor, por defecto es aleatorio
      * `-d` Se le especifica al contenedor que se ejecute en segundo plano
      * `--rm` Elimina el contenedor luego de ejecutado
      * `-it` Habilita el modo interactivo por consola, permitiendo asi ejecutar comandos adentro del contenedor, ejemplo: `docker run -it ubuntu bash` (aparecera un consola de bash para poder ejecutar comandos)
      * `-p` Muy util para especificar puertos a exponer entre el host y el contenedor, es decir, que haga match con algun puerto adentro del mismo y lo muestre afuera en el host, ejemplo:
      `docker run -p 9090:80 ubuntu` (la sintaxis es **host_port:container_port** )
      * `-v` Al igual que el parametro `-p` que hace match entre contenedor y host, este parametro nos viene muy util para hacer match entre carpetas, es decir, voy a poder tener archivos en el contenedor que estan en mi maquina, y asi si realizo algun cambio es afectado en ambos, ejemplo: `docker run -v $(pwd):/app` (al escribir `$(pwd)` lo que hago es hacer uso del directorio actual, `$()` permite ejecutar comandos y mostrar la salida y `pwd` es el comando para imprimir la ruta del directorio actual, la sintaxis es **/host/volume/location:/container/storage**)
      * `-e` Asigna variables de entorno adentro del contenedor, ejemplo: `docker run --env VAR1=value1 --env VAR2=value2 ubuntu`
  </details>

  <details>
    <summary><h2>Docker Compose</h2></summary>

  * Configuracion de YAML - `docker-compose.yaml` o `docker-compose.yml`
    * `docker-compose up -d` Corre todos los contenedores en segundo plano como se especifican en el archivo de configuracion
  </details>

</details>

<hr>
<details>
  <summary><h1>Clase 3 (Introduccion a PHP)</h1></summary>

  <details>
    <summary><h2>¿Que es PHP? - Historia</h2></summary>

  * Paginas web dinamicas desde 1995
  </details>

  <details>
    <summary><h2>Servidores para PHP</h2></summary>

  * Apache
  * Nginx
  * Lighttpd
  * ...
  </details>

  <details>
    <summary><h2>Conectores de PHP al servidor</h2></summary>

  * mod_php
  * CGI
  * FastCGI
  * FPM
  
  ## [mod_php vs CGI vs FastCGI vs FPM](https://blog.ahierro.es/php-mod_php-vs-cgi-vs-fastcgi-vs-fpm/)
  </details>

  <details>
    <summary><h2>Configuracion con Docker</h2></summary>

  * LAMP (Linux-Apache-MySQL-PHP) Docker Services - ([configuration](https://gist.github.com/Beyarz/674b24d03614fde205a38f449800857a))

    **`docker-compose.yaml`**

    ```YAML
    version: "3" # Nosotros especificamos la version del docker-compose
    services: # Declaramos los servicios
        # Llamamos un servicio, como www, pero puede llevar cualquier nombre
        # Lo importante esque este nombre sera el nombre usado en la red interna de docker
        www: 
            build: . # Le decimos que construya una imagen que usara este contenedor
            restart: always # Si algo falla al crearse el contenedor, se vuelve a reiniciar
            image: course:1.0.0 # Luego de construida la imagen que le ponga el nombre de course en la version 1.0
            container_name: course # Este sera el nombre del contenedor, viene siendo el uso de --name
            ports: # Le especificamos la configuracion de los puertos del host y el contenedor
                - "8000:80" # La sintaxis es "puerto-host":"puerto-contenedor", entonces veremos la pagina en localhost:8000
            volumes: # Le especificamos que debe montar un directorio en el contenedor para visualizarlo en el host
                - ./:/var/www/html/ # Le decimos que sea la carpeta actual con './' y que la ingrese en '/var/www/html' 
            links: # Aca se estaria vinculando el contenedor de la base de datos en este
                - mysql:mysql # A grandes rasgos, copia la direccion ip del contenedor de mysql en el /etc/hosts/
            depends_on: # Le bloqueamos la inicializacion hasta que el contenedor de base de datos este arriba
                - mysql
        mysql: # Llamamos a este servicio que tendra acceso en la red interna de docker atraves de este nombre
            image: mysql:8.0.16 # Le especificamos una version de la imagen de mysql ya que es una buena practica
            command: --default-authentication-plugin=mysql_native_password # Con este comando garantizamos las credenciales para iniciar sesion
            container_name: mysql # Este sera el nombre del contenedor, viene siendo el uso de --name
            ports: # Habilitamos los puertos que se exponen en el host y los vinculamos con el del contenedor
                - "3306:3306" # Por defecto el puerto para mysql es 3306
            volumes: # Conectamos un volumen con la carpeta que maneja toda la informacion de la base de datos
                - volumen_mysql:/var/lib/mysql # Este volumen no es un directorio sino uno que se ha creado directamente docker, mas abajo se comenta
            environment: # Le pasamos las variables de entorno o variables de configuracion al contenedor
                MYSQL_DATABASE: course # Le especificamos que tiene que crear una base de datos llamada 'course'
                MYSQL_USER: user # Le especificamos que tiene que crear un usuario llamado user
                MYSQL_PASSWORD: user # Le especificamos su contraseña a esta base de datos
                MYSQL_ROOT_PASSWORD: root # Le especificamos la contraseña del super usuario root que sera 'root'

        phpmyadmin: # Llamamos a este servicio para poder mostrar y gestionar la base de datos de una manera mas amigable
            image: phpmyadmin/phpmyadmin:4.8 # Le especificamos una version por buenas practicas
            container_name: phpmyadmin # Este sera el nombre del contenedor, viene siendo el uso de --name
            links: # Vinculamos la base de datos a este contenedor
                - mysql:mysql # Directamente asigna la ip del contenedor por nombre 'mysql' en el /etc/hosts de este contenedor
            ports: # Habilitamos los puertos por el cual este gestor de base de datos sera controlado
                - 8080:80 # Por lo tanto podremos manejar la base de datos accediendo al localhost:8080
            environment: # Le pasamos las variables de configuracion
                PMA_ARBITRARY: 1 # Con este parametro le permitimos disponibilidad de yo escoger luego las credenciales
            depends_on:
                - mysql
    # Esta seccion es importante que es para montar un volumen directamente con docker y que no sea una carpeta de mi sistema
    # Esto es importante ya que si no lo hacemos con volumenes de docker sino volumenes usando directorios como './mi-carpeta' no functionaria
    # Puede funcionar si se estaria usando un sistema operativo de linux que soporta sistemas de archivos ext4 y no ntfs como es en el caso de windows
    volumes:
        volumen_mysql:
            external: false
    ```

    **`Dockerfile`**

    ```Dockerfile
    # Le especificamos que imagen sera la creada, que usaremos la de php en la version 8.1 con 
    # servidor de apache
    FROM php:8.1-apache

    # Esta variable contiene la configuracion para habilitar una carpeta llamada /public como 
    # principal y que el archivo principal (DirectoryIndex) sera el index.php
    ENV PUBLIC_DIRECTORY="\/var\/www\/html\/public\n\tDirectoryIndex \/index.php\n"

    # Usar el comando 'sed' realiza sustituciones en un archivo o textos, en este caso 
    # necesitamos añadirle la variable con el contenido de $PUBLIC_DIRECTORY en el archivo de 
    # configuracion por defecto para apache2
    RUN sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ s/\/var\/www\/html/$PUBLIC_DIRECTORY/" /etc/apache2/sites-available/000-default.conf
    ```

  </details>

  <details>
    <summary><h2>Versionado de PHP</h2></summary>

  * Versiones aconsejadas `>=7.4` ([versionado semantico](https://fperez217.medium.com/qu%C3%A9-es-versionamiento-sem%C3%A1ntico-bf495b9eb028) - [video](https://www.youtube.com/watch?v=hwlOuZvaDIA) - [Packagist Semver Checker](https://semver.madewithlove.com/?package=madewithlove%2Fhtaccess-cli&constraint=dev-main&stability=stable))
    
  </details>

  <details>
    <summary><h2>Uso de PHP</h2></summary>

  * Codigo PHP - Etiqueta `<?php `
  * Mostrando toda la informacion sobre la configuracion de php - `<?php phpinfo();`
  * Variables predefinidas
    * **Superglobals** — Superglobals son variables internas que están disponibles siempre en todos los ámbitos:
      * `$GLOBALS` — Hace referencia a todas las variables disponibles en el ámbito global
      * `$_SERVER` — Información del entorno del servidor y de ejecución
      * `$_GET` — Variables HTTP GET
      * `$_POST` — Variables POST de HTTP
      * `$_FILES` — Variables de subida de ficheros HTTP
      * `$_REQUEST` — Variables HTTP Request
      * `$_SESSION` — Variables de sesión
      * `$_ENV` — Variables de entorno
      * `$_COOKIE` — Cookies HTTP
    * `$php_errormsg` — El mensaje del error anterior
    * `$http_response_header` — Encabezados de respuesta HTTP
    * `$argc` — El número de argumentos pasados a un script
    * `$argv` — Array de argumentos pasados a un script
  * Mostrando la informacion de las variables con `echo`,`print_r` y `var_dump`
  * Declaracion de variables

  </details>

</details>

<hr>
<details>
  <summary><h1>Clase 4 (Condicionales y Bucles)</h1></summary>

  <details>
    <summary><h2>Declaracion de condicionales</h2></summary>

  * `if`
  * `else`
  * `operador ternario`
  * `switch`
  * [match](https://www.php.net/manual/es/control-structures.match.php) `(php>=8.0.0)`
  </details>
  <details>
    <summary><h2>Declaracion de ciclos</h2></summary>

  * `while`
  * `do-while`
  * `for`
  * `foreach`
  * Directivas de control de ciclos
    * `continue`
    * `break`
    * `return`
  </details>
  <details>
    <summary><h2>Comentarios de codigo</h2></summary>

  * Comentarios de una linea
  * Comentarios multilinea
  * Comentarios para documentacion ([PHPDocs Basics](https://phpstan.org/writing-php-code/phpdocs-basics))
  </details>
  <details>
    <summary><h2>Practica de variables, condicionales y ciclos</h2></summary>
  </details>

</details>

<hr>
<details>
  <summary><h1>Clase 5 (Funciones en PHP)</h1></summary>

  <details>
    <summary><h2>Semantica de funciones</h2></summary>

  * Palabra reservada `function` y `return`
  </details>

  <details>
    <summary><h2>Argumentos en funciones</h2></summary>

  * Por valor
  * Por referencia
  </details>

  <details>
    <summary><h2>Documentacion de Funciones</h2></summary>

  * Documentando con etiquetas `@param` y `@return`
  </details>

  <details>
    <summary><h2>Scope de variables en las funciones</h2></summary>

  * Variables globales
  * Variables locales
  </details>

  <details>
    <summary><h2>Funciones anonimas</h2></summary>

  * Callbacks - Uso de callbacks para manipulacion de arrays
    * Uso de `array_map`, `array_filter` y `array_reduce`
  * Clousures
  </details>

  <details>
    <summary><h2>Modularizacion de codigo</h2></summary>

  * Uso de `include`, `include_once`,`require` y `require_once`
  </details>

  <details>
    <summary><h2>Practica de funciones usando array callbacks</h2></summary>
  </details>

</details>

<hr>
<details>
  <summary><h1>Clase 6 (Introduccion a POO con PHP)</h1></summary>  

  <details>
    <summary><h2>¿Que es POO? ¿Para que me puede servir?</h2></summary>

  * Caracteristicas de POO
    * Cohesión
    * Acoplamiento
    * Encapsulamiento.
    * Herencia
    * Abstracción
    * Polimorfismo
  </details>

  <details>
    <summary><h2>Sintaxis de clases en PHP</h2></summary>

  * Ejemplo de clase base
  * Ejemplo de Cohesion de clase base (reduccion de complejidad en clases)
  * Ejemplo de Acoplamiento de clase base (El bajo acoplamiento es frecuentemente una señal de un sistema bien estructurado y de un buen diseño de software)
  * Ejemplo de Encapsulamiento de clase base (ocultamiento del estado)
    * ![Encapsulamiento](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/03_Encapsulamiento.jpg/450px-03_Encapsulamiento.jpg)
  </details>
</details>

<hr>
<details>
  <summary><h1>Clase 7 (Herencia y Abstraccion)</h1></summary>  

  <details>
    <summary><h2>¿Que es la Herencia? ¿Que es la Abstraccion?</h2></summary>

  * Abstraccion
    * Uso de la abstraccion para atributos entre clases
      * atributos y funciones `public`,`private` y `protected`
    * Metodos y variables estaticas
      * Constantes estaticas - `const`
      * Variables estaticas - `static`
      * Metodos estaticos - `static function`
  * Herencia simple
    * Uso de `extends` entre clases
  * Herencia "multiple"
    * Uso de `traits` con `use`
  </details>

  <details>
    <summary><h2>Practica sobre herencia simple y herencia multiple</h2></summary>
  </details>
</details>

<hr>
<details>
  <summary><h1>Clase 8 (Polimorfismo)</h1></summary>  

  <details>
    <summary><h2>¿Que es el Polimorfismo?</h2></summary>
    
  * Poli: muchas - morfismo: formas
  * Reutilizacion de codigo
  </details>

  <details>
    <summary><h2>¿Que son las interfaces?</h2></summary>

  * Uso de `interface` para definir contratos a cumplir entre clases
  </details>

  <details>
    <summary><h2>Clases abstractas</h2></summary>

  * Uso de `abstract` para definir clases abstractas que poseen atributos con metodos abstractos que definen un contrato a cumplir
  </details>

  <details>
    <summary><h2>Practica sobre polimorfismo con vectores polimorficos</h2></summary>
  </details>
</details>

<hr>
<details>
  <summary><h1>Clase 9 (Clase de Repaso y Consultas)</h1></summary>  

* Repaso sobre servidores
* Resolucion de problemas con docker
* Resolucion de problemas con PHP
* Repaso sobre Programacion Orientada a Objetos
* Herencia, Abstraccion y Polimorfismo
  
</details>

<hr>
<details>
  <summary><h1>Clase 10 (Namespace, Control de Excepciones y Autoloading)</h1></summary>  

  <details>
    <summary><h2>¿Que es el namespacing?</h2></summary>

  * Uso de `namespace` para definir un espacio de nombres
  </details>

   <details>
    <summary><h2>¿Como se controlan los errores?</h2></summary>

  * [Tipos de errores](https://cybmeta.com/tipos-de-errores-en-php)
    * Errores fatales: detienen el flujo de la aplicacion

      ```php
      <?php
      $objeto;
      # La declaracion de esta variable ha sido interpretada y se le ha asignado un valor nulo
      # Esto quiere decir que $objeto === null, por lo tanto sera un excepcion critica invocar
      # un metodo llamado 'obtenerNombre' en algo que esta vacio
      echo $objeto->obtenerNombre();
      ?>
      ```

    * Errores de warning: no detienen el flujo de la aplicacion, pero se mostrara un mensaje de advertencia

      ```php
      <?php
      $numerador = 5;
      $denominador = 0;
      # La division por cero aunque seria tratada en otros lenguajes como una excepcion
      # Aca se trabaja como un warning y se imprimira la palabra 'INF' como resultado
      echo $numerador/$denominador;
      ?>
      ```

    * Errores de Notice: son los errores mas bajos o de menor prioridad y por defecto no se muestran pero podria darse el caso de que se activen

      ```php
      <?php
      $name = "Manolo";
      //$nombre es una variable que no ha sido definida antes de su uso. Su valor es NULL.
      echo 'Tu nombre es ' . $nombre;
      ?>
      ```

  * Uso del `throw` para arrojar nuevos errores, ejemplo: `throw new Error('nuevo error');`
  * Uso del `try` y `catch` para poder manejar estos errores sin detener el flujo de la aplicacion
  * Uso del `finally` para ejecutar codigo que se requiera siempre

    ```php
      try {
        $numerador = 5;
        $denominador = 0;
        if ($numerador/$denominador === INF) {
            throw new Error('<br>Estas diviendo por cero y no se puede<br>');
        }
        echo $numerador/$denominador;
      } catch (\Throwable $error) {
          echo $error->getMessage();
      } finally {
          echo "<br>Se ha realizado la division<br>";
      }
    ```
  </details>

   <details>
    <summary><h2>¿Que es el autoloading?</h2></summary>

  * Estandares para el autoloading
    * [PSR-4](https://www.php-fig.org/psr/psr-4/)
  </details>

   <details>
    <summary><h2>Manejador de Codigo para PHP - <a href="https://medium.com/@deboj88/difference-between-pear-pecl-and-composer-6426223c55ff">PEAR, PECL and Composer</a></h2></summary>

  * PECL: (PHP Extension Community Library)
  * Composer: (PHP Package Manager)
  * PEAR: (PHP Package Manager - Deprecated)
  </details>

   <details>
    <summary><h2>Composer</h2></summary>

  * Instalacion de composer en host - [descargar](https://getcomposer.org/download/)
  * Instalacion de composer en docker - modificando `Dockerfile` con `COPY --from=composer:2.3 /usr/bin/composer /usr/bin/composer`
  * Iniciar un proyecto con `composer init`
  * Estructura de un proyecto con composer
  * Uso del archivo `.gitignore`
  </details>

   <details>
    <summary><h2>Practica para hacer uso de autoloading con `use` para las clases o funciones</h2></summary>
  </details>

</details>

<hr>
<details>
  <summary><h1>Clase 11 (Configuracion de Proyecto con composer.json)</h1></summary>  

  <details>
    <summary><h2>Atributos de composer.json</h2></summary>

  * Autoload - Define el estandar a autocargar las clases
    * autoload - Indice como seran cargadas las clases en produccion
    * autoload-dev - Indica como seran cargadas las clases en el desarrollo, usada en el testing
      * PSR-4 - Indica que `namespace` sera el buscado y la carpeta donde se encuentra el codigo
  * Require - Define las distintas dependencias del proyecto
    * require - Indica aquellas librerias que seran cargadas en un entorno de produccion usando [versionado semantico](https://fperez217.medium.com/qu%C3%A9-es-versionamiento-sem%C3%A1ntico-bf495b9eb028) - [video](https://www.youtube.com/watch?v=hwlOuZvaDIA) - [Packagist Semver Checker](https://semver.madewithlove.com/?package=madewithlove%2Fhtaccess-cli&constraint=dev-main&stability=stable)
    * require-dev - Indica aquellas librerias que seran cargadas en un entorno de desarrollo, por ejemplo, `phpunit`
  * Scripts - Indica aquellos scripts que seran ejecutados directamente desde composer
    * `post-update-cmd` - Ocurre despues del comando de `composer update`
    * Se pueden customizar los distintos scripts a ejecutar en el proyecto
  </details>

  <details>
    <summary><h2>Agregando dependencias al proyecto</h2></summary>

  * Dependencia para manejar [peticiones HTTP](https://symfony.com/doc/current/components/http_foundation.html) - `composer require symfony/http-foundation`
  * Dependencia para manejar [testing](https://phpunit.de/getting-started/phpunit-9.html) en la app - `composer require --dev phpunit`
  </details>

  <details>
    <summary><h2>Practica para manejar peticiones por HTTP y realizando testing con script `composer test`</h2></summary>
  </details>
</details>


<hr>
<details>
  <summary><h1>Clase 12 (Configuracion del entorno de desarrollo)</h1></summary>  

  <details>
    <summary><h2>¿Que es un linter? ¿Para que me puede servir?</h2></summary>

  * [PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) (estandar actual)
  </details>

  <details>
    <summary><h2>Analizador de codigo</h2></summary>

  * PHPStan
  </details>

  <details>
    <summary><h2>Test unitarios con PHPUnit</h2></summary>

  * [PHPUnit](https://phpunit.de/getting-started/phpunit-9.html) (mas usado)
  </details>

  <details>
    <summary><h2>Generador de documentacion de codigo PHP</h2></summary>

  * Necesario trabajar con PHPDocs
  * [PHPDoc](https://www.phpdoc.org/) (recomandable usarlo con docker)

    ```docker
    docker run --rm -v ${PWD}:/data phpdoc/phpdoc:3
    ```
  </details>
</details>

<hr>
<details>
  <summary><h1>Clase 13 (Wrappers de PHP)</h1></summary>  

  <details>
    <summary><h2>¿Que es un wrapper?</h2></summary>

  * [Protocolos y Envolturas](https://www.php.net/manual/es/wrappers.php)
  </details>

  <details>
    <summary><h2>Wrapper <a href="https://www.php.net/manual/es/wrappers.php.php">php://</a></h2></summary>

  * `php://input` - Flujo de entrada de solo lectura con el contenido del usuario en el caso de peticiones `POST`
  * `php://output` - Flujo de solo escritura que permite escribir en el buffer (memoria ram) de salida tal como lo hacen `print` y `echo`.
  * `php://temp` - Flujo de lectura y escritura pero almacenara los datos en memoria (disco solido o rigido), util para guardar archivos temporales como imagenes o archivos que envia el usuario, la ubicacion de la carpeta donde se guardan temporalmente se puede saber invocando la funcion `sys_get_temp_dir()`
    * Importante: `php://memory` y `php://temp` no son reutilizabes, esto es, despues de que los flujos hayan sido cerrados, no hay forma de hacer referencia a ellos de nuevo

     ```php
     <?php
     file_put_contents('php://memory', 'PHP');
     echo file_get_contents('php://memory'); // no imprime nada
     ```
  </details>

  <details>
    <summary><h2>Practica para extraer imagen del usuario usando un formulario</h2></summary>

  ```html
  <html>
    <style>
      form{
          margin: 100px;
          border: 1px solid black;
          border-radius: 10px;
      }
      div {
          margin:10px;
          padding: 10px;
          text-align: center;
      }
      input[type="file"] {
          display: none;
      }
  
      label,
      input[type="submit"] {
          border: 1px solid black;
          padding: 10px;
          border-radius: 10px;
          cursor: pointer;
      }
    </style>
    <body>
        <form method="post" action="/upload.php" enctype="multipart/form-data">
            <div>Formulario de Ejemplo</div>
            <div>
                <label for="boton">Escoga el archivo</label>
                <input id="boton" type="file" name="archivo" />
            </div>
            <div><input type="submit" value="Subir archivo"></div>
        </form>
    </body>
  </html>
  ```

  </details>

</details>

<hr>

<details>
  <summary><h1>Clase 14 (Enrutamiento dinamico)</h1></summary>  

  <details>
    <summary><h2>¿Que es enrutamiento dinamico?</h2></summary>

  * Habilitar enrutamiento dinamico en `apache` con docker
    * Modificando el `Dockerfile`:

    ```Dockerfile
      # This string enable /public directory as main
      ENV PUBLIC_DIRECTORY="\/var\/www\/html\/public\n\tDirectoryIndex \/index.php\n"
      # This string enable dynamic routing
      ENV DYNAMIC_ROUTING="<Directory \/var\/www\/html\/public>\n\t\tAllowOverride None\n\t\tOrder Allow,Deny\n\n\t\tFallbackResource \/index.php\n\t\tAllow from All\n\t<\/Directory>\n"
      # Using 'sed' we add the content between <VirtualHost> directives
      RUN sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ s/\/var\/www\/html/$PUBLIC_DIRECTORY\n$DYNAMIC_ROUTING/" /etc/apache2/sites-available/000-default.conf
    ```

  * Caso contrario en el archivo de configuracion de `apache2` garantizar la siguiente [configuracion](https://symfony.com/doc/current/setup/web_server_configuration.html#adding-rewrite-rules)

    ```apache.conf
    <VirtualHost *:80>
        
        DocumentRoot /var/www/html/public
        DirectoryIndex /index.php

        <Directory /var/www/html/public>
          
          AllowOverride None
          Order Allow,Deny
          Allow from All

          FallbackResource /index.php

        </Directory>

    </VirtualHost>
    ```

  </details>

  <details>
    <summary><h2>Practica para crear enrutamiento dinamico usando peticiones `GET` y `POST`</h2></summary>
  </details>
  
</details>



