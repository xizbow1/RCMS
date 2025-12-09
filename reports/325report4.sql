-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS325 - Fall 2025

ttitle center 'Customer Analysis Report' skip 1 -
       center 'Comprehensive Customer Activity Report' skip 2

btitle center 'Report Date: ' _date skip 1 -
       center 'Blake Culbertson, Andrew Gallimore, Abbi Ochoa'

set pagesize 60
set linesize 150
set feedback off

spool 325report4-out.txt

prompt
prompt ========================================
prompt SECTION 1: Active rentals and the customer that rented it
prompt ========================================
prompt

column Customer_Name format A25
column Instrument_Type format A15
column Instrument_Subtype format A20
column Rental_Start format A12
column Rental_Due format A12
column Rental_Cost format $9,999.99

select r.Rental_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       to_char(r.Rental_start, 'MM/DD/YYYY') as Rental_Start,
       r.Rental_cost
from Rental r
join Customer c on r.Cust_id = c.Cust_id
join Instrument i on r.Inst_id = i.Inst_id
where r.Rental_due is null
order by r.Rental_start desc;

prompt
prompt ========================================
prompt SECTION 2: All customers, their info, and their contact info
prompt ========================================
prompt

select c.Cust_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       c.Cust_creditbal,
       ce.Cust_email
from Customer c
left join Cust_email ce on c.Cust_id = ce.Cust_id
order by c.Cust_lname, c.Cust_fname, ce.Cust_email;

prompt
prompt ========================================
prompt SECTION 3: Total revenue from each customer
prompt ========================================
prompt

select c.Cust_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       sum(i.Invoice_total) as Total_Revenue
from Customer c
left join Invoice i on c.Cust_id = i.Cust_id
group by c.Cust_id, c.Cust_fname, c.Cust_lname
order by Total_Revenue desc; 

prompt
prompt ========================================
prompt SECTION 4: Outstanding rentals for each customer
prompt ========================================
prompt

column Outstanding_Items format 999
select c.Cust_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       count(r.Rental_id) as Num_Overdue,
       sum(r.Rental_cost) as Total_Cost_Overdue
from Rental r
join Customer c on r.Cust_id = c.Cust_id
where r.Rental_due < sysdate
group by c.Cust_id, c.Cust_fname, c.Cust_lname
order by Num_Overdue desc;

spool off