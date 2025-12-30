--crea tabla videojuegos
drop table 
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

delete from videojuegos
where valoracion<7

select * from videojuegos
where nombre ilike '%c%' or
valoracion=7;

select * from videojuegos
where codigo between 3 and 7
and valoracion=7;

select* from videojuegos 
where (descripcion='guerra' 
and valoracion>7 and nombre like 'C%')
or (valoracion>8 and nombre like 'D%');

--- DEBER 23
create table plataformas(
	id_plataforma int not null,
	nombre_plataforma varchar(50)not null,
	codigo_videojuego int not null,
	constraint plataforma_pk primary key (id_plataforma),
	constraint videojuegos_plataformas_fk 
	foreign key (codigo_videojuego)
	references videojuegos(codigo)
);

delete from videojuegos
INSERT INTO videojuegos (codigo, nombre, descripcion, valoracion) VALUES 
(1, 'Call of Duty', 'Juego de Guerra en primera persona', 9),
(2, 'God of war', 'Acción y aventura basada en mitología', 10),
(3, 'Crysis', 'Guerra futurista con nanotrajes', 8),
(4, 'Dark Souls', 'RPG de acción y fantasía oscura', 9),
(5, 'Doom Eternal', 'Guerra contra demonios en el infierno', 9),
(6, 'Civilization VI', 'Estrategia de construcción de imperios', 7),
(7, 'Detroit: Become Human', 'Aventura gráfica sobre androides', 8),
(8, 'Dragon Ball FighterZ', 'Lucha basada en el anime', 9),
(9, 'Counter Strike', 'Guerra táctica entre equipos', 8),
(10, 'Dead Space', 'Horror de supervivencia en el espacio', 10);

INSERT INTO plataformas (id_plataforma, nombre_plataforma, codigo_videojuego) VALUES 
(1, 'PC', 1),
(2, 'PlayStation 5', 2),
(3, 'Xbox Series X', 3),
(4, 'PC', 4),
(5, 'Nintendo Switch', 8),
(6, 'PlayStation 4', 2);


------------ DEBER 24 CONSULTAS
select v.nombre, v.descripcion, v.valoracion, p.nombre_plataforma 
from videojuegos v, plataformas p 
where v.codigo = p.codigo_videojuego 
and (
    (v.descripcion like '%Guerra%' and v.valoracion > 7) 
    or (v.nombre like 'C%' and v.valoracion > 8) 
    or (v.nombre like 'D%')
);
select * from plataformas p
where p.codigo_videojuego=(select codigo from videojuegos where nombre='God of war');

----- DEBER 25 CONSULTAS DE AGREGACION 

SELECT codigo_videojuego, COUNT(*) AS total_plataformas
FROM plataformas
GROUP BY codigo_videojuego;

select ROUND (avg(valoracion),2) as valoracion_promedio from videojuegos
