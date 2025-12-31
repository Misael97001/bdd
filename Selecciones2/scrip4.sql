--crea tabla registros_entrada
drop table registros_entrada
create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint registros_entrada_pk primary key (codigo_registro)
)

insert into registros_entrada (codigo_registro,cedula_empleado,fecha,hora) 
values
(14,'1102457893','13/10/2001','07:45'),
(15,'1723894567','12/11/2001','08:10'),
(16,'0957841236','13/11/2001','06:59'),
(17,'1802345678','14/11/2001','07:30'),
(18,'0912345675','15/11/2001','08:05'),
(19,'1758963241','16/11/2001','07:50'),
(20,'1234598765','17/11/2001','06:45'),
(21,'1712345698','18/11/2001','07:55'),
(22,'0987654321','19/08/2001','08:20'),
(23,'9876543216','21/08/2001','08:30');

select * from registros_entrada

Select cedula_empleado, fecha, hora from registros_entrada;
select * from registros_entrada where hora between '07:00' and '14:00';
select * from registros_entrada where hora > '08:00';

update registros_entrada set cedula_empleado='082345679'
where extract(month from fecha)=8;

delete from registros_entrada
where extract(month from fecha) = 6;

select * from registros_entrada
where extract(month from fecha)=9 or
cedula_empleado like '17%';

select * from registros_entrada
where extract(month from fecha) =8 
and cedula_empleado like '17%'
and hora between '08:00' and '12:00'

select * from registros_entrada
where
(
    extract(month from fecha) = 8
    and cedula_empleado like '17%'
    and hora between '08:00' and '12:00'
)
or
(
   extract (month from fecha) = 9
    and cedula_empleado like '08%'
    and hora between '09:00' and '13:00'
);

-- DEBER DE RELACIONES DE LLAVES

select * from regitros_entrada
delete from registros_entrada
CREATE TABLE empleado (
    codigo_empleado INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT empleado_pk PRIMARY KEY (codigo_empleado)
);

-- Ajustar tu tabla registros_entrada para incluir la llave foránea
ALTER TABLE registros_entrada ADD COLUMN codigo_empleado INT NOT NULL;
ALTER TABLE registros_entrada ADD CONSTRAINT registros_entrada_empleado_fk
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado);

INSERT INTO empleado (codigo_empleado, nombre, fecha, hora) 
VALUES (2201, 'Juan Pérez', '2023-01-15', '08:00:00');

INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora, codigo_empleado) VALUES
(1, '1712345678', '2023-08-05', '08:15:00', 2201),
(2, '1712345678', '2023-08-12', '09:30:00', 2201),
(3, '1712345678', '2023-09-01', '08:05:00', 2201),
(4, '1712345678', '2023-09-20', '10:45:00', 2201),
(5, '1712345678', '2023-10-10', '08:00:00', 2201),
(6, '1712345678', '2023-10-25', '12:20:00', 2201),
(7, '1712345678', '2023-11-05', '08:50:00', 2201),
(8, '1712345678', '2023-11-18', '11:15:00', 2201),
(9, '1712345678', '2023-12-01', '08:10:00', 2201),
(10, '1712345678', '2023-12-20', '13:00:00', 2201);

-- Ver todos los empleados
SELECT * FROM empleado;

-- Ver todos los registros de entrada
SELECT * FROM registros_entrada;

SELECT 
    e.nombre, 
    r.cedula_empleado, 
    r.fecha, 
    r.hora
FROM registros_entrada r
JOIN empleado e ON r.codigo_empleado = e.codigo_empleado;


--- DEBER 24
select re.cedula_empleado, re.fecha, em.nombre 
from registros_entrada re, empleado em 
where re.codigo_empleado = em.codigo_empleado 
and (
    (re.fecha between '2023-08-01' and '2023-08-31') 
    or (re.cedula_empleado like '17%' and re.hora between '08:00' and '12:00') 
    or (re.fecha between '2023-10-06' and '2023-10-20' and re.cedula_empleado like '08%' and re.hora between '09:00' and '13:00')
);

select re.codigo_registro, em.nombre from empleado em,registros_entrada re
where em.codigo_empleado='2201';


--- DEBER 25 REGISTROS ENTRADA Y EMPLEADO4

select cedula_empleado, count(*) as total_registros_entrada
from registros_entrada
group by cedula_empleado

select max (fecha) as fecha_maxima, min(fecha) as fecha_minima
from registros_entrada