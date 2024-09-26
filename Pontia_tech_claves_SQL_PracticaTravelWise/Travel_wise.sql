
###############################
# TRAVEL WISE - SQL
###############################

-- esto es un comentario

## esto tambien

/* 
esto es un comentario en varias lineas
*/

# Para ejecutar UNA query, situarse sobre ella (linea en gris) y pulsar: Ctr + Enter, Command + Enter

###############################
# Creacion base de datos
###############################

# Eliminamos la base de datos si existe
DROP DATABASE IF EXISTS agencia;

# Crear base de datos (database/schema)
CREATE SCHEMA agencia;

# Eliminar base de datos (database/schema)
DROP SCHEMA IF EXISTS agencia;

# Crear base de datos (database/schema)
CREATE DATABASE agencia;

# para entrar en esta base de datos 
USE agencia;

###############################
# Crear tabla
###############################

# Eliminar la tabla si ya existiera
DROP TABLE IF EXISTS viaje_clientes;

# Creamos la tabla
CREATE TABLE viaje_clientes (
    id_viaje INT PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(100),
    email VARCHAR(100),
    fecha_nacimiento DATE,
    tipo_viaje VARCHAR(50),
    destino VARCHAR(100),
    tipo_destino VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    coste DECIMAL(10, 2),
    es_nacional VARCHAR(100), 
    continente VARCHAR(50)
);

