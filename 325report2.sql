-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS 325 - Fall 2025
-- Financial Summary Report

set pagesize 60
set linesize 150
set feedback off

column Revenue_Month format A12
column Num_Rentals format 9999
column Rental_Revenue format $99,999.99
column Num_Repairs format 9999
column Repair_Revenue format $99,999.99
column Num_Invoices format 9999
column Invoice_Revenue format $99,999.99
column Total_Monthly_Revenue format $99,999.99
column Avg_Rental format $9,999.99
column Avg_Invoice format $9,999.99
column Instrument_Type format A15
column YTD_Revenue format $99,999.99


ttitle center 'Rental Management System' skip 1 -
       center 'Financial Summary Report' skip 2

btitle center 'Report Date: ' _date skip 1 -
       center 'Blake Culbertson, Andrew Gallimore, Abbi Ochoa'

spool 325report2-out.txt

prompt
prompt ================================================
prompt SECTION 1: Monthly Revenue Breakdown
prompt ================================================
prompt

break on report
compute sum label 'TOTAL:' of Total_Revenue on report

select to_char(coalesce(r.Rental_start, rp.Repair_date_read, inv.Invoice_date), 'YYYY-MM') as Month,
       count(distinct r.Rental_id) as Rentals,
       coalesce(sum(r.Rental_cost), 0) as Rental_Rev,
       count(distinct rp.Repair_id) as Repairs,
       coalesce(sum(rp.Repair_cost), 0) as Repair_Rev,
       count(distinct inv.Invoice_id) as Invoices,
       coalesce(sum(inv.Invoice_total), 0) as Invoice_Rev,
       coalesce(sum(r.Rental_cost), 0) + coalesce(sum(rp.Repair_cost), 0) + coalesce(sum(inv.Invoice_total), 0) as Total_Revenue
from Rental r
full outer join Repair rp on 1=0
full outer join Invoice inv on 1=0
group by to_char(coalesce(r.Rental_start, rp.Repair_date_read, inv.Invoice_date), 'YYYY-MM')
union all
select to_char(rp.Repair_date_read, 'YYYY-MM') as Month,
       0 as Rentals,
       0 as Rental_Rev,
       count(distinct rp.Repair_id) as Repairs,
       coalesce(sum(rp.Repair_cost), 0) as Repair_Rev,
       0 as Invoices,
       0 as Invoice_Rev,
       coalesce(sum(rp.Repair_cost), 0) as Total_Revenue
from Repair rp
where rp.Repair_date_read is not null
group by to_char(rp.Repair_date_read, 'YYYY-MM')
union all
select to_char(inv.Invoice_date, 'YYYY-MM') as Month,
       0 as Rentals,
       0 as Rental_Rev,
       0 as Repairs,
       0 as Repair_Rev,
       count(distinct inv.Invoice_id) as Invoices,
       coalesce(sum(inv.Invoice_total), 0) as Invoice_Rev,
       coalesce(sum(inv.Invoice_total), 0) as Total_Revenue
from Invoice inv
group by to_char(inv.Invoice_date, 'YYYY-MM')
order by Month desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 2: Revenue by Source (Rentals, Repairs, Invoices)
prompt ================================================
prompt

select 'Rental' as Revenue_Source,
       count(Rental_id) as Num_Transactions,
       sum(Rental_cost) as Total_Revenue,
       avg(Rental_cost) as Avg_Transaction
from Rental
union all
select 'Repair' as Revenue_Source,
       count(Repair_id) as Num_Transactions,
       sum(Repair_cost) as Total_Revenue,
       avg(Repair_cost) as Avg_Transaction
from Repair
where Repair_cost is not null
union all
select 'Invoice' as Revenue_Source,
       count(Invoice_id) as Num_Transactions,
       sum(Invoice_total) as Total_Revenue,
       avg(Invoice_total) as Avg_Transaction
from Invoice;

prompt
prompt ================================================
prompt SECTION 3: Revenue by Instrument Type (Rentals)
prompt ================================================
prompt

break on report
compute sum label 'TOTAL RENTAL REVENUE:' of Total_Revenue on report

