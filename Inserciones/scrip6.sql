--crea tabla transacciones
drop table transacciones
create table transacciones(
	codigo int not null,
	numero_cuenta char(5)not null,
	monto money not null,
	tipo char(1) not null,
	fecha date not null, 
	hora time not null,
	constraint transacciones_pk primary key (codigo)
)
insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora) 
values ('0001','12',140.8,'C','10/10/2018','11:30')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0002','45',340.78,'D','10/11/2018','13:20')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0003','135',1454.8,'D','13/10/2019','14:50')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0004','235',1414.8,'C','25/10/2018','16:53')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0005','145',1457.8,'C','01/04/2019','18:52')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0006','14',440.8,'D','14/06/2017','10:10')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0007','124',540.8,'D','18/107/2018','12:55')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0008','1345',640.8,'C','11/11/2018','19:52')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0009','1234',340.8,'D','12/10/2019','13:32')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0010','123',1780.8,'D','11/12/2020','16:12')


select * from transacciones

select * from transacciones where tipo = 'D';
select * from transacciones where monto::numeric between 200 and 2000 ;
select codigo,monto,tipo,fecha from transacciones where fecha is not null;
