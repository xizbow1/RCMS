-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS325 - Fall 2025
-- 11/3/25


-- Table to store customer information, including Cust_creditbal to denote store credit.
create table Customer (
    Cust_id int primary key,
    Cust_lname varchar(30) not null,
    Cust_fname varchar(30) not null,
    Cust_creditbal decimal(10,2) not null
);

-- Table to store customer invoices. Invoice_total denotes the total amount paid
create table Invoice (
    Invoice_id int primary key,
    Invoice_date date not null,
    Cust_id int,
    Invoice_total decimal(10,2) not null,
    foreign key (Cust_id) references Customer(Cust_id)
);

-- Table to store different instrument parts.
create table Part (
    Part_id int primary key,
    Part_type varchar(50) not null,
    Part_price decimal(10,2) not null,
    Part_stock int not null
);