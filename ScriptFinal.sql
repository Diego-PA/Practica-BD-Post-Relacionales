CREATE DATABASE practica;

/*Cambiar a la BD y ejecutar*/
CREATE SCHEMA equipo1;

--zona
CREATE TABLE equipo1.zona (nombre_zona VARCHAR(100) PRIMARY KEY,
						   clasificacion CHAR(3) CHECK (clasificacion IN ('A', 'AA', 'AAA')));
--vendedor
CREATE TABLE equipo1.vendedor (id_vendedor INTEGER PRIMARY KEY,
    						   nombre_vendedor VARCHAR(100) NOT NULL,
    						   apellido_vendedor VARCHAR(100) NOT NULL,
							   nombre_zona VARCHAR(100) REFERENCES equipo1.zona(nombre_zona));

--cliente
CREATE TABLE  equipo1.cliente (id_cliente INTEGER PRIMARY KEY NOT NULL,
							   nombre_cliente VARCHAR(100) NOT NULL,
							   nombre_zona VARCHAR(100) NOT NULL REFERENCES equipo1.zona(nombre_zona));
							   
--venta
CREATE TABLE equipo1.venta(id_vendedor INTEGER REFERENCES equipo1.vendedor(id_vendedor) NOT NULL,
						   id_cliente INTEGER REFERENCES equipo1.cliente(id_cliente) NOT NULL,
						   fecha DATE NOT NULL,
						   importe NUMERIC(10,5) NOT NULL,
						   PRIMARY KEY(id_vendedor, id_cliente, fecha));

--comisiones
CREATE TABLE equipo1.comisiones(id_vendedor INTEGER REFERENCES equipo1.vendedor(id_vendedor),
								mes VARCHAR(100) NOT NULL,
								venta_total NUMERIC(10,5) NOT NULL);
							
--penalizaciones
CREATE TABLE equipo1.penalizaciones(id_vendedor INTEGER REFERENCES equipo1.vendedor(id_vendedor),
									fecha DATE NOT NULL);
							  
--INSERTS
--zona
INSERT INTO equipo1.zona (nombre_zona,clasificacion)
VALUES
    ('CDMX SUR', null),
    ('CDMX NORTE', null),
    ('CDMX CENTRO', null),
    ('CDMX PONIENTE', null),
    ('CDMX ORIENTE', null),
    ('EDOMEX NORTE', null),
    ('EDOMEX ORIENTE', null),
    ('EDOMEX SUR', null),
    ('HIDALGO', null),
    ('PUEBLA', null),
    ('QUERETARO', null);
   
 --vendedor
INSERT INTO equipo1.vendedor (id_vendedor,nombre_vendedor,apellido_vendedor,nombre_zona)
VALUES
	('0', 'DESCONOCIDO', '', null),
    ('1', 'Rafael', 'Soto', 'CDMX SUR'),
    ('2', 'Ricardo', 'Arzate', 'CDMX SUR'),
    ('3', 'Raymundo', 'Urbina', 'CDMX NORTE'),
    ('4', 'Viridiana', 'Hernandez', 'CDMX NORTE'),
    ('5', 'Martin ', 'Retana', 'CDMX CENTRO'),
    ('6', 'Mario', 'Garcia', 'CDMX CENTRO'),
    ('7', 'Elizabeth', 'Garcia', 'CDMX PONIENTE'),
    ('8', 'Consuelo', 'Aviles', 'CDMX PONIENTE'),
    ('9', 'Elias', 'Ukan', 'EDOMEX NORTE'),
    ('10', 'Aceneth', 'Hernandez', 'EDOMEX NORTE'),
    ('11', 'Salvador', 'Avila', 'EDOMEX SUR'),
    ('12', 'Armando', 'Martinez', 'HIDALGO'),
    ('13', 'Alicia', 'Cordoba', 'PUEBLA'),
    ('14', 'Ana', 'Macias', 'QUERETARO');
    
