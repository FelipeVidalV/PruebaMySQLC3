#creo esquema para el minimarket de José#
CREATE SCHEMA IF NOT EXISTS minimarket_jose;
#creo todas las tablas (7), ingreso los datos de cada una y establezco sus respectivas PK#
 
 #tabla cliente#
 CREATE TABLE `minimarket_jose`.`cliente`(
`cliente_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NOT NULL,
`rut` VARCHAR(20) NOT NULL,
PRIMARY KEY (`cliente_id`));

 #tabla venta#
 CREATE TABLE `minimarket_jose`.`venta`(
`venta_id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`venta_id`));

 #tabla ventaAnual#
 CREATE TABLE `minimarket_jose`.`ventaAnual`(
`ventaAnual_id` INT NOT NULL AUTO_INCREMENT,
`periodoInicio` DATE NOT NULL,
`periodoFin` DATE NOT NULL,
PRIMARY KEY (`ventaAnual_id`));

 #tabla gananciaAnual#
 CREATE TABLE `minimarket_jose`.`gananciaAnual`(
`gananciaAnual_id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`gananciaAnual_id`));

 #tabla compraAnual#
 CREATE TABLE `minimarket_jose`.`compraAnual`(
`compraAnual_id` INT NOT NULL AUTO_INCREMENT,
`periodoInicio` DATE NOT NULL,
`periodoFin` DATE NOT NULL,
PRIMARY KEY (`compraAnual_id`));

 #tabla proveedor#
 CREATE TABLE `minimarket_jose`.`proveedor`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`tipoProducto` VARCHAR(20) NOT NULL,
`cantidadEnCaja` INT NOT NULL,
`precioCompra` INT NOT NULL,
PRIMARY KEY (`proveedor_id`));

 #tabla producto#
 CREATE TABLE `minimarket_jose`.`producto`(
`producto_id` INT NOT NULL AUTO_INCREMENT,
`tipoProducto` VARCHAR(20) NOT NULL,
`cantidad` INT NOT NULL,
`precioVenta` INT NOT NULL,
PRIMARY KEY (`producto_id`));

#a continuación genero las FK dentro de las tablas que lo requieran y agrego las relaciones entre ellas#

#altero la tabla "venta" y agrego FK "cliente_id"#
ALTER TABLE minimarket_jose.venta ADD cliente_id INT NOT NULL;
#hago la relación "venta_Cliente"#
ALTER TABLE minimarket_jose.venta ADD CONSTRAINT venta_Cliente FOREIGN KEY (cliente_id) REFERENCES minimarket_jose.cliente(cliente_id);

#altero la tabla "venta" y agrego FK "producto_id"#
ALTER TABLE minimarket_jose.venta ADD producto_id INT NOT NULL;
#hago la relación "venta_Producto"#
ALTER TABLE minimarket_jose.venta ADD CONSTRAINT venta_Producto FOREIGN KEY (producto_id) REFERENCES minimarket_jose.producto(producto_id);

#altero la tabla "ventaAnual" y agrego FK "venta_id"#
ALTER TABLE minimarket_jose.ventaAnual ADD venta_id INT NOT NULL;
#hago la relación "ventaAnual_Venta"#
ALTER TABLE minimarket_jose.ventaAnual ADD CONSTRAINT ventaAnual_Venta FOREIGN KEY (venta_id) REFERENCES minimarket_jose.venta(venta_id);

#altero la tabla "gananciaAnual" y agrego FK "ventaAnual_id"#
ALTER TABLE minimarket_jose.gananciaAnual ADD ventaAnual_id INT NOT NULL;
#hago la relación "GananciaAnual_VentaAnual"#
ALTER TABLE minimarket_jose.gananciaAnual ADD CONSTRAINT GananciaAnual_VentaAnual FOREIGN KEY (ventaAnual_id) REFERENCES minimarket_jose.ventaAnual(ventaAnual_id);

#altero la tabla "gananciaAnual" y agrego FK "compraAnual_id"#
ALTER TABLE minimarket_jose.gananciaAnual ADD compraAnual_id INT NOT NULL;
#hago la relación "gananciaAnual_CompraAnual"#
ALTER TABLE minimarket_jose.gananciaAnual ADD CONSTRAINT gananciaAnual_CompraAnual FOREIGN KEY (compraAnual_id) REFERENCES minimarket_jose.compraAnual(compraAnual_id);

#altero la tabla "CompraAnual" y agrego FK "proveedor_id"#
ALTER TABLE minimarket_jose.CompraAnual ADD proveedor_id INT NOT NULL;
#hago la relación "CompraAnual_Proveedor"#
ALTER TABLE minimarket_jose.CompraAnual ADD CONSTRAINT CompraAnual_Proveedor FOREIGN KEY (proveedor_id) REFERENCES minimarket_jose.proveedor(proveedor_id);

#a continuación poblo la base insertando al menos 5 productos y al menos 4 tipos de productos#

#inserto productos en la tabla "producto"#
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('papas fritas', 1, 800);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('cereal', 1 , 3200);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('jugo', 1,  1800);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('agua mineral', 1, 600);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('tallarines', 1, 1200);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('arroz', 1, 900);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('sal', 1, 400);
INSERT INTO minimarket_jose.producto(tipoProducto, cantidad,PrecioVenta) VALUES ('aceite', 1, 10000);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('mantequilla', 1, 3500);
INSERT INTO minimarket_jose.producto (tipoProducto, cantidad,PrecioVenta) VALUES ('kilo de pan', 1, 2900);

#visualizo las instancias de la tabla "producto"#
SELECT * FROM minimarket_jose.producto;

#inserto clientes en la tabla "cliente"#
INSERT INTO minimarket_jose.cliente (nombre, rut) VALUES ('alicia', '18536458-9');
INSERT INTO minimarket_jose.cliente (nombre, rut) VALUES ('alonso','18365478-4');
INSERT INTO minimarket_jose.cliente (nombre, rut) VALUES ('aurora','9365748-0');
INSERT INTO minimarket_jose.cliente (nombre, rut) VALUES ('amelie','14367896-6');
INSERT INTO minimarket_jose.cliente (nombre, rut) VALUES ('ricardo','13967895-4');
INSERT INTO minimarket_jose.cliente (nombre, rut) VALUES ('fernanda','17651734-8');

#visualizo las instancias de la tabla "cliente"#
SELECT * FROM minimarket_jose.cliente;

#creo ventas asociando clientes y productos en la tabla "venta"#
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('1', '5');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('1', '10');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('6', '1');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('4', '9');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('5', '2');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('2', '8');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('3', '3');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('2', '7');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('3', '6');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('5', '5');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('4', '4');
INSERT INTO minimarket_jose.venta (cliente_id, producto_id) VALUES ('6', '3');

#visualizo las instancias de la tabla "venta"#
SELECT * FROM minimarket_jose.venta;

#ingreso cada una de las 12 ventas anteriormente creadas a "ventaAnual e indico que fueron hechas dentro del lapso de un año"#
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 1 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 2 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 3 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 4 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 5 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 6 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 7 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 8 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 9 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 10 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 11 );
INSERT INTO minimarket_jose.ventaAnual (periodoInicio, periodoFin, venta_id) VALUES ('2022-01-01', '2022-12-31', 12 );


#visualizo las instancias de la tabla "ventaAnual"#
SELECT * FROM minimarket_jose.ventaAnual;


#creo un LEFT JOIN para que me muestre las filas de la tabla izquiera y si coinciden datos con la tabla derecha me los muestre también#
#en este caso le hice una consulta para que me mostrara el periodo de un año y los clientes que habían comprado en ese lapso de tiempo#
#uní las tablas "ventaAnual" y "venta"#

SELECT  ventaAnual.periodoInicio, ventaAnual.periodoFin, venta.cliente_id
FROM minimarket_jose.ventaAnual
LEFT JOIN minimarket_jose.venta
ON minimarket_jose.ventaAnual.venta_id = minimarket_jose.venta.venta_id;



