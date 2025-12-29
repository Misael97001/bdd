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


----- DEBER FK
CREATE TABLE banco (
	codigo_banco int not null,
	codigo_transaccion int not null,
	detalle varchar(100) not null,
	constraint banco_pk primary key (codigo_banco),
	constraint transacciones_banco_fk foreign key(codigo_transaccion)
	references transacciones(codigo)
)
delete from transacciones
INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) VALUES
(1, '22001', 50.00, 'C', '2023-12-01', '08:00'), -- Condición: código 1 y tipo 'C'
(2, '22002', 100.00, 'C', '2023-12-01', '09:30'), -- Condición: tipo 'C'
(3, '22004', 25.50, 'C', '2023-12-02', '10:15'),  -- Condición: tipo 'C'
(4, '22005', 10.00, 'D', '2023-12-02', '11:00'),
(5, '22001', 200.00, 'D', '2023-12-03', '12:45'),
(6, '22008', 45.00, 'C', '2023-12-03', '14:20'),
(7, '22002', 30.00, 'D', '2023-12-04', '15:10'),
(8, '22010', 500.00, 'C', '2023-12-04', '16:00'),
(9, '22003', 15.00, 'D', '2023-12-05', '17:30'),
(10, '22001', 60.00, 'C', '2023-12-05', '08:50');

INSERT INTO banco (codigo_banco, codigo_transaccion, detalle) 
VALUES (101, 1, 'Depósito por ventanilla - Sean');

--- CODIGOS DE CONSULTA
SELECT * FROM transacciones 
WHERE tipo = 'C' 
AND numero_cuenta BETWEEN '22001' AND '22004';

SELECT * FROM transacciones 
WHERE codigo = 1;

SELECT t.codigo, t.monto, b.detalle 
FROM transacciones t
JOIN banco b ON t.codigo = b.codigo_transaccion;

SELECT tipo, COUNT(*) as total 
FROM transacciones 
GROUP BY tipo;


-- DEBER 24 

select * from transacciones
where tipo='C' and numero_cuenta::numeric between 22001 and 22004;

SELECT * FROM transacciones 
WHERE codigo = (SELECT codigo_transaccion FROM banco WHERE codigo = 1);
