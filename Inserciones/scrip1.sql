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

delete from productos
where descripcion is null;