<?php
namespace alitaware;
require('./clases/Usuario.php');
require('./clases/Api.php');

$usuario = new Usuario();

$data = $usuario->getEquipo();

echo json_encode($data);
?>