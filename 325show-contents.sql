-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS 325 - Fall 2025
-- 11/26/25

spool 325result-contents.txt


set pagesize 100
set linesize 200

COLUMN EMPL_FNAME FORMAT A15
COLUMN EMPL_LNAME FORMAT A15

COLUMN CUST_FNAME FORMAT A15
COLUMN CUST_LNAME FORMAT A15

COLUMN PART_TYPE FORMAT A15


prompt
prompt
prompt Employee Table:

select * 
from Employee;



prompt
prompt
prompt Empl_email Table:

select *
from Empl_email;



prompt
prompt
prompt Supplier Table:

select *
from Supplier;



prompt
prompt
prompt Customer Table:

select *
from Customer;



prompt
prompt
prompt Cust_email Table:

select *
from Cust_email;



prompt
prompt
prompt Instrument Table:

select *
from Instrument;



prompt
prompt
prompt Concert Table:

select *
from Concert;



prompt
prompt
prompt Class Table:

select *
from Class;



prompt
prompt
prompt Class_instruments Table:

select *
from Class_instruments;



prompt
prompt
prompt Concert_class_id Table:

select *
from Concert_class_id;



prompt
prompt
prompt Part Table:

select *
from Part;



prompt
prompt
prompt Invoice Table:

select *
from Invoice;



prompt
prompt
prompt Rental Table:

select *
from Rental;



prompt
prompt
prompt Repair Table:

select *
from Repair;

prompt


COLUMN EMPL_FNAME CLEAR
COLUMN EMPL_LNAME CLEAR

COLUMN CUST_FNAME CLEAR
COLUMN CUST_LNAME CLEAR

COLUMN PART_TYPE CLEAR


spool off