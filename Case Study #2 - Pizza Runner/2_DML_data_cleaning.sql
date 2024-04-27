--DML -Data Manipulation Language- "Lenguaje de Manipulación de Datos". Las tablas que necesitan limpieza son 2.

--Tabla "customer_orders"
 ALTER TABLE pizza_names
ALTER COLUMN pizza_name VARCHAR(255);

 --Tabla "customer_orders"
 --Convertir valores nulos y valores de texto 'nulo' en la columna extras y en la columna exclusions en espacios en blanco '' 

UPDATE customer_orders
SET exclusions = NULL
WHERE exclusions IS NULL OR exclusions LIKE '' 

UPDATE customer_orders
SET extras = NULL
WHERE extras IS NULL OR extras LIKE ''

--Tabla "runner_orders"

--Column 'pickup_time'

--Convertir texto 'null' en valores nulos.
UPDATE runner_orders
SET pickup_time = NULL
WHERE pickup_time IS NULL OR pickup_time LIKE 'null'

--Convertir a tipo 'datetime'
ALTER TABLE runner_orders
ALTER COLUMN  pickup_time datetime;


--Column 'distance'
--Convertir texto 'null' en valores nulos.
UPDATE runner_orders
SET distance = NULL
WHERE distance IS NULL OR distance LIKE 'null'

--Extraer el texto 'km'
UPDATE runner_orders
SET distance = CAST(TRIM('km' FROM CAST(distance AS VARCHAR(MAX))) AS FLOAT)
WHERE distance LIKE '%km'

--Convertir a tipo 'FLOAT'
ALTER TABLE runner_orders
ALTER COLUMN  distance float;


--Column 'duration'
--Convertir texto 'null' en valores nulos.
UPDATE runner_orders
SET duration = NULL
WHERE duration IS NULL OR duration LIKE 'null'

--Extraer los distintos textos de 'minutos'

UPDATE runner_orders
SET duration = CAST(TRIM('mins' FROM CAST(duration AS VARCHAR(MAX))) AS FLOAT)
WHERE duration LIKE '%mins'

UPDATE runner_orders
SET duration = CAST(TRIM('minute' FROM CAST(duration AS VARCHAR(MAX))) AS FLOAT)
WHERE duration LIKE '%minute'

UPDATE runner_orders
SET duration = CAST(TRIM('minutes' FROM CAST(duration AS VARCHAR(MAX))) AS FLOAT)
WHERE duration LIKE '%minutes'

--Convertir a tipo de datos INTERGER
ALTER TABLE runner_orders
ALTER COLUMN  duration INTEGER;

--Column 'cancellation'
--Convertir texto 'null' en valores nulos.
UPDATE runner_orders
SET cancellation = NULL
WHERE cancellation IS NULL OR cancellation LIKE 'null'

--Convertir valores vacios en valores nulos.
UPDATE runner_orders
SET cancellation = NULL
WHERE cancellation LIKE ''
