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
(22,'0987654321','19/11/2001','08:20'),
(23,'9876543216','21/11/2001','08:30');

select * from registros_entrada