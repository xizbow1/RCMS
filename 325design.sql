-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS325 - Fall 2025
-- 11/3/25

-- Table to hold a supplier. Supplier phone and email can be null because there may be other contact methods.
drop table Supplier cascade constraints;
create table Supplier (
    Supplier_id int primary key,
    Supplier_name varchar2(30) not null,
    Supplier_phone varchar2(10),
    Supplier_email varchar2(50)
);

-- Table to store customer information, including Cust_creditbal to denote store credit.
drop table Customer cascade constraints;
create table Customer (
    Cust_id int primary key,
    Cust_lname varchar2(30) not null,
    Cust_fname varchar2(30) not null,
    Cust_creditbal decimal(10,2) not null
);

-- Table to hold customer emails (MV)
drop table Cust_email cascade constraints;
create table Cust_email (
    Cust_id int,
    Cust_email varchar2(50),
    primary key (Cust_id, Cust_email),
    foreign key (Cust_id) references Customer(Cust_id)
);

-- Table to store customer invoices. Invoice_total denotes the total amount 
drop table Invoice cascade constraints;
create table Invoice (
    Invoice_id int primary key,
    Invoice_date date not null,
    Cust_id int,
    Invoice_total decimal(10,2) not null,
    foreign key (Cust_id) references Customer(Cust_id)
);

-- Table to store different instrument parts.
drop table Part cascade constraints;
create table Part (
    Part_id int primary key,
    Part_type varchar2(50) not null,
    Part_price decimal(10,2) not null,
    Part_stock int not null,
    Supplier_id int,
    foreign key (Supplier_id) references Supplier(Supplier_id)
);

-- Table to hold store-owned instruments. Supertype = Piano, Violin, etc, subtype = Grand piano, alto sax. isRentable and isRented are 0, 1
drop table Instrument cascade constraints;
create table Instrument (
    Inst_id int primary key,
    Inst_supertype varchar2(20) not null,
    Inst_subtype varchar2(20),
    Inst_isRentable char(1) not null,
    Inst_price decimal(10, 2),
    Inst_isRented char(1) not null
);

-- Table to hold customer instrument rentals.
drop table Rental cascade constraints;
create table Rental (
    Rental_id int primary key,
    Cust_id int not null,
    Inst_id int not null,
    Rental_start date not null,
    Rental_due date,
    Rental_cost decimal(10, 2),
    foreign key (Cust_id) references Customer(Cust_id),
    foreign key (Inst_id) references Instrument(Inst_id)
);

-- Table to hold repair orders. Inst_id can be null because it can be a customer instrument. Repair cost can be null because it can be free.
drop table Repair cascade constraints;
create table Repair (
    Repair_id int primary key,
    Cust_id int not null,
    Inst_id int,
    Repair_cost decimal(10, 2),
    Repair_date_read date,
    foreign key (Cust_id) references Customer(Cust_id),
    foreign key (Inst_id) references Instrument(Inst_id)
);

-- Table to hold employees. Job title can be null because of new employees or similar.
drop table Employee cascade constraints;
create table Employee (
    Empl_id int primary key,
    Empl_salary decimal(10, 2) not null,
    Empl_job_title varchar2(20),
    Empl_fname varchar2(30) not null,
    Empl_lname varchar2(30) not null
);


-- Table to hold Empl_email (MV)
drop table Empl_email cascade constraints;
create table Empl_email (
    Empl_id int,
    Empl_email varchar2(50),
    primary key (Empl_id, Empl_email),
    foreign key (Empl_id) references Employee(Empl_id)
);

-- Table to hold class lesson sessions. Empl_id is the employee teaching the class, and class_level is from 1-3 for beginning/intermediate/master. Class cost can be free, so it can be null.
drop table Class cascade constraints;
create table Class (
    Class_id int primary key,
    Class_level char(1) not null,
    Class_cost decimal(10, 2),
    Class_schedule date not null,
    Empl_id int not null,
    foreign key (Empl_id) references Employee(Empl_id)
);

-- Table to hold Class_instruments (MV)
drop table Class_instruments cascade constraints;
create table Class_instruments (
    Class_id int,
    Inst_id int,
    primary key (Class_id, Inst_id),
    foreign key (Class_id) references Class(Class_id),
    foreign key (Inst_id) references Instrument(Inst_id)
);


-- Table to hold concerts put on by classes
drop table Concert cascade constraints;
create table Concert (
    Concert_id int primary key,
    Concert_date date not null,
    Concert_cost int
);

-- Table to hold the Class_id for concerts (MV)
drop table Concert_class_id cascade constraints;
create table Concert_class_id (
    Concert_id int,
    Class_id int,
    primary key (Concert_id, Class_id),
    foreign key (Concert_id) references Concert(Concert_id),
    foreign key (Class_id) references Class(Class_id)
);


