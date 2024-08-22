**Definición:**

- Es una vulnerabilidad en la que un atacante puede hacer que el servidor realice solicitudes HTTP arbitrarias.

**Principales Características:**

1. **Origen en el servidor:** A diferencia de otras vulnerabilidades, como XSS (Cross-Site Scripting), donde el ataque se origina desde el navegador del cliente, SSRF se inicia desde el servidor vulnerable.
2. **Manipulación de solicitudes:** El atacante puede manipular las solicitudes HTTP realizadas por la aplicación vulnerable para acceder a recursos que normalmente no estarían disponibles.
3. **Posibles impactos:** SSRF puede tener varios impactos, incluida la extracción de datos sensibles, el escaneo de la red interna, el acceso a servicios de la nube, entre otros.

**Escenarios Comunes:**

1. **Acceso a recursos internos:** Un atacante podría utilizar SSRF para acceder a recursos internos de la red, como bases de datos, sistemas de archivos o servicios de administración.
2. **Escaneo de la red:** Mediante el uso de direcciones IP internas, un atacante puede intentar escanear la red interna para identificar otros sistemas y servicios disponibles.
3. **Acceso a servicios en la nube:** SSRF también puede ser utilizado para acceder a servicios de la nube (por ejemplo, almacenamiento en la nube, bases de datos en la nube) que están configurados para permitir solicitudes desde la red interna.

**Mitigación y Prevención:**

1. **Validación de URL:** Validar y filtrar cuidadosamente las URL proporcionadas por los usuarios para garantizar que solo se permita acceder a recursos permitidos.
2. **Limitar permisos:** Reducir los permisos y la funcionalidad de la aplicación para limitar el alcance de posibles ataques SSRF.
3. **Firewalls y reglas de red:** Implementar firewalls y configurar reglas de red para limitar el acceso a recursos internos desde el servidor.
4. **Monitoreo y registro:** Implementar mecanismos de monitoreo y registro para detectar y registrar intentos de SSRF, lo que facilita la identificación y mitigación de posibles ataques.

**Ejemplo:** Supongamos que una aplicación web tiene una función de "previsualización de URL" que permite a los usuarios ingresar una URL para obtener una vista previa del contenido. Si esta función no valida adecuadamente las URL proporcionadas por los usuarios, un atacante podría explotar esta vulnerabilidad para acceder a recursos internos, como archivos del sistema o servicios de administración.

Why do applications behave in this way, and implicitly trust requests that come from the local machine? This can arise for various reasons:

- The access control check might be implemented in a different component that sits in front of the application server. When a connection is made back to the server, the check is bypassed.
- For disaster recovery purposes, the application might allow administrative access without logging in, to any user coming from the local machine. This provides a way for an administrator to recover the system if they lose their credentials. This assumes that only a fully trusted user would come directly from the server.
- The administrative interface might listen on a different port number to the main application, and might not be reachable directly by users.