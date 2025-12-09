-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS 325 - Fall 2025
-- Instrument Utilization & Maintenance Report

set pagesize 60
set linesize 150
set feedback off

column Instrument_Type format A15
column Instrument_Subtype format A20
column Inst_Price format $99,999.99
column Rental_Revenue format $99,999.99
column Repair_Cost format $99,999.99
column Net_Revenue format $99,999.99
column ROI_Pct format 999.99
column Avg_Rental format $9,999.99
column Avg_Repair format $9,999.99
column Times_Rented format 999
column Times_Repaired format 999
column Availability format A12

ttitle center 'Instrument Management System' skip 1 -
       center 'Instrument Utilization and Maintenance Report' skip 2

btitle center 'Report Date: ' _date skip 1 -
       center 'Blake Culbertson, Andrew Gallimore, Abbi Ochoa'

spool 325report6-out.txt

prompt
prompt ================================================
prompt SECTION 1: All Instruments with Status
prompt ================================================
prompt

column Inst_Status format A15

select i.Inst_id,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       i.Inst_price,
       case when i.Inst_isRentable = '1' then 'Rentable' else 'Not Rentable' end as Availability,
       case when exists (select 1 from Rental r where r.Inst_id = i.Inst_id and r.Rental_due > sysdate)
            then 'Currently Rented'
            when exists (select 1 from Rental r where r.Inst_id = i.Inst_id and r.Rental_due < sysdate)
            then 'Overdue'
            else 'Available' end as Inst_Status
from Instrument i
order by i.Inst_supertype, i.Inst_id;

prompt
prompt ================================================
prompt SECTION 2: Rental Frequency by Instrument
prompt ================================================
prompt

break on report
compute sum label 'TOTAL RENTALS:' of Times_Rented on report
compute sum label 'TOTAL REVENUE:' of Rental_Revenue on report

select i.Inst_id,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       count(r.Rental_id) as Times_Rented,
       coalesce(sum(r.Rental_cost), 0) as Rental_Revenue,
       case when count(r.Rental_id) > 0 
            then round(avg(r.Rental_cost), 2)
            else 0 end as Avg_Rental
from Instrument i
left join Rental r on i.Inst_id = r.Inst_id
group by i.Inst_id, i.Inst_supertype, i.Inst_subtype
order by Times_Rented desc, Rental_Revenue desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 3: Repair History by Instrument
prompt ================================================
prompt

break on report
compute sum label 'TOTAL REPAIRS:' of Times_Repaired on report
compute sum label 'TOTAL COST:' of Repair_Cost on report

select i.Inst_id,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       count(rp.Repair_id) as Times_Repaired,
       coalesce(sum(rp.Repair_cost), 0) as Repair_Cost,
       case when count(rp.Repair_id) > 0
            then round(avg(rp.Repair_cost), 2)
            else 0 end as Avg_Repair
from Instrument i
left join Repair rp on i.Inst_id = rp.Inst_id
group by i.Inst_id, i.Inst_supertype, i.Inst_subtype
having count(rp.Repair_id) > 0
order by Times_Repaired desc, Repair_Cost desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 4: ROI Analysis (Rental Revenue vs. Price)
prompt ================================================
prompt

column ROI_Status format A15

select i.Inst_id,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       i.Inst_price,
       coalesce(sum(r.Rental_cost), 0) as Rental_Revenue,
       coalesce(sum(rp.Repair_cost), 0) as Repair_Cost,
       coalesce(sum(r.Rental_cost), 0) - coalesce(sum(rp.Repair_cost), 0) as Net_Revenue,
       case when i.Inst_price > 0
            then round((coalesce(sum(r.Rental_cost), 0) - coalesce(sum(rp.Repair_cost), 0)) / i.Inst_price * 100, 2)
            else 0 end as ROI_Pct,
       case when (coalesce(sum(r.Rental_cost), 0) - coalesce(sum(rp.Repair_cost), 0)) > i.Inst_price
            then 'Profitable'
            when (coalesce(sum(r.Rental_cost), 0) - coalesce(sum(rp.Repair_cost), 0)) > 0
            then 'Positive'
            else 'Loss' end as ROI_Status
