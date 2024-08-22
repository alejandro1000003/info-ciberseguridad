
Directory Traversal, también conocida como Path Traversal, es una vulnerabilidad de seguridad que permite a un atacante acceder y leer archivos fuera del directorio web raíz, aprovechando la falta de validación adecuada en las entradas del usuario.
#### Ejemplo:

Si una aplicación web permite a los usuarios acceder a archivos mediante una URL como `https://example.com/files?filename=archivo.txt`, un atacante podría manipular el parámetro `filename` para intentar acceder a archivos fuera del directorio especificado, por ejemplo, `https://example.com/files?filename=../../etc/passwd`.

#### Ejemplos de rutas vulnerables

| **Location**                | **Description**                                                                                                                                                                       |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| /etc/issue                  | contains a message or system identification to be printed before the login prompt.                                                                                                    |
| /etc/profile                | controls system-wide default variables, such as Export variables, File creation mask (umask), Terminal types, Mail messages to indicate when new mail has arrived                     |
| /proc/version               | specifies the version of the Linux kernel                                                                                                                                             |
| /etc/passwd                 | has all registered user that has access to a system                                                                                                                                   |
| /etc/shadow                 | contains information about the system's users' passwords                                                                                                                              |
| /root/.bash_history         | contains the history commands for root user                                                                                                                                           |
| /var/log/dmessage           | contains global system messages, including the messages that are logged during system startup                                                                                         |
| /var/mail/root              | all emails for root user                                                                                                                                                              |
| /root/.ssh/id_rsa           | Private SSH keys for a root or any known valid user on the server                                                                                                                     |
| /var/log/apache2/access.log | the accessed requests for Apache  webserver                                                                                                                                           |
| C:\boot.ini                 | contains the boot options for computers with BIOS firmware                                                                                                                            |
| /proc/sched_debug           | contiene los procesos que están corriendo en el sistema                                                                                                                               |
| /proc/net/fib_trie          | contiene ip's de la máquina (curl -s 'http://localhost/example.php?file=/proc/net/fib_trie' \| grep -i "host local" -B 1 \| grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' \| sort -u) |
| /proc/net/tcp               | ver puertos internos de la máquina                                                                                                                                                    |