# Insertamos datos en la tabla
INSERT INTO viaje_clientes (id_viaje, id_cliente, nombre, email, fecha_nacimiento, tipo_viaje, destino, tipo_destino, fecha_inicio, fecha_fin, coste, es_nacional, continente) VALUES
(1, 1, 'Ana Fernández', 'ana.fernandez@gmail.com', '1990-05-15', 'Familiar', 'Sevilla', 'Ciudad', '2024-07-10', '2024-07-17', 1200.00, 'si', 'Europa'),
(2, 2, 'Pedro Gómez', 'pedro.gomez@hotmail.com', '1985-11-23', 'Negocios', 'Madrid', 'Ciudad', '2024-08-05', '2024-08-07', 800.00, 'si', 'Europa'),
(3, 3, 'Laura Martínez', 'laura.martinez@yahoo.com', '1992-03-22', 'Amigos', 'Cancún', 'Playa', '2024-06-10', '2024-06-20', 2500.00, 'no', 'América del Norte'),
(4, 4, 'Carlos Pérez', 'carlos.perez@gmail.com', '1989-09-01', 'Individual', 'Bali', 'Playa', '2024-08-01', '2024-08-10', 3000.00, 'no', 'Asia'),
(5, 5, 'Sofía Rodríguez', 'sofia.rodriguez@hotmail.com', '1995-01-14', 'Familiar', 'Barcelona', 'Ciudad', '2024-07-22', '2024-07-28', 900.00, 'si', 'Europa'),
(6, 6, 'David Sánchez', 'david.sanchez@yahoo.com', '1988-04-05', 'Negocios', 'Berlín', 'Ciudad', '2024-09-15', '2024-09-20', 1800.00, 'no', 'Europa'),
(7, 7, 'María López', 'maria.lopez@gmail.com', '1991-06-10', 'Amigos', 'Ibiza', 'Playa', '2024-07-10', '2024-07-17', 1500.00, 'si', 'Europa'),
(8, 8, 'Juan Torres', 'juan.torres@hotmail.com', '1983-11-28', 'Familiar', 'Malaga', 'Playa', '2024-06-01', '2024-06-08', 1000.00, 'si', 'Europa'),
(9, 9, 'Clara Gómez', 'clara.gomez@yahoo.com', '1994-09-12', 'Negocios', 'Nueva York', 'Ciudad', '2024-08-25', '2024-08-30', 2800.00, 'no', 'América del Norte'),
(10, 10, 'Luis Martínez', 'luis.martinez@gmail.com', '1987-03-19', 'Amigos', 'Tenerife', 'Playa', '2024-09-10', '2024-09-17', 1600.00, 'si', 'Europa'),
(11, 11, 'Patricia Díaz', 'patricia.diaz@hotmail.com', '1993-07-29', 'Individual', 'París', 'Ciudad', '2024-05-15', '2024-05-20', 1300.00, 'no', 'Europa'),
(12, 12, 'Roberto Muñoz', 'roberto.munoz@yahoo.com', '1980-02-14', 'Familiar', 'Londres', 'Ciudad', '2024-07-01', '2024-07-08', 1900.00, 'no', 'Europa'),
(13, 13, 'Sara Pink', 'sara.pink@gmail.com', '1992-05-22', 'Familiar', 'Dubrovnik', 'Playa', '2024-06-10', '2024-06-17', 2300.00, 'no', 'Europa'),
(14, 14, 'Tommy Gold', 'tommy.gold@hotmail.com', '1988-11-15', 'Negocios', 'Shanghái', 'Ciudad', '2024-09-01', '2024-09-05', 1900.00, 'no', 'Asia'),
(15, 15, 'Nina Silver', 'nina.silver@yahoo.com', '1990-03-04', 'Amigos', 'Santorini', 'Playa', '2024-07-14', '2024-07-21', 2400.00, 'no', 'Europa'),
(16, 16, 'Oscar Red', 'oscar.red@gmail.com', '1994-06-18', 'Individual', 'Lima', 'Ciudad', '2024-08-01', '2024-08-08', 1200.00, 'no', 'América del Sur'),
(17, 17, 'Laura White', 'laura.white@hotmail.com', '1986-09-07', 'Familiar', 'Orlando', 'Ciudad', '2024-07-02', '2024-07-09', 3200.00, 'no', 'América del Norte'),
(18, 18, 'Victor Black', 'victor.black@yahoo.com', '1983-12-13', 'Negocios', 'Beijing', 'Ciudad', '2024-05-18', '2024-05-24', 2100.00, 'no', 'Asia'),
(19, 19, 'Irene Grey', 'irene.grey@gmail.com', '1991-10-09', 'Familiar', 'Cancún', 'Playa', '2024-08-15', '2024-08-22', 2500.00, 'no', 'América del Norte'),
(20, 20, 'Adam Blue', 'adam.blue@hotmail.com', '1985-04-20', 'Amigos', 'Lisboa', 'Ciudad', '2024-06-20', '2024-06-27', 1400.00, 'no', 'Europa'),
(21, 21, 'Elsa Violet', 'elsa.violet@yahoo.com', '1990-08-03', 'Familiar', 'Zanzibar', 'Playa', '2024-05-10', '2024-05-17', 2800.00, 'no', 'África'),
(22, 22, 'Hugo Green', 'hugo.green@gmail.com', '1987-02-16', 'Negocios', 'Melbourne', 'Ciudad', '2024-07-08', '2024-07-14', 2200.00, 'no', 'Australia'),
(23, 23, 'Maria Rose', 'maria.rose@yahoo.com', '1989-01-30', 'Amigos', 'Dubái', 'Ciudad', '2024-06-12', '2024-06-19', 2900.00, 'no', 'Asia'),
(24, 24, 'Peter Orange', 'peter.orange@hotmail.com', '1993-03-17', 'Individual', 'Marrakech', 'Ciudad', '2024-05-22', '2024-05-29', 1700.00, 'no', 'África'),
(25, 25, 'Sophia Indigo', 'sophia.indigo@gmail.com', '1995-07-12', 'Familiar', 'Mykonos', 'Playa', '2024-08-03', '2024-08-11', 2600.00, 'no', 'Europa'),
(26, 26, 'Chris Silver', 'chris.silver@hotmail.com', '1982-11-25', 'Negocios', 'Munich', 'Ciudad', '2024-04-15', '2024-04-20', 1500.00, 'no', 'Europa'),
(27, 27, 'Isabel Cyan', 'isabel.cyan@yahoo.com', '1988-05-22', 'Familiar', 'Buenos Aires', 'Ciudad', '2024-07-19', '2024-07-27', 1800.00, 'no', 'América del Sur'),
(28, 28, 'Andrés Gold', 'andres.gold@gmail.com', '1996-09-30', 'Amigos', 'Barcelona', 'Ciudad', '2024-07-23', '2024-07-29', 1100.00, 'si', 'Europa'),
(29, 29, 'Javier Grey', 'javier.grey@hotmail.com', '1985-01-18', 'Individual', 'Asturias', 'Montaña', '2024-06-12', '2024-06-18', 1300.00, 'si', 'Europa'),
(30, 30, 'Elena Black', 'elena.black@gmail.com', '1992-11-08', 'Familiar', 'Cuenca', 'Ciudad', '2024-09-03', '2024-09-10', 1000.00, 'si', 'Europa'),
(31, 31, 'Carla Brown', 'carla.brown@yahoo.com', '1987-04-21', 'Familiar', 'Toledo', 'Ciudad', '2024-08-22', '2024-08-28', 900.00, 'si', 'Europa'),
(32, 1, 'Ana Fernández', 'ana.fernandez@gmail.com', '1990-05-15', 'Familiar', 'Granada', 'Ciudad', '2024-06-10', '2024-06-17', 1200.00, 'si', 'Europa'),
(33, 2, 'Pedro Gómez', 'pedro.gomez@hotmail.com', '1985-11-23', 'Individual', 'Sevilla', 'Ciudad', '2024-07-25', '2024-07-29', 950.00, 'si', 'Europa'),
(34, 3, 'Laura Martínez', 'laura.martinez@yahoo.com', '1992-03-22', 'Familiar', 'Madrid', 'Ciudad', '2024-06-02', '2024-06-08', 1350.00, 'si', 'Europa'),
(35, 4, 'Carlos Pérez', 'carlos.perez@gmail.com', '1989-09-01', 'Amigos', 'Ávila', 'Montaña', '2024-08-01', '2024-08-06', 700.00, 'si', 'Europa'),
(36, 5, 'Sofía Rodríguez', 'sofia.rodriguez@hotmail.com', '1995-01-14', 'Amigos', 'Salamanca', 'Ciudad', '2024-07-10', '2024-07-15', 850.00, 'si', 'Europa'),
(37, 6, 'David Sánchez', 'david.sanchez@yahoo.com', '1988-04-05', 'Familiar', 'Málaga', 'Playa', '2024-08-18', '2024-08-25', 1300.00, 'si', 'Europa'),
(38, 7, 'María López', 'maria.lopez@gmail.com', '1991-06-10', 'Familiar', 'Bilbao', 'Ciudad', '2024-07-03', '2024-07-08', 950.00, 'si', 'Europa'),
(39, 8, 'Juan Torres', 'juan.torres@hotmail.com', '1983-11-28', 'Familiar', 'Valencia', 'Playa', '2024-08-22', '2024-08-28', 1150.00, 'si', 'Europa'),
(40, 9, 'Clara Gómez', 'clara.gomez@yahoo.com', '1994-09-12', 'Amigos', 'Barcelona', 'Ciudad', '2024-06-15', '2024-06-21', 1400.00, 'si', 'Europa'),
(41, 10, 'Luis Martínez', 'luis.martinez@gmail.com', '1987-03-19', 'Familiar', 'Córdoba', 'Ciudad', '2024-09-02', '2024-09-09', 1000.00, 'si', 'Europa'),
(42, 11, 'Patricia Díaz', 'patricia.diaz@hotmail.com', '1993-07-29', 'Individual', 'Cusco', 'Montaña', '2024-07-03', '2024-07-10', 2100.00, 'no', 'América del Sur'),
(43, 12, 'Roberto Muñoz', 'roberto.munoz@yahoo.com', '1980-02-14', 'Amigos', 'Lisboa', 'Ciudad', '2024-08-05', '2024-08-10', 1600.00, 'no', 'Europa'),
(44, 13, 'Sara Pink', 'sara.pink@gmail.com', '1992-05-22', 'Familiar', 'Oporto', 'Ciudad', '2024-06-18', '2024-06-22', 1200.00, 'no', 'Europa'),
(45, 14, 'Tommy Gold', 'tommy.gold@hotmail.com', '1988-11-15', 'Amigos', 'Santander', 'Playa', '2024-09-15', '2024-09-22', 900.00, 'si', 'Europa'),
(46, 15, 'Nina Silver', 'nina.silver@yahoo.com', '1990-03-04', 'Amigos', 'Marrakech', 'Ciudad', '2024-07-10', '2024-07-16', 2000.00, 'no', 'África'),
(47, 16, 'Oscar Red', 'oscar.red@gmail.com', '1994-06-18', 'Familiar', 'Tokio', 'Ciudad', '2024-08-01', '2024-08-07', 2700.00, 'no', 'Asia'),
(48, 17, 'Laura White', 'laura.white@hotmail.com', '1986-09-07', 'Amigos', 'Atenas', 'Ciudad', '2024-07-14', '2024-07-21', 1400.00, 'no', 'Europa'),
(49, 18, 'Victor Black', 'victor.black@yahoo.com', '1983-12-13', 'Negocios', 'Lima', 'Ciudad', '2024-09-12', '2024-09-16', 2200.00, 'no', 'América del Sur'),
(50, 19, 'Irene Grey', 'irene.grey@gmail.com', '1991-10-09', 'Individual', 'Miami', 'Playa', '2024-06-03', '2024-06-10', 2400.00, 'no', 'América del Norte'),
(51, 20, 'Adam Blue', 'adam.blue@hotmail.com', '1985-04-20', 'Amigos', 'Amsterdam', 'Ciudad', '2024-09-01', '2024-09-08', 1800.00, 'no', 'Europa'),
(52, 21, 'Elsa Violet', 'elsa.violet@yahoo.com', '1990-08-03', 'Familiar', 'Málaga', 'Playa', '2024-08-21', '2024-08-28', 1250.00, 'si', 'Europa'),
(53, 22, 'Hugo Green', 'hugo.green@gmail.com', '1987-02-16', 'Negocios', 'Tokio', 'Ciudad', '2024-06-10', '2024-06-17', 3100.00, 'no', 'Asia'),
(54, 23, 'Maria Rose', 'maria.rose@yahoo.com', '1989-01-30', 'Amigos', 'Valencia', 'Playa', '2024-07-01', '2024-07-07', 950.00, 'si', 'Europa'),
(55, 24, 'Peter Orange', 'peter.orange@hotmail.com', '1993-03-17', 'Familiar', 'Santiago de Chile', 'Ciudad', '2024-09-12', '2024-09-20', 2500.00, 'no', 'América del Sur'),
(56, 25, 'Sophia Indigo', 'sophia.indigo@gmail.com', '1995-07-12', 'Amigos', 'Ibiza', 'Playa', '2024-08-22', '2024-08-28', 1900.00, 'si', 'Europa'),
(57, 26, 'Chris Silver', 'chris.silver@hotmail.com', '1982-11-25', 'Individual', 'Bangkok', 'Ciudad', '2024-07-14', '2024-07-20', 2200.00, 'no', 'Asia'),
(58, 27, 'Isabel Cyan', 'isabel.cyan@yahoo.com', '1988-05-22', 'Amigos', 'Cusco', 'Montaña', '2024-06-15', '2024-06-22', 2700.00, 'no', 'América del Sur'),
(59, 28, 'Andrés Gold', 'andres.gold@gmail.com', '1996-09-30', 'Amigos', 'Londres', 'Ciudad', '2024-08-10', '2024-08-17', 1600.00, 'no', 'Europa'),
(60, 29, 'Javier Grey', 'javier.grey@hotmail.com', '1985-01-18', 'Individual', 'Moscú', 'Ciudad', '2024-06-05', '2024-06-12', 2100.00, 'no', 'Europa'),
(61, 30, 'Elena Black', 'elena.black@gmail.com', '1992-02-02', 'Familiar', 'Sevilla', 'Ciudad', '2024-09-12', '2024-09-18', 1100.00, 'si', 'Europa'),
(62, 12, 'Roberto Muñoz', 'roberto.munoz@yahoo.com', '1980-02-14', 'Negocios', 'Valencia', 'Ciudad', '2024-07-01', '2024-07-05', 1700.00, 'si', 'Europa'),
(63, 11, 'Patricia Díaz', 'patricia.diaz@hotmail.com', '1993-07-29', 'Amigos', 'Toledo', 'Ciudad', '2024-09-08', '2024-09-13', 1100.00, 'si', 'Europa'),
(64, 10, 'Luis Martínez', 'luis.martinez@gmail.com', '1987-03-19', 'Negocios', 'Granada', 'Ciudad', '2024-06-20', '2024-06-25', 1800.00, 'si', 'Europa'),
(65, 9, 'Clara Gómez', 'clara.gomez@yahoo.com', '1994-09-12', 'Individual', 'Salamanca', 'Ciudad', '2024-08-05', '2024-08-10', 1000.00, 'si', 'Europa'),
(66, 8, 'Juan Torres', 'juan.torres@hotmail.com', '1983-11-28', 'Amigos', 'Cádiz', 'Playa', '2024-07-02', '2024-07-08', 1400.00, 'si', 'Europa'),
(67, 7, 'María López', 'maria.lopez@gmail.com', '1991-06-10', 'Amigos', 'Toledo', 'Ciudad', '2024-08-25', '2024-08-30', 1000.00, 'si', 'Europa'),
(68, 6, 'David Sánchez', 'david.sanchez@yahoo.com', '1988-04-05', 'Negocios', 'Londres', 'Ciudad', '2024-06-01', '2024-06-05', 2000.00, 'no', 'Europa'),
(69, 5, 'Sofía Rodríguez', 'sofia.rodriguez@hotmail.com', '1995-01-14', 'Familiar', 'Málaga', 'Playa', '2024-07-28', '2024-08-04', 1500.00, 'si', 'Europa'),
(70, 4, 'Carlos Pérez', 'carlos.perez@gmail.com', '1989-09-01', 'Familiar', 'Palma de Mallorca', 'Playa', '2024-06-05', '2024-06-12', 1800.00, 'si', 'Europa'),
(71, 3, 'Laura Martínez', 'laura.martinez@yahoo.com', '1992-03-22', 'Amigos', 'Roma', 'Ciudad', '2024-08-20', '2024-08-25', 1600.00, 'no', 'Europa'),
(72, 2, 'Pedro Gómez', 'pedro.gomez@hotmail.com', '1985-11-23', 'Amigos', 'Nápoles', 'Ciudad', '2024-07-15', '2024-07-20', 1500.00, 'no', 'Europa'),
(73, 1, 'Ana Fernández', 'ana.fernandez@gmail.com', '1990-05-15', 'Amigos', 'Ibiza', 'Playa', '2024-09-01', '2024-09-08', 1600.00, 'si', 'Europa'),
(74, 2, 'Pedro Gómez', 'pedro.gomez@hotmail.com', '1985-11-23', 'Familiar', 'Toledo', 'Ciudad', '2024-07-20', '2024-07-24', 900.00, 'si', 'Europa'),
(75, 3, 'Laura Martínez', 'laura.martinez@yahoo.com', '1992-03-22', 'Individual', 'Tokio', 'Ciudad', '2024-08-12', '2024-08-19', 3200.00, 'no', 'Asia'),
(76, 4, 'Carlos Pérez', 'carlos.perez@gmail.com', '1989-09-01', 'Negocios', 'Sídney', 'Ciudad', '2024-09-15', '2024-09-22', 3500.00, 'no', 'Australia'),
(77, 5, 'Sofía Rodríguez', 'sofia.rodriguez@hotmail.com', '1995-01-14', 'Familiar', 'Tenerife', 'Playa', '2024-07-15', '2024-07-22', 1400.00, 'si', 'Europa'),
(78, 6, 'David Sánchez', 'david.sanchez@yahoo.com', '1988-04-05', 'Individual', 'Buenos Aires', 'Ciudad', '2024-08-05', '2024-08-12', 1800.00, 'no', 'América del Sur'),
(79, 7, 'María López', 'maria.lopez@gmail.com', '1991-06-10', 'Amigos', 'Londres', 'Ciudad', '2024-06-20', '2024-06-27', 2000.00, 'no', 'Europa'),
(80, 8, 'Juan Torres', 'juan.torres@hotmail.com', '1983-11-28', 'Familiar', 'Paris', 'Ciudad', '2024-09-01', '2024-09-07', 1800.00, 'no', 'Europa'),
(81, 9, 'Clara Gómez', 'clara.gomez@yahoo.com', '1994-09-12', 'Negocios', 'Lisboa', 'Ciudad', '2024-07-10', '2024-07-13', 1000.00, 'no', 'Europa'),
(82, 10, 'Luis Martínez', 'luis.martinez@gmail.com', '1987-03-19', 'Familiar', 'Roma', 'Ciudad', '2024-09-02', '2024-09-09', 2300.00, 'no', 'Europa'),
(83, 11, 'Patricia Díaz', 'patricia.diaz@hotmail.com', '1993-07-29', 'Amigos', 'Atenas', 'Ciudad', '2024-06-01', '2024-06-06', 1500.00, 'no', 'Europa'),
(84, 12, 'Roberto Muñoz', 'roberto.munoz@yahoo.com', '1980-02-14', 'Familiar', 'Asturias', 'Montaña', '2024-08-03', '2024-08-10', 1100.00, 'si', 'Europa'),
(85, 13, 'Sara Pink', 'sara.pink@gmail.com', '1992-05-22', 'Individual', 'Bangkok', 'Ciudad', '2024-07-20', '2024-07-27', 2600.00, 'no', 'Asia'),
(86, 14, 'Tommy Gold', 'tommy.gold@hotmail.com', '1988-11-15', 'Negocios', 'Málaga', 'Ciudad', '2024-05-01', '2024-05-03', 700.00, 'si', 'Europa'),
(87, 15, 'Nina Silver', 'nina.silver@yahoo.com', '1990-03-04', 'Familiar', 'Sevilla', 'Ciudad', '2024-09-15', '2024-09-20', 900.00, 'si', 'Europa'),
(88, 16, 'Oscar Red', 'oscar.red@gmail.com', '1994-06-18', 'Amigos', 'Cuenca', 'Ciudad', '2024-08-14', '2024-08-19', 800.00, 'si', 'Europa'),
(89, 17, 'Laura White', 'laura.white@hotmail.com', '1986-09-07', 'Familiar', 'Bruselas', 'Ciudad', '2024-07-18', '2024-07-25', 1900.00, 'no', 'Europa'),
(90, 18, 'Victor Black', 'victor.black@yahoo.com', '1983-12-13', 'Negocios', 'Dubai', 'Ciudad', '2024-09-11', '2024-09-14', 3000.00, 'no', 'Asia'),
(91, 19, 'Irene Grey', 'irene.grey@gmail.com', '1991-10-09', 'Individual', 'Miami', 'Ciudad', '2024-07-09', '2024-07-16', 2400.00, 'no', 'América del Norte'),
(92, 20, 'Adam Blue', 'adam.blue@hotmail.com', '1985-04-20', 'Amigos', 'Lisboa', 'Ciudad', '2024-07-12', '2024-07-18', 1500.00, 'no', 'Europa'),
(93, 21, 'Elsa Violet', 'elsa.violet@yahoo.com', '1990-08-03', 'Familiar', 'Marrakech', 'Ciudad', '2024-09-02', '2024-09-08', 1700.00, 'no', 'África'),
(94, 22, 'Hugo Green', 'hugo.green@gmail.com', '1987-02-16', 'Negocios', 'Bruselas', 'Ciudad', '2024-06-05', '2024-06-08', 1400.00, 'no', 'Europa'),
(95, 23, 'Maria Rose', 'maria.rose@yahoo.com', '1989-01-30', 'Amigos', 'Córdoba', 'Ciudad', '2024-08-11', '2024-08-15', 900.00, 'si', 'Europa'),
(96, 24, 'Peter Orange', 'peter.orange@hotmail.com', '1993-03-17', 'Familiar', 'Santiago de Chile', 'Ciudad', '2024-07-22', '2024-07-30', 2100.00, 'no', 'América del Sur'),
(97, 25, 'Sophia Indigo', 'sophia.indigo@gmail.com', '1995-07-12', 'Amigos', 'Valencia', 'Playa', '2024-07-28', '2024-08-02', 900.00, 'si', 'Europa'),
(98, 26, 'Chris Silver', 'chris.silver@hotmail.com', '1982-11-25', 'Individual', 'Osaka', 'Ciudad', '2024-08-10', '2024-08-18', 2800.00, 'no', 'Asia'),
(99, 27, 'Isabel Cyan', 'isabel.cyan@yahoo.com', '1988-05-22', 'Familiar', 'Cusco', 'Montaña', '2024-08-19', '2024-08-26', 2700.00, 'no', 'América del Sur'),
(100, 28, 'Andrés Gold', 'andres.gold@gmail.com', '1996-09-30', 'Familiar', 'Granada', 'Ciudad', '2024-05-05', '2024-05-10', 800.00, 'si', 'Europa'),
(101, 29, 'Javier Grey', 'javier.grey@hotmail.com', '1985-01-18', 'Amigos', 'Oporto', 'Ciudad', '2024-07-30', '2024-08-05', 1300.00, 'no', 'Europa'),
(102, 30, 'Elena Black', 'elena.black@gmail.com', '1992-11-08', 'Negocios', 'Melbourne', 'Ciudad', '2024-08-02', '2024-08-07', 2700.00, 'no', 'Australia'),
(103, 31, 'Carla Brown', 'carla.brown@yahoo.com', '1987-04-21', 'Familiar', 'Salamanca', 'Ciudad', '2024-06-01', '2024-06-05', 1000.00, 'si', 'Europa');