select i.Inst_supertype as Instrument_Type,
       count(r.Rental_id) as Num_Rentals,
       sum(r.Rental_cost) as Total_Revenue,
       avg(r.Rental_cost) as Avg_Rental_Cost
from Rental r
join Instrument i on r.Inst_id = i.Inst_id
group by i.Inst_supertype
order by Total_Revenue desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 4: Top 5 Customers by Total Revenue
prompt ================================================
prompt

select * from (
    select c.Cust_id,
           c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
           (coalesce(sum(r.Rental_cost), 0) + coalesce(sum(rp.Repair_cost), 0) + coalesce(sum(inv.Invoice_total), 0)) as Total_Revenue
    from Customer c
    left join Rental r on c.Cust_id = r.Cust_id
    left join Repair rp on c.Cust_id = rp.Cust_id
    left join Invoice inv on c.Cust_id = inv.Cust_id
    group by c.Cust_id, c.Cust_fname, c.Cust_lname
    order by Total_Revenue desc
)
where rownum <= 5;

prompt
prompt ================================================
prompt SECTION 5: Outstanding Invoices (Not Yet Paid)
prompt ================================================
prompt

break on report
compute sum label 'TOTAL OUTSTANDING:' of Invoice_Total on report

select inv.Invoice_id,
       c.Cust_fname || ' ' || c.Cust_lname as Customer_Name,
       to_char(inv.Invoice_date, 'MM/DD/YYYY') as Invoice_Date,
       trunc(sysdate - inv.Invoice_date) as Days_Outstanding,
       inv.Invoice_total
from Invoice inv
left join Customer c on inv.Cust_id = c.Cust_id
where inv.Cust_id is null or inv.Cust_id not in (select Cust_id from Customer where Cust_creditbal >= 0)
order by inv.Invoice_date asc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 6: Rental Revenue Trend (Last 12 Months)
prompt ================================================
prompt

select to_char(r.Rental_start, 'YYYY-MM') as Month,
       count(r.Rental_id) as Num_Rentals,
       sum(r.Rental_cost) as Monthly_Revenue,
       avg(r.Rental_cost) as Avg_Rental_Cost
from Rental r
group by to_char(r.Rental_start, 'YYYY-MM')
order by Month desc;

prompt
prompt ================================================
prompt SECTION 7: Repair Revenue by Instrument Type
prompt ================================================
prompt

break on report
compute sum label 'TOTAL REPAIR REVENUE:' of Total_Repair_Cost on report

select i.Inst_supertype as Instrument_Type,
       count(rp.Repair_id) as Num_Repairs,
       sum(rp.Repair_cost) as Total_Repair_Cost,
       avg(rp.Repair_cost) as Avg_Repair_Cost
from Repair rp
join Instrument i on rp.Inst_id = i.Inst_id
where rp.Repair_cost is not null
group by i.Inst_supertype
order by Total_Repair_Cost desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 8: Invoice Totals by Month
prompt ================================================
prompt

break on report
compute sum label 'TOTAL INVOICED:' of Monthly_Invoice_Total on report

select to_char(inv.Invoice_date, 'YYYY-MM') as Invoice_Month,
       count(inv.Invoice_id) as Num_Invoices,
       sum(inv.Invoice_total) as Monthly_Invoice_Total,
       avg(inv.Invoice_total) as Avg_Invoice_Amount
from Invoice inv
group by to_char(inv.Invoice_date, 'YYYY-MM')
order by Invoice_Month desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 9: Overall Financial Summary
prompt ================================================
prompt

select 'Total Rental Revenue' as Summary_Category,
       sum(Rental_cost) as Amount
from Rental
union all
select 'Total Repair Revenue' as Summary_Category,
       sum(Repair_cost) as Amount
from Repair
where Repair_cost is not null
union all
select 'Total Invoice Revenue' as Summary_Category,
       sum(Invoice_total) as Amount
from Invoice
union all
select 'GRAND TOTAL REVENUE' as Summary_Category,
       (select coalesce(sum(Rental_cost), 0) from Rental) +
       (select coalesce(sum(Repair_cost), 0) from Repair where Repair_cost is not null) +
       (select coalesce(sum(Invoice_total), 0) from Invoice) as Amount
from dual;

spool off

ttitle off
btitle off
set feedback on