
## Ejemplo sencillo de IDOR (con api)

Imagina una aplicación web de biblioteca donde los usuarios pueden reservar libros. La URL para ver los detalles de un libro es `https://biblioteca.com/libro?id=123`, donde `123` es el identificador único del libro. Si un usuario malintencionado cambia el `id` a `124` en la URL y la aplicación muestra los detalles del libro sin verificar permisos, se trata de una vulnerabilidad de IDOR.