###############################
# Consultas
###############################

# 1. Visualizar toda la informacion de la tabla 'viaje_clientes'

SELECT * FROM viaje_clientes;

# 2. Contar el numero de registros totales que tenemos en nuestra tabla 'viaje_clientes'

SELECT COUNT(*) FROM viaje_clientes;

# 3. La agencia quiere ver todos los destinos únicos a los que sus clientes han viajado

SELECT distinct destino FROM viaje_clientes;

# 4. Mostrar todos los viajes que fueron realizados dentro de España

SELECT * FROM viaje_clientes
WHERE es_nacional='si';

# ordenar los datos alfabeticamente por nombre y fecha_inicio

SELECT * FROM viaje_clientes
WHERE es_nacional='si'
ORDER BY nombre, fecha_inicio;

# 5. Encontrar a los clientes que han realizado viajes a destino 'playa'
# mostrar el nombre del cliente, el nombre del destino y el tipo de destino
# ordenar por nombre y destino

SELECT nombre, destino, tipo_destino FROM viaje_clientes
WHERE tipo_destino='playa'
ORDER BY nombre, destino;

# 6. La agencia está interesada en ver los clientes que han viajado a América del Norte o Europa.
# ordenar por continente y destino

SELECT * FROM viaje_clientes
WHERE continente IN ('Europa','America del norte')
ORDER BY continente, destino;

