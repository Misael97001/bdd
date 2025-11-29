--crea tabla estudiantes
drop table estudiante
create table estudiantes(
	cedula char(10) not null,
	nombre varchar(50)not null,
	descripcion varchar(50) not null,
	email varchar(50) not null,
	fecha_nacimiento date not null,
	constraint estudiantes_pk primary key (cedula)
)
insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('0123456789','Jefferson','estudiante','jefferson@gmail.com','02/05/1997')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('5485659876','Misael','estudiante','misael@gmail.com','12/08/1996')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('5784565459','Miguel','profesor','miguel@gmail.com','08/09/1998')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('7985879854','Andres','conserje','andres@gmail.com','16/09/2000')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('5436987529','Bayron','profesor','bayron@gmail.com','12/11/1997')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('4968732156','Goku','padre','goku@gmail.com','10/09/2020')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('3212321231','Amadeus','estudiante','amadeus@gmail.com','09/10/1997')

insert into estudiantes (cedula,nombre,descripcion,email,fecha_nacimiento)
values ('1787656478','Carlos','padre','carlos@gmail.com','24/12/1988')

select * from estudiantes

select nombre, cedula from estudiantes;
select nombre from estudiantes where cedula like '17%';
Select nombre from estudiantes where nombre like 'A%';

update estudiantes set nombre='Hernàdez'
where cedula like '17%'

delete from estudiantes
where cedula like '%05';
