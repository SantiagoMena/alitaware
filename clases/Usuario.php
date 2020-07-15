<?php
namespace alitaware;
require('DB.php');

class Usuario
{
    private $usuarios;
    public function __construct() {
        $db = new DB();
        $sql = "SELECT usuario, nombre as nombre_equipo, X(primer_uso_geo) as x_geo, Y(primer_uso_geo) as y_geo from usuario
                INNER JOIN equipo on equipo.id = usuario.equipo_id;";

        $data = [];

        foreach ($db->pdo->query($sql) as $usuario) {
            $data[] = [
                'usuario' => $usuario['usuario'],
                'nombre_equipo' => $usuario['nombre_equipo'],
                'x_geo' => $usuario['x_geo'],
                'y_geo' => $usuario['y_geo'],
            ];
        }

        $this->usuarios = $data;
    }

    public function getAll(): array
    {
        return $this->usuarios;
    }

    public function getByNombre(string $nombre): array
    {
        foreach ($this->getAll() as $usuario) {
            preg_match('/('. $nombre .')/', $usuario['usuario'], $matches, PREG_OFFSET_CAPTURE);
            if(count( $matches ) > 0 ){
                $data[] = $usuario;
            }
        }

         return array_filter($data, function($dato){ return !is_null($dato); });
    }
}
