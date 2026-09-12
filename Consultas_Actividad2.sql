-- =========================================================
-- Actividad 2 - Administración de Bases de Datos
-- Akira's Boutique: Consultas
-- Alumno: Luis Enrique García Bojórquez
-- =========================================================
USE AkirasBoutique;
GO

-- ---------------------------------------------------------
-- 1. Clientes con factura en el año 2021
-- ---------------------------------------------------------
SELECT c.id_cliente, c.nombre, c.apellido, f.id_factura, f.fecha
FROM cliente c
INNER JOIN factura f ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2021
ORDER BY f.fecha;
GO

-- ---------------------------------------------------------
-- 2. Clientes con factura en 2022 (hasta el momento)
-- ---------------------------------------------------------
SELECT c.id_cliente, c.nombre, c.apellido, f.id_factura, f.fecha
FROM cliente c
INNER JOIN factura f ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2022
ORDER BY f.fecha;
GO

-- ---------------------------------------------------------
-- 3. Clientes con factura en diciembre de 2021
-- ---------------------------------------------------------
SELECT c.id_cliente, c.nombre, c.apellido, f.id_factura, f.fecha
FROM cliente c
INNER JOIN factura f ON c.id_cliente = f.id_cliente
WHERE YEAR(f.fecha) = 2021 AND MONTH(f.fecha) = 12
ORDER BY f.fecha;
GO

-- ---------------------------------------------------------
-- 4. Compras de clientes especificos
-- ---------------------------------------------------------

-- 4.1 Valentina Anastasia Huerta Corral (id_cliente = 2)
SELECT c.nombre, c.apellido, f.id_factura, f.fecha, p.nombre AS Producto, d.cantidad, d.precio
FROM cliente c
INNER JOIN factura f  ON c.id_cliente = f.id_cliente
INNER JOIN detalle d  ON f.id_detalle = d.id_detalle
INNER JOIN producto p ON d.id_producto = p.id_producto
WHERE c.id_cliente = 2;
GO

-- 4.2 Zayra Manuela Gomez Lopez (id_cliente = 17)
SELECT c.nombre, c.apellido, f.id_factura, f.fecha, p.nombre AS Producto, d.cantidad, d.precio
FROM cliente c
INNER JOIN factura f  ON c.id_cliente = f.id_cliente
INNER JOIN detalle d  ON f.id_detalle = d.id_detalle
INNER JOIN producto p ON d.id_producto = p.id_producto
WHERE c.id_cliente = 17;
GO

-- 4.3 Dante Eduardo Dolores Meza (id_cliente = 24)
SELECT c.nombre, c.apellido, f.id_factura, f.fecha, p.nombre AS Producto, d.cantidad, d.precio
FROM cliente c
INNER JOIN factura f  ON c.id_cliente = f.id_cliente
INNER JOIN detalle d  ON f.id_detalle = d.id_detalle
INNER JOIN producto p ON d.id_producto = p.id_producto
WHERE c.id_cliente = 24;
GO

-- 4.4 Ana Maribel Cedillo Nunez (id_cliente = 4)
SELECT c.nombre, c.apellido, f.id_factura, f.fecha, p.nombre AS Producto, d.cantidad, d.precio
FROM cliente c
INNER JOIN factura f  ON c.id_cliente = f.id_cliente
INNER JOIN detalle d  ON f.id_detalle = d.id_detalle
INNER JOIN producto p ON d.id_producto = p.id_producto
WHERE c.id_cliente = 4;
GO

-- 4.5 Rodrigo Ismael Silva Ugarte (id_cliente = 11)
SELECT c.nombre, c.apellido, f.id_factura, f.fecha, p.nombre AS Producto, d.cantidad, d.precio
FROM cliente c
INNER JOIN factura f  ON c.id_cliente = f.id_cliente
INNER JOIN detalle d  ON f.id_detalle = d.id_detalle
INNER JOIN producto p ON d.id_producto = p.id_producto
WHERE c.id_cliente = 11;
GO

