-- crear table clientess

create table personas(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar (50) not null,
	estatura decimal,
	fecha_nacimiento date,
	hora_nacimiento time,
	cantidad_ahorrada money,
	numero_hijos int,
	constraint personas_pk primary key (cedula)
)
insert into personas (cedula, nombre,apellido)
values ('1234567890','Santiago', 'Mosquera');

insert into personas (cedula, nombre,apellido)
values ('4034567875','Pepe', 'Mujica');


insert into personas (cedula, nombre,apellido)
values ('0234567834','Andres', 'Falconi');

insert into personas (cedula, nombre,apellido, numero_hijos, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada)
values ('1734564767','Adrian', 'Perez',1,1.58,'22/05/2000','22:54', 200.34);

insert into personas (cedula, nombre,apellido, hora_nacimiento)
values ('1765432105','Carlos', 'Villacres','10:54');

select * from personas where hora_nacimiento > '09:00:00'

select * from personas
delete from personas

--CODIGO PARA AGREGAR UNA COLUMNA
alter table personas
--No me permite crear porque no permite null y se crea con null por eso primero puse delete
add column estado_civil_codigo char(1) not null
-- creamos la tabla de los estado civiles
create table estado_civil(
	codigo char (1) not null,
	descripcion varchar(20) not null,
	constraint estado_civil_pk primary key (codigo)
)
-- alternamos la llave del estado civil foranea con el de personas
alter table personas
add constraint personas_estado_civil_fk foreign key (estado_civil_codigo)
references estado_civil(codigo)

insert into personas ( cedula, nombre, apellido, estado_civil_codigo)
values ('1723454328','Misael','Chiluisa','U')

select * from estado_civil

insert into estado_civil(codigo,descripcion)
values ('U', 'UNION LIBRE'):

insert into estado_civil(codigo,descripcion)
values ('C', 'CASADO'):

insert into estado_civil(codigo,descripcion)
values ('U', 'UNION LIBRE'):


---- DEBER 
create table prestamo(
	cedula char(10) not null,
	monto money not null,
	fecha_prestamo date not null,
	hora_prestamo time not null,
	garante varchar(40) not null,
	constraint persona_prestamo_fk foreign key(cedula) 
	references personas(cedula)
)

INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos,estado_civil_codigo)
VALUES ('1700000001', 'Sean', 'Anderson', 1.75, '1995-05-20', '14:30:00', 500.00, 0,'U');

-- Insertamos un par de personas más para variar los préstamos
INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos,estado_civil_codigo)
VALUES ('1700000002', 'Maria', 'Lopez', 1.60, '1990-10-10', '09:15:00', 1200.00, 2,'C');

INSERT INTO prestamo (cedula, monto, fecha_prestamo, hora_prestamo, garante) VALUES
('1700000001', 150.00, '2023-11-01', '10:00:00', 'Carlos Ruiz'),   -- Sean ($150)
('1700000001', 800.50, '2023-11-15', '11:30:00', 'Ana Morales'),  -- Sean ($800.50)
('1700000002', 450.00, '2023-11-20', '09:00:00', 'Sean Anderson'),-- ($450)
('1700000002', 1200.00, '2023-12-01', '14:20:00', 'Juan Perez'), 
('1700000001', 95.00, '2023-12-05', '08:45:00', 'Carlos Ruiz'),
('1700000002', 100.00, '2023-12-10', '16:00:00', 'Elena Castro'), -- ($100)
('1700000001', 1000.00, '2023-12-12', '10:10:00', 'Ana Morales'), -- ($1000)
('1700000002', 2500.00, '2023-12-15', '12:00:00', 'Pedro Infante'),
('1700000001', 500.00, '2023-12-20', '11:00:00', 'Carlos Ruiz'),  -- ($500)
('1700000002', 75.00, '2023-12-28', '15:30:00', 'Elena Castro');

SELECT * FROM prestamo 
WHERE monto BETWEEN 100::money AND 1000::money;


select pe.nombre, pe.apellido, pr.monto, pr.garante from personas pe, prestamo pr where pe.cedula=pr.cedula

SELECT p.nombre, pr.monto, pr.fecha_prestamo 
FROM personas p
JOIN prestamo pr ON p.cedula = pr.cedula
WHERE p.nombre = 'Sean';


-- DEBER 24 CONSULTAS
select pe.cantidad_ahorrada, pr.monto, pr.garante from personas pe, prestamo pr
where pr.monto::numeric between 100 and 1000;

select * from personas pe
where pe.cedula=(select cedula from personas where nombre='Sean');

--DEBER 25 CONSULTAS DE AGREGACION
select * from prestamo 

select pr.cedula, sum(pr.monto)from prestamo pr
group by pr.cedula

select count(*) as total_personas from personas
where numero_hijos>1

