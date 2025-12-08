-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS 325 - Fall 2025
-- Rental Summary Report

set pagesize 60
set linesize 150
set feedback off

column Customer_Name format A20
column Instrument_Type format A15
column Instrument_Subtype format A20
column Rental_Start format A12
column Rental_Due format A12
column Rental_Cost format $9,999.99
column Total_Revenue format $99,999.99
column Avg_Cost format $9,999.99
column Days_Rented format 9999

ttitle center 'Rental Management System' skip 1 -
       center 'Comprehensive Rental Summary Report' skip 2

btitle center 'Report Date: ' _date skip 1 -
       center 'Blake Culbertson, Andrew Gallimore, Abbi Ochoa'

spool 325report1-out.txt

prompt
prompt ========================================
prompt SECTION 1: Active Rentals (No Due Date)
prompt ========================================
prompt

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
prompt ============================================
prompt SECTION 2: Overdue Rentals (Past Due Date)
prompt ============================================
prompt

select r.Rental_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       i.Inst_supertype as Instrument_Type,
       to_char(r.Rental_due, 'MM/DD/YYYY') as Rental_Due,
       trunc(sysdate - r.Rental_due) as Days_Overdue,
       r.Rental_cost
from Rental r
join Customer c on r.Cust_id = c.Cust_id
join Instrument i on r.Inst_id = i.Inst_id
where r.Rental_due < sysdate
order by r.Rental_due;

prompt
prompt ================================================
prompt SECTION 3: Rental Revenue by Instrument Type
prompt ================================================
prompt

break on report
compute sum label 'TOTAL REVENUE:' of Total_Revenue on report

select i.Inst_supertype as Instrument_Type,
       count(r.Rental_id) as Num_Rentals,
       sum(r.Rental_cost) as Total_Revenue,
       round(sum(r.Rental_cost) / (select sum(Rental_cost) from Rental) * 100, 2) as Pct_of_Total
from Rental r
join Instrument i on r.Inst_id = i.Inst_id
group by i.Inst_supertype
order by Total_Revenue desc;

clear breaks
clear computes

prompt
prompt ==========================================
prompt SECTION 4: Top 5 Customers by Rental Cost
prompt ==========================================
prompt

select * from (
    select c.Cust_id,
           c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
           count(r.Rental_id) as Num_Rentals,
           sum(r.Rental_cost) as Total_Spent
    from Customer c
    join Rental r on c.Cust_id = r.Cust_id
    group by c.Cust_id, c.Cust_fname, c.Cust_lname
    order by Total_Spent desc
)
where rownum <= 5;

prompt
prompt ============================================
prompt SECTION 5: Rental Duration Analysis
prompt ============================================
prompt

select r.Rental_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       i.Inst_supertype as Instrument_Type,
       to_char(r.Rental_start, 'MM/DD/YYYY') as Rental_Start,
       to_char(r.Rental_due, 'MM/DD/YYYY') as Rental_Due,
       case 
           when r.Rental_due is null then trunc(sysdate - r.Rental_start)
           else trunc(r.Rental_due - r.Rental_start)
       end as Days_Rented,
       r.Rental_cost
from Rental r
join Customer c on r.Cust_id = c.Cust_id
join Instrument i on r.Inst_id = i.Inst_id
order by Days_Rented desc;

prompt
prompt ===============================================
prompt SECTION 6: Most and Least Rented Instruments
prompt ===============================================
prompt

select i.Inst_id,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       count(r.Rental_id) as Times_Rented,
       sum(r.Rental_cost) as Total_Revenue
from Instrument i
left join Rental r on i.Inst_id = r.Inst_id
where i.Inst_isRentable = '1'
group by i.Inst_id, i.Inst_supertype, i.Inst_subtype
order by Times_Rented desc, Total_Revenue desc;

prompt
prompt ==========================================
prompt SECTION 7: Monthly Rental Revenue Trends
prompt ==========================================
prompt

select to_char(r.Rental_start, 'YYYY-MM') as Month,
       count(r.Rental_id) as Num_Rentals,
       sum(r.Rental_cost) as Total_Revenue,
       avg(r.Rental_cost) as Avg_Cost
from Rental r
group by to_char(r.Rental_start, 'YYYY-MM')
order by Month desc;

prompt
prompt ========================================
prompt SECTION 8: Complete Rental History
prompt ========================================
prompt

break on Instrument_Subtype skip 1 on report
compute sum label 'Subtotal:' of Rental_Cost on Instrument_Subtype
compute sum label 'GRAND TOTAL:' of Rental_Cost on report
compute avg label 'Average:' of Rental_Cost on Instrument_Subtype

column Rental_Cost format $9,999.99

select i.Inst_subtype as Instrument_Subtype,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       to_char(r.Rental_start, 'MM/DD/YYYY') as Rental_Start,
       to_char(r.Rental_due, 'MM/DD/YYYY') as Rental_Due,
       r.Rental_cost as Rental_Cost
from Rental r
join Customer c on r.Cust_id = c.Cust_id
join Instrument i on r.Inst_id = i.Inst_id
order by i.Inst_subtype, r.Rental_start desc;

clear breaks
clear computes

ttitle off
btitle off

spool off