-- ---------------------------------------------------------
-- 5. Producto mas vendido (por cantidad total en detalle)
-- ---------------------------------------------------------
SELECT TOP 1 p.id_producto, p.nombre, v.TotalVendido
FROM (
    SELECT id_producto, SUM(cantidad) AS TotalVendido
    FROM detalle
    GROUP BY id_producto
) v
INNER JOIN producto p ON p.id_producto = v.id_producto
ORDER BY v.TotalVendido DESC;
GO

-- ---------------------------------------------------------
-- 6. Producto con mas stock
-- ---------------------------------------------------------
SELECT TOP 1 id_producto, nombre, stock
FROM producto
ORDER BY stock DESC;
GO

-- ---------------------------------------------------------
-- 7. Compras ordenadas de la mas antigua a la mas reciente
-- ---------------------------------------------------------
SELECT f.id_factura, c.nombre, c.apellido, f.fecha
FROM factura f
INNER JOIN cliente c ON f.id_cliente = c.id_cliente
ORDER BY f.fecha ASC;
GO

-- ---------------------------------------------------------
-- 8. Clientes ordenados alfabeticamente
-- ---------------------------------------------------------
SELECT id_cliente, CAST(nombre AS NVARCHAR(200)) AS nombre, CAST(apellido AS NVARCHAR(200)) AS apellido
FROM cliente
ORDER BY nombre ASC, apellido ASC;
GO

-- ---------------------------------------------------------
-- 9. Productos por categoria
-- ---------------------------------------------------------

-- 9.1 Falda
SELECT p.id_producto, p.nombre, p.precio, p.stock
FROM producto p
INNER JOIN categoria cat ON p.id_categoria = cat.id_categoria
WHERE cat.nombre LIKE 'Falda';
GO

-- 9.2 Pantalon
SELECT p.id_producto, p.nombre, p.precio, p.stock
FROM producto p
INNER JOIN categoria cat ON p.id_categoria = cat.id_categoria
WHERE cat.nombre LIKE 'Pantalón';
GO

-- 9.3 Chamarra
SELECT p.id_producto, p.nombre, p.precio, p.stock
FROM producto p
INNER JOIN categoria cat ON p.id_categoria = cat.id_categoria
WHERE cat.nombre LIKE 'Chamarra';
GO

-- 9.4 Zapatos
SELECT p.id_producto, p.nombre, p.precio, p.stock
FROM producto p
INNER JOIN categoria cat ON p.id_categoria = cat.id_categoria
WHERE cat.nombre LIKE 'Zapato';
GO

-- 9.5 Accesorios
SELECT p.id_producto, p.nombre, p.precio, p.stock
FROM producto p
INNER JOIN categoria cat ON p.id_categoria = cat.id_categoria
WHERE cat.nombre LIKE 'Accesorios';
GO

-- ---------------------------------------------------------
-- 10. Encargados de cada sucursal
-- ---------------------------------------------------------
SELECT NumSucursal, NombreSucursal, Encargado, Ciudad, Estado
FROM Sucursales
ORDER BY NumSucursal;
GO

-- ---------------------------------------------------------
-- 11. Empleados de la sucursal Constitucion
-- ---------------------------------------------------------
SELECT e.Nombre, e.Edad, e.Correo, s.NombreSucursal
FROM Empleados e
INNER JOIN Sucursales s ON e.NumSucursal = s.NumSucursal
WHERE s.NombreSucursal LIKE '%Constitucion%';
GO

-- ---------------------------------------------------------
-- 12. Clientes mayores de 30 anios
-- ---------------------------------------------------------
SELECT id_cliente, nombre, apellido, fec_nac,
    DATEDIFF(YEAR, fec_nac, GETDATE())
    - CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, fec_nac, GETDATE()), fec_nac) > GETDATE()
           THEN 1 ELSE 0 END AS Edad
FROM cliente
WHERE DATEDIFF(YEAR, fec_nac, GETDATE())
    - CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, fec_nac, GETDATE()), fec_nac) > GETDATE()
           THEN 1 ELSE 0 END > 30
ORDER BY fec_nac;
GO
