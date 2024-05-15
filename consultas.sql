-- Autor: Adrián Sobrevela
-- Fecha: [15/05/2024]
-- Descripción: [Evaluación Continua - UF1845 - SQL - Adrian Sobrevela]

-- Consultas Base de Datos. 

-- 1. Total de Ventas por Producto. Calcula el total de ventas para cada producto, ordenado de mayor a menor.
SELECT p.id_producto, p.nombre AS nombre_producto, SUM(dp.cantidad * p.precio) AS ventas_totales
FROM Productos p
JOIN Detalles_Pedidos dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY ventas_totales DESC;

-- 2. Último Pedido de Cada Cliente: Identifica el último pedido realizado por cada cliente.
SELECT c.nombre AS nombre_cliente, MAX(p.fecha_pedido) AS ultimo_pedido
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre;

-- 3. Número de Pedidos por Ciudad: Determina el número total de pedidos realizados por clientes en cada ciudad.
SELECT c.ciudad, COUNT(p.id_pedido) AS num_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.ciudad;

-- 4. Productos que Nunca se Han Vendido: Lista todos los productos que nunca han sido parte de un pedido.
SELECT p.id_producto, p.nombre AS nombre_producto
FROM Productos p
LEFT JOIN Detalles_Pedidos dp ON p.id_producto = dp.id_producto
WHERE dp.id_producto IS NULL;

-- 5. Productos Más Vendidos por Cantidad: Encuentra los productos más vendidos en términos de cantidad total vendida.
SELECT p.id_producto, p.nombre AS nombre_producto, SUM(dp.cantidad) AS cantidad_total_vendida
FROM Productos p
JOIN Detalles_Pedidos dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY cantidad_total_vendida DESC;

-- 6. Clientes con Compras en Múltiples Categorías: Identifica a los clientes que han realizado compras en más de una categoría de producto.
SELECT c.id_cliente, c.nombre AS nombre_cliente
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
JOIN Detalles_Pedidos dp ON p.id_pedido = dp.id_pedido
JOIN Productos pr ON dp.id_producto = pr.id_producto
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(DISTINCT pr.categoría) > 1;

-- 7. Ventas Totales por Mes: Muestra las ventas totales agrupadas por mes y año.
SELECT YEAR(p.fecha_pedido) AS año, MONTH(p.fecha_pedido) AS mes, SUM(pr.precio * dp.cantidad) AS ventas_totales
FROM Pedidos p
JOIN Detalles_Pedidos dp ON p.id_pedido = dp.id_pedido
JOIN Productos pr ON dp.id_producto = pr.id_producto
GROUP BY YEAR(p.fecha_pedido), MONTH(p.fecha_pedido)
ORDER BY año, mes;

-- 8. Promedio de Productos por Pedido: Calcula la cantidad promedio de productos por pedido.
SELECT AVG(cantidad) AS promedio_productos_por_pedido
FROM (
    SELECT id_pedido, COUNT(id_producto) AS cantidad
    FROM Detalles_Pedidos
    GROUP BY id_pedido
) AS productos_por_pedido;

-- 9. Tasa de Retención de Clientes: Determina cuántos clientes han realizado pedidos en más de una ocasión.
SELECT COUNT(*) AS clientes_retención
FROM (
    SELECT id_cliente
    FROM Pedidos
    GROUP BY id_cliente
    HAVING COUNT(id_pedido) > 1
) AS clientes_retención;

-- 10. Tiempo Promedio entre Pedidos: Calcula el tiempo promedio que pasa entre pedidos para cada cliente.
SELECT id_cliente, AVG(tiempo_entre_pedidos) AS tiempo_promedio_entre_pedidos
FROM (
    SELECT 
        p1.id_cliente, 
        DATEDIFF(MIN(p2.fecha_pedido), MAX(p1.fecha_pedido)) AS tiempo_entre_pedidos
    FROM Pedidos p1
    JOIN Pedidos p2 ON p1.id_cliente = p2.id_cliente
    WHERE p2.fecha_pedido > p1.fecha_pedido
    GROUP BY p1.id_cliente, p1.id_pedido
) AS tiempo_pedidos_por_cliente
GROUP BY id_cliente;