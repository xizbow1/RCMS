set pagesize 60
set linesize 150

prompt Query 17: Parts that should be reordered (below 3), and their supplier
select p.Part_id, p.Part_type, p.Part_stock, s.Supplier_name
from Part p
left join Supplier s on p.Supplier_id = s.Supplier_id
where p.Part_stock < 3
order by p.Part_stock asc;

prompt Query 24: Employees sorted into salary ranges
select Empl_id, Empl_fname || ' ' || Empl_lname as Full_Name, Empl_salary,
       case 
           when ntile(3) over (order by Empl_salary) = 1 then 'Low'
           when ntile(3) over (order by Empl_salary) = 2 then 'Medium'
           else 'High'
       end as Salary_Range
from Employee
order by Empl_salary;