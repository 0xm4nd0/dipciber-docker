# Imagen de SO base
FROM ubuntu

# Se instalan los paquetes a utilizar
RUN apt-get update && apt-get install -y \
apache2 \
systemctl \
net-tools \
openssh-server

# Se crea un nuevo usuario para el servicio
RUN useradd -ms /bin/bash newuser

# Se crea un directorio donde se almacenarán las llaves SSH
RUN mkdir -p /home/newuser/.ssh

# Se copia la llave pública en el archivo "authorized_keys"
COPY public_key/pubkey.pub /home/newuser/.ssh/authorized_keys

# Asignamos los privilegios necesarios
RUN chmod 600 /home/newuser/.ssh/authorized_keys && chown -R newuser:newuser /home/newuser/

# Se corrige el error "Missing privilege separation directory"
RUN mkdir /var/run/sshd

# Se copian todos los elementos necesarios para el sitio web
ADD ./dockerhtml /var/www/html/

# Se exponen los puertos donde se levantan los servicios
EXPOSE 80 22

## Se inician los servicios de SSH y Apache
ENTRYPOINT service ssh start && apachectl -D FOREGROUND