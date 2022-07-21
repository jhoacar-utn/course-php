# Curso Programacion Web FullStack

![UTN BA Centro de e-Learning](https://www.frba.utn.edu.ar/wp-content/uploads/2016/08/logo-utn.ba-horizontal-e1471367724904.jpg)

## Clase 1 (Nivelacion)

* Lenguajes de Programacion (Compilados e Interpretados)
  * Metafora: Recetas de Cocina
* Comandos de Git:
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
* Instalacion de Docker
  * [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  * Windows o Mac `virtualizacion del sistema operativo`
* Protocolos de Comunicación y Servicios:
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
* Navegacion Web
  * HTML,CSS,Javascript
  * Conocimientos del DOM
* Trabajo Practico de Nivelacion

## Clase 2 (Introduccion a Docker)

* ¿Que es Docker? ¿Para que me puede servir?
  * Diferencia entre **maquina virtual** y **contenedor**
* Imagenes en Docker
  * Comandos utiles
    * `docker images`: Lista todas las imagenes que se hayan descargado
    * `docker pull`: Descarga una imagen del repositorio de [docker hub](https://hub.docker.com/)
    * `docker build`: Permite construir una imagen con el uso de un archivo `Dockerfile`, ejemplo: `docker build .` (se especifica que en la carpeta actual hay un archivo `Dockerfile` para construir la imagen)
      * `docker build -t`: Se le especifica con el parametro `-t` el nombre de la imagen a contruir, ejemplo: `docker build -t mi-imagen:v1` (con el `:` le puedo especificar la version)
* Contenedores
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
* Docker Compose
  * Configuracion de YAML - `docker-compose.yaml` o `docker-compose.yml`
    * `docker-compose up -d` Corre todos los contenedores en segundo plano como se especifican en el archivo de configuracion

## Clase 3 (Introduccion a PHP)

* ¿Que es PHP? - Historia
  * Servidores
  * Conectores de PHP al servidor [mod_php vs CGI vs FastCGI vs FPM](https://blog.ahierro.es/php-mod_php-vs-cgi-vs-fastcgi-vs-fpm/)
  * Configuracion con Docker (`docker-compose`)
  * LAMP Docker Services - ([configuration](https://gist.github.com/Beyarz/674b24d03614fde205a38f449800857a))
  * Codigo PHP - Etiqueta `<?php`
* Versionado de PHP
  * Versiones aconsejadas `>=7.4` ([versionado semantico](https://fperez217.medium.com/qu%C3%A9-es-versionamiento-sem%C3%A1ntico-bf495b9eb028) - [video](https://www.youtube.com/watch?v=hwlOuZvaDIA) - [Packagist Semver Checker](https://semver.madewithlove.com/?package=madewithlove%2Fhtaccess-cli&constraint=dev-main&stability=stable))
* Uso de PHP
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

## Clase 4 (Condicionales y Bucles)

* Declaracion de condicionales
  * `if`
  * `else`
  * `operador ternario`
  * `switch`
  * [match](https://www.php.net/manual/es/control-structures.match.php) `(php>=8.0.0)`
* Declaracion de ciclos
  * `while`
  * `do-while`
  * `for`
  * `foreach`
  * Directivas de control de ciclos
    * `continue`
    * `break`
    * `return`
* Comentarios de codigo
  * Comentarios de una linea
  * Comentarios multilinea
  * Comentarios para documentacion ([PHPDocs Basics](https://phpstan.org/writing-php-code/phpdocs-basics))
* Practica de variables, ciclos y condicionales

## Clase 5 (Funciones en PHP)

* Semantica de funciones
* Argumentos en funciones
  * Por valor
  * Por referencia
* Documentacion de Funciones
  * Documentando con etiquetas `@param` y `@return`
* Scope de variables en las funciones
  * Variables globales
  * Variables locales
* Funciones anonimas
  * Callbacks - Uso de callbacks para manipulacion de arrays
    * Uso de `array_map`, `array_filter` y `array_reduce`
  * Clousures
* Modularizacion de codigo
  * Uso de `include`, `include_once`,`require` y `require_once`
* Practica de funciones usando array callbacks

## Clase 6 (Introduccion a POO con PHP)

* ¿Que es POO? ¿Para que me puede servir?
  * Caracteristicas de POO
    * Cohesión
    * Acoplamiento
    * Encapsulamiento.
    * Herencia
    * Abstracción
    * Polimorfismo
* Sintaxis de clases en PHP
  * Ejemplo de clase base
  * Ejemplo de Cohesion de clase base (reduccion de complejidad en clases)
  * Ejemplo de Acoplamiento de clase base (El bajo acoplamiento es frecuentemente una señal de un sistema bien estructurado y de un buen diseño de software)
  * Ejemplo de Encapsulamiento de clase base (ocultamiento del estado)
    * ![Encapsulamiento](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/03_Encapsulamiento.jpg/450px-03_Encapsulamiento.jpg)

## Clase 7 (Herencia y Abstraccion)

* ¿Que es la Herencia? ¿Que es la Abstraccion?
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
* Practica sobre herencia simple y herencia multiple

## Clase 8 (Polimorfismo)

* ¿Que es el Polimorfismo?
  * Poli: muchas - morfismo: formas
  * Reutilizacion de codigo
* ¿Que son las interfaces?
  * Uso de `interface` para definir contratos a cumplir entre clases
* Clases abstractas
  * Uso de `abstract` para definir clases abstractas que poseen atributos con metodos abstractos que definen un contrato a cumplir
* Practica sobre polimorfismo con vectores polimorficos

## Clase 9 (Clase de Repaso y Consultas)

* Repaso sobre servidores
* Resolucion de problemas con docker
* Resolucion de problemas con PHP
* Repaso sobre Programacion Orientada a Objetos
* Herencia, Abstraccion y Polimorfismo

## Clase 10 (Namespace, Control de Excepciones y Autoloading)

* ¿Que es el namespacing?
  * Uso de `namespace` para definir un espacio de nombres
* ¿Como se controlan los errores?
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

* ¿Que es el autoloading?
  * Estandares para el autoloading
    * [PSR-4](https://www.php-fig.org/psr/psr-4/)
* Manejador de Codigo para PHP - [PEAR,PECL and Composer](https://medium.com/@deboj88/difference-between-pear-pecl-and-composer-6426223c55ff)
  * PECL: (PHP Extension Community Library)
  * Composer: (PHP Package Manager)
  * PEAR: (PHP Package Manager - Deprecated)
* Composer
  * Instalacion de composer en host - [descargar](https://getcomposer.org/download/)
  * Instalacion de composer en docker - modificando `Dockerfile` con `COPY --from=composer:2.3 /usr/bin/composer /usr/bin/composer`
  * Iniciar un proyecto con `composer init`
  * Estructura de un proyecto con composer
  * Uso del archivo `.gitignore`
* Practica para hacer uso de autoloading con `use` para las clases o funciones

## Clase 11 (Configuracion de Proyecto con composer.json)

* Atributos de composer.json
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
* Agregando dependencias al proyecto
  * Dependencia para manejar [peticiones HTTP](https://symfony.com/doc/current/components/http_foundation.html) - `composer require symfony/http-foundation`
  * Dependencia para manejar [testing](https://phpunit.de/getting-started/phpunit-9.html) en la app - `composer require --dev phpunit`
* Practica para manejar peticiones por HTTP y realizando testing con script `composer test`

## Clase 12 (Configuracion del entorno de desarrollo)

* ¿Que es un linter? ¿Para que me puede servir?
  * [PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) (estandar actual)
* Test unitarios con PHPUnit
  * [PHPUnit](https://phpunit.de/getting-started/phpunit-9.html) (mas usado)
* Generador de documentacion de codigo PHP
  * Necesario trabajar con PHPDocs
  * [PHPDoc](https://www.phpdoc.org/) (recomandable usarlo con docker)

    ```docker
    docker run --rm -v ${PWD}:/data phpdoc/phpdoc:3
    ```

## Clase 13 (Wrappers de PHP)

* ¿Que es un wrapper? - [Protocolos y Envolturas](https://www.php.net/manual/es/wrappers.php)
* Wrapper [php://](https://www.php.net/manual/es/wrappers.php.php)
  * `php://input` - Flujo de entrada de solo lectura con el contenido del usuario en el caso de peticiones `POST`
  * `php://output` - Flujo de solo escritura que permite escribir en el buffer (memoria ram) de salida tal como lo hacen `print` y `echo`.
  * `php://temp` - Flujo de lectura y escritura pero almacenara los datos en memoria (disco solido o rigido), util para guardar archivos temporales como imagenes o archivos que envia el usuario, la ubicacion de la carpeta donde se guardan temporalmente se puede saber invocando la funcion `sys_get_temp_dir()`
    * Importante: `php://memory` y `php://temp` no son reutilizabes, esto es, despues de que los flujos hayan sido cerrados, no hay forma de hacer referencia a ellos de nuevo

     ```php
     <?php
     file_put_contents('php://memory', 'PHP');
     echo file_get_contents('php://memory'); // no imprime nada
     ```

* Practica para extraer imagen del usuario usando un formulario:

    ```html
   <html lang="en">
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

## Clase 12 (Enrutamiento dinamico)

* ¿Que es enrutamiento dinamico?
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

* Practica para crear enrutamiento dinamico usando peticiones `GET` y `POST`
