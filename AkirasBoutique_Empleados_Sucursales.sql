-- =========================================================
-- Actividad 1 - Administraci�n de Bases de Datos
-- Akira's Boutique: tablas Empleados y Sucursales
-- Alumno: Luis Enrique Garc�a Boj�rquez
-- =========================================================
-- Ejecutar DESPU�S de haber importado AkirasBoutique.sql
-- USE AkirasBoutique;  -- descomenta y ajusta al nombre real de tu BD
-- GO

-- ---------------------------------------------------------
-- 1. TABLA SUCURSALES
-- ---------------------------------------------------------
CREATE TABLE Sucursales (
    NumSucursal      INT           PRIMARY KEY,
    NombreSucursal   VARCHAR(100)  NOT NULL,
    Encargado        VARCHAR(100)  NOT NULL,
    Direccion        VARCHAR(150)  NOT NULL,
    Telefono         VARCHAR(20)   NOT NULL,
    Ciudad           VARCHAR(60)   NOT NULL,
    Estado           VARCHAR(60)   NOT NULL
);
GO

INSERT INTO Sucursales (NumSucursal, NombreSucursal, Encargado, Direccion, Telefono, Ciudad, Estado) VALUES
(1, 'Akira''s Boutique: Las Mercedes',    'Sonia Alejandra Fernandez Moreno',   'Calle Roble #507 Fracc. Las Mercedes',            '444 783 1225', 'San Luis Potosi', 'San Luis Potosi'),
(2, 'Akira''s Boutique: Obraje',          'Fernando Calderon Ayala',            'Calle Dr. Jesus Diaz de Leon #438 col. Obraje',   '449 378 0921', 'Aguascalientes',  'Aguascalientes'),
(3, 'Akira''s Boutique: Galerias Mazatlan','Daniela Fernanda Diaz Ordaz',       'Av. de la Marina #6204, Marina, local 35',        '669 293 2059', 'Mazatlan',        'Sinaloa'),
(4, 'Akira''s Boutique: Zapopan',         'Mario Alberto Jimenez Salcido',      'Av. Manuel J. Clouthier 525 col. Benito Juarez',  '333 784 1230', 'Zapopan',         'Jalisco'),
(5, 'Akira''s Boutique: Melchor',         'Yesenia Guadalupe Campos Rojo',      'Av. Melchor Ocampo #2528 Zona Centro',            '614 390 6721', 'Chihuahua',       'Chihuahua'),
(6, 'Akira''s Boutique: Constitucion',    'Tamara Alejandra Bernal Ramos',      'Calle Constitucion #106 Zona Centro',             '618 196 2954', 'Durango',         'Durango'),
(7, 'Akira''s Boutique: Centro',          'Samuel Enrique Barrios Enciso',      'Av. Hidalgo #338 Zacatecas Centro',               '492 930 1250', 'Zacatecas',       'Zacatecas');
GO

-- ---------------------------------------------------------
-- 2. TABLA EMPLEADOS
-- FK a Sucursales para saber a qu� sucursal pertenece cada quien
-- ---------------------------------------------------------
CREATE TABLE Empleados (
    IdEmpleado    INT IDENTITY(1,1) PRIMARY KEY,
    Nombre        VARCHAR(100) NOT NULL,
    Direccion     VARCHAR(150) NOT NULL,
    Telefono      VARCHAR(20)  NOT NULL,
    Edad          INT          NOT NULL CHECK (Edad >= 18),
    NumSucursal   INT          NOT NULL FOREIGN KEY REFERENCES Sucursales(NumSucursal),
    Correo        VARCHAR(100) NOT NULL UNIQUE,
    Contrasena    VARCHAR(100) NOT NULL
);
GO

-- 5 empleados por sucursal x 7 sucursales = 35... la actividad pide m�nimo 40,
-- as� que aqu� van 6 por sucursal (42 en total) para cubrir el m�nimo con margen.
-- El encargado de cada sucursal tambi�n queda registrado como empleado (regla del Paso 7).

INSERT INTO Empleados (Nombre, Direccion, Telefono, Edad, NumSucursal, Correo, Contrasena) VALUES
-- Sucursal 1: Las Mercedes
('Sonia Alejandra Fernandez Moreno', 'Calle Roble #507, San Luis Potosi',      '444 783 1225', 34, 1, 'sonia.fernandez@akirasboutique.com',   'Ak1$Mercedes'),
('Ana Luisa Torres Medina',          'Calle Pino #12, San Luis Potosi',        '444 210 5588', 26, 1, 'ana.torres@akirasboutique.com',        'Ak1$Torres26'),
('Karen Lizeth Vega Palma',          'Av. Reforma #340, San Luis Potosi',      '444 552 8890', 23, 1, 'karen.vega@akirasboutique.com',        'Ak1$Vega901'),
('Ricardo Omar Salas Nu�ez',         'Calle Encino #88, San Luis Potosi',      '444 776 4432', 29, 1, 'ricardo.salas@akirasboutique.com',     'Ak1$Salas770'),
('Diana Paola Reyes Cortes',         'Calle Alamo #205, San Luis Potosi',      '444 908 1123', 31, 1, 'diana.reyes@akirasboutique.com',       'Ak1$Reyes345'),
('Jorge Luis Mata Delgado',          'Av. Universidad #56, San Luis Potosi',   '444 334 9021', 24, 1, 'jorge.mata@akirasboutique.com',        'Ak1$Mata8821'),

