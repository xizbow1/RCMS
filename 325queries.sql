-- Blake Culbertson, Andrew Gallimore, Abbi Ochoa
-- CS 325 - Fall 2025
-- 12/1/25

set pagesize 200
set linesize 150

set feedback on

column Full_Name format A30 truncate
column Part_type format A15

spool 325query-results.txt

prompt Query 1: List all products and their suppliers (if applicable)

select Part.Part_id, Part.Part_type, Part.Part_price, Supplier.Supplier_name
from Part
left join Supplier on Part.Supplier_id = Supplier.Supplier_id
order by Part.Part_id;

prompt Query 2: List all suppliers, and the number of items they have supplied.
select Supplier.Supplier_id, Supplier.Supplier_name, count(Part.Part_id) as Num_parts
from Supplier
left join Part on Supplier.Supplier_id = Part.Supplier_id
group by Supplier.Supplier_id, Supplier.Supplier_name
order by Supplier.Supplier_id;

prompt Query 3: List all customers and their rented instruments

select Customer.Cust_id, Customer.Cust_fname || ' ' || Customer.Cust_lname as Full_Name, Instrument.Inst_id, Instrument.Inst_supertype, Instrument.Inst_subtype
from Customer
left join Rental on Customer.Cust_id = Rental.Cust_id
join Instrument on Rental.Inst_id = Instrument.Inst_id
order by Customer.Cust_id;

prompt Query 4: List all repairs, and the customer name
select Repair.Repair_id, Customer.Cust_fname || ' ' || Customer.Cust_lname as Full_Name, Repair.Repair_date_read, Repair.Repair_cost
from Repair
left join Customer on Repair.Cust_id = Customer.Cust_id
order by Repair.Repair_id;  

prompt Query 5: Count the number of times each instrument has been rented
select Instrument.Inst_id, Instrument.Inst_supertype, Instrument.Inst_subtype, count(Rental.Rental_id) as Num_rentals
from Instrument
left join Rental on Instrument.Inst_id = Rental.Inst_id
group by Instrument.Inst_id, Instrument.Inst_supertype, Instrument.Inst_subtype
order by Instrument.Inst_id;

prompt Query 6: Average price of a repair by instrument type
select Instrument.Inst_supertype, avg(Repair.Repair_cost) as Avg_repair_cost
from Repair
join Instrument on Repair.Inst_id = Instrument.Inst_id
group by Instrument.Inst_supertype
order by Instrument.Inst_supertype;

prompt Query 7: All customers with an active rental
select distinct Customer.Cust_id, Customer.Cust_fname || ' ' || Customer.Cust_lname as Full_Name
from Customer
where Customer.Cust_id in (select Rental.Cust_id from Rental where Rental.Rental_due is null)
order by Customer.Cust_id;

prompt Query 8: List all parts that are low in stock (less than 5)
select Part.Part_id, Part.Part_type, Part.Part_stock
from Part
where Part.Part_stock < 5
order by Part.Part_id;

prompt Query 9: List all employees with their job titles and salaries
select Employee.Empl_id, Employee.Empl_fname || ' ' || Employee.Empl_lname as Full_Name, Employee.Empl_job_title, Employee.Empl_salary
from Employee
order by Employee.Empl_id;

prompt Query 10: Total revenue from rentals, grouped by instrument supertype
select Instrument.Inst_supertype, sum(Rental.Rental_cost) as Total_revenue
from Rental
join Instrument on Rental.Inst_id = Instrument.Inst_id
group by Instrument.Inst_supertype
order by Total_revenue desc;

prompt Query 11: List all invoices from more than 6 months ago
select Invoice.Invoice_id, Invoice.Invoice_date, Invoice.Invoice_total
from Invoice
where Invoice.Invoice_date < add_months(sysdate, -6)
order by Invoice.Invoice_date;

prompt Query 12: List all customers and their emails
select Customer.Cust_id, Customer.Cust_fname || ' ' || Customer.Cust_lname as Full_Name, Cust_email.Cust_email
from Customer
left join Cust_email on Customer.Cust_id = Cust_email.Cust_id
order by Customer.Cust_id;

