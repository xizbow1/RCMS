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