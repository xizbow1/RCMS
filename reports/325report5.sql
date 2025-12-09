-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS325 - Fall 2025
-- Supplier/Parts Report

ttitle center 'Supplier and Parts Report' skip 1 -
       center 'Supplier Contact Information and Part Inventory' skip 2
btitle center 'Report Date: ' _date skip 1 -
         center 'Blake Culbertson, Andrew Gallimore, Abbi Ochoa'

set pagesize 60
set linesize 150

spool 325report5-out.txt

prompt
prompt ========================================
prompt Section 1: Parts, their stock, and their suppliers
prompt ========================================
prompt

column Part_id format 999
column Part_stock format 99
column Part_type format A15
column Supplier_email format A30

select p.Part_id, p.Part_type, p.Part_price, p.Part_stock, p.Part_price * p.Part_stock as Total_value, s.Supplier_name
from Part p
left join Supplier s on p.Supplier_id = s.Supplier_id
group by p.Part_id, p.Part_type, p.Part_price, p.Part_stock, s.Supplier_name
order by p.Part_id;

prompt
prompt ========================================
prompt Section 2: Supplier Information
prompt ========================================
prompt

select s.Supplier_id, s.Supplier_name, s.Supplier_phone, s.Supplier_email, count(p.Part_id) as Num_Parts_Supplied
from Supplier s
left join Part p on s.Supplier_id = p.Supplier_id
group by s.Supplier_id, s.Supplier_name, s.Supplier_phone, s.Supplier_email
order by s.Supplier_name;

prompt
prompt ========================================
prompt Section 3: Parts to reorder (stock less than 3)
prompt ========================================
prompt

select p.Part_id, p.Part_type, p.Part_stock, s.Supplier_name, s.Supplier_phone, s.Supplier_email
from Part p
join Supplier s on p.Supplier_id = s.Supplier_id
where p.Part_stock < 3
order by p.Part_stock asc, p.Part_id;

prompt
prompt ========================================
prompt Section 4: Diversity of suppliers by part type
prompt ========================================
prompt

select p.Part_type, count(distinct p.Supplier_id) as Num_Suppliers
from Part p
group by p.Part_type
order by Num_Suppliers desc, p.Part_type;

prompt
prompt ========================================
prompt Section 5: Inventory Value by Supplier
prompt ========================================
prompt

break on report
compute sum label 'TOTAL INVENTORY VALUE:' of Total_Inventory_Value on report
compute avg label 'Average Value:' of Total_Inventory_Value on report

column Supplier_Name format A25
column Num_Parts format 999
column Total_Inventory_Value format $99,999.99
column Avg_Part_Value format $9,999.99

select s.Supplier_name,
       count(p.Part_id) as Num_Parts,
       sum(p.Part_price * p.Part_stock) as Total_Inventory_Value,
       avg(p.Part_price * p.Part_stock) as Avg_Part_Value
from Supplier s
left join Part p on s.Supplier_id = p.Supplier_id
group by s.Supplier_name
order by Total_Inventory_Value desc;

clear breaks
clear computes

spool off