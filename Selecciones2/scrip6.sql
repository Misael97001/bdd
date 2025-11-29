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
values ('0010','123',300.8,'D','11/09/2020','16:12')

insert into transacciones (codigo,numero_cuenta,monto,tipo,fecha,hora)
values ('0130','123',300.8,'D','11/09/2020','16:12')


select * from transacciones

select * from transacciones where tipo = 'D';
select * from transacciones where monto::numeric between 200 and 2000 ;
select codigo,monto,tipo,fecha from transacciones where fecha is not null;

update transacciones set Tipo='T'
where monto::numeric>100 and monto::numeric<500
and extract(month from fecha)=9 and hora between '14:00' and '20:00'

delete from transacciones
where extract(month from fecha)=8
	and extract(year from fecha)=2025
	and hora between '14:00' and '18:00'

select * from transacciones
where tipo='C' and
numero_cuenta::int between 222001 and 22004;

select * from transacciones
where tipo='D' and fecha='25/05/2025'
and numero_cuenta::int between 22007 and 22010;

select * from transacciones
where (codigo between 1 and 5) and
(numero_cuenta::int between 22002 and 22004) 
and extract(month from fecha)=5 
and extract(day from fecha) in (26,29);