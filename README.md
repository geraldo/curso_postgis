# Curso de introducción a PostgreSQL y PostGIS

Introducción a PostgreSQL y PostGIS, configuración y gestión básica.

Material de curso utilizado con permiso de [Carlos López](https://github.com/psigcat/curso_postgis_1_intro)

## Requerimientos software

Hay que tener instalado PostgreSQL, PostGIS, pgAdmin 4 y QGIS Desktop.

### Windows

Tutorial como instalar postgreSQL y PostGIS en Windows https://youtu.be/_EgtELrjLO4

Los pasos mśa importantes están en estas [capturas de pantalla](https://github.com/geraldo/curso_postgis/tree/main/capturas).

### Linux

Protoclo de instalación y configuración en Linux: [Enlace Github](https://github.com/carlospsig/protocol_install_qgis_ubuntu/blob/master/install_postgis.sh)

### PostgreSQL Service connection file

[Enlace pg_service.conf](https://docs.qgis.org/3.44/en/docs/user_manual/managing_data_source/opening_data.html)

## Pasos a instalación día 1

1. Instalar PostgreSQL 18

2. Instalar PostGIS 3

3. Instalar pgAdmin4 9

4. Abrir pgAdmin con la configuración inicial

```
host=localhost
port=5432
dbname=postgres
user=postgres
password=postgres
```

5. Crear una nueva base de datos llamada `gis_curso`

A futuro, les recomiendo utilizar otra base de dadtos como plantilla (template) la base de datos "postgres" (pe)

6. Activar la extensión de PostGIS

Ejecutar la sintaxi siguiente en una "Query Tool"

`create extension postgis;`

podemos compartir el código en esta web: https://codeshare.io/curso_postgis

7. Crear un nuevo usuario gisadmin

Ejecutar la sintaxi siguiente en una "Query Tool", antes de ejecutarlo reemplazar el texto 'your_password' por un password vuestro personal y guardarlo en agún sitio seguro como keepass

`CREATE ROLE gisadmin login PASSWORD 'your_password' SUPERUSER CREATEDB CREATEROLE NOINHERIT;`

8. Definir pg_service.conf

```
host=localhost
port=5432
dbname=gis_curso
user=gisadmin
password=your_password
```

9. Abrir QGIS con el usuario gisadmin (vídeo a partir del minuto 20)

Crear un nueva conexión con el usuario `gisadmin` y guardar la conexión.

10. Montar proyecto QGIS

Importamos 3 capas municipis, comarques y PEIN desde los Geopackage que hay en la carpeta [datos](https://github.com/geraldo/curso_postgis/tree/main/datos).

11. Crear conexción a base de datos gis_curso desde Administrador de fuentes de datos

12. Utilizar el DB Manager para importar datos a PostgreSQL

a. Abrimos el complemento DB Manager
b. Creamos nuevos esquemas
    - limit_admin
    - medi_ambient
c. Importar capa/archivo

13. Cargar capa desde base de datos haciendo doble click en DB Manager

## Notas

Otros vídeos tutoriales en este canal: http://www.youtube.com/c/CarlosLópezQuintanilla

Gracias a [Carlos López](carlos.lopez@psig.es) por el material.

Colabora con QGIS, hazte socio! www.qgis.es