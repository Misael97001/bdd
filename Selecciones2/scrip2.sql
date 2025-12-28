--crea tabla cuentas
drop table cuentas
create table cuentas(
	numero_cuenta char(5) not null,
	cedula_propietario char(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	constraint cuentas_pk primary key (numero_cuenta)
)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('10000','12312','12/10/2021',456.30)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('11000','14312','23/11/2022',869.21)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('11100','32312','09/03/2024',976.46)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('11110','98782','19/03/2022',478.21)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('11111','48382','28/08/2023',786.48)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('20001','42352','18/09/2022',865.38)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('31231','19712','08/11/2024',6514.30)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('18415','41188','14/05/2022',789.60)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('94188','15887','06/03/2021',74595)

insert into cuentas (numero_cuenta,cedula_propietario,fecha_creacion,saldo)
values('64151','84882','13/11/2019',1886.30)

select * from cuentas

select numero_cuenta, saldo from cuentas;

select * from cuentas where fecha_creacion 
    between current_date - interval '2 months' and current_date;

select numero_cuenta, saldo from cuentas where fecha_creacion 
 	between current_date - interval '2 months' and current_date;

update  cuentas set saldo=10   
where cedula_propietario like '17%'


delete from cuentas
where cedula_propietario like '10%';


select * from cuentas
delete from cuentas
--CODIGO PARA AGREGAR UNA COLUMNA
alter table cuentas
--No me permite crear porque no permite null y se crea con null por eso primero puse delete
--add column cedula_codigo char(5) not null
-- creamos la tabla de los usuarios
create table usuario(
	cedula char(5) not null,
	nombre varchar (25) not null,
	apellido varchar(25) not null,
	tipo_cuenta varchar(20) not null,
	limite_credito decimal (10,5),
	constraint usuario_pk primary key (cedula)
)
-- alternamos la llave del estado civil foranea con el de personas
alter table cuentas
add constraint cuentas_usuario_fk foreign key (cedula_propietario)
references usuario(cedula)

insert into usuario values
('12312','Juan','Perez','Ahorros',500.00),
('14312','Maria','Lopez','Corriente',800.00),
('32312','Carlos','Mena','Ahorros',600.00),
('98782','Ana','Vera','Corriente',1000.00),
('48382','Luis','Paz','Ahorros',400.00),
('42352','Elena','Cruz','Corriente',900.00),
('19712','Pedro','Rojas','Ahorros',700.00),
('41188','Lucia','Santos','Corriente',850.00),
('15887','Miguel','Torres','Ahorros',300.00),
('84882','Rosa','Morales','Corriente',1200.00);

insert into cuentas (numero_cuenta, cedula_propietario, fecha_creacion, saldo) values
('30001','12312','2022-08-25',250.50),
('30002','14312','2022-09-10',480.75),
('30003','32312','2022-11-15',920.00),
('30004','98782','2023-01-20',610.30),
('30005','48382','2023-03-05',150.00),
('30006','42352','2023-04-18',780.90),
('30007','19712','2023-06-12',999.99),
('30008','41188','2023-07-30',430.40),
('30009','15887','2023-08-25',560.60),
('30010','84882','2023-09-18',890.00);

select * from cuentas

select * from usuario