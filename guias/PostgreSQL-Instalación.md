# Guía de Instalación de PostgreSQL + pgAdmin + PostGIS

PostgreSQL es un sistema de gestión de bases de datos relacional (RDBMS, por sus siglas en inglés) de código abierto y de alto rendimiento. Fue desarrollado originalmente en la Universidad de California en Berkeley a principios de la década de 1990 y ha ido ganando popularidad desde entonces.

A continuación se enumeran algunas de las principales características de PostgreSQL:
1. __Open Source:__ Es software libre, lo cual significa que su código fuente está disponible para que cualquiera lo examine, modifique y distribuya de acuerdo con los términos de su licencia (Licencia PostgreSQL, que es similar a la Licencia MIT).
2. __Bases de datos relacionales:__ Está dentro de las DB que siguen el modelo de bases de datos relacionales, lo que significa que organiza los datos en tablas con relaciones definidas entre ellas.
3. __Extensibilidad:__ Es altamente extensible y permite a los desarrolladores crear sus propias funciones, tipos de datos y lenguajes de programación para extender su funcionalidad.
4. __Transacciones y ACID:__ Garantiza la integridad de los datos mediante el soporte de transacciones ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad), lo que significa que las operaciones de base de datos se ejecutan de manera segura y confiable.
5. __Escalabilidad:__ Es conocido por su capacidad para manejar grandes cantidades de datos y cargas de trabajo intensivas. Se puede configurar para escalar horizontal o verticalmente según las necesidades de rendimiento.
6. __Compatibilidad con múltiples plataformas:__ Es compatible con todas las familias de sistemas operativos tales cómo Linux, Windows, macOS y más. Además, cuenta con numerosas bibliotecas y controladores que facilitan la integración con una variedad de lenguajes de programación y aplicaciones.

## Instalación paso a paso de PostgreSQL (Windows):
1. La instalación de PostgreSQL en SO Windows es una instalación muy sencilla. En primer lugar, se debe descargar PostgreSQL desde el siguiente [enlace]([https://github.com/bdm-unlu/2021/blob/master/guias/Java_configuracion.md](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads).
2. Una vez descargado, se debe hacer doble click sobre el archivo ejecutable, definir un puerto de escucha del servidor (se sugiere dejar el puerto por defecto: 5432) y una clave para el usuario postgres (usuario con mayores privilegios). Es importante no olvidar esa clave.
3. Presionar siguiente y esperar a que finalice la instalación.

## Instalación paso a paso de PostgreSQL (Linux):
1. La instalación de PostgreSQL en SO Windows es una instalación muy sencilla. En primer lugar, se debe descargar PostgreSQL desde el siguiente [enlace]([https://github.com/bdm-unlu/2021/blob/master/guias/Java_configuracion.md](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads).
2. Una vez descargado, se debe hacer doble click sobre el archivo ejecutable, definir un puerto de escucha del servidor (se sugiere dejar el puerto por defecto: 5432) y una clave para el usuario postgres (usuario con mayores privilegios). Es importante no olvidar esa clave.
3. Presionar siguiente y esperar a que finalice la instalación.

1. La instalación de PostgreSQL en SO Windows es una instalación muy sencilla. En primer lugar, se debe acceder al Sitio Web Oficial de PostgreSQL en https://www.postgresql.org/download/windows/.
2. En la página de descargas, se debe seleccionar la versión de PostgreSQL que se desea instalar. Generalmente, se recomienda la última versión estable. Una vez elegida, hacer clic en el enlace correspondiente para descargar el instalador de Windows.
3. Una vez que se haya completado la descarga, ejecuta el archivo de instalación descargado.
4. Aparecerá un asistente de instalación. Haz clic en "Next" (Siguiente) para continuar.
5. A continuación se debe seleccionar la ubicación donde se desea instalar PostgreSQL (la ubicación predeterminada es adecuada para la mayoría de los casos). Luego, haz clic en "Next" (Siguiente).
6. En la siguiente pantalla, se deben seleccionar los componentes que deseas instalar. A menos que tengas conocimientos o necesidades específicos, se recomienda dejar las opciones predeterminadas seleccionadas. Haz clic en "Next" (Siguiente).
7. Elige la carpeta donde se almacenarán los datos de PostgreSQL. La carpeta predeterminada es adecuada para la mayoría de los casos. Haz clic en "Next" (Siguiente).
8. A continuación, se debe establecer una contraseña para el usuario "postgres", que es el superusuario de PostgreSQL. Asegúrate de recordar esta contraseña, ya que la necesitarás más adelante. Haz clic en "Next" (Siguiente).
9. En la siguiente pantalla, elige el puerto en el que PostgreSQL escuchará las conexiones. El valor predeterminado es 5432, pero puedes cambiarlo si lo deseas aunque es recomendable dejar el puerto por defecto en la mayoría de los casos. Haz clic en "Next" (Siguiente).
10. En la siguiente pantalla, puedes elegir el idioma y la contribución regional para la instalación. Deja las opciones predeterminadas a menos que necesites configurarlas de manera diferente. Haz clic en "Next" (Siguiente).
11. A continuación, selecciona los ajustes de inicio. Por lo general, es mejor dejar las opciones predeterminadas, que permiten que PostgreSQL se inicie automáticamente con Windows. Haz clic en "Next" (Siguiente).
12. El asistente de instalación mostrará un resumen de las configuraciones que has seleccionado. Revisa la información y, si todo parece correcto, haz clic en "Next" (Siguiente) para comenzar la instalación.
13. El instalador copiará los archivos y configurará PostgreSQL. Este proceso puede llevar varios minutos.
14. Una vez que la instalación se complete con éxito, verás una pantalla que indica que la instalación fue exitosa. Haz clic en "Finish" (Finalizar) para cerrar el instalador.
15. Para verificar que PostgreSQL se ha instalado correctamente, es posible abrir la consola de comandos (cmd) y ejecutar el siguiente comando para acceder a la consola de comandos de PostgreSQL (psql):
```
psql -U postgres
```
16. La respuesta debería ser la solicitud de ingreso de la contraseña que configuraste para el usuario "postgres". Después de ingresarla correctamente, deberías poder acceder a la línea de comandos de PostgreSQL.

## Instalación paso a paso de pgAdmin:


## Instalación paso a paso de PostGIS:

