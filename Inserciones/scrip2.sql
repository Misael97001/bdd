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
