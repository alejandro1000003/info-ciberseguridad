## Definición

- La asignación masiva (o autoasignación) ocurre cuando un software asigna automáticamente los datos de una solicitud a los campos de un objeto interno.
- Puede resultar en la asignación de datos sensibles o no deseados a campos inapropiados.

## Ejemplo

- Una aplicación web recibe datos de un formulario y los asigna directamente a los campos correspondientes en un objeto de usuario.
- Si no se verifica adecuadamente qué datos se asignan y a qué campos, puede haber una vulnerabilidad de asignación masiva.

## Riesgos

- Las vulnerabilidades de asignación masiva pueden permitir a un atacante obtener acceso no autorizado o realizar acciones no deseadas.
- Por ejemplo, un atacante podría manipular una solicitud para incluir un campo adicional, como un "rol de administrador", y obtener privilegios no autorizados.

## Prevención

- Los desarrolladores deben implementar controles adecuados para evitar la asignación de datos no deseados a campos inapropiados.
- Se pueden utilizar técnicas como la validación de entrada y la lista blanca de campos permitidos para mitigar estas vulnerabilidades.

## Conclusión

- Las vulnerabilidades de asignación masiva pueden ser explotadas por atacantes para comprometer la seguridad de una aplicación.
- Es crucial que los desarrolladores implementen prácticas de seguridad sólidas para prevenir este tipo de vulnerabilidades.

---

*teoría portswigger*
## Identifying hidden parameters

Since mass assignment creates parameters from object fields, you can often identify these hidden parameters by manually examining objects returned by the API.

For example, consider a `PATCH /api/users/` request, which enables users to update their username and email, and includes the following JSON:

`{ "username": "wiener", "email": "wiener@example.com", }`

A concurrent `GET /api/users/123` request returns the following JSON:

`{ "id": 123, "name": "John Doe", "email": "john@example.com", "isAdmin": "false" }`

This may indicate that the hidden `id` and `isAdmin` parameters are bound to the internal user object, alongside the updated username and email parameters.

## Testing mass assignment vulnerabilities

To test whether you can modify the enumerated `isAdmin` parameter value, add it to the `PATCH` request:

`{ "username": "wiener", "email": "wiener@example.com", "isAdmin": false, }`

In addition, send a `PATCH` request with an invalid `isAdmin` parameter value:

`{ "username": "wiener", "email": "wiener@example.com", "isAdmin": "foo", }`

If the application behaves differently, this may suggest that the invalid value impacts the query logic, but the valid value doesn't. This may indicate that the parameter can be successfully updated by the user.

You can then send a `PATCH` request with the `isAdmin` parameter value set to `true`, to try and exploit the vulnerability:

`{ "username": "wiener", "email": "wiener@example.com", "isAdmin": true, }`

If the `isAdmin` value in the request is bound to the user object without adequate validation and sanitization, the user `wiener` may be incorrectly granted admin privileges. To determine whether this is the case, browse the application as `wiener` to see whether you can access admin functionality.