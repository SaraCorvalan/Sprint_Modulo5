#Sara Corvalan 
# creacion de base de datos para el sprint Modulo 5 con el comando create database
CREATE DATABASE IF NOT EXISTS `bd_SprintModulo5`;
#comando para hacer uso de la base de datos
USE `bd_SprintModulo5`;
#creacion de tablas con las cuales trabajare para este sprint con el comando create table
# para los id primarios uso el auto_increment
CREATE TABLE Usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  edad INT,
  correo_electronico VARCHAR(100),
  num_veces INT
);
CREATE TABLE Operario (
  id_operario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  edad INT,
  correo_electronico VARCHAR(100),
  num_veces INT
);
# esta tabla llevara las claves foraneas
CREATE TABLE Soporte (
  id_soporte INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_operario INT,
  fecha DATE,
  evaluacion INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_operario) REFERENCES Operario(id_operario)
);
# con el comando insert into se realizan la insercion de los datos de las tablas
INSERT INTO Usuario (nombre, apellido, edad, correo_electronico, num_veces) VALUES
  ('Juan', 'Pérez', 25, 'juan@example.com', 1),
  ('María', 'González', 32, 'maria@example.com', 1),
  ('Pedro', 'López', 40, 'pedro@example.com', 1),
  ('Laura', 'Fernández', 28, 'laura@example.com', 1),
  ('Carlos', 'Ramírez', 37, 'carlos@example.com', 1);

INSERT INTO Operario (nombre, apellido, edad, correo_electronico, num_veces) VALUES
  ('Luis', 'Torres', 30, 'luis@example.com', 1),
  ('Ana', 'Sánchez', 28, 'ana@example.com', 1),
  ('David', 'Martínez', 35, 'david@example.com', 1),
  ('Sofía', 'López', 33, 'sofia@example.com', 1),
  ('Jorge', 'Hernández', 29, 'jorge@example.com', 1);

INSERT INTO Soporte (id_usuario, id_operario, fecha, evaluacion) VALUES
  (1, 3, '2023-07-01', 5),
  (2, 2, '2023-07-02', 6),
  (3, 4, '2023-07-03', 7),
  (4, 1, '2023-07-04', 4),
  (5, 5, '2023-07-05', 7),
  (1, 2, '2023-07-06', 6),
  (3, 5, '2023-07-07', 3),
  (2, 4, '2023-07-08', 5),
  (4, 3, '2023-07-09', 7),
  (5, 1, '2023-07-10', 2);
#Seleccione las 3 operaciones con mejor evaluación.
SELECT * FROM Soporte ORDER BY evaluacion DESC LIMIT 3;

#Seleccione las 3 operaciones con menos evaluación.
SELECT * FROM Soporte ORDER BY evaluacion ASC LIMIT 3;

#Seleccione al operario que más soportes ha realizado.
SELECT Operario.nombre, Operario.apellido, COUNT(Soporte.id_operario) AS total_soportes
FROM Operario
JOIN Soporte ON Operario.id_operario = Soporte.id_operario
GROUP BY Operario.id_operario
ORDER BY total_soportes DESC
LIMIT 1;

#Seleccione al cliente que menos veces ha utilizado la aplicación.
SELECT Usuario.nombre, Usuario.apellido, MIN(Usuario.num_veces) AS min_num_veces
FROM Usuario
GROUP BY Usuario.id_usuario
ORDER BY min_num_veces ASC
LIMIT 1;

#Agregue 10 años a los tres primeros usuarios registrados.
UPDATE Usuario SET edad = edad + 10 WHERE id_usuario IN (1, 2, 3);

#El nuevo nombre debe ser email.
ALTER TABLE Usuario CHANGE correo_electronico email varchar(45);
ALTER TABLE Operario CHANGE correo_electronico email varchar(45);

#Seleccione solo los operarios mayores de 20 años.
SELECT * FROM Operario WHERE edad > 20;


  
