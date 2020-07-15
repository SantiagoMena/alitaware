<?php
namespace alitaware;
class Api
{
    private $data;
    public function __construct(float $lat, float $lon) {
        $url = "https://apis.datos.gob.ar/georef/api/ubicacion?lat=$lat&lon=$lon";
        $ch = curl_init($url);
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPGET, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Accept: application/json'
        ));
        
        $this->data = json_decode(curl_exec($ch), true);
        curl_close($ch);
    }

    public function getData(){
        return $this->data;
    }
}