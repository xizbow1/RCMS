-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS 325 - Fall 2025
-- 11/26/25

spool 325result-contents.txt

set pagesize 100
set linesize 200

select * from Employee;
select * from Supplier;
select * from Customer;
select * from Instrument;
select * from Concert;
select * from Class;
select * from Empl_email;
select * from Cust_email;
select * from Class_instruments;
select * from Concert_class_id;
select * from Part;
select * from Invoice;
select * from Rental;
select * from Repair;

spool off