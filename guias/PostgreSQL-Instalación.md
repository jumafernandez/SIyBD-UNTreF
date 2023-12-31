# Guía de Instalación de PostgreSQL + pgAdmin

PostgreSQL es un sistema de gestión de bases de datos relacional (RDBMS, por sus siglas en inglés) de código abierto y de alto rendimiento. Fue desarrollado originalmente en la Universidad de California en Berkeley a principios de la década de 1990 y ha ido ganando popularidad desde entonces.

<p align="center">
<img src="./imgs/postgresql-logo.png" width="150px" />
</p>

A continuación se enumeran algunas de las principales características de PostgreSQL:
1. __Open Source:__ Es software libre, lo cual significa que su código fuente está disponible para que cualquiera lo examine, modifique y distribuya de acuerdo con los términos de su licencia (Licencia PostgreSQL, que es similar a la Licencia MIT).
2. __Bases de datos relacionales:__ Está dentro de las DB que siguen el modelo de bases de datos relacionales, lo que significa que organiza los datos en tablas con relaciones definidas entre ellas.
3. __Extensibilidad:__ Es altamente extensible y permite a los desarrolladores crear sus propias funciones, tipos de datos y lenguajes de programación para extender su funcionalidad.
4. __Transacciones y ACID:__ Garantiza la integridad de los datos mediante el soporte de transacciones ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad), lo que significa que las operaciones de base de datos se ejecutan de manera segura y confiable.
5. __Escalabilidad:__ Es conocido por su capacidad para manejar grandes cantidades de datos y cargas de trabajo intensivas. Se puede configurar para escalar horizontal o verticalmente según las necesidades de rendimiento.
6. __Compatibilidad con múltiples plataformas:__ Es compatible con todas las familias de sistemas operativos tales cómo Linux, Windows, macOS y más. Además, cuenta con numerosas bibliotecas y controladores que facilitan la integración con una variedad de lenguajes de programación y aplicaciones.

## Instalación paso a paso de PostgreSQL + pgAdmin

<p align="center">
<img src="./imgs/pgadmin-logo.png" width="350px" />
</p>


### Sistemas Operativos Windows:
1. La instalación de PostgreSQL en SO Windows es una instalación muy sencilla. En primer lugar, se debe acceder al Sitio Web Oficial de PostgreSQL en https://www.postgresql.org/download/windows/.

<p align="center">
<img src="./imgs/postgresql-1.png" width="350px" />
</p>

2. En la página de descargas, se debe seleccionar la versión de PostgreSQL que se desea instalar **(se recomienda la versión 15.4 o anterior por algunos problemas de compatibilidad encontrados en la versión 16)**. Una vez elegida, hacer clic en el enlace correspondiente para descargar el instalador de Windows.

<p align="center">
<img src="./imgs/postgresql-2.png" width="350px" />
</p>

3. Una vez que se haya completado la descarga, se debe ejecutar el archivo de instalación descargado. En ese momento aparecerá un asistente de instalación. Haz clic en "Siguiente" para continuar.
4. En la pantalla siguiente pueden escogerse los componentes adicionales que se pueden instalar, aquí optaremos seleccionar **pgAdmin** también.

<p align="center">
<img src="./imgs/postgresql-pgAdmin-install.png" width="350px" />
</p>

5. A continuación se debe seleccionar la ubicación donde se desea instalar PostgreSQL (la ubicación predeterminada es adecuada para la mayoría de los casos). Luego, haz clic en "Siguiente".
6. En la siguiente pantalla, se deben seleccionar los componentes que deseas instalar. A menos que tengas conocimientos o necesidades específicos, se recomienda dejar las opciones predeterminadas seleccionadas. Haz clic en "Siguiente".
7. Luego, se elegirá el directorio donde se almacenarán los datos que se generan a partir de la gestión de las Bases de Datos. A menos que tengas conocimientos o necesidades específicos, se recomienda dejar las opciones predeterminadas seleccionadas. Haz clic en "Siguiente".
8. A continuación, se debe establecer una contraseña para el usuario "postgres", que es el superusuario de PostgreSQL. Asegúrate de recordar esta contraseña, ya que la necesitarás más adelante.
9. En la siguiente pantalla, elige el puerto en el que PostgreSQL escuchará las conexiones. El valor predeterminado es 5432, pero puedes cambiarlo si lo deseas aunque es recomendable dejar el puerto por defecto en la mayoría de los casos.
10. En la siguiente pantalla, puedes elegir el idioma y la contribución regional para la instalación. Deja las opciones predeterminadas a menos que necesites configurarlas de manera diferente.
11. El asistente de instalación mostrará un resumen de las configuraciones que has seleccionado. Revisa la información y, si todo parece correcto, haz clic en "Siguiente" para comenzar la instalación. El instalador copiará los archivos y configurará PostgreSQL. Este proceso puede llevar varios minutos.
12. Una vez que la instalación se complete con éxito, verás una pantalla que indica que la instalación fue exitosa. Haz clic en "Finalizar" para cerrar el instalador.
13. Para verificar que PostgreSQL se ha instalado correctamente, es posible abrir la consola de comandos (cmd) y ejecutar el siguiente comando para acceder a la consola de comandos de PostgreSQL (psql):
```
psql -U postgres
```
14. La respuesta debería ser la solicitud de ingreso de la contraseña que configuraste para el usuario "postgres". Después de ingresarla correctamente, deberías poder acceder a la línea de comandos de PostgreSQL.

### Sistemas operativos Linux (Ubuntu):
1. Desde hace un tiempo, Ubuntu incluye una versión de PostgreSQL en su instalación por defecto. No obstante se brindan las instrucciones para su instalación.
2. En primer lugar, es necesario abrir una terminal y ejecutar el siguiente comando para instalar PostgreSQL y el paquete adicional `postgresql-contrib`, que incluye extensiones útiles:
```
sudo apt install postgresql postgresql-contrib
```
3. Durante la instalación, el instalador solicitará una contraseña para el usuario "postgres". Esta contraseña se utilizará para acceder a la base de datos. Ingresa una contraseña segura y recuérdala.
4. Ahora es posible acceder a la línea de comandos de PostgreSQL (psql) con el usuario "postgres" que se creó durante la instalación. Utiliza el siguiente comando para acceder:
```
sudo -i -u postgres
```
5. Luego, puedes usar el cliente PostgreSQL interactivo con el comando:
```
psql
```
6. Una vez terminadas las tareas con PostgreSQL, no olvide salir de psql y del usuario postgresql con los comandos `\q` y `exit` respectivamente.
7. Luego, para instalar pgAdmin, es necesario volver a abrir una consola y escribir el siguiente comando:
```
sudo apt install pgadmin4
```
8. Ahora si, hemos terminado.
