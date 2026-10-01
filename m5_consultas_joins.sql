USE Ventas_Tech_DB;


-- CONSULTA 1 - VISTA BASE DEL PROYECTO
-- INNER JOIN
-- =========================================================

SELECT
    v.fecha_venta AS fecha,
    c.id_cliente,
    c.nombre AS cliente,
    c.ciudad AS region,
    p.id_producto,
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;


-- CONSULTA 2 - CLIENTES SIN VENTAS
-- LEFT JOIN
-- =========================================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


-- CONSULTA 3 - PRODUCTOS SIN VENTAS
-- LEFT JOIN
-- =========================================================

SELECT
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;


-- CONSULTA 4 - CONSOLIDADO POR ORIGEN
-- UNION ALL
-- =========================================================

SELECT
    canal,
    COUNT(*) AS cantidad_pedidos,
    SUM(total) AS total_facturado
FROM
(
    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Periodo 1' AS canal
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-01' AND '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Periodo 2' AS canal
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-31'
) AS ventas_consolidadas
GROUP BY canal
ORDER BY canal;