--cliente
INSERT INTO equipo1.cliente (id_cliente,nombre_cliente,nombre_zona)
VALUES
    ('10', 'La sazon', 'CDMX SUR'),
    ('20', 'Cantina la Jalisiense', 'CDMX SUR'),
    ('30', 'Wings Motors', 'CDMX SUR'),
    ('40', 'Bar Habos', 'CDMX SUR'),
    ('50', 'El ogro', 'CDMX SUR'),
    ('60', 'Tecla de sol', 'CDMX NORTE'),
    ('70', 'Doghouse', 'CDMX NORTE'),
    ('80', 'La clandestina', 'CDMX NORTE'),
    ('90', 'La Alhambra ', 'CDMX CENTRO'),
    ('100', 'Cantabria', 'CDMX CENTRO'),
    ('110', 'Resturante Manolo', 'CDMX CENTRO'),
    ('120', 'La vitola', 'CDMX CENTRO'),
    ('130', 'Rincon de Luis', 'CDMX CENTRO'),
    ('140', 'La sureña', 'CDMX CENTRO'),
    ('150', 'La mula de Moscu', 'CDMX CENTRO'),
    ('160', 'El perro Andaluz', 'CDMX CENTRO'),
    ('170', 'Chinaloa', 'CDMX CENTRO'),
    ('180', 'Resturante Montejo', 'CDMX CENTRO'),
    ('190', 'Un lugar de la mancha', 'CDMX PONIENTE'),
    ('200', 'Gin Gin', 'CDMX PONIENTE'),
    ('210', 'Beer Station', 'CDMX PONIENTE'),
    ('220', 'Torito Sinaloense', 'EDOMEX SUR'),
    ('230', 'El puerto', 'EDOMEX NORTE'),
    ('240', 'La perla', 'EDOMEX ORIENTE'),
    ('250', 'TEODIO', 'PUEBLA'),
    ('260', 'Bar Veider', 'QUERETARO'),
    ('270', 'La bodeguita', 'QUERETARO'),
    ('280', 'Paradiso Perduto', 'QUERETARO'),
    ('290', 'El asadero', 'HIDALGO'),
    ('300', 'La terraza', 'PUEBLA');

--venta
INSERT INTO equipo1.venta (id_vendedor,id_cliente,fecha,importe)
VALUES
    (1, 40, '03/02/2020', '12000.00'),
    (1, 30, '10/03/2020', '15000.00'),
    (1, 10, '20/02/2020', '8000.00'),
    (1, 90, '25/02/2020', '13000.00'),
    (1, 150, '05/03/2020', '10000.00'),
    (2, 20, '06/02/2020', '7000.00'),
    (2, 50, '18/02/2020', '6000.00'),
    (2, 110, '22/02/2020', '4000.00'),
    (3, 80, '28/02/2020', '10000.00'),
    (3, 70, '04/03/2020', '15000.00'),
    (3, 130, '06/03/2020', '22000.00'),
    (3, 180, '12/03/2020', '18000.00'),
    (4, 60, '20/01/2020', ' 4000.00'),
    (4, 140, '10/01/2020', '6000.00'),
    (5, 90, '18/02/2020', '9000.00'),
    (5, 100, '11/01/2020', '9000.00'),
    (5, 100, '08/02/2020', '14000.00'),
    (5, 110, '15/02/2020', '18000.00'),
    (6, 160, '30/01/2020', '20000.00'),
    (6, 170, '06/02/2020', '17000.00'),
    (6, 180, '28/01/2020', '15000.00'),
    (6, 90, '22/01/2020', '12000.00'),
    (7, 130, '15/03/2020', '13000.00'),
    (7, 100, '23/01/2020', '8000.00'),
    (8, 200, '14/02/2020', '9000.00'),
    (8, 190, '17/02/2020', '9000.00'),
    (9, 210, '10/03/2020', '7000.00'),
    (10, 70, '11/01/2020', '2000.00'),
    (11, 220, '27/02/2020', '19000.00'),
    (12, 290, '11/02/2020', '20000.00'),
    (13, 250, '05/03/2020', '17000.00'),
    (14, 260, '10/01/2020', '14000.00'),
    (14, 260, '03/02/2020', '4000.00'),
    (14, 270, '27/02/2020', '2000.00'),
    (14, 280, '10/02/2020', '25000.00');


