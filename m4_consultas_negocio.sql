USE Ventas_Tech_DB;


-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
-- =========================================================

SELECT 
	MONTH(fecha_venta) AS mes, 
	SUM(cantidad * precio_unitario) AS total_facturado, 
	COUNT(*) AS cantidad_pedidos, 
	AVG(cantidad * precio_unitario) AS ticket_promedio 

FROM ventas 
GROUP BY MONTH(fecha_venta) 
ORDER BY MONTH(fecha_venta);


-- CONSULTA 2 - RANKING DE PRODUCTOS 
-- ========================================================= 

SELECT TOP (5)
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY SUM(cantidad * precio_unitario) DESC;


-- CONSULTA 3 - CLIENTES RECURRENTES
-- =========================================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY SUM(cantidad * precio_unitario) DESC;


-- CONSULTA 4 - MESES POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- =========================================================

;WITH ventas_por_mes AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
),
promedio_mensual AS (
    SELECT
        AVG(total_facturado) AS promedio
    FROM ventas_por_mes
)
SELECT
    v.mes,
    v.total_facturado,
    CASE
        WHEN v.total_facturado > p.promedio THEN 'Por encima'
        WHEN v.total_facturado < p.promedio THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM ventas_por_mes v
CROSS JOIN promedio_mensual p
ORDER BY v.mes;


-- HALLAZGOS
-- =========================================================

-- 1. La facturación total del período fue de $6.444,
--    distribuida en 10 pedidos, con un ticket promedio de $644,40.

-- 2. El producto 1 generó $3.600,
--    aproximadamente el 55,9% de la facturación total.

-- 3. El cliente 1 fue el que más gastó,
--    con un total de $2.640.
