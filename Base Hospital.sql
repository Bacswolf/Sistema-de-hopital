create database hospital;
use hospital;

create table hospitales(
	Id_Hospital int auto_increment,
	Nombre varchar(40),
	Telefono int,
	RFC varchar(13),
	Email varchar(30),
	Sitioweb varchar (30),
	Calle varchar(20),
	Noext int,
	Noint int,
	Colonia varchar(40),
	Municipio varchar(30),
	Estado varchar(30),
	Primary key (Id_Hospital));

create table Paciente(
	Id_Paciente int auto_increment,
	Nombre varchar(20),
	APaterno varchar(20),
	AMaterno varchar(20),
	CURP varchar(20),
	RFC varchar(20),
	CorreoElectronico varchar(25),
	Telefono int,
	ContactoEmergencia varchar(30),
	TelefonoEmergencia int,
	Genero varchar(15),
	FechaNacimiento date,
	Calle varchar(20),
	NoExt int,
	NoInt int,
	Colonia varchar(20),
	Municipio varchar(20),
	Estado varchar(20),
	CodigoPostal int(5),
	Primary key (Id_Paciente));

create table Cita(
	idCita int auto_increment,
	idPaciente int,
	fecha datetime,
	total float,
	idHospital int,
	Primary key(idCita),
	Foreign key(idPaciente) references Paciente(Id_Paciente),
	Foreign key(idHospital) references Hospitales(Id_Hospital)
);

create table Especialidad(
	idEspecialidad int auto_increment,
	nombre varchar(20),
	descripcion varchar(20),
	idHospital int,
	Primary key(idEspecialidad),
	Foreign key(idHospital) references Hospitales(Id_Hospital)
	);

create table Servicios(
	Id_Servicios int auto_increment,
	nombre varchar(40),
	Categoria varchar(40),
	Costo float,
	Descripcion varchar(200),
	Primary key (Id_Servicios));


create table Medicamentos(
	idMedicamento int auto_increment,
	nombre varchar(30),
	cantidad int,
	formula varchar(30),
	presentacion varchar(30),
	gramaje varchar(30),
	laboratorio varchar(30),
	fechaCaducidad date,
	descripcion varchar(30),
	precio decimal(4,2),
	viaAdministracion varchar(20),
	Primary key(idMedicamento)
);

create table Material(
	idMaterial int auto_increment,
	nombre varchar(30),
	cantidad int,
	tipoMaterial varchar(20),
	fechaCaducidad date,
	precio decimal(4,2),
	Primary key(idMaterial)
);

create table empleados(
	Id_Empleado int auto_increment,
	Nombre varchar (40),
	ApPat varchar (20),
	ApMat varchar (20),
	Fecha_Nac date,
	Calle varchar(20),
	Noext int,
	Noint int,
	Colonia varchar(40),
	Municipio varchar(30),
	Estado varchar(30),
	RFC varchar(13),
	CURP varchar(16),
	Genero varchar(30),
	Cedula_profesional int,
	Telefono int,
	Email varchar(30),
	Primary key (Id_Empleado)
);

create table CuentaCita(
	idCuentaCita int auto_increment,
	idCita int,
	idMedicamento int,
	idMaterial int,
	idEmpleado int,
	idServicio int,
	idEspecialidad int,
	primary key(idCuentaCita, idCita),
	Foreign key(idMedicamento) references Medicamentos(idMedicamento),
	Foreign key(idMaterial) references Material(idMaterial),
	Foreign key(idEmpleado) references empleados(Id_Empleado),
	Foreign key(idServicio) references Servicios(id_Servicios),
	Foreign key(idEspecialidad) references Especialidad(idEspecialidad)
);

create table cargos (
		Id_Cargo int auto_increment,
		Nombre varchar(40),
		NombreDepartamento varchar(40),
		Descripcion varchar(100),
		Sueldo float,
		Primary key (Id_Cargo));

create table Pago(
	Id_Pago int auto_increment,
	Fecha_Inicio datetime,
	Fecha_Fin datetime,
	DiasLaborados datetime,
	TotalPercepciones float,
	TotalDeducciones float,
	Id_Empleado int,
	Id_Cargo int,
	NetoPagado float,
	SueldoBruto float,
	Foreign key (Id_Empleado) references empleados(Id_Empleado),
	Foreign key (Id_Cargo) references cargos(Id_Cargo),
	Primary key (Id_Pago)
);

Create table percepciones(
		Id_Percepcion int auto_increment,
		Nombre varchar (40),
		Monto float,
 		Primary key (Id_Percepcion));

Create table deducciones(
		Id_Deduccion int auto_increment Primary key,
		Nombre varchar (40),
		Monto float);