--comisiones 
INSERT INTO equipo1.comisiones (id_vendedor,mes,venta_total)
VALUES
    ('1', 'Febrero', '38280.00'),
    ('1', 'Marzo', '29000.00'),
    ('2', 'Febrero', '19720.00'),
    ('3', 'Febrero', '11600.00'),
    ('3', 'Marzo', '63800.00'),
    ('4', 'Enero', '11600.00'),
    ('5', 'Enero', '10440.00'),
    ('5', 'Febrero', '47560.00'),
    ('6', 'Enero', '54520.00'),
    ('6', 'Febrero', '19720.00'),
    ('7', 'Enero', '9280.00'),
    ('7', 'Marzo', '15080.00'),
    ('8', 'Febrero', '20880.00'),
    ('9', 'Marzo', '8120.00'),
    ('10', 'Enero', '2320.00'),
    ('11', 'Febrero', '22040.00'),
    ('12', 'Febrero', '23200.00'),
    ('13', 'Marzo', '19720.00'),
    ('14', 'Enero', '16240.00'),
    ('14', 'Febrero', '35960.00');
    
/*3.- Generar un Store Procedure para ingresar o actualizar vendedores.
      El procedimiento almacenado debe validar que un vendedor no este en mas de una zona de venta.*/

CREATE OR REPLACE FUNCTION sp_vendedor(
	id_vendedor int,
	nombre_vendedor varchar(100),
	apellido_vendedor varchar(100),
	nombre_zona varchar(100)
	)
RETURNS TEXT AS $$
DECLARE
	existe int;
	mensaje TEXT;
BEGIN
	SELECT INTO existe COUNT(equipo1.vendedor.nombre_zona) FROM equipo1.vendedor WHERE sp_vendedor.id_vendedor=equipo1.vendedor.id_vendedor;
	IF (existe = 1) THEN
 		UPDATE equipo1.vendedor 
		SET nombre_vendedor = sp_vendedor.nombre_vendedor,
			apellido_vendedor = sp_vendedor.apellido_vendedor,
			nombre_zona = sp_vendedor.nombre_zona
		WHERE equipo1.vendedor.id_vendedor = sp_vendedor.id_vendedor;
		mensaje := 'Se ha realizado la actualización';
	ELSE 
		INSERT INTO equipo1.vendedor VALUES (sp_vendedor.id_vendedor, sp_vendedor.nombre_vendedor,sp_vendedor.apellido_vendedor,sp_vendedor.nombre_zona);
		mensaje := 'Se ha realizado la inserción';
	END IF;
	RETURN mensaje;
end; 
$$ LANGUAGE plpgsql;

DROP FUNCTION sp_vendedor();

SELECT sp_vendedor(16,'Diego','Aldama','CDMX NORTE');



/*Generar un Store Procedure para obtener el nombre del cliente y la zona a la que
  pertenece dado su IDC. ( El IDC se ingresa como parámetro del SP)*/

CREATE OR REPLACE FUNCTION  clienteZona(INTEGER) RETURNS TABLE (
    	nombre_cliente VARCHAR(100),
    	nombre_zona VARCHAR(100))
    LANGUAGE plpgsql AS
	$func$
	BEGIN
	RETURN QUERY
		SELECT c.nombre_cliente, z.nombre_zona
		FROM equipo1.cliente c
		INNER JOIN equipo1.zona z
		ON c.nombre_zona = z.nombre_zona
		WHERE c.id_cliente = $1;
	END
	$func$;

DROP FUNCTION clienteZona ;
	
SELECT * FROM clienteZona(150);


--eder, fco



