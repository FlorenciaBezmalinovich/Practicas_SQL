--Cononcer la composición de las tablas.
EXEC sp_columns 'customer_orders';
EXEC sp_columns 'runner_orders';
EXEC sp_columns 'pizza_names';
select * from customer_orders
--1.¿Cuántas pizzas se pidieron?
 
 SELECT COUNT(order_id) AS pedidos_totales
 FROM customer_orders

--2.¿Cuántos pedidos únicos de clientes se realizaron?

SELECT COUNT(DISTINCT(order_id)) AS pedidos_unicos
FROM customer_orders

--3.¿Cuántos pedidos exitosos entregó cada repartidor ?

SELECT 
runner_id,
COUNT(order_id) AS pedidos_exitosos
FROM runner_orders
WHERE runner_orders.cancellation IS NULL
GROUP BY runner_id


--4.¿Cuántas pizzas de cada tipo se entregaron?

SELECT 
p.pizza_name AS sabor,
COUNT(c.pizza_id) AS cantidad_entregadas
FROM pizza_names AS P 
INNER JOIN customer_orders AS C ON C.pizza_id = P.pizza_id 
INNER JOIN runner_orders AS R ON R.order_id = C.order_id 
WHERE r.pickup_time IS NOT NULL
GROUP BY p.pizza_name;

--5.¿Cuántas pizzas vegetarianas y amantes de la carne ordenó cada cliente?

SELECT
customer_id AS cliente,
p.pizza_name AS sabor,
COUNT(c.pizza_id) AS cantidad_entregadas
FROM pizza_names AS P 
INNER JOIN customer_orders AS C ON C.pizza_id = P.pizza_id 
INNER JOIN runner_orders AS R ON R.order_id = C.order_id 
GROUP BY c.customer_id, p.pizza_name; 

--6.¿Cuál fue el número máximo de pizzas entregadas en un solo pedido?
WITH max_q_pizzas_entregadas AS
(
SELECT
order_id AS pedido,
COUNT(customer_id) AS q_pizzas_ordenadas
FROM customer_orders
GROUP BY order_id
)

SELECT
MAX(q_pizzas_ordenadas) AS max_entregado
FROM max_q_pizzas_entregadas;


--7.Para cada cliente, ¿cuántas pizzas entregadas 
--tenían al menos 1 cambio y cuántas no tenían cambios?

SELECT
    customer_id AS cliente,
    COUNT(CASE WHEN exclusions IS NULL AND extras IS NULL THEN C.pizza_id END) AS ordenes_originales,
    COUNT(CASE WHEN exclusions IS not NULL OR extras IS not  NULL THEN C.pizza_id END) AS ordenes_cambiadas
FROM 
    customer_orders AS C
INNER JOIN 
    runner_orders AS R ON R.order_id = C.order_id
WHERE 
    R.pickup_time IS NOT NULL
GROUP BY 
    C.customer_id;

--8.¿Cuántas pizzas se entregaron que tenían 
--exclusiones y extras?

SELECT
    COUNT(CASE WHEN exclusions IS not NULL AND extras IS not  NULL THEN C.pizza_id END) AS ordenes_cambiadas
FROM 
    customer_orders AS C
INNER JOIN 
    runner_orders AS R ON R.order_id = C.order_id
WHERE 
    R.pickup_time IS NOT NULL


--9.¿Cuál fue el volumen total de pizzas 
--ordenadas para cada hora del día?

SELECT 
DATEPART(HOUR, order_time) AS hora,
COUNT(order_id) AS cantidad_de_pedidos
FROM customer_orders
GROUP BY DATEPART(HOUR, order_time)
ORDER BY hora ASC;

--10.¿Cuál fue el volumen de pedidos para cada 
--día de la semana?

SELECT
 FORMAT(DATEADD(DAY, 2, order_time),'dddd') AS dia, -- Para ajustar el 1° día de la semana al "Lunes", agregue 2.
COUNT(order_id) AS cantidad_de_pedidos
FROM customer_orders
GROUP BY FORMAT(DATEADD(DAY, 2, order_time),'dddd')
ORDER BY dia ASC;