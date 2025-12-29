
-- 1. Eliminar tablas en orden correcto (primero la que tiene la llave foránea)
drop table if exists compras;
drop table if exists clientes;

-- 2. Crear tabla clientes (según tu diagrama)
create table clientes(
    cedula char(10) not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int, -- Opcional según tu primer código
    constraint clientes_pk primary key (cedula)
);

-- 3. Crear tabla compras 
create table compras(
    id_compra int not null,
    cedula char(10) not null,
    fecha_compra date not null,
    monto decimal(10,2) not null,
    constraint compras_pk primary key (id_compra)
);

-- 4. AGREGAR LLAVE FORÁNEA (El error estaba aquí)
-- La tabla 'compras' es la que debe referenciar a 'clientes'
alter table compras
add constraint compras_clientes_fk foreign key (cedula)
references clientes(cedula);

-- 5. INSERTAR CLIENTES (Cumpliendo requisitos: Monica y cédulas con '7')
insert into clientes (cedula, nombre, apellido, edad) values
('1723456789','Monica','Vera',28),    -- Tiene '7' y es Monica
('0912345677','Carlos','Perez',35),   -- Tiene '7'
('1712345678','Ana','Mendoza',22),    -- Tiene '7'
('0923456712','Luis','Torres',40),    -- Tiene '7'
('1709876543','Paola','Rivas',31),    -- Tiene '7'
('0956781237','Mario','Lopez',45),    -- Tiene '7'
('1711122233','Sofia','Cruz',26),
('0998765432','Jorge','Mora',38),
('1722233377','Diana','Paz',29),      -- Tiene '7'
('0917778889','Kevin','Salazar',33);  -- Tiene '7'

-- 6. INSERTAR COMPRAS (Importante: incluir el id_compra)
insert into compras (id_compra, cedula, fecha_compra, monto) values
(1, '1723456789','2023-01-10',120.50),
(2, '1723456789','2023-03-15',250.00),
(3, '0912345677','2023-02-05',340.75),
(4, '1712345678','2023-04-20',89.90),
(5, '0923456712','2023-05-11',560.40),
(6, '0956781237','2023-06-08',410.00),
(7, '1709876543','2023-07-01',199.99),
(8, '1711122233','2023-07-18',320.60),
(9, '1722233377','2023-08-22',145.30),
(10, '0917778889','2023-09-05',780.00);

--- CONSULTAS DE VERIFICACIÓN ---

-- Clientes con '7' en su cédula
select * from clientes where cedula like '%7%';

-- El JOIN que te marcaba error (ahora funcionará)
select 
    c.nombre,
    c.apellido,
    co.id_compra,
    co.fecha_compra,
    co.monto
from clientes c
join compras co on c.cedula = co.cedula;


---- CONSULTAS DEBER 24
select nombre, apellido from clientes
where cedula like '%7%';

select * from clientes
where nombre='Monica'