--ivan
CREATE VIEW equipo1.auditoría AS SELECT to_char(Ve.fecha, 'MM/YY') AS mes, V.id_vendedor, V.nombre_zona, clasificar(to_char(Ve.fecha, 'MM/YY'), V.nombre_zona), COUNT(*),
   	 CASE WHEN (to_char(Ve.fecha, 'MM/YY') > '03/20') THEN to_char((porcentaje_comision(clasificar(to_char(Ve.fecha, 'MM/YY'), V.nombre_zona)))*100,'fm99%') ELSE to_char(9,'fm99%') END AS PCOM, sum(importe*1.16::money) AS venta_total_mensual
   	 , CASE WHEN (to_char(Ve.fecha, 'MM/YY') > '03/20') THEN (porcentaje_comision(clasificar(to_char(Ve.fecha, 'MM/YY'), V.nombre_zona))) ELSE 0.09 END * sum(importe*1.16::money) AS comision
   	 , porcentaje_penalisacion(CASE WHEN (to_char(Ve.fecha, 'MM/YY') > '03/20') THEN (porcentaje_comision(clasificar(to_char(Ve.fecha, 'MM/YY'), V.nombre_zona))) ELSE 0.09 END * sum(importe*1.16::money)
   							   , to_char(Ve.fecha, 'MM/YY'), V.id_vendedor) as penalizacion
   	 , ((CASE WHEN (to_char(Ve.fecha, 'MM/YY') > '03/20') THEN (porcentaje_comision(clasificar(to_char(Ve.fecha, 'MM/YY'), V.nombre_zona))) ELSE 0.09 END * sum(importe*1.16::money)) - (porcentaje_penalisacion(
   		 CASE WHEN (to_char(Ve.fecha, 'MM/YY') > '03/20') THEN (porcentaje_comision(clasificar(to_char(Ve.fecha, 'MM/YY'), V.nombre_zona))) ELSE 0.09 END * sum(importe*1.16::money)
   							   , to_char(Ve.fecha, 'MM/YY'), V.id_vendedor))) AS comisionT
   	 FROM equipo1.vendedor AS V
   	 INNER JOIN equipo1.venta As Ve on (V.id_vendedor = Ve.id_vendedor)
   	 GROUP BY to_char(Ve.fecha, 'MM/YY'), V.id_vendedor
   	 order by V.id_vendedor;
   	 
SELECT to_char(fecha, 'MM/YY') AS mes, id_vendedor, COUNT(*) FROM equipo1.venta
GROUP BY to_char(fecha, 'MM/YY'), id_vendedor
order by id_vendedor;
SELECT to_char(fecha, 'MM/YY'),to_char(fecha, 'MM/YY') > '02/20' FROM equipo1.venta

--funcion que calcuala el promedio del total de las ventas de cada mes
DROP FUNCTION promedio_mensual(TEXT);
CREATE OR REPLACE FUNCTION promedio_mensual(mesAnio TEXT) RETURNS money AS $$
DECLARE    
    resultado money;
BEGIN   	 
    CREATE TEMPORARY TABLE promedio AS (SELECT to_char(fecha, 'MM/YY') AS mes, AVG(importe)::money AS promedio FROM equipo1.venta AS V INNER JOIN equipo1.vendedor AS Ve ON (V.id_vendedor = Ve.id_vendedor) group by to_char(fecha, 'MM/YY'));
    resultado = (SELECT promedio FROM promedio WHERE mes = mesAnio);
    DROP TABLE promedio;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;


--SELECT promedio_mensual('01/20');
-------------------------------------------------------------
--funcion que calcuala las ventas totales de cada zona por mes
DROP FUNCTION ventaTotal_zona_mensual(TEXT, VARCHAR);
CREATE OR REPLACE FUNCTION ventaTotal_zona_mensual(mesAnio TEXT, zona VARCHAR) RETURNS money AS $$
DECLARE    
    resultado money;
BEGIN   	 
    CREATE TEMPORARY TABLE venta_zona AS (SELECT to_char(fecha, 'MM/YY') AS mes, nombre_zona, SUM(importe)::money AS suma FROM equipo1.venta AS V INNER JOIN equipo1.vendedor AS Ve ON (V.id_vendedor = Ve.id_vendedor) group by nombre_zona, to_char(fecha, 'MM/YY'));
    resultado = (SELECT suma FROM venta_zona WHERE mes = mesAnio AND nombre_zona = zona);
    DROP TABLE venta_zona;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;


