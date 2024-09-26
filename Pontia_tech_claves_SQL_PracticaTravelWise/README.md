## 🌍 Travel Wise - SQL Queries

Al haber participado de una masterclass sobre *Claves del SQL* realice una serie de ejercicios practicos que se encuentran en 'Travel_wise.sql'.
Este archivo SQL contiene una serie de consultas y operaciones basicas que se pueden realizar en una base de datos relacional.
El script esta diseñado para gestionar una base de datos llamada **agencia**, que almacena información sobre clientes y sus viajes. 
A continuación, se detalla la estructura del script y las operaciones que realiza:

### 📂 Estructura del Script:

1. **💬 Comentarios**: El código incluye como realizar comentarios ya sea de una sola linea como de multiples lineas para describir cada bloque de código.

2. **🏗️ Creación de la Base de Datos**: 
   - Si la base de datos `agencia` ya existe, se elimina utilizando `DROP DATABASE IF EXISTS`.
   - Posteriormente, se crea la base de datos con `CREATE DATABASE` y se selecciona con `USE agencia`.

3. **📊 Creación de la Tabla**: 
   - Se crea una tabla llamada `viaje_clientes` que almacena información de los clientes y sus viajes. Los campos incluyen detalles como el nombre del cliente, correo electrónico, tipo de viaje, destino, fechas de inicio y fin, costo, etc.

4. **📥 Inserción de Datos**: 
   - Se insertan algunos registros de ejemplo en la tabla `viaje_clientes` con datos de clientes y viajes.

> Considerar que todas las soluciones fueron realizadas en MySQL Workbench.

5. **🔍 Consultas SQL**: El archivo incluye consultas para obtener información de la base de datos:

   1- Visualizar toda la información de la tabla.

```SQL
SELECT * FROM viaje_clientes;

```

   2- Contar el número total de registros.

   3- Obtener los destinos únicos de los viajes.

   4- Filtrar viajes nacionales y ordenar por nombre y fecha.

   5- Buscar clientes que hayan viajado a destinos de playa.

   6- Consultar clientes que hayan viajado a continentes específicos (Europa y América del Norte).

   7- Calcular el gasto total de los clientes y el gasto solo en viajes nacionales.

   8- Filtrar clientes que hayan gastado más de 3000 euros en un viaje.

   9- Contar los viajes realizados en septiembre de 2024.

   10- Agrupar el número total de viajes por tipo de destino.

   11- Calcular el costo promedio de los viajes por tipo de viaje.
