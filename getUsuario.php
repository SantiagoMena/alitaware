<?php
namespace alitaware;
require('./clases/Usuario.php');
require('./clases/Api.php');


$textoNombre = isset($_GET['nombre']) ? $_GET['nombre'] : false;


if(!$textoNombre) {
    return json_encode([]);
}

$usuario = new Usuario();

// var_dump($usuario->getAll());
// var_dump($usuario->getByNombre('jh'));

$usuarios = $usuario->getByNombre($textoNombre);
$data = [];
foreach ($usuarios as $usuario) {
    $api = new Api($usuario['x_geo'], $usuario['y_geo']);
    $data[] = array_merge($usuario, [ 'geo' => $api->getData() ]);
}

echo json_encode($data);
?>