--SELECT ventaTotal_zona_mensual('02/20', 'CDMX SUR');
-------------------------------------------------------------
--FUNCION PARA DETERMINAR LA CLASIFICACION DE LA ZONA MEDIANTE LAS VENTASS DE CADA MES
DROP FUNCTION clasificar(TEXT, VARCHAR);
CREATE OR REPLACE FUNCTION clasificar(mesAnio TEXT, zona VARCHAR) RETURNS CHAR AS $$
DECLARE
    promedio money;
    total money;
BEGIN    
    promedio = promedio_mensual(mesAnio);
    total = ventaTotal_zona_mensual(mesAnio, zona);
    CASE
   	 WHEN total > (promedio + 20000::money) THEN RETURN 'AAA';
   	 WHEN total BETWEEN (promedio - 5000::money) AND (promedio + 20000::money) THEN RETURN 'AA';
   	 ELSE RETURN 'A';
    END CASE;
END;
$$ LANGUAGE plpgsql;

--SELECT clasificar('01/20', 'CDMX CENTRO');--AAA
--SELECT clasificar('01/20', 'CDMX NORTE');--AA
--SELECT clasificar('01/20', 'EDOMEX NORTE');--A
-------------------------------------------------------------
--FUNCION PARA DETERMINAR EL PORCENTAJE DE LA COMISION
DROP FUNCTION porcentaje_comision(nivel CHAR);
CREATE OR REPLACE FUNCTION porcentaje_comision(nivel CHAR) RETURNS FLOAT AS $$
DECLARE    
    porcentaje float;
BEGIN
    CASE nivel
   	 WHEN 'A' THEN RETURN .12;
   	 WHEN 'AA' THEN RETURN .10;
   	 WHEN 'AAA' THEN RETURN .08;
    END CASE;
END;
$$ LANGUAGE plpgsql;

--SELECT porcentaje_comision('A');
-------------------------------------------------------------
--FUNCION PARA DETERMINAR EL PORCENTAJE DE LA PENALISACION
DROP FUNCTION porcentaje_penalisacion(money, text, integer);

CREATE OR REPLACE FUNCTION porcentaje_penalisacion(comision money, fecha1 text, idv integer) RETURNS money AS $$
DECLARE    
    porcentaje float;
BEGIN
    IF (SELECT COUNT(*) > 0 FROM equipo1.penalizaciones where to_char(fecha, 'MM/YY') = fecha1 AND id_vendedor = idv GROUP BY to_char(fecha, 'MM/YY'),id_vendedor) THEN
   	 RETURN comision * 0.02;
    ELSE
   	 RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

--SELECT porcentaje_penalisacion(1000.0, '02/20', 1);


--diego otra vez
--función que verifica si la zona de la venta le pertenece al vendedor 
CREATE OR REPLACE FUNCTION verificar_zona()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
DECLARE
	zona_vendedor VARCHAR(100);
	zona_cliente VARCHAR(100);
BEGIN
	SELECT v.nombre_zona INTO zona_vendedor FROM equipo1.vendedor v WHERE v.id_vendedor = NEW.id_vendedor;
	SELECT c.nombre_zona INTO zona_cliente FROM equipo1.cliente c WHERE c.id_cliente = NEW.id_cliente;
	IF zona_vendedor <> zona_cliente THEN
		 INSERT INTO equipo1.penalizaciones(id_vendedor,fecha)
		 VALUES(NEW.id_vendedor, NEW.fecha);
	END IF;
	RETURN NEW;
END;
$$

--Trigger que ANTES DE INSERTAR EN VENTA, REVISE LA ZONA Y SI NO LE PERTENECE AL VENDEDOR REGISTRE LA PENALIZACIÓN
CREATE TRIGGER penalizacion
BEFORE INSERT ON equipo1.venta
FOR EACH ROW EXECUTE PROCEDURE verificar_zona();

--insert de prueba
INSERT INTO equipo1.venta (id_vendedor,id_cliente,fecha,importe)
VALUES (2, 250, '03/02/2020', '12000.00');