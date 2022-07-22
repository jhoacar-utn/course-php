<?php

require_once __DIR__.'/../vendor/autoload.php';

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection([
    'driver' => 'mysql',
    'host' => 'mysql',
    'database' => 'course',
    'username' => 'user',
    'password' => 'user',
    'charset' => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix' => '',
]);

/**
 * Esto asegura que todos los metodos estaticos de conexio a modelos
 * Sean ejecutados directamente en esta 'capsula' de base de datos
*/
$capsule->setAsGlobal();

/**
 * Arrancamos a Eloquent para que se conecte a la base de datos
*/
$capsule->bootEloquent();

/**
 * Creamos una tabla llamada 'users' que contendra los campos
 * @var int id (incremental)
 * @var string email (unico en la tabla)
 * @var string todo (una lista de tareas)
 * @var timestamps agrega dos columnas 'created_at' y 'updated_at' en la tabla 
*/
// Capsule::schema()->create('users', function ($table) {
//   $table->increments('id');
//   $table->string('email')->unique();
//   $table->string('todo');
//   $table->timestamps();
// });

/**
 * Clase usada para representar los datos del usuario
*/

class User extends Illuminate\Database\Eloquent\Model {
  /**
   * La tabla que sera asociada al modelo
   * @var string
  */
  protected $table = 'users';
}

/**
 * Creamos una nueva instancia de nuestro modelo para poder asignarle datos
*/
$user = new User();
/**
 *  Le asignamos el valor a los atributos del modelo 
*/

$user->email = "ejemplo".rand(0,10)."@ejemplo.com";
$user->todo = "sacar a pasear al perro";
/** 
 * Procedemos a guardar esa informacion
*/
$user->save();

/**
 * Luego de guardados los datos procedemos a traerlos con el metodo all();
 * Procedemos posteriormente a mostrarlos por pantalla
*/
$users = User::all();

foreach($users as $user)
{
  echo "$user->email - $user->todo <br>";
}


require_once '../index.html';