-- Sucursal 2: Obraje
('Fernando Calderon Ayala',          'Calle Dr. Jesus Diaz de Leon #438, Aguascalientes', '449 378 0921', 38, 2, 'fernando.calderon@akirasboutique.com', 'Ak2$Obraje01'),
('Monica Guadalupe Ibarra Solis',    'Calle Morelos #90, Aguascalientes',      '449 220 7712', 27, 2, 'monica.ibarra@akirasboutique.com',     'Ak2$Ibarra27'),
('Hector Manuel Rangel Ortiz',       'Av. Convencion #145, Aguascalientes',    '449 556 3390', 25, 2, 'hector.rangel@akirasboutique.com',     'Ak2$Rangel55'),
('Paulina Elizabeth Cano Ruiz',      'Calle Juarez #310, Aguascalientes',      '449 771 2245', 22, 2, 'paulina.cano@akirasboutique.com',      'Ak2$Cano2245'),
('Sergio Andres Lopez Miranda',      'Calle Zaragoza #77, Aguascalientes',     '449 990 1122', 30, 2, 'sergio.lopez@akirasboutique.com',      'Ak2$Lopez990'),
('Brenda Nayeli Chavez Rios',        'Av. Aguascalientes #501, Aguascalientes','449 445 6678', 28, 2, 'brenda.chavez@akirasboutique.com',     'Ak2$Chavez44'),

-- Sucursal 3: Galerias Mazatlan
('Daniela Fernanda Diaz Ordaz',      'Av. de la Marina #6204, Mazatlan',       '669 293 2059', 33, 3, 'daniela.diaz@akirasboutique.com',      'Ak3$Marina20'),
('Luis Fernando Beltran Ochoa',      'Calle Del Mar #12, Mazatlan',            '669 108 4432', 26, 3, 'luis.beltran@akirasboutique.com',      'Ak3$Beltran1'),
('Cynthia Lorena Aviles Rubio',      'Av. Camaron Sabalo #900, Mazatlan',      '669 776 5521', 24, 3, 'cynthia.aviles@akirasboutique.com',    'Ak3$Aviles77'),
('Marco Antonio Zazueta Leon',       'Calle Constitucion #34, Mazatlan',       '669 334 9087', 29, 3, 'marco.zazueta@akirasboutique.com',     'Ak3$Zazueta3'),
('Gabriela Ines Rocha Peraza',       'Av. Ejercito Mexicano #221, Mazatlan',   '669 552 1190', 27, 3, 'gabriela.rocha@akirasboutique.com',    'Ak3$Rocha552'),
('Emmanuel Osuna Guerrero',          'Calle Angel Flores #58, Mazatlan',       '669 887 4410', 31, 3, 'emmanuel.osuna@akirasboutique.com',    'Ak3$Osuna887'),

-- Sucursal 4: Zapopan
('Mario Alberto Jimenez Salcido',    'Av. Manuel J. Clouthier 525, Zapopan',   '333 784 1230', 36, 4, 'mario.jimenez@akirasboutique.com',     'Ak4$Zapopan5'),
('Alejandra Guadalupe Nava Torres',  'Av. Vallarta #2100, Zapopan',            '333 210 6690', 25, 4, 'alejandra.nava@akirasboutique.com',    'Ak4$Nava2106'),
('Ivan Eduardo Ramos Cervantes',     'Calle Patria #340, Zapopan',             '333 445 7723', 23, 4, 'ivan.ramos@akirasboutique.com',        'Ak4$Ramos445'),
('Fatima Montserrat Solis Vera',     'Av. Lopez Mateos #870, Zapopan',         '333 998 1245', 28, 4, 'fatima.solis@akirasboutique.com',      'Ak4$Solis998'),
('Cesar Ivan Munguia Robles',        'Calle Guadalupe #45, Zapopan',           '333 665 8821', 30, 4, 'cesar.munguia@akirasboutique.com',     'Ak4$Munguia6'),
('Karla Denisse Padilla Ortega',     'Av. Mariano Otero #630, Zapopan',        '333 220 4456', 26, 4, 'karla.padilla@akirasboutique.com',     'Ak4$Padilla2'),

