<?php
namespace alitaware;
use PDO;

class DB
{
    public $pdo;
    public function __construct() {
        $this->pdo = new PDO(
            'mysql:host=mysql;dbname=alitaware',
            'alitaware',
            'alitaware'
        );
    }


}
