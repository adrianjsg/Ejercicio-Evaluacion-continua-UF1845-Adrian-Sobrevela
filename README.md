# Ejercicio-Evaluacion-continua-UF1845-Adrian-Sobrevela
Ejercicio Evaluación continua-UF1845-Adrián Sobrevela

Trabajas como analista de datos en una empresa de comercio electrónico. La empresa mantiene una base de datos que contiene información sobre productos, clientes, pedidos y detalles de pedidos. Se requiere que realices una serie de consultas para ayudar al departamento de marketing y ventas a entender mejor las tendencias de ventas, el comportamiento del cliente y la eficacia operativa.

Estructura de las Tablas:

1. Productos: (`id_producto`, `nombre`, `precio`, `categoría`)
2. Clientes: (`id_cliente`, `nombre`, `email`, `ciudad`)
3. Pedidos: (`id_pedido`, `id_cliente`, `fecha_pedido`, `estado`)
4. Detalles_Pedidos: (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`)

Se proporcionan los scripts para crear las tablas y realizar los inserts correspondientes. Se deben realizar las qerys SQL para poder responder a cada una de las tareas siguientes:

Tareas a Realizar:
1. Total de Ventas por Producto:Calcula el total de ventas para cada producto, ordenado de mayor a menor.
2. Último Pedido de Cada Cliente:Identifica el último pedido realizado por cada cliente.
3. Número de Pedidos por Ciudad:Determina el número total de pedidos realizados por clientes en cada ciudad.
4. Productos que Nunca se Han Vendido:Lista todos los productos que nunca han sido parte de un pedido.
5. Productos Más Vendidos por Cantidad:Encuentra los productos más vendidos en términos de cantidad total vendida.
6. Clientes con Compras en Múltiples Categorías:Identifica a los clientes que han realizado compras en más de una categoría de producto.
7. Ventas Totales por Mes:Muestra las ventas totales agrupadas por mes y año.
8. Promedio de Productos por Pedido:Calcula la cantidad promedio de productos por pedido.
9. Tasa de Retención de Clientes:Determina cuántos clientes han realizado pedidos en más de una ocasión. 
10. Tiempo Promedio entre Pedidos:Calcula el tiempo promedio que pasa entre pedidos para cada cliente. 

Requisitos:
Utiliza correctamente funciones de agregación, cláusulas `GROUP BY`, `ORDER BY` y funciones de ventana donde sea necesario.
Asegúrate de que todas las consultas estén optimizadas para la ejecución eficiente en una base de datos grande.
Incluye comentarios en tus consultas SQL para explicar la lógica utilizada.