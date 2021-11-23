/* Create a database of your own choosing that consists car services */
CREATE DATABASE db_carServices
GO

USE db_carServices
GO
/************ */
DROP TABLE IF EXISTS tbl_vehicle;
DROP TABLE IF EXISTS tbl_customer;
DROP TABLE IF EXISTS tbl_employee;
DROP TABLE IF EXISTS tbl_catalog_services;
DROP TABLE IF EXISTS tbl_services;
DROP TABLE IF EXISTS tbl_detail_services;


/* Create procedure  */

CREATE PROCEDURE create_carServicesDB
AS
BEGIN
	CREATE TABLE tbl_vehicle (
		vehicle_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		vehicle_make  VARCHAR(50) NOT NULL,
		vehicle_model  VARCHAR(50) NOT NULL,
		vehicle_year INT,
		vehicle_body_style VARCHAR(50) NOT NULL,
		vehicle_color VARCHAR(30) NOT NULL,
		vehicle_engine VARCHAR(70) NOT NULL
	);
	CREATE TABLE tbl_customer (
		customer_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		customer_fname VARCHAR(50) NOT NULL,
		customer_lname VARCHAR(50) NOT NULL,
		customer_contact VARCHAR(50) NOT NULL,
		customer_email VARCHAR(100) NOT NULL
	);
	CREATE TABLE tbl_employee (
		employee_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		employee_fname VARCHAR(50) NOT NULL,
		employee_lname VARCHAR(50) NOT NULL,
		employee_contact VARCHAR(50) NOT NULL,
		job VARCHAR(50) NOT NULL,
		salary MONEY NOT NULL
	);
	CREATE TABLE tbl_catalog_services (
		catalog_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		catalog_task VARCHAR(50) NOT NULL,
		catalog_price VARCHAR(50) NOT NULL,
		catalog_job_specialist INT NOT NULL CONSTRAINT fk_employee_esp_id FOREIGN KEY REFERENCES tbl_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE
	);
	create table tbl_services (
		services_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		services_description VARCHAR(50) NOT NULL,
		services_vehicle INT NOT NULL CONSTRAINT fk_vehicle_id FOREIGN KEY REFERENCES tbl_vehicle(vehicle_id) ON UPDATE CASCADE ON DELETE CASCADE,
		services_customer INT NOT NULL CONSTRAINT fk_customer_id FOREIGN KEY REFERENCES tbl_customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
		services_agent INT NOT NULL CONSTRAINT fk_employee_agent_id FOREIGN KEY REFERENCES tbl_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE,
		services_date DATETIME
	);
	create table tbl_detail_services (
		detail_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		detail_services INT NOT NULL CONSTRAINT fk_services_id FOREIGN KEY REFERENCES tbl_services(services_id) ON UPDATE CASCADE ON DELETE CASCADE,
		detail_catalog INT NOT NULL CONSTRAINT fk_catalog_id FOREIGN KEY REFERENCES tbl_catalog_services(catalog_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	);

	/*  Add values to your database    */
	INSERT INTO tbl_vehicle
	(vehicle_make,vehicle_model,vehicle_year,vehicle_body_style,vehicle_color,vehicle_engine)
	VALUES
	('BMW','3 serie',2018,'sedan', 'blue','2.0L 4cyl Turbo 8A'),
	('ford','F-150',2020,'cab style','white','2.7L 6cyl Turbo 10A'),
	('toyota','prius',2020,'suv','blue','1.8L 4cyl gas/electric hybrid CVT'),
	('ferrari','488 gtb',2016,'coupe','red','Twin-Turbo 3.9L V8'),
	('fiat','500',2017,'Hatchback','blue','4-Cyl 1.4 Liter MultiAir'),
	('audi','a6',2017,'sedan','clack','4-Cyl Turbo 2.0 Liter')
	;
	SELECT * FROM tbl_vehicle;
	INSERT INTO tbl_customer 
	(customer_fname,customer_lname,customer_contact,customer_email) 
	VALUES
	('john','Smith','55-23-23-32-12','jsmith@mail.com'),
	('Daniel','Frank','55-23-23-32-12','dfrank@mail.com'),
	('Monica','Lin','55-23-23-32-12','mlin@mail.com'),
	('Anie','Jones','55-23-23-32-12','ajones@mail.com'),
	('Albert','Miller','55-23-23-32-12','amiller@mail.com'),
	('Felix','Smith','55-23-23-32-12','fsmith@mail.com'),
	('Tina','Tylor','55-23-23-32-12','ttylor@mail.com'),
	('Carl','Anderson','55-23-23-32-12','canderson@mail.com');
	select * from tbl_customer;
	INSERT INTO tbl_employee 
		(employee_fname,employee_lname,employee_contact,job,salary)
	VALUES
		('Mike','Koch','55-33-55-77-88','mechanics',800),
		('Ken','Mares','55-33-55-77-88','mechanics',800),
		('Kim','Hee','55-33-55-77-88','mechanics',800),
		('Paul','Diaz','55-33-55-77-88','mechanics',800),
		('Ben','Miller','55-33-55-77-88','agent',900),
		('Paola','Siles','55-33-55-77-88','agent',900),
		('Brenda','Soyer','55-33-55-77-88','agent',900),
		('Mary','Rs.','55-33-55-77-88','agent',900)
	;
	SELECT * FROM tbl_employee;
	INSERT INTO tbl_catalog_services
		(catalog_task, catalog_price, catalog_job_specialist)
	VALUES 
		('cabin air filter',25.00, 1),
		('oil and filter change',60.00, 2),
		('windsheld wiper fluid',40.00, 3),
		('replace windsheld wiper fluid',50.00, 4),
		('coolant change',50.00, 4),
		('rotate and balance tires',40.00, 1),
		('change tires',60.00, 2),
		('check belt',30.00, 3),
		('power steering fluid',40.00, 1),
		('tire pressure',60.00, 2),
		('brake fluid',60.00, 3),
		('trim clutch',60.00, 3),
		('setting the ignition time',60.00, 3)
	;
	SELECT * FROM tbl_catalog_services;
	INSERT INTO tbl_services 
		(services_description,services_vehicle,services_customer,services_agent,services_date)
	VALUES
		('preventive 10 mil.',1,1,5,SYSDATETIME()),
		('preventive 30 mil.',2,2,6,SYSDATETIME()),
		('preventive 50 mil.',3,3,7,SYSDATETIME()),
		('preventive 10 mil.',4,4,8,SYSDATETIME()),
		('corrective',5,5,5,SYSDATETIME()),
		('corrective',6,6,6,SYSDATETIME())
	;
	SELECT * FROM tbl_services;
	INSERT INTO tbl_detail_services 
		(detail_services,detail_catalog)
	VALUES
		(1,1),
		(1,2),
		(1,3),
		(2,1),
		(2,2),
		(2,3),
		(2,4),
		(2,5),
		(2,6),
		(3,2),
		(3,3),
		(3,4),
		(3,5),
		(3,6),
		(3,9),
		(3,10),
		(3,11),
		(3,12),
		(4,1),
		(4,2),
		(4,3),
		(5,6),
		(5,7),
		(6,12),
		(6,13)
	;

	SELECT * FROM tbl_detail_services;

	/* Create a statement that queries data from both tables. */
	/* consult the services performed on the ford F-150 vehicle */
	SELECT 
		a2.vehicle_make, a2.vehicle_model,a1.services_date, a3.catalog_task
	FROM
		tbl_services a1
		INNER JOIN tbl_vehicle a2 ON a2.vehicle_id=a1.services_vehicle
		INNER JOIN tbl_detail_services a4 ON a4.detail_services=a1.services_id
		INNER JOIN tbl_catalog_services a3 ON a3.catalog_id=a4.detail_catalog
	WHERE
		a2.vehicle_make='ford' and a2.vehicle_model='F-150'
;
END
/************ */

/* Execute procedure to create tables and sql statements */

USE db_carServices
GO
EXECUTE [dbo].create_carServicesDB
