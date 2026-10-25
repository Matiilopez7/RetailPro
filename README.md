# RetailPro
RetailPro — Proyecto de análisis de datos
Repositorio de prácticas del curso de Data Analytics. Incluye consultas SQL para analizar ventas, clientes, productos y categorías.
Herramientas
- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub para versionado y entrega de los scripts
Cómo ejecutar los scripts
1. Abrir SQL Server Management Studio y conectarse al servidor.
2. Ejecutar primero Ventas_Tech_DB.sql (Módulo 3) para crear y cargar la base Ventas_Tech_DB.
3. Abrir y ejecutar m4_consultas_negocio.sql para obtener métricas, ranking de productos y clientes recurrentes.
4. Ejecutar m5_consultas_joins.sql para cruzar ventas con clientes, productos y categorías.
5. Revisar los resultados en la pestaña Results de SSMS.
Los scripts de M4 y M5 requieren que la base de datos del Módulo 3 ya esté creada y cargada. Están escritos para SQL Server.
Entregas incluidas
- M3 — Ventas_Tech_DB.sql: creación de la base, tablas, claves y datos de ejemplo.
- M4 — m4_consultas_negocio.sql: resumen mensual, ranking de productos, clientes recurrentes y comparación contra el promedio.
- M5 — m5_consultas_joins.sql: vista enriquecida con INNER JOIN, búsqueda de clientes y productos sin ventas con LEFT JOIN, y consolidado con UNION ALL.