prompt Query 13: List all employees that are paid more than the average
select Empl_id, Empl_fname || ' ' || Empl_lname as Full_Name, Empl_salary
from Employee
where Empl_salary > (select avg(Empl_salary) from Employee)
order by Empl_salary desc;

prompt Query 14: List all parts supplied by suppliers whose name starts with 'H' and price between $10 and $40
select p.Part_id, p.Part_type, p.Part_price
from Part p
where p.Part_price between 10 and 40
  and p.Supplier_id in (
    select Supplier_id
    from Supplier
    where Supplier_name like 'H%'
  );

prompt Query 15: Level 2-3 classes taught by employees that make more than the average salary
select c.Class_id, e.Empl_fname || ' ' || e.Empl_lname as Full_Name, e.Empl_salary
from Class c
join Employee e on c.Empl_id = e.Empl_id
where c.Class_level in (2, 3)
    and e.Empl_salary > (select avg(Empl_salary) from Employee)
order by c.Class_id;

prompt Query 16: List all instruments that are rentable but not currently rented
select Inst_id, Inst_supertype, Inst_subtype
from Instrument
where Inst_isRentable = '1' and Inst_isRented = '0' 
order by Inst_id;

prompt Query 17: Parts that should be reordered (below 3), and their supplier
select p.Part_id, p.Part_type, p.Part_stock, s.Supplier_name
from Part p
left join Supplier s on p.Supplier_id = s.Supplier_id
where p.Part_stock < 3
order by p.Part_stock asc;

prompt Query 18: Average and total instrument cost by supertype
select Inst_supertype, avg(Inst_price) as Avg_price, sum(Inst_price) as Total_price
from Instrument
group by Inst_supertype
order by Inst_supertype;

prompt Query 19: Invoice totals by month
select to_char(Invoice_date, 'YYYY-MM') as YearMonth,
       count(*) as Num_Invoices,
       sum(Invoice_total) as Total_Invoiced
from Invoice
where Invoice_date >= add_months(trunc(sysdate, 'MM'), -12)
group by to_char(Invoice_date, 'YYYY-MM')
order by YearMonth;

prompt Query 20: Total rental revenue by customer
select c.Cust_id, c.Cust_fname || ' ' || c.Cust_lname as Full_Name, 
       sum(r.Rental_cost) as Total_Rental_Cost
from Customer c
left join Rental r on c.Cust_id = r.Cust_id 
group by c.Cust_id, c.Cust_fname, c.Cust_lname
order by Total_Rental_Cost desc;

prompt Query 21: Employees and the count of classes that they teach
select e.Empl_id, e.Empl_fname || ' ' || e.Empl_lname as Full_Name, count(cl.Class_id) as Num_Classes
from Employee e
left join Class cl on e.Empl_id = cl.Empl_id
group by e.Empl_id, e.Empl_fname, e.Empl_lname
order by Num_Classes desc;

prompt Query 22: Instruments used in a class, with details of the instrument
select cl.Class_id, i.Inst_id, i.Inst_supertype, i.Inst_subtype
from Class cl
join Class_instruments ci on cl.Class_id = ci.Class_id
join Instrument i on ci.Inst_id = i.Inst_id
order by cl.Class_id, i.Inst_id;

prompt Query 23: Suppliers ranked by the total value of parts they supply
select s.Supplier_id, s.Supplier_name, sum(p.Part_price * p.Part_stock) as Total_Value
from Supplier s
left join Part p on s.Supplier_id = p.Supplier_id
group by s.Supplier_id, s.Supplier_name
order by Total_Value desc;

prompt Query 24: Employees sorted into salary ranges
select Empl_id, Empl_fname || ' ' || Empl_lname as Full_Name, Empl_salary,
       case 
           when ntile(3) over (order by Empl_salary) = 1 then 'Low'
           when ntile(3) over (order by Empl_salary) = 2 then 'Medium'
           else 'High'
       end as Salary_Range
from Employee
order by Empl_salary;