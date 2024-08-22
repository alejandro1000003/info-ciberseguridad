
```sh

# CONFIGURACIÓN INICIAL

# Mostrar y establecer configuración básica.
git --version 
git config --global user.name "Alejandro. C"
git config --global user.email alejandro1000003@gmail.com

# Esta línea de código indica a git que VSCode es nuestro editor por defecto, la opción de --wait es para que la terminal se quede esperando hasta que nosotros cerremos nuestro editor de texto.
git config --global core.editor "code --wait"

# Tambien para editar el archivo de configuración global
git config --global -e 

# configuración cambiar saltos de línea 

# windows:
# git config --global -core.autocrlf true 

# linux:
git config --global -core.autocrlf input 

# mostrar configuraciónes de git
git config -h


# INICIALIZAR REPOSITORIO Y AÑADIR ARCHIVOS AL STAGING AREA


git init
# entrar en la carpeta oculta donde git maneja todos los archivos de los repositorios, commits y demás
# cd ".git";
# ls
# cd ".."

# Se utiliza para mostrar el estado actual de nuestro repositorio, muestra archivos editados y con o sin seguimiento
git status
# Añadir archivo al staging area
git add repositorio_prueba
# 1. añade todos los archivos de la carpeta actual (mala práctica)
# git add .
# 2. añade todos los archivos con la extension .txt
# git add *.txt
# 3. añadea todos los archivos dentro de una carpeta
# git add repositorio_prueba/*

# 3 / una vez añadidos los archivos al staging area realizaremos una modificacion:
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git/repositorio_prueba$ git status

Cambios a ser confirmados:
  (usa "git rm --cached <archivo>..." para sacar del área de stage)
	nuevo archivo:  repositorio_prueba/archivo.txt
	nuevo archivo:  repositorio_prueba/archivo2.txt

Cambios no rastreados para el commit:
  (usa "git add <archivo>..." para actualizar lo que será confirmado)
  (usa "git restore <archivo>..." para descartar los cambios en el directorio de trabajo)
	modificado:     repositorio_prueba/archivo2.txt

Cambios a ser confirmados:
    (usa "git rm --cached <archivo>..." para sacar del área de stage)
    nuevo archivo:  repositorio_prueba/archivo.txt
    nuevo archivo:  repositorio_prueba/archivo2.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"comandos_b\303\241sicos.sh"
	etapas_git.png

    '
# para agregar los cambios modificados al stage area añadiremos de nuevo el archivo
git add repositorio_prueba/*
# luego git status para ver los resultados:
: 'Cambios a ser confirmados:
  (usa "git rm --cached <archivo>..." para sacar del área de stage)
	nuevo archivo:  repositorio_prueba/archivo.txt
	nuevo archivo:  repositorio_prueba/archivo2.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"comandos_b\303\241sicos.sh"
	etapas_git.png'

# GUARDAR EN EL REPOSITORIO LOCAL ( COMMIT ) por último vamos a comprometer nuestro trabajo con commit, (almacenarlo en el repositorio local) 
git commit -m "Commit inicial"

# ahora hacemos un status para ver como los cambios y los archivos se han añadido al repositorio local
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git status
En la rama master
Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"comandos_b\303\241sicos.sh"
	etapas_git.png

no hay nada agregado al commit pero hay archivos sin seguimiento presentes (usa "git add" para hacerles seguimiento)'

# ELIMINAR ARCHIVOS DEL REPOSITORIO
rm repositorio_prueba/archivo2.txt
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git status
En la rama master
Cambios no rastreados para el commit:
  (usa "git add/rm <archivo>..." para actualizar a lo que se le va a hacer commit)
  (usa "git restore <archivo>..." para descartar los cambios en el directorio de trabajo)
	borrado:        repositorio_prueba/archivo2.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"comandos_b\303\241sicos.sh"
	etapas_git.png
    '
# para hacer saber al staging area que un archivo fué eliminado tendremos que agregar el archivo eliminado al stage area
git add repositorio_prueba/archivo2.txt

# Resultado:
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git add repositorio_prueba/archivo2.txt
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git status
En la rama master
Cambios a ser confirmados:
  (usa "git restore --staged <archivo>..." para sacar del área de stage)
	borrado:        repositorio_prueba/archivo2.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"comandos_b\303\241sicos.sh"
	etapas_git.png
'
# luego guardamos los cambios ( eliminación de archivo ) en el repositorio local
git commit -m "eliminando archivo2.txt"

# RENOMBRAR ARCHIVOS EN GIT
:'
alejandro@alejandro-H110M-S2H:~/Documentos/Git/repositorio_prueba$ mv archivo.txt ./archivo_renombrado.txt 
alejandro@alejandro-H110M-S2H:~/Documentos/Git/repositorio_prueba$ ls
archivo_renombrado.txt

'
git status
# comprobamos lo que ha sucedido con git status, y nos dice que se ha eliminado el archivo.txt y se ha encontrado uno nuevo (archivo renombrado) que no tiene seguimiento
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git/repositorio_prueba$ git status
En la rama master
Cambios no rastreados para el commit:
  (usa "git add/rm <archivo>..." para actualizar a lo que se le va a hacer commit)
  (usa "git restore <archivo>..." para descartar los cambios en el directorio de trabajo)
	borrado:        archivo.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"../comandos_b\303\241sicos.sh"
	../etapas_git.png
	archivo_renombrado.txt

sin cambios agregados al commit (usa "git add" y/o "git commit -a")'

# entonces tendremos que añadir el archivo eliminado... y añadir el archivo_renombrado para hacer el seguimiento
git add archivo.txt archivo_renombrado.txt
# resultado:
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git/repositorio_prueba$ git status
En la rama master
Cambios a ser confirmados:
  (usa "git restore --staged <archivo>..." para sacar del área de stage)
	renombrado:     archivo.txt -> archivo_renombrado.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"../comandos_b\303\241sicos.sh"
	../etapas_git.png

'
# por último guardamos cambios en el repositorio local
git commit -m "archivo renombrado"

# IGNORAR ARCHIVOS PARA QUE NUNCA SEAN INCLUIDOS EN NUESTRO REPOSITORIO DE GIT
: '
alejandro@alejandro-H110M-S2H:~/Documentos/Git/repositorio_prueba$ git status
En la rama master
Cambios a ser confirmados:
  (usa "git restore --staged <archivo>..." para sacar del área de stage)
	renombrado:     archivo.txt -> archivo_renombrado.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	"../comandos_b\303\241sicos.sh"
	../etapas_git.png
'
:' 

para ignorar archivos tendré que crear un archivo llamado .gitignore en el mismo directorio que la carpeta ./git. Luego simplemente tendremos que añadir su nombre o el nombre de las carpetas que deseemos ignorar dentro del archivo gitignore:

(.gitignore)

comandos_básicos.sh
etapas_git.png
carpeta_ejemplo/

'
# resultado:

:'
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git status
En la rama master
Cambios a ser confirmados:
  (usa "git restore --staged <archivo>..." para sacar del área de stage)
	renombrado:     repositorio_prueba/archivo.txt -> repositorio_prueba/archivo_renombrado.txt

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que se será confirmado)
	.gitignore
'
# por ultimo añadimos el archivo gitignire al repositorio
git add .gitignore
git commit -m "agregando archivo gitignore"

# MOSTRAR CAMBIOS REALIZADOS EN UN DETERMINADO ARCHIVO

# para hacer esto es importante no hacer un commit! simplemente hacemos una modificacion y ya podemos comparar lo que ha sido modificado...
# modifación de archivo... añadido letras al documento
git diff
# resultado:
:'
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git diff
diff --git a/repositorio_prueba/archivo_renombrado.txt b/repositorio_prueba/archivo_renombrado.txt
index d71a08c..2c3f14f 100644
--- a/repositorio_prueba/archivo_renombrado.txt
+++ b/repositorio_prueba/archivo_renombrado.txt
@@ -1,3 +1,4 @@
 chanchito feliz
 chancho ultra feliz
-chancho chancho pancho
\ No newline at end of file
+chancho chancho pancho
+ultimamodificacion
'
# ahora lo añadimos al stage area:
git add repositorio_prueba/*
# por último comprobamos los cambios:
:' ( no ha realizado nada el git diff)
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git diff
alejandro@alejandro-H110M-S2H:~/Documentos/Git$ 
'
# para mirar los cambios que han sido subidos al area de stage haremos 
git diff --staged
: 'alejandro@alejandro-H110M-S2H:~/Documentos/Git$ git diff --staged
diff --git a/repositorio_prueba/archivo_renombrado.txt b/repositorio_prueba/archivo_renombrado.txt
index d71a08c..2c3f14f 100644
--- a/repositorio_prueba/archivo_renombrado.txt
+++ b/repositorio_prueba/archivo_renombrado.txt
@@ -1,3 +1,4 @@
 chanchito feliz
 chancho ultra feliz
-chancho chancho pancho
\ No newline at end of file
+chancho chancho pancho
+ultimamodificacion
'
# DESCARTAR CAMBIO, VOLVER A COMO ESTABA EL ARCHIVO
# primero tendremos que descartar los cambios del staging area ( lo contrario que hacer add file.txt)
git restore --staged repositorio_prueba/archivo_renombrado.txt
# por último git restaurarlo al anterior commit
repositorio_prueba/archivo_renombrado.txt


# HISTORIAL DE COMMITS EN UN ARCHIVO
git log
# con el parámetro online mostraremos lo mismo pero resumido y con el identificador de cada commit
git log --oneline

# CREAR RAMAS EN GIT

# mostrar rama actual
git branch

# crear rama nueva
git checkout -b rama_nueva

# cambiar de rama
git checkout master

# combinar modificaciones de ramas, desde la rama principal combinamos la rama_b
git merge ramab
```