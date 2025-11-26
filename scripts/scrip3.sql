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
