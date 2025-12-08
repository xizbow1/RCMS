-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS325 - Fall 2025
-- Employee Report

set pagesize 60
set linesize 150
set feedback off

ttitle center 'Employee Tracking System' skip 1 -
       center 'Employee Report' skip 2

btitle center 'Report Date: ' _date skip 1 -
       center 'Blake Culbertson, Andrew Gallimore, Abbi Ochoa'

column Employee_Name format A25
column Empl_id format 999

spool 325report3-out.txt

prompt
prompt ========================================
prompt SECTION 1: Employees and their Salaries
prompt ========================================
prompt

select Empl_id, Empl_job_title, Empl_fname || ' ' || Empl_lname as Employee_Name, Empl_salary, 
        case 
           when ntile(3) over (order by Empl_salary) = 1 then 'Low'
           when ntile(3) over (order by Empl_salary) = 2 then 'Medium'
           else 'High'
       end as Salary_Range
from Employee
order by Empl_salary desc;

prompt
prompt ========================================
prompt SECTION 2: Who is teaching classes
prompt ========================================
prompt

select e.Empl_id, e.Empl_fname || ' ' || e.Empl_lname as Employee_Name, count(c.Class_id) as Classes_Taught
from Employee e
left join Class c on e.Empl_id = c.Empl_id
group by e.Empl_id, e.Empl_fname, e.Empl_lname
order by Classes_Taught desc;

select Class_id, Class_level, Class_cost, to_char(Class_schedule, 'MM/DD/YYYY') as Class_schedule, c.Empl_id, 
         e.Empl_fname || ' ' || e.Empl_lname as Employee_Name
from Class c
left join Employee e on c.Empl_id = e.Empl_id
order by Employee_Name;

prompt
prompt ========================================
prompt SECTION 3: Employees and their Emails
prompt ========================================
prompt

select e.Empl_id, e.Empl_fname || ' ' || e.Empl_lname as Employee_Name, ee.Empl_email
from Employee e
left join Empl_email ee on e.Empl_id = ee.Empl_id
order by e.Empl_id, ee.Empl_email;

prompt
prompt ========================================
prompt SECTION 4: Payroll Summary by Job Title
prompt ========================================
prompt

select Empl_job_title as Job_Title,
       count(*) as Num_Employees,
       sum(Empl_salary) as Total_Payroll,
       avg(Empl_salary) as Avg_Salary,
       min(Empl_salary) as Min_Salary,
       max(Empl_salary) as Max_Salary
from Employee
group by Empl_job_title
order by Total_Payroll desc;

prompt
prompt ========================================
prompt SECTION 5: Employee Workload Analysis
prompt ========================================
prompt

select e.Empl_id,
       e.Empl_fname || ' ' || e.Empl_lname as Employee_Name,
       e.Empl_salary,
       count(c.Class_id) as Classes_Taught,
       round(e.Empl_salary / nullif(count(c.Class_id), 0), 2) as Cost_Per_Class
from Employee e
left join Class c on e.Empl_id = c.Empl_id
group by e.Empl_id, e.Empl_fname, e.Empl_lname, e.Empl_salary
order by Classes_Taught desc;

spool off