# 7. La agencia quiere saber cuánto dinero han gastado en total los clientes 

SELECT SUM(coste) AS gasto_total FROM viaje_clientes;

# y ahora unicamente el gasto de los clientes que han hecho viajes dentro de España

SELECT SUM(coste) AS gasto_total_nacional FROM viaje_clientes
WHERE es_nacional='si';

# 8. La agencia quiere ver qué clientes han gastado más de 3000 euros en al menos uno de sus viajes

SELECT * FROM viaje_clientes
WHERE coste>='3000';

# 9. La agencia quiere ver cuántos viajes se han realizado con fecha_inicio septiembre 2024

SELECT * FROM viaje_clientes
WHERE fecha_inicio LIKE '2024-09-%';

SELECT COUNT(*) FROM viaje_clientes
WHERE fecha_inicio LIKE '2024-09-%';

# 10. Obtener el número total de viajes realizados por tipo de destino

SELECT COUNT(*) AS num_total_viajes , tipo_destino FROM viaje_clientes
GROUP BY tipo_destino;

# 11. Calcula el coste promedio de los viajes, agrupados por el tipo_viaje

SELECT ROUND(AVG(coste),2) AS coste_promedio_viajes, tipo_viaje FROM viaje_clientes
GROUP BY tipo_viaje
ORDER BY coste_promedio_viajes DESC;








