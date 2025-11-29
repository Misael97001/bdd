--crea tabla estudiantes
drop table estudiantes
create table estudiantes(
	cedula char(10) not null,
	nombre varchar(50)not null,
	apellido varchar(50) not null,
	descripcion varchar(50) not null,
	email varchar(50) not null,
	fecha_nacimiento date not null,
	constraint estudiantes_pk primary key (cedula)
)
insert into estudiantes (cedula,nombre,apellido, descripcion,email,fecha_nacimiento)
values ('0123456789','Jefferson','CHAIS','estudiante','jefferson@gmail.com','02/05/1997');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('5485659876','Misael','ARCOS','estudiante','misael@gmail.com','12/08/1996');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('5784565459','Miguel','Bose','profesor','miguel@gmail.com','08/09/1998');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('7985879854','Andres','Benitez','conserje','andres@gmail.com','16/09/2000');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('5436987529','Bayron','Montaluisa','profesor','bayron@gmail.com','12/11/1997');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('4968732156','Goku','Son','padre','goku@gmail.com','10/09/2020');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('3212321231','Amadeus','Guevara','estudiante','amadeus@gmail.com','09/10/1997');

insert into estudiantes (cedula,nombre,apellido,descripcion,email,fecha_nacimiento)
values ('1787656478','Carlos','Tumai','padre','carlos@gmail.com','24/12/1988');

insert into estudiantes (cedula,nombre,apellido,descripcion, email,fecha_nacimiento)
values ('1789758978','Carlos','Cacideo','padre','carlos@gmail.com','24/12/1988');

select * from estudiantes

select nombre, cedula from estudiantes;
select nombre from estudiantes where cedula like '17%';
Select nombre from estudiantes where nombre like 'A%';

update estudiantes set nombre='Hernàdez'
where cedula like '17%'

delete from estudiantes
where cedula like '%05';

select nombre, apellido from estudiantes
where nombre like 'M%' or apellido like '%z';

select nombre from estudiantes 
where cedula ilike '18%' and  cedula like '32%';

select nombre from estudiantes 
where cedula like '%06' and  cedula like '17%';