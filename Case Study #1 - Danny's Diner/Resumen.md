Para contestar las preguntas de este caso utilicé funciones básicas, a saber:

La función de agregación 'SUM' la utilicé para sumarizar los valores de una columna en una tabla.

La función de agregación 'COUNT' la utilicé para contar el número de filas en un conjunto de resultados que cumplían con deterkminados criterios.

La función de agregación 'COUNT (DISTINCT)' la utilicé para contar el número de valores únicos en una columna.

La función 'DENSE_RANK() OVER (PARTITION BY)' la utilicé para asignar un rango a cada fila de un conjunto de resultados. La cláusula OVER se utiliza para especificar cómo se debe dividir el conjunto de resultados. Por ejemplo, puedes usar DENSE_RANK() OVER (PARTITION BY department) para asignar un rango denso a cada fila dentro de cada departamento.

La función 'ROW_NUMBER() OVER (PARTITION BY)' la utilicpe para asignar un número de fila a cada fila de la tabla. Al igual que en DENSE_RANK(), la cláusula OVER se utiliza para especificar cómo se debe dividir el conjunto de resultados. Por ejemplo, ROW_NUMBER() OVER (PARTITION BY category) asignaría un número de fila único a cada fila dentro de cada categoría.

La cláusula 'INNER JOIN' la utilicé para unir filas de dos o más tablas en función de una condición especificada. Solo las filas que cumplen con la condición de unión se incluyen en el resultado. Por lo tanto, INNER JOIN devuelve únicamente las filas que tienen valores coincidentes en ambas tablas.

La cláusula 'GROUP BY' la utilicé para agrupar filas que tienen los mismos valores en una o más columnas. La mayoria de las veces junto con funciones de agregación previamente calculadas como por ejemplo, SUM, COUNT, AVG, etc. Y así visualizar los resultados de consultas que involucran funciones de agregación resumidas en grupos.

