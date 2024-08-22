### Utilizando eCryptfs para cifrar un directorio

1. **Instalación**:
```bash
sudo apt-get install ecryptfs-utils  # Instala eCryptfs en distribuciones basadas en Debian/Ubuntu
```

2. **Configuración**:
```bash
mkdir -p ~/Documentos/Privado
sudo mount -t ecryptfs ~/Documentos/Privado ~/Documentos/Privado
```
- Crea un directorio `Privado` dentro de `Documentos` y lo monta como un directorio cifrado utilizando eCryptfs.


3. **Uso**:
- Coloca y accede a tus archivos dentro de `~/Documentos/Privado`. Todo se cifra automáticamente en este directorio.

4. **Desmontar**:
```bash
sudo umount ~/Documentos/Privado
```
- Desmonta el directorio cifrado cuando hayas terminado de usarlo para proteger tus datos.

### Notas adicionales

- eCryptfs es ideal para cifrar directorios individuales de forma conveniente en Linux.
- Asegúrate de utilizar contraseñas fuertes y realizar copias de seguridad de tus datos cifrados para mayor seguridad.