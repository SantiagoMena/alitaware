<?php
namespace alitaware;
require('./clases/Usuario.php');
require('./clases/Api.php');

// use alitaware\DB;


$id = isset($_GET['id']) ? $_GET['id'] : false;
$id = 1;

if(!$id) {
    throw new Exception('Ingrese el atributo $_GET["id"]', 1);    
}

$usuario = new Usuario();

// var_dump($usuario->getAll());
// var_dump($usuario->getByNombre('jh'));

$usuarios = $usuario->getByNombre('jh');

foreach ($usuarios as $usuario) {
    $api = new Api($usuario['x_geo'], $usuario['y_geo']);
    
    var_dump($api->getData());
}

?>