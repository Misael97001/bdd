--crea tabla productos
drop table productos
create table productos(
	codigo int not null,
	nombre varchar(50)not null,
	descripcion varchar(200),
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)

insert into productos(codigo,nombre,descripcion,precio,stock)
values(12,'Escoba','Limpieza',1.50,500)

insert into productos(codigo,nombre,descripcion,precio,stock)
values(13,'Pala','Limpieza',3,300)

insert into productos(codigo,nombre,descripcion,precio,stock)
values(14,'Detergente','Limpieza',2.50,200)

insert into productos(codigo,nombre,descripcion,precio,stock)
values(15,'Ollas','Cocina',80,180)

insert into productos(codigo,nombre,descripcion,precio,stock)
values(16,'Cucharas','Cocina',0.50,1200)

select * from productos

insert into productos(codigo,nombre,precio,stock)
values(17,'Tenedores',0.50,1000)

insert into productos(codigo,nombre,precio,stock)
values(18,'Platos',1.25,900)

insert into productos(codigo,nombre,precio,stock)
values(19,'Cucharas',0.50,1200)

select * from productos


select * from productos where nombre like 'Q%';
select * from productos where descripcion is null;
select *from productos where precio between money(2) and money(3);

update productos set stock = 0 where descripcion is null;

delete from productos where descripcion is null;

--------------------- DEBER

--Eliminación de tablas en orden (primero la tabla con la llave foránea)
drop table if exists ventas;
drop table if exists productos;
--Creación de la tabla productos
create table productos(
    codigo int not null,
    nombre varchar(50) not null,
    descripcion varchar(200), -- Permite nulos
    precio money not null,
    stock int not null,
    constraint productos_pk primary key (codigo)
);

create table ventas(
	id_venta int not null,
	codigo_producto int not null,
	fecha_venta date not null,
	cantidad int,
	constraint ventas_pk primary key (id_venta),
	-- Relación: Una venta pertenece a un producto
	constraint ventas_productos_pk foreign key (codigo_producto)
	references productos(codigo)	
)


-- 4. Inserción de 10 productos
-- Requisitos: 3 con letra 'm' y 1 con descripción NULL
insert into productos (codigo, nombre, descripcion, precio, stock) values
(1, 'Monitor Gamer', 'Monitor 144hz 24 pulgadas', 250.00, 15), -- Tiene 'm'
(2, 'Mouse Óptico', 'Mouse ergonómico inalámbrico', 25.50, 50),   -- Tiene 'm'
(3, 'Memoria RAM', 'DDR4 16GB 3200Mhz', 85.00, 30),              -- Tiene 'm'
(4, 'Teclado Mecánico', null, 60.00, 20),                        -- Descripción NULL
(5, 'Procesador i7', '12va Generación', 450.00, 10),
(6, 'Tarjeta Madre', 'Chipset B550', 180.00, 12),
(7, 'Disco SSD', '1TB NVMe Gen4', 110.00, 25),
(8, 'Fuente Poder', '850W Gold Plus', 135.00, 8),
(9, 'Gabinete ATX', 'Panel de vidrio templado', 90.00, 15),
(10, 'Audífonos Pro', 'Cancelación de ruido activa', 120.00, 18);

-- 5. Inserción de 10 ventas
-- Requisito: Al menos 1 venta con cantidad = 5
insert into ventas (id_venta, codigo_producto, fecha_venta, cantidad) values
(101, 1, '2023-10-01', 2),
(102, 2, '2023-10-02', 5), -- Cantidad 5
(103, 3, '2023-10-02', 1),
(104, 4, '2023-10-03', 3),
(105, 1, '2023-10-05', 1),
(106, 10, '2023-10-06', 5), -- Cantidad 5
(107, 7, '2023-10-07', 2),
(108, 5, '2023-10-08', 1),
(109, 8, '2023-10-09', 1),
(110, 2, '2023-10-10', 4);

-- Unir productos con sus ventas para ver el detalle
select 
    p.nombre,
    p.precio,
    v.fecha_venta,
    v.cantidad,
    (p.precio * v.cantidad) as total_venta
from productos p
join ventas v on p.codigo = v.codigo_producto;


--- DEBER 24 CONSULTAS
select p.nombre, p.stock, v.cantidad  from productos p, ventas v
where p.codigo=v.codigo_producto 
and (p.nombre like '%m%' or p.descripcion='0')

select nombre,stock from productos p, ventas v
where v.codigo_producto='5' and p.codigo='5'