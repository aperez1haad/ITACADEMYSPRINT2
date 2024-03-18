SELECT nombre FROM tienda.producto;
SELECT nombre,precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio, precio * 0.85 AS precio_usd FROM producto;
SELECT nombre AS "nom de producto", precio AS euros, precio * 0.85 AS dolars FROM producto;
SELECT UPPER(nombre) AS nombre, precio FROM producto;
SELECT LOWER(nombre) AS nomfabricantebre, precio FROM producto;
SELECT nombre, ROUND(precio,2) AS precio FROM producto;
SELECT nombre, TRUNCATE(precio,0) AS precio FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT * FROM tienda.fabricante;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS "Primeras dos letras" FROM fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto 
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto 
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;

SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto 
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;

SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
SELECT * FROM producto JOIN fabricante ON codigo_fabricante=fabricante.codigo WHERE fabricante.nombre ="Lenovo";
--dos maneras de hacer lo mismo para seleccionar lenovo;

SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Crucial") 
AND precio>200;

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo 
WHERE fabricante.nombre= "Asus" OR fabricante.nombre = "Seagate" OR fabricante.nombre = "Hewlett-Packard";

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto 
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE (RIGHT(fabricante.nombre, 1) = 'e');

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto 
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE (LOCATE("w",fabricante.nombre));

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante 
JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

SELECT fabricante.codigo, fabricante.nombre, COUNT(producto.codigo) FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo;

SELECT fabricante.codigo, fabricante.nombre FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;

SELECT * FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo
AND fabricante.nombre = "Lenovo";
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");

SELECT * FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT producto.nombre FROM producto
JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre ="Lenovo" 
ORDER BY producto.precio DESC LIMIT 1;

SELECT producto.nombre FROM producto
JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre ="Hewlett-Packard" 
ORDER BY producto.precio ASC LIMIT 1;

SELECT * FROM producto 
WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

SELECT * FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus')
AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));
