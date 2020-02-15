
DELIMITER $$

USE `examen`$$

DROP FUNCTION IF EXISTS `cantidadAlmacen`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `cantidadAlmacen`(accesorio INT) RETURNS INT(11)
BEGIN    
    DECLARE almacen INT;
    SELECT SUM(accesorios.cantidad) INTO almacen
    FROM accesorios
    JOIN tipoaccesorios ON tipoaccesorios.idt = accesorios.idt
    JOIN ventas ON ventas.ida = accesorios.ida
    WHERE accesorios.idt = accesorio
    GROUP BY tipoaccesorios.nombre;
    RETURN almacen;

    END$$

DELIMITER ;





DELIMITER $$

USE `examen`$$

DROP FUNCTION IF EXISTS `cantidadComprar`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `cantidadComprar`(accesorio INT) RETURNS INT(11)
BEGIN    
    DECLARE venta INT;
    SELECT SUM(ventas.cant) INTO venta
    FROM accesorios
    JOIN tipoaccesorios ON tipoaccesorios.idt = accesorios.idt
    JOIN ventas ON ventas.ida = accesorios.ida
    WHERE accesorios.idt = accesorio
    GROUP BY tipoaccesorios.nombre;
    RETURN venta;

    END$$

DELIMITER ;








SELECT tablas.nombre,tablas.almacen,tablas.comprar,
IF(tablas.almacen>tablas.comprar,"si", "no") AS surtido,
IF(tablas.comprar<=10,"si", "no") AS baja
FROM tipoaccesorios
INNER JOIN
(SELECT tipoaccesorios.nombre AS nombre,
cantidadAlmacen(tipoaccesorios.idt) AS almacen,
cantidadComprar(tipoaccesorios.idt) AS comprar
FROM tipoaccesorios) AS tablas
GROUP BY tablas.nombre,tablas.almacen,tablas.comprar

