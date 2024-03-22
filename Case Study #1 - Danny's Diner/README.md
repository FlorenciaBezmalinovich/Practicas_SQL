# 🍜 Caso de estudio #1: Danny's Diner
![Logo_Danny](https://html.scribdassets.com/14q7tadsn49nbifk/images/1-53579a9c13.png)
## 📋Índice
- [Problema del negocio](#Problema-del-negocio)
- [DER - Diagrama Entidad-Relación](#DER---Diagrama-Entidad-Relación)
- [Preguntas y Respuestas](#Preguntas-y-Respuestas)
> Considerar que toda la información sobre el caso de estudio fue obtenido desde el siguiente enlace: [SQL_Challenge](https://8weeksqlchallenge.com/case-study-1/)
***
## Problema del negocio
Danny es un restaurante que desea conocer más sobre el comportamiento de sus clientes utilizando datos para responder algunas preguntas sencillas. Es de su interés saber sobre sus patrones de visita, cuánto dinero han gastado y también qué elementos del menú son sus favoritos, entre otras cosas.
***
## DER - Diagrama Entidad-Relación
![DER](https://miro.medium.com/v2/resize:fit:750/format:webp/1*fEmZXjnIof5BHL_sLGDVUg.png)
***
## Preguntas y Respuestas
> Considerar que todas las soluciones fueron realizadas en Microsoft SQL Server Management Studio.

### 1. ¿Cuál es la cantidad total que gastó cada cliente en el restaurante?
 ```SQL
SELECT
customer_id as cliente,
SUM(price) as total_gastado
FROM Sales AS S
INNER JOIN Menu AS M on S.product_id = M.product_id
GROUP BY customer_id;
```
Pasos:
1. Usé JOIN para combinar las tablas Sales y Menu por product_id.
2. Usé SUM para calcular el total gastado por cada cliente.
3. Agrupé los resultados por customer_id porque se pregunta por cada uno de ellos.
Solución:

| cliente       | total_gastado|
|:-------------:|:------------:|
| A             | 76           |
| B             | 74           |
| C             | 36           | 
***
### 2. ¿Cuántos días ha visitado cada cliente el restaurante?
 ```SQL
SELECT 
customer_id AS cliente,
COUNT (DISTINCT order_date) as dias
FROM Sales
GROUP BY customer_id
```
Esta consulta cuenta todas las filas en la tabla de sales para cada cliente, lo que nos dará el número de días que cada cliente visitó el restaurante.

Es importante aplicar la palabra clave DISTINCT al calcular el recuento de visitas para evitar recuentos duplicados de días. Por ejemplo, si el cliente C visitó el restaurante dos veces el '2021–01–01', contar sin DISTINCT daría como resultado 2 días en lugar del recuento exacto de 1 día.

Pasos:
1. Usé COUNT (DISTINCT order_date) para determinar un único número de visitas de cada cliente.
2. Agrupé los resultados por customer_id porque se pregunta por cada uno de ellos.
   

Solución:
| cliente       | días|
|:-------------:|:------------:|
| A             | 4           |
| B             | 6           |
| C             | 2           | 
***
### 3. ¿Cuál fue el primer artículo del menú comprado por cada cliente?

 ```SQL
WITH ordered_sales_cte AS (
SELECT 
customer_id,
order_date,
product_name,
DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date ASC) as rkn
FROM Sales AS S
INNER JOIN Menu AS M on S.product_id = M.product_id
)

SELECT 
  customer_id AS cliente, 
  product_name AS artículo
FROM ordered_sales_cte
WHERE rkn = 1
GROUP BY customer_id, product_name;
```
Cree una expresión común de tabla (CTE) denominada order_sales_cte. Allí, cree una nueva columna y calcule el número de filas usando la función DENSE_RANK(). La cláusula PARTITION BY divide los datos por customer_id y la cláusula ORDER BY ordena las filas dentro de cada partición por order_date.
En la consulta externa, seleccione las columnas apropiadas y aplique un filtro en la cláusula WHERE para recuperar solo las filas donde la columna de rkn es igual a 1, que representa la primera fila dentro de cada partición customer_id.

Pasos:
1. Usé WITH para crear una tabla expresión común de tabla llamada ordered_sales_cte.
2. En la tabla creada en el punto 1 use ña función DENSE_RANK() para dividir y ordenar los datos.
3. En la consulta principal, seleccioné las columnas que deseaba mostrar en la respuesta y lasfiltré con WHERE indicando que deseaba mostrar solos los rkn = 1.
4. Por último, utilice la cláusula GROUP BY para agrupar el resultado por customer_id y product_name.
   

Solución:
| cliente       | artículo|
|:-------------:|:------------:|
| A             | curry         |
| A             | sushi           | 
| B             | curry           |
| C             | ramen           | 

***
### 4. ¿Cuál es el artículo más comprado en el menú y cuántas veces lo compraron todos los clientes?

 ```SQL
SELECT TOP 1
product_name as producto,
COUNT (order_date) as cantidad_ordenes
FROM Sales AS S
INNER JOIN Menu AS M on S.product_id = M.product_id
GROUP BY product_name
ORDER BY cantidad_ordenes DESC;
```

Pasos:
1. Usé JOIN para combinar las tablas Sales y Menu por product_id.
2. Usé COUNT para crea una agregación en la columna order_date.
3. Ordenpe de manera descendiente el resultado utilizando el campo cantidad_ordenes.


Solución:
| producto       | cantidad_ordenes|
|:-------------:|:------------:|
| ramen             | 8        |

***
### 5. ¿Qué artículo fue el más popular para cada cliente?
 ```SQL
WITH articulo_popular AS(
SELECT 
customer_id as cliente,
product_name as articulo,
COUNT (order_date) as cantidad_ordenes,
RANK() OVER(PARTITION BY customer_id ORDER BY COUNT (order_date) DESC) as rkn
FROM Sales AS S
INNER JOIN Menu AS M on S.product_id = M.product_id
GROUP BY product_name,
customer_id
)
SELECT
*
FROM articulo_popular
WHERE rkn = 1
 ```
Pasos:
1. Creación un CTE llamado `articulo_popular` y dentro del CTE, unión de las tablas Menu y Sales usando la columna product_id.
2. Agrupación los resultados por sales.customer_id y menu.product_name y cálculo del recuento de apariciones de order_date para cada grupo.
3. Uso de RANK() para calcular la clasificación de cada partición sales.customer_id en función del recuento de pedidos en orden descendente.
4. En la consulta externa, selección de las columnas apropiadas y aplicación de un filtro en la cláusula WHERE para recuperar solo las filas donde la columna de clasificación es igual a 1, lo que representa las filas con el recuento de pedidos más alto para cada cliente.


Solución:
| cliente       |       artículos |cantidad_ordenes|
|:-------------:|:---------------:|:-------------:|
| A             |ramen           |3             |
| B             |curry           |2             |
| B             |ramen           |2             |
| B             |sushi           |2             |
| C             |ramen           |3             |
***

### 6. ¿Qué artículo compró primero el cliente después de convertirse en miembro?
 ```SQL
WITH conversion_a_miembro AS(
	SELECT
	S.customer_id as cliente,
	order_date as fecha,
	join_date,
	product_name AS articulo,
	RANK() OVER(PARTITION BY S.customer_id ORDER BY order_date) as rnk,
	ROW_NUMBER() OVER(PARTITION BY S.customer_id ORDER BY order_date) as rn
	FROM Sales AS S
	INNER JOIN Members AS MEM on S.customer_id = MEM.customer_id
	INNER JOIN Menu AS M on S.product_id = M.product_id
	WHERE order_date >= join_date
	)
SELECT 
cliente,
articulo
FROM conversion_a_miembro
WHERE rnk = 1
 ```
Pasos:
1. Creación de un CTE llamado `conversion_a_miembro` donde se unen las tablas Sales y Miembros por la columna customer_id y las tablas Sales y Menu por product_id.
2. Creación de la columna rn que cuenta la cantidad de filas con la función ROW_NUMBER() particionando en función del customer_id.
3. Utilización dle filtro WHERE para recuperar solo las columnas donde la fecha del pedido es mayor o igual a la fecha de alta como miembro.
4. En la consulta externa, selección de cliente y artículo de del CTE filtrando por la columna rnk que le da un numero de orden a los pedidos en base a la fecha de la orden.

Solución:
| cliente       |       artículo |
|:-------------:|:---------------:|
| A             |curry           |
| B             |sushi           |  

***
### 7. ¿Qué artículo se compró justo antes de que el cliente se convirtiera en miembro?
 ```SQL
WITH compra_anterior_conversion_miembro AS(
	SELECT
	S.customer_id as cliente,
	order_date as fecha,
	join_date,
	product_name AS articulo,
	RANK() OVER(PARTITION BY S.customer_id ORDER BY order_date DESC) as rnk,
	ROW_NUMBER() OVER(PARTITION BY S.customer_id ORDER BY order_date DESC) as rn
	FROM Sales AS S
	INNER JOIN Members AS MEM on S.customer_id = MEM.customer_id
	INNER JOIN Menu AS M on S.product_id = M.product_id
	WHERE order_date < join_date
	)
SELECT 
cliente,
articulo
FROM compra_anterior_conversion_miembro
WHERE rnk = 1
 ```
Pasos:
1.  Creación de un CTE llamado `compra_anterior_conversion_miembro` donde se unen las tablas Sales y Miembros por la columna customer_id y las tablas Sales y Menu por la columna product_id.
2. 

Solución:
| cliente       |       artículo |
|:-------------:|:---------------:|
| A             |curry           |
| A             |sushi           |  
| B             |sushi           |  
***
### 8. ¿Cuál es el total de artículos y la cantidad gastada por cada miembro antes de convertirse en miembro?
 ```SQL
 ```
Pasos:


Solución:
| cliente       |       artículos |cantidad_ordenes|
|:-------------:|:---------------:|:-------------:|
| A             |ramen           |3             |
| B             |curry           |2             |
***
### 9. Si cada $ 1 gastado equivale a 10 puntos y el sushi tiene un multiplicador de puntos 2x, ¿cuántos puntos tendría cada cliente? Nota: Solo los clientes que son miembros reciben puntos al comprar artículos.
 ```SQL
 ```
Pasos:


Solución:
| cliente       |       artículos |cantidad_ordenes|
|:-------------:|:---------------:|:-------------:|
| A             |ramen           |3             |
| B             |curry           |2             |
***
### 10. En la primera semana después de que un cliente se une al programa (incluida la fecha de ingreso), gana el doble de puntos en todos los artículos, no solo en sushi. ¿Cuántos puntos tienen los clientes A y B a fines de enero?
 ```SQL
 ```
Pasos:


Solución:
| cliente       |       artículos |cantidad_ordenes|
|:-------------:|:---------------:|:-------------:|
| A             |ramen           |3             |
| B             |curry           |2             |
***
