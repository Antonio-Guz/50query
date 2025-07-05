-- CREACIÓN DE BASE DE DATOS
CREATE DATABASE SistemaDeAdministracionTallerAutomotriz;
GO
USE SistemaDeAdministracionTallerAutomotriz;
GO

-- Tabla Rol 
CREATE TABLE Rol (
    idRol INT PRIMARY KEY IDENTITY(1,1),
    nombreRol NVARCHAR(50) NOT NULL
);

-- Tabla Taller 
CREATE TABLE Taller (
    idTaller INT PRIMARY KEY IDENTITY(1,1),
    nombreTaller NVARCHAR(100)NOT NULL,
    direccion NVARCHAR(200),
    telefono NVARCHAR(20)
);

-- 3. Tabla Empleado 
CREATE TABLE Empleado (
    idEmpleado INT PRIMARY KEY IDENTITY(1,1),
    idTaller INT,
    nombre NVARCHAR(50)Not null,
    apellido NVARCHAR(50),
    salario DECIMAL(10,2),
    fechaContratacion DATE,
    FOREIGN KEY (idTaller) REFERENCES Taller(idTaller)
);

-- Tabla Usuario 
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY IDENTITY(1,1),
    nombreUsuario NVARCHAR(50) UNIQUE NOT NULL,
    clave NVARCHAR(100),
    correo NVARCHAR(100),
    idRol INT,
    idEmpleado INT,
    FOREIGN KEY (idRol) REFERENCES Rol(idRol),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);
-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    dui NVARCHAR(20),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

-- Tabla TipoCombustible
CREATE TABLE TipoCombustible (
    idTipoCombustible INT PRIMARY KEY IDENTITY(1,1),
    nombreTipo NVARCHAR(50)
);

-- Tabla Carro 
CREATE TABLE Carro (
    idCarro INT PRIMARY KEY IDENTITY(1,1),
    matricula NVARCHAR(20),
    color NVARCHAR(30),
    modelo NVARCHAR(50),
    marca NVARCHAR(50),
    anio INT,
    idTipoCombustible INT,
    idCliente INT,
    FOREIGN KEY (idTipoCombustible) REFERENCES TipoCombustible(idTipoCombustible),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Producto
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY IDENTITY(1,1),
    nombreProducto NVARCHAR(100),
    descripcion NVARCHAR(200),
    precioUnitario DECIMAL(10,2),
    stock INT
);

-- Tabla Servicio
CREATE TABLE Servicio (
    idServicio INT PRIMARY KEY IDENTITY(1,1),
    nombreServicio NVARCHAR(100),
    precio DECIMAL(10,2)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY IDENTITY(1,1),
    nombreEmpresa NVARCHAR(100)NOT NULL,
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

-- Tabla Compra 
CREATE TABLE Compra (
    idCompra INT PRIMARY KEY IDENTITY(1,1),
    fechaCompra DATE,
    idProveedor INT,
    idTaller INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
    FOREIGN KEY (idTaller) REFERENCES Taller(idTaller)
);

-- 12. DetalleCompra 
CREATE TABLE DetalleCompra (
    idDetalleCompra INT PRIMARY KEY IDENTITY(1,1),
    idCompra INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10,2),
    precio INT
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- 13. Tabla Venta 
CREATE TABLE Venta (
    idVenta INT PRIMARY KEY IDENTITY(1,1),
    fechaVenta DATE,
    idTaller INT,
    FOREIGN KEY (idTaller) REFERENCES Taller(idTaller)
);

-- 14. DetalleVenta (FK a Venta y Producto)
CREATE TABLE DetalleVenta (
    idDetalle INT PRIMARY KEY IDENTITY(1,1),
    idVenta INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10,2),
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- 15. Tabla HistorialServicio 
CREATE TABLE HistorialServicio (
    idHistorial INT PRIMARY KEY IDENTITY(1,1),
    idCarro INT,
    idServicio INT,
    fechaRealizacion DATE,
    observaciones NVARCHAR(200),
    FOREIGN KEY (idCarro) REFERENCES Carro(idCarro),
    FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio),
);