from Instrument i
left join Rental r on i.Inst_id = r.Inst_id
left join Repair rp on i.Inst_id = rp.Inst_id
group by i.Inst_id, i.Inst_supertype, i.Inst_subtype, i.Inst_price
order by ROI_Pct desc;

prompt
prompt ================================================
prompt SECTION 5: Instruments Never Rented
prompt ================================================
prompt

select i.Inst_id,
       i.Inst_supertype as Instrument_Type,
       i.Inst_subtype as Instrument_Subtype,
       i.Inst_price,
       case when i.Inst_isRentable = '1' then 'Available' else 'Not Rentable' end as Status
from Instrument i
where not exists (select 1 from Rental r where r.Inst_id = i.Inst_id)
order by i.Inst_price desc;

prompt
prompt ================================================
prompt SECTION 6: Maintenance Cost vs. Revenue by Type
prompt ================================================
prompt

break on report
compute sum label 'TOTAL:' of Total_Rental_Rev on report
compute sum label 'TOTAL:' of Total_Repair_Cost on report
compute sum label 'TOTAL:' of Net_Revenue on report

select i.Inst_supertype as Instrument_Type,
       count(distinct i.Inst_id) as Num_Instruments,
       coalesce(sum(r.Rental_cost), 0) as Total_Rental_Rev,
       coalesce(sum(rp.Repair_cost), 0) as Total_Repair_Cost,
       coalesce(sum(r.Rental_cost), 0) - coalesce(sum(rp.Repair_cost), 0) as Net_Revenue,
       case when coalesce(sum(rp.Repair_cost), 0) > 0
            then round(coalesce(sum(r.Rental_cost), 0) / coalesce(sum(rp.Repair_cost), 0), 2)
            else 0 end as Revenue_to_Cost_Ratio
from Instrument i
left join Rental r on i.Inst_id = r.Inst_id
left join Repair rp on i.Inst_id = rp.Inst_id
group by i.Inst_supertype
order by Net_Revenue desc;

clear breaks
clear computes

prompt
prompt ================================================
prompt SECTION 7: High Maintenance Instruments (Most Repairs)
prompt ================================================
prompt

select * from (
    select i.Inst_id,
           i.Inst_supertype as Instrument_Type,
           i.Inst_subtype as Instrument_Subtype,
           count(rp.Repair_id) as Times_Repaired,
           sum(rp.Repair_cost) as Total_Repair_Cost,
           max(rp.Repair_date_read) as Last_Repair_Date
    from Instrument i
    join Repair rp on i.Inst_id = rp.Inst_id
    group by i.Inst_id, i.Inst_supertype, i.Inst_subtype
    order by Times_Repaired desc, Total_Repair_Cost desc
)
where rownum <= 10;

prompt
prompt ================================================
prompt SECTION 8: Utilization Rate by Instrument Type
prompt ================================================
prompt

column Utilization_Pct format 999.99

select i.Inst_supertype as Instrument_Type,
       count(distinct i.Inst_id) as Total_Instruments,
       count(distinct case when i.Inst_isRentable = '1' then i.Inst_id end) as Rentable_Count,
       count(distinct r.Inst_id) as Ever_Rented_Count,
       case when count(distinct case when i.Inst_isRentable = '1' then i.Inst_id end) > 0
            then round(count(distinct r.Inst_id) / count(distinct case when i.Inst_isRentable = '1' then i.Inst_id end) * 100, 2)
            else 0 end as Utilization_Pct
from Instrument i
left join Rental r on i.Inst_id = r.Inst_id
group by i.Inst_supertype
order by Utilization_Pct desc;

spool off

ttitle off
btitle off
set feedback on