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


-- DEBER ------------------------------------------
-- 1. Ver y limpiar la tabla estudiantes para poder agregar la columna NOT NULL
select * from estudiantes;
delete from estudiantes;

drop table estudiantes
create table estudiantes(
	cedula char(10) not null,
	nombre varchar(50)not null,
	apellido varchar(50)not null,
	email varchar(50) not null,
	fecha_nacimiento date not null,
	constraint estudiantes_pk primary key (cedula)
)


-- 2. Agregar la columna de la llave foránea a estudiantes
-- Se hace delete antes porque no permite null al crear la columna
alter table estudiantes
add column codigo_profesor int not null;

-- 3. Crear la tabla de profesores
create table profesores(
    codigo int not null,
    nombre varchar(50) not null,
    constraint profesores_pk primary key (codigo)
);

-- 4. Alternar la tabla estudiantes para crear la llave foránea
alter table estudiantes
add constraint estudiantes_profesores_fk foreign key (codigo_profesor)
references profesores(codigo);

-- 5. Insertar datos en la tabla de profesores (Debe estar el profesor Francisco)
insert into profesores (codigo, nombre) values (1, 'Francisco');
insert into profesores (codigo, nombre) values (2, 'Beatriz');

-- 6. Insertar 10 estudiantes
-- (5 de ellos con la letra 'n' en su apellido y relacionados a Francisco)

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000001', 'Carlos', 'Pinto','carlos@mail.com', '2005-03-15', 1);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000002', 'Ana', 'Montenegro', 'ana@mail.com', '2004-11-20', 1);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000003', 'Luis', 'Cano', 'luis@mail.com', '2005-01-10', 1);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000004', 'Maria', 'Antunez', 'maria@mail.com', '2006-05-22', 1);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000005', 'Jose', 'Bernal', 'jose@mail.com', '2004-08-30', 1);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000006', 'Elena', 'Lopez', 'elena@mail.com', '2005-02-14', 2);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000007', 'Pedro', 'Gomez', 'pedro@mail.com', '2005-07-07', 2);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000008', 'Rosa', 'Perez', 'rosa@mail.com', '2004-12-01', 2);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000009', 'Javier', 'Ruiz', 'javier@mail.com', '2005-09-18', 2);

insert into estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
values ('1750000010', 'Sofia', 'Diaz', 'sofia@mail.com', '2006-01-25', 2);

-- 7. Verificaciones finales
select * from profesores;
select * from estudiantes;


select 
    est.cedula, 
    est.nombre as nombre_estudiante, 
    est.apellido as apellido_estudiante, 
    prof.nombre as nombre_profesor
from estudiantes est
inner join profesores prof on est.codigo_profesor = prof.codigo;