# alitaware
Evaluación técnica

# Explicación del diagrama de datos 💾
_La idea es que un [subscriptior]() ingrese con sus datos, cree una [subscripcion]() o más en base a un [servicio]() el cual tiene un [costo]() asociado. El [subscriptior]() tiene la facultad de crear un [equipo]() o más, los cuales tienen asociados un [usuario]() o más. Con respecto a la cantidad de registros en la entidad [usuario]() que se encuentren se deberíar generar un nuevo [pago]() mensualmente de todas las subscripciones en estado "Pendiente", con el valor correspondiente a la entidad [costo]() asociada al [servicio]() de la [subscripcion]()_

# Correr el proyecto
### Usando Docker
`$ docker-compose build && docker-compose up` <br>
[http://localhost:8000](http://localhost:8000)

### Local
_Es necesario cambiar las credenciales de la base de datos en el archivo ./clases/DB.php_