create table Ordendepago(
	Consecutivo int auto_increment,
	Id_Pago int,
	Id_Percepcion int,
	Id_Deducciones int,
	Foreign key (Id_Pago) references Pago (Id_Pago),
	Foreign key (Id_Percepcion) references percepciones (Id_Percepcion),
	Foreign key (Id_Deducciones) references deducciones (Id_Deduccion),
	Primary key(Consecutivo,Id_Pago)
);

create table turnos(
	Id_Turno int auto_increment,
	HoraI datetime,
	HoraT datetime,
	TotHoras int,
	PRIMARY KEY (Id_Turno)
);

create table incapacidades(
	Id_Incapacidades int auto_increment,
	FechaInicio datetime,
	FechaFin datetime,
	Motivo varchar(600),
	Primary key (Id_Incapacidades)
);

create table vacaciones(
	Id_Vacacion int auto_increment,
	TipoVacacion varchar(40),
	Fecha_inicio date,
	Fecha_Fin date,
	Total_dias int,
	Primary key (Id_Vacacion)
);

create table Asistencia(
	Id_Registro int auto_increment,
	Id_Empleado int,
	Id_Cargo int,
	Id_Turno int,
	Id_Incapacidades int,
	Id_Vacaciones int,
	Fecha date,
	HoraEntrada datetime,
	HoraSalida datetime,
	HoraComidaInicio datetime,
	HoraComidaFin datetime,
	Falta boolean,
	Foreign key (Id_Empleado) references empleados (Id_Empleado),
	Foreign key (Id_Cargo) references cargos (Id_Cargo),
	Foreign key (Id_Turno) references turnos (Id_Turno),
	Foreign key (Id_Incapacidades) references incapacidades (Id_Incapacidades),
	Foreign key (Id_Vacaciones) references vacaciones (Id_Vacacion),
	Primary key(Id_Registro)
);

create table Farmacia(
	idFarmacia int auto_increment,
	razonSocial varchar(30),
	RFC varchar(13),
	telefono int,
	redSocial varchar(20),
	Calle varchar(20),
	NoExt int,
	NoInt int,
	Colonia varchar(40),
	Municipio varchar(40),
	Estado varchar(30),
	CP int,
	PRIMARY KEY(idFarmacia)
);

create table Cliente(
	idCliente int auto_increment,
	Nombre varchar(40),
	ApPaterno varchar(30),
	ApMaterno varchar(30),
	razonSocial varchar(30),
	Genero varchar(1),
	RFC varchar(13),
	telefono varchar(10),
	Calle varchar(30),
	NoExt varchar(10),
	NoInt varchar(10),
	Colonia varchar(30),
	Municipio varchar(30),
	Estado varchar(30),
	CP varchar(5),
	PRIMARY KEY(idCliente)

	);

create table Productos(
	idProductos int auto_increment,
	Nombre varchar(30),
	Formula varchar(100),
	cantidad int,
	Presentacion varchar(50),
	Gramaje varchar(30),
	Marca varchar(30),
	Fecha_caducidad datetime,
	Descripcion varchar(100),
	Via_administracion varchar(30),
	Precio float,
	PRIMARY KEY(idProductos)
);

create table proveedor(
	idProveedor int auto_increment,
	RazonSocial varchar(30),
	Estado varchar(30),
	Municipio varchar(30),
	Colonia varchar(30),
	Calle varchar(30),
	NoExt varchar(10),
	NoInt varchar(10),
	Cp varchar(5),
	SM varchar(10),
	Telefono varchar(10),
	PRIMARY KEY(idProveedor)
);

create table Venta(
	Id_Venta int auto_increment,
	id_Empleado int,
	total float,
	Fecha_Venta date,
	Foreign key(id_Empleado)references empleados(Id_Empleado),
	Primary key(Id_Venta)
);

create table factura(
	id_Factura int auto_increment,
	id_Cliente int,
	id_Venta int,
	FechaHora_factura datetime,
	Folio_Fiscal varchar(50),
	Foreign key(id_Cliente)references Cliente(idCliente),
	Foreign key(id_Venta)references Venta(Id_Venta),
	Primary key(id_Factura)
);

create table Nota_Venta(
	Id_NotaVenta int auto_increment,
	id_Venta int,
	id_Productos int,
	Cantidad int,
	Foreign key(id_Venta)references Venta(Id_Venta),
	Foreign key(id_Productos)references Productos(idProductos),
	Primary key(Id_NotaVenta, id_Venta)
);

create table Compra(
	id_Compra int auto_increment,
	id_Proveedor int,
	FechaHora_Compra datetime,
	Total_Compra float,
	Foreign key(id_Proveedor)references proveedor(idProveedor),
	Primary key(id_Compra)
);

create table Nota_Compra(
	Id_Nota int auto_increment,
	Id_Compra int,
	Id_Producto int,
	Cantidad int,
	Foreign key(Id_Compra)references Compra(id_Compra),
	Foreign key(Id_Producto)references Productos(idProductos),
	Primary key(Id_Nota, Id_Compra)
);

