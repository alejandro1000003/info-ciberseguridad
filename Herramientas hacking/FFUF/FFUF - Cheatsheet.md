---
tags:
  - ffuf
  - cheatsheet
---

## Enumerar páginas y directorios

1.  **Páginas**
```sh
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt
```
*ffuz apis*
```sh
ffuf -s -u https://0ac100b103ffa1758028fdfb00640026.web-security-academy.net/a  
pi/FUZZ -w /usr/share/seclists/Discovery/Web-Content/api/api-endpoints.txt
```
2. **Directorios**
```
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt
```
3. Por **extensión de archivo**
```sh
ffuf -u http://10.10.142.27/indexFUZZ -w /usr/share/seclists/Discovery/Web-Content/web-extensions.txt
```
4. **Excluir** extensiones
```sh
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -e .php,.txt
```

## Filtros

ffuf -h (sección filtros)

1. Excluir por código de estado *-fc* (filter code)
```sh
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt -fc 404
```
2. Coincidir por código de estado *-mc* (match code)
```sh
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt -mc 200
```
3.  Por tamaño *-fs* (filter size)
```bash
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt -fs 200
```  
4. Por regex.

## Generar wordlists

```sh
# GENERAR UN FUZZ CON NÚMEROS DEL 1 AL 255
# - (representa el output del pipe (stdout))
for i in {0..255}; do echo $i; done | ffuf -u 'http://10.10.145.176/sqli-labs/Less-1/?id=FUZZ' -c -w - -fw 33

```

```sh
# Crear una wordlist para hacer fuerza bruta (método POST)
# -X (method)
# -d en ffuf especifica los datos del cuerpo de las solicitudes HTTP en POST o PUT
ffuf -u http://10.10.145.176/sqli-labs/Less-11/ -w /usr/share/seclists/Passwords/Leaked-Databases/hak5.txt -X POST -d 'uname=Dummy&passwd=FUZZ&submit=Submit' -fs 1435 -H 'Content-Type: application/x-www-form-urlencoded'
```

## Subdominios dns
```sh

# Ejecución 1
ffuf -u http://FUZZ.mydomain.com -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt

# Ejecución 2
ffuf -u http://mydomain.com -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -H 'Host: FUZZ.mydomain.com' -fs 0
```
```sh
# Algunos subdominios dns están en redes dns privadas por lo tanto no podrás acceder
# Por lo tanto
# - La primera ejecución **prueba directamente la existencia de "FUZZ" como subdominio** para cada dominio en la lista.

# - La segunda ejecución **simula la creación de un subdominio "FUZZ"** para cada dominio y verifica si el servidor web lo reconoce.
# Si deseas **encontrar subdominios configurados en el servidor web, incluso si no son subdominios oficiales con el nombre "FUZZ"**, la segunda ejecución con el encabezado `Host` es más efectiva.
```

## Usuarios y contraseñas

1. Para buscar usuarios de una página web a través del formulario de registro del sitio web, con método post y mensaje de error "username already exists" con los parámetros post adecuados
```sh
# -H : añade un header adicional, aquí estamos específicando que enviemos un formulario
ffuf -w /usr/share/wordlists/seclists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.28.78/customers/signup -mr "username already exists"
```
2. Brute force un login mediante wordlist de usuarios
```sh
ffuf -w valid_usernames.txt:W1,/usr/share/wordlists/SecLists/Passwords/Common-Credentials/10-million-password-list-top-100.txt:W2 -X POST -d "username=W1&password=W2" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.28.78/customers/login -fc 200
```
## Proxy

Whether it's for [network pivoting](https://blog.raw.pm/en/state-of-the-art-of-network-pivoting-in-2019/) or for using BurpSuite plugins you can send all the ffuf traffic through a web proxy (HTTP or SOCKS5).  

`$ ffuf -u http://10.10.145.176/FUZZ -c -w /usr/share/seclists/Discovery/Web-Content/common.txt -x http://127.0.0.1:8080`

It's also possible to send only matches to your proxy for replaying:

`$ ffuf -u http://10.10.145.176/FUZZ -c -w /usr/share/seclists/Discovery/Web-Content/common.txt -replay-proxy http://127.0.0.1:8080`

This may be useful if you don't need all the traffic to traverse an upstream proxy and want to minimize resource usage or to avoid polluting your proxy history.

## Interfaz (OPCIONAL)

1. Puedes cualquier palabra especial, ejemplo con *ç*
```sh
ffuf -u http://10.10.142.27/ç -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt:ç
```
2. Ignorar comentarios
```sh
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/ejemplo.txt -ic
```
3. Te pone colores en las líneas por código de status
```sh
ffuf -u http://10.10.142.27/FUZZ -w /usr/share/ejemplo.txt -c
```