--crea tabla videojuegos
drop table videojuegos
create table videojuegos(
	codigo int not null,
	nombre varchar(100)not null,
	descripcion varchar(300),
	valoracion int not null,
	constraint videojuegos_pk primary key (codigo)
)
insert into videojuegos(codigo,nombre,descripcion,valoracion)
values(1,'DOTA','juego de campos', 10),
(2,'LOL','juego de campos', 10),
(3,'counter','juego de campos',10),
(4, 'Sonic','aventura',9),
(5,'Mario', 'aventura',10);

select * from videojuegos

insert into videojuegos(codigo,nombre,valoracion)
values(6,'Inspecto Gaget', 8),
(7,'Tarzan', 10),
(8,'KOF',10);

select * from videojuegos

select * from videojuegos where nombre like 'c%';
select * from videojuegos where valoracion between 9 and 10;
select * from videojuegos where descripcion is null;

update videojuegos set descripcion='Mejor puntuado'
where valoracion>9