-- Sucursal 5: Melchor (Chihuahua)
('Yesenia Guadalupe Campos Rojo',    'Av. Melchor Ocampo #2528, Chihuahua',    '614 390 6721', 35, 5, 'yesenia.campos@akirasboutique.com',    'Ak5$Melchor3'),
('Oscar Daniel Nevarez Portillo',    'Calle Aldama #150, Chihuahua',           '614 220 3312', 24, 5, 'oscar.nevarez@akirasboutique.com',     'Ak5$Nevarez2'),
('Perla Ivonne Chacon Almanza',      'Av. Tecnologico #900, Chihuahua',        '614 776 5590', 27, 5, 'perla.chacon@akirasboutique.com',      'Ak5$Chacon77'),
('Rodrigo Alonso Quinones Lara',     'Calle Libertad #33, Chihuahua',          '614 445 2210', 29, 5, 'rodrigo.quinones@akirasboutique.com',  'Ak5$Quinones'),
('Miriam Alejandra Rey Solano',      'Av. Universidad #480, Chihuahua',        '614 908 7734', 22, 5, 'miriam.rey@akirasboutique.com',        'Ak5$Rey90877'),
('Adrian Emilio Baca Fierro',        'Calle Ojinaga #67, Chihuahua',           '614 334 1102', 31, 5, 'adrian.baca@akirasboutique.com',       'Ak5$Baca3341'),

-- Sucursal 6: Constitucion (Durango)
('Tamara Alejandra Bernal Ramos',    'Calle Constitucion #106, Durango',       '618 196 2954', 33, 6, 'tamara.bernal@akirasboutique.com',     'Ak6$Constitu'),
('Julio Cesar Herrera Montes',       'Av. 20 de Noviembre #210, Durango',      '618 220 9087', 26, 6, 'julio.herrera@akirasboutique.com',     'Ak6$Herrera2'),
('Nadia Berenice Loya Sifuentes',    'Calle Negrete #45, Durango',             '618 776 4432', 24, 6, 'nadia.loya@akirasboutique.com',        'Ak6$Loya7764'),
('Francisco Javier Ortega Del Rio',  'Av. Felipe Pescador #310, Durango',      '618 445 1198', 30, 6, 'francisco.ortega@akirasboutique.com',  'Ak6$Ortega44'),
('Vanessa Lizbeth Carrillo Payan',   'Calle Zaragoza #78, Durango',            '618 990 3321', 27, 6, 'vanessa.carrillo@akirasboutique.com',  'Ak6$Carrillo'),
('Ruben Dario Espino Valles',        'Av. Patria #560, Durango',               '618 665 8843', 25, 6, 'ruben.espino@akirasboutique.com',      'Ak6$Espino66'),

-- Sucursal 7: Centro (Zacatecas)
('Samuel Enrique Barrios Enciso',    'Av. Hidalgo #338, Zacatecas',            '492 930 1250', 37, 7, 'samuel.barrios@akirasboutique.com',    'Ak7$Centro93'),
('Lorena Isabel Macias Trejo',       'Calle Tacuba #22, Zacatecas',            '492 220 5567', 26, 7, 'lorena.macias@akirasboutique.com',     'Ak7$Macias22'),
('Erick Alan Delgadillo Nava',       'Av. Gonzalez Ortega #145, Zacatecas',    '492 776 3390', 23, 7, 'erick.delgadillo@akirasboutique.com',  'Ak7$Delgadil'),
('Claudia Ines Reveles Marquez',     'Calle Juarez #90, Zacatecas',            '492 445 7712', 29, 7, 'claudia.reveles@akirasboutique.com',   'Ak7$Reveles4'),
('Omar Ivan Frausto Correa',         'Av. Universidad #310, Zacatecas',        '492 990 2245', 28, 7, 'omar.frausto@akirasboutique.com',      'Ak7$Frausto9'),
('Brenda Sofia Villagrana Ponce',    'Calle Hidalgo #67, Zacatecas',           '492 552 1123', 24, 7, 'brenda.villagrana@akirasboutique.com', 'Ak7$Villagra');
GO

-- ---------------------------------------------------------
-- 3. CUATRO CONSULTAS SELECT (Paso 7)
-- ---------------------------------------------------------

-- 3.1 Ver todos los empleados junto con el nombre de su sucursal (INNER JOIN)
SELECT e.IdEmpleado, e.Nombre, e.Edad, s.NombreSucursal, s.Ciudad, s.Estado
FROM Empleados e
INNER JOIN Sucursales s ON e.NumSucursal = s.NumSucursal
ORDER BY s.NumSucursal, e.Nombre;

-- 3.2 Contar cuantos empleados tiene cada sucursal (agrupado)
SELECT s.NombreSucursal, COUNT(e.IdEmpleado) AS TotalEmpleados
FROM Sucursales s
LEFT JOIN Empleados e ON s.NumSucursal = e.NumSucursal
GROUP BY s.NombreSucursal
ORDER BY TotalEmpleados DESC;

-- 3.3 Empleados menores de 27 anios (filtro con WHERE)
SELECT Nombre, Edad, NumSucursal, Correo
FROM Empleados
WHERE Edad < 27
ORDER BY Edad ASC;

-- 3.4 Datos completos de la sucursal de Mazatlan y su encargado
SELECT NumSucursal, NombreSucursal, Encargado, Ciudad, Estado, Telefono
FROM Sucursales
WHERE Ciudad = 'Mazatlan';
GO
