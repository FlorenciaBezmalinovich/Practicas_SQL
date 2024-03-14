# 🍜 Caso de estudio #1: Danny's Diner
![Logo_Danny](https://html.scribdassets.com/14q7tadsn49nbifk/images/1-53579a9c13.png)
## 📋Índice
- [Problema del negocio](#Problema-del-negocio)
- [DER - Diagrama Entidad-Relación](#Diagrama-Entidad-Relación)
- [Preguntas y Respuestas](#Preguntas-y-Soluciones)
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
3. Agrupé los resultados por customer_id.
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

Pasos:

1. Usé JOIN para combinar las tablas Sales y Menu por product_id.
2. Usé SUM para calcular el total gastado por cada cliente.
3. Agrupé los resultados por customer_id.

Solución:
| cliente       | total_gastado|
|:-------------:|:------------:|
| A             | 76           |
| B             | 74           |
| C             | 36           | 
***
