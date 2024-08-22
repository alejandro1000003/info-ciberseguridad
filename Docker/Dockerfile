FROM ubuntu:latest

# Actualizar el sistema e instalar las dependencias necesarias
RUN apt-get update && \
    apt-get install -y python2.7

# Establecer python2.7 como el intérprete predeterminado
RUN ln -s /usr/bin/python2.7 /usr/bin/python

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar tu script de Python al contenedor
COPY tu_script.py /app

# Ejecutar el script cuando se inicie el contenedor
CMD ["python", "tu_script.py"]

