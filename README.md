# Examen de Docker
Examen que cubre los temas de Docker del módulo 3.4 "Ciberseguridad en la nube e IoT" del Diplomado en Ciberseguridad de la FI, UNAM.

## ¿Cómo obtener la imagen del contenedor? (Ejecutar con `sudo` si el usuario en uso no pertenece al grupo `docker`)
~~~bash
docker image pull mandovg/dipciber-docker:1.1
~~~

![image](https://user-images.githubusercontent.com/31267678/215366540-38c1dd78-c439-4c5f-9ec8-95249aabd765.png)

## ¿Cómo obtener el ID de la imagen obtenida?
~~~bash
docker images
~~~

![image](https://user-images.githubusercontent.com/31267678/215366937-21786997-dd8d-4e65-b17f-449d97a7114e.png)

## ¿Cómo ejecutar el contenedor?
~~~bash
docker run -p 8000:80 -p 2222:22 <imagen>
~~~

![image](https://user-images.githubusercontent.com/31267678/215366888-1e8f5842-0de8-48f5-871a-8bf560d4bdb6.png)

## ¿Cómo comprobar que funciona el contenedor?

### 1. Visitando el sitio web desde un navegador web

Ingresar la URL `http://localhost:8000`
![image](https://user-images.githubusercontent.com/31267678/215367069-4a5a4580-d4f4-4840-9a7d-1eba9c0f8c6e.png)

### 2. Mediante el comando `curl` desde una terminal:
~~~bash
curl localhost:8000
~~~

![image](https://user-images.githubusercontent.com/31267678/215367260-8c3ceaa8-cd00-4da4-8c91-c9379bc93995.png)

### 3. Comprobando la conexión hacia el servidor SSH

Para lograr la conexión, se usa el archivo `id_rsa.key` encontrado en el directorio `public_key` de este repositorio.

~~~bash
ssh -p 2222 -i ./public_key/id_rsa.key newuser@localhost
~~~

![image](https://user-images.githubusercontent.com/31267678/215367315-3534e715-78c3-42eb-898c-e538ea5ea482.png)

## Archivos
+ Dockerfile
    + Archivo necesario para la construcción de la imagen del contenedor
+ README.md 
    + Documentación 
+ /public_key/id_rsa.key
    + Llave privada para iniciar sesión como el usuario `newuser`
+ /public_key/pubkey.pub
    + Llave pública del host que se guarda en el servidor
