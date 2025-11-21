prompt Blake Culbertson, Andrew Gallimore, Abbi Ochoa
prompt CS325 - Fall 2025

set feedback off

prompt Deleting data

delete from Concert_class_id;
delete from Class_instruments;
delete from Cust_email;
delete from Empl_email;
delete from Rental;
delete from Repair;
delete from Invoice;
delete from Part;
delete from Concert;
delete from Class;
delete from Instrument;
delete from Customer;
delete from Employee;
delete from Supplier;

prompt Inserting data

prompt Inserting Employee

insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (1, 60461.19, 'Store Manager', 'Horten', 'Kime');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (2, 69990.98, 'Music Instructor', 'Kacey', 'Dalwood');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (3, 56506.45, 'Sales Associate', 'Gwenny', 'Bomfield');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (4, 34755.79, 'Music Instructor', 'Alphonse', 'Gerdes');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (5, 33121.2, 'Inventory Specialist', 'Ignazio', 'Lambillion');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (6, 61473.47, 'Store Manager', 'Ax', 'Burth');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (7, 30116.43, 'Sales Associate', 'Chelsy', 'Dunford');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (8, 61005.97, 'Customer Service Representative', 'Bordie', 'Tupling');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (9, 64939.21, 'Music Instructor', 'Jareb', 'Edgerly');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (10, 68465.72, 'Inventory Specialist', 'Thebault', 'Matuszewski');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (11, 32607.6, 'Store Manager', 'Myrvyn', 'Kike');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (12, 65745.62, 'Customer Service Representative', 'Mitzi', 'Gullberg');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (13, 60176.91, 'Music Instructor', 'Loren', 'Longbone');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (14, 60501.53, 'Customer Service Representative', 'Bruis', 'Lackington');
insert into Employee (Empl_id, Empl_salary, Empl_job_title, Empl_fname, Empl_lname) values (15, 65738.24, 'Customer Service Representative', 'Idelle', 'Gorvin');

prompt Inserting Supplier

insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (1, 'Hermann, Kris and McLaughlin', '8486758219', 'vattarge0@howstuffworks.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (2, 'Bernhard, Wisozk and Dare', '5907755368', 'iferrierio1@blogspot.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (3, 'Bode, Kris and Corwin', '9165100158', 'daspole2@abc.net.au');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (4, 'Hilpert, Hauck and Bogisich', '2305400799', 'dpykett3@tumblr.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (5, 'Dach Inc', '3888426243', 'echaves4@youku.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (6, 'Thompson, O''Hara and Prohaska', '6608240820', 'laimson5@so-net.ne.jp');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (7, 'Corwin-Aufderhar', '9973156203', 'kattlee6@wsj.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (8, 'Kassulke-Franecki', '2809344845', 'ahuckle7@ucoz.ru');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (9, 'Bechtelar Group', '6675882338', 'lthorwarth8@netscape.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (10, 'Homenick-Gutmann', '9239477948', 'ljoseph9@salon.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (11, 'Block-Grant', '3026774726', 'zbenera@cnn.com');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (12, 'Feil, Reichert and Sporer', '2563388004', 'aklimshukb@wordpress.org');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (13, 'Renner-MacGyver', '1419021716', 'nslimmingc@dailymail.co.uk');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (14, 'Ortiz, Emard and Bashirian', '1068252572', 'gjewettd@craigslist.org');
insert into Supplier (Supplier_id, Supplier_name, Supplier_phone, Supplier_email) values (15, 'Graham-Murazik', '8693187759', 'sstreetleye@apache.org');

prompt Inserting Customer

insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (1, 'Phayre', 'Shayne', 70.89);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (2, 'Truder', 'Morganica', 97.98);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (3, 'Downer', 'Ira', 40.89);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (4, 'McChruiter', 'Ezequiel', 93.55);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (5, 'Stillmann', 'Codi', 63.36);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (6, 'Brimblecomb', 'Kirsteni', 44.19);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (7, 'Wigzell', 'Nicol', 12.84);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (8, 'Jeffery', 'Sigismond', 88.04);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (9, 'Everingham', 'Sergent', 79.41);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (10, 'Arcase', 'Cathee', 41.71);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (11, 'Hickeringill', 'Shawn', 40.85);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (12, 'Harwick', 'Claudetta', 96.03);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (13, 'Nisby', 'Jillene', 53.48);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (14, 'Giacobillo', 'Bink', 74.1);
insert into Customer (Cust_id, Cust_lname, Cust_fname, Cust_creditbal) values (15, 'Gadsden', 'Mason', 17.28);

prompt Inserting Instrument

insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (1, 'Piano', 'Grand Piano', 0, 98.1, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (2, 'Guitar', 'Electric Guitar', 1, 18.04, 1);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (3, 'Saxophone', 'Alto Saxophone', 1, 62.32, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (4, 'Piano', 'Upright Piano', 0, 87.18, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (5, 'Guitar', 'Acoustic Guitar', 0, 5.18, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (6, 'Saxophone', 'Baritone Saxophone', 0, 30.24, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (7, 'Piano', 'Grand Piano', 0, 97.99, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (8, 'Guitar', 'Electric Guitar', 1, 57.45, 1);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (9, 'Saxophone', 'Alto Saxophone', 1, 23.72, 1);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (10, 'Piano', 'Upright Piano', 1, 25.09, 1);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (11, 'Guitar', 'Acoustic Guitar', 1, 32.62, 1);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (12, 'Saxophone', 'Baritone Saxophone', 0, 15.35, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (13, 'Piano', 'Grand Piano', 1, 29.02, 0);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (14, 'Guitar', 'Electric Guitar', 0, 79.25, 1);
insert into Instrument (Inst_id, Inst_supertype, Inst_subtype, Inst_isRentable, Inst_price, Inst_isRented) values (15, 'Saxophone', 'Alto Saxophone', 1, 32.78, 0);

prompt Inserting Concert

insert into Concert (Concert_id, Concert_date, Concert_cost) values (1, TO_DATE('08/25/2025','MM/DD/YYYY'), 2.57);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (2, TO_DATE('05/31/2025','MM/DD/YYYY'), null);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (3, TO_DATE('12/20/2024','MM/DD/YYYY'), 28.35);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (4, TO_DATE('09/27/2025','MM/DD/YYYY'), 47.44);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (5, TO_DATE('05/04/2025','MM/DD/YYYY'), 33.9);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (6, TO_DATE('08/15/2025','MM/DD/YYYY'), 44.53);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (7, TO_DATE('10/01/2025','MM/DD/YYYY'), null);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (8, TO_DATE('05/19/2025','MM/DD/YYYY'), null);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (9, TO_DATE('04/19/2025','MM/DD/YYYY'), 5.31);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (10, TO_DATE('05/04/2025','MM/DD/YYYY'), 42.14);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (11, TO_DATE('12/24/2024','MM/DD/YYYY'), null);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (12, TO_DATE('08/06/2025','MM/DD/YYYY'), 21.97);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (13, TO_DATE('04/30/2025','MM/DD/YYYY'), 14.6);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (14, TO_DATE('02/22/2025','MM/DD/YYYY'), 16.56);
insert into Concert (Concert_id, Concert_date, Concert_cost) values (15, TO_DATE('01/25/2025','MM/DD/YYYY'), 26.79);

prompt Inserting Class

insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (1, 3, 240.16, TO_DATE('12/26/2022','MM/DD/YYYY'), 5);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (2, 2, 411.0, TO_DATE('12/04/2026','MM/DD/YYYY'), 14);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (3, 1, 428.79, TO_DATE('02/26/2020','MM/DD/YYYY'), 4);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (4, 3, 129.3, TO_DATE('07/09/2026','MM/DD/YYYY'), 1);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (5, 1, 487.4, TO_DATE('09/27/2030','MM/DD/YYYY'), 2);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (6, 3, 145.13, TO_DATE('02/05/2026','MM/DD/YYYY'), 10);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (7, 1, 260.6, TO_DATE('07/22/2029','MM/DD/YYYY'), 5);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (8, 3, 252.41, TO_DATE('10/28/2028','MM/DD/YYYY'), 8);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (9, 3, 442.4, TO_DATE('04/14/2020','MM/DD/YYYY'), 8);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (10, 1, 412.32, TO_DATE('01/07/2029','MM/DD/YYYY'), 1);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (11, 3, 30.13, TO_DATE('01/21/2020','MM/DD/YYYY'), 11);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (12, 1, 481.27, TO_DATE('01/26/2024','MM/DD/YYYY'), 10);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (13, 3, 493.59, TO_DATE('11/14/2024','MM/DD/YYYY'), 5);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (14, 1, 178.27, TO_DATE('07/15/2020','MM/DD/YYYY'), 5);
insert into Class (Class_id, Class_level, Class_cost, Class_schedule, Empl_id) values (15, 1, 266.47, TO_DATE('08/18/2021','MM/DD/YYYY'), 5);

prompt Inserting Empl_email

insert into Empl_email (Empl_id, Empl_email) values (1, 'apeperell0@behance.net');
insert into Empl_email (Empl_id, Empl_email) values (2, 'faery1@vistaprint.com');
insert into Empl_email (Empl_id, Empl_email) values (3, 'dkinge2@biglobe.ne.jp');
insert into Empl_email (Empl_id, Empl_email) values (4, 'ddobrowski3@github.com');
insert into Empl_email (Empl_id, Empl_email) values (5, 'cglackin4@google.com');
insert into Empl_email (Empl_id, Empl_email) values (6, 'tbanker5@examiner.com');
insert into Empl_email (Empl_id, Empl_email) values (7, 'lbilfoot6@mtv.com');
insert into Empl_email (Empl_id, Empl_email) values (8, 'vjonathon7@narod.ru');
insert into Empl_email (Empl_id, Empl_email) values (9, 'msrutton8@netscape.com');
insert into Empl_email (Empl_id, Empl_email) values (10, 'rgagan9@tinypic.com');
insert into Empl_email (Empl_id, Empl_email) values (11, 'bvautina@columbia.edu');
insert into Empl_email (Empl_id, Empl_email) values (12, 'slynesb@sciencedaily.com');
insert into Empl_email (Empl_id, Empl_email) values (13, 'dstaniforthc@unc.edu');
insert into Empl_email (Empl_id, Empl_email) values (14, 'uhalesd@mac.com');
insert into Empl_email (Empl_id, Empl_email) values (15, 'sskittlee@t-online.de');

prompt Inserting Cust_email

insert into Cust_email (Cust_id, Cust_email) values (1, 'npidcock0@blog.com');
insert into Cust_email (Cust_id, Cust_email) values (2, 'vmarle1@blogs.com');
insert into Cust_email (Cust_id, Cust_email) values (3, 'ekowal2@google.com');
insert into Cust_email (Cust_id, Cust_email) values (4, 'obowller3@scientificamerican.com');
insert into Cust_email (Cust_id, Cust_email) values (5, 'amacteague4@blinklist.com');
insert into Cust_email (Cust_id, Cust_email) values (6, 'bcreedland5@ucla.edu');
insert into Cust_email (Cust_id, Cust_email) values (7, 'fbeeby6@latimes.com');
insert into Cust_email (Cust_id, Cust_email) values (8, 'dkilduff7@theatlantic.com');
insert into Cust_email (Cust_id, Cust_email) values (9, 'awinterbotham8@omniture.com');
insert into Cust_email (Cust_id, Cust_email) values (10, 'rpadly9@utexas.edu');
insert into Cust_email (Cust_id, Cust_email) values (11, 'asawera@xing.com');
insert into Cust_email (Cust_id, Cust_email) values (12, 'sbowcockb@sitemeter.com');
insert into Cust_email (Cust_id, Cust_email) values (13, 'wloadc@w3.org');
insert into Cust_email (Cust_id, Cust_email) values (14, 'wdenyukhind@meetup.com');
insert into Cust_email (Cust_id, Cust_email) values (15, 'ebumpase@engadget.com');

prompt Inserting Class_instruments

insert into Class_instruments (Class_id, Inst_id) values (1, 14);
insert into Class_instruments (Class_id, Inst_id) values (2, 8);
insert into Class_instruments (Class_id, Inst_id) values (3, 3);
insert into Class_instruments (Class_id, Inst_id) values (4, 15);
insert into Class_instruments (Class_id, Inst_id) values (5, 12);
insert into Class_instruments (Class_id, Inst_id) values (6, 7);
insert into Class_instruments (Class_id, Inst_id) values (7, 8);
insert into Class_instruments (Class_id, Inst_id) values (8, 11);
insert into Class_instruments (Class_id, Inst_id) values (9, 10);
insert into Class_instruments (Class_id, Inst_id) values (10, 4);
insert into Class_instruments (Class_id, Inst_id) values (11, 1);
insert into Class_instruments (Class_id, Inst_id) values (12, 3);
insert into Class_instruments (Class_id, Inst_id) values (13, 14);
insert into Class_instruments (Class_id, Inst_id) values (14, 15);
insert into Class_instruments (Class_id, Inst_id) values (15, 3);

prompt Inserting Concert_class_id

insert into Concert_class_id (Concert_id, Class_id) values (1, 3);
insert into Concert_class_id (Concert_id, Class_id) values (2, 7);
insert into Concert_class_id (Concert_id, Class_id) values (3, 15);
insert into Concert_class_id (Concert_id, Class_id) values (4, 6);
insert into Concert_class_id (Concert_id, Class_id) values (5, 15);
insert into Concert_class_id (Concert_id, Class_id) values (6, 14);
insert into Concert_class_id (Concert_id, Class_id) values (7, 4);
insert into Concert_class_id (Concert_id, Class_id) values (8, 2);
insert into Concert_class_id (Concert_id, Class_id) values (9, 4);
insert into Concert_class_id (Concert_id, Class_id) values (10, 11);
insert into Concert_class_id (Concert_id, Class_id) values (11, 12);
insert into Concert_class_id (Concert_id, Class_id) values (12, 9);
insert into Concert_class_id (Concert_id, Class_id) values (13, 10);
insert into Concert_class_id (Concert_id, Class_id) values (14, 12);
insert into Concert_class_id (Concert_id, Class_id) values (15, 8);

prompt Inserting Part

insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (1, 'cymbals', 15.22, 2, 1);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (2, 'strings', 19.5, 8, 2);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (3, 'valves', 69.86, 9, 3);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (4, 'pegs', 3.32, 10, 4);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (5, 'mouthpiece', 40.12, 0, 5);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (6, 'cymbals', 33.36, 2, 6);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (7, 'drumheads', 72.63, 3, 7);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (8, 'valves', 11.83, 9, 8);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (9, 'drumheads', 4.05, 5, 9);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (10, 'valves', 32.99, 10, 10);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (11, 'valves', 27.64, 8, 11);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (12, 'tuning knobs', 86.17, 0, 12);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (13, 'reeds', 21.7, 1, 13);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (14, 'cymbals', 56.12, 5, 14);
insert into Part (Part_id, Part_type, Part_price, Part_stock, Supplier_id) values (15, 'drumheads', 39.34, 4, 15);

prompt Inserting Invoice

insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (1, TO_DATE('12/17/2024','MM/DD/YYYY'), 1, 97.95);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (2, TO_DATE('11/16/2025','MM/DD/YYYY'), 2, 51.76);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (3, TO_DATE('10/13/2025','MM/DD/YYYY'), 3, 85.96);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (4, TO_DATE('07/25/2025','MM/DD/YYYY'), 4, 75.63);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (5, TO_DATE('04/19/2025','MM/DD/YYYY'), 5, 89.93);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (6, TO_DATE('07/07/2025','MM/DD/YYYY'), 6, 10.45);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (7, TO_DATE('12/28/2024','MM/DD/YYYY'), 7, 60.64);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (8, TO_DATE('10/31/2025','MM/DD/YYYY'), 8, 89.53);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (9, TO_DATE('02/08/2025','MM/DD/YYYY'), 9, 13.34);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (10, TO_DATE('04/03/2025','MM/DD/YYYY'), 10, 24.98);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (11, TO_DATE('03/06/2025','MM/DD/YYYY'), 11, 38.56);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (12, TO_DATE('08/26/2025','MM/DD/YYYY'), 12, 11.65);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (13, TO_DATE('02/07/2025','MM/DD/YYYY'), 13, 27.08);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (14, TO_DATE('10/27/2025','MM/DD/YYYY'), 14, 69.86);
insert into Invoice (Invoice_id, Invoice_date, Cust_id, Invoice_total) values (15, TO_DATE('03/11/2025','MM/DD/YYYY'), null, 50.07);

prompt Inserting Rental

insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (1, 1, 1, TO_DATE('12/12/2016','MM/DD/YYYY'), TO_DATE('11/22/2023','MM/DD/YYYY'), 1691.44);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (2, 2, 2, TO_DATE('12/05/2018','MM/DD/YYYY'), TO_DATE('09/02/2025','MM/DD/YYYY'), 4969.19);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (3, 3, 3, TO_DATE('05/20/2018','MM/DD/YYYY'), TO_DATE('10/31/2024','MM/DD/YYYY'), 2080.39);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (4, 4, 4, TO_DATE('12/11/2020','MM/DD/YYYY'), TO_DATE('04/15/2023','MM/DD/YYYY'), 1859.24);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (5, 5, 5, TO_DATE('07/21/2020','MM/DD/YYYY'), TO_DATE('08/09/2021','MM/DD/YYYY'), 3269.16);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (6, 6, 6, TO_DATE('11/13/2019','MM/DD/YYYY'), TO_DATE('12/11/2023','MM/DD/YYYY'), 4852.78);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (7, 7, 7, TO_DATE('05/21/2019','MM/DD/YYYY'), TO_DATE('06/06/2025','MM/DD/YYYY'), 4134.26);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (8, 8, 8, TO_DATE('01/21/2020','MM/DD/YYYY'), TO_DATE('11/30/2024','MM/DD/YYYY'), 2894.93);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (9, 9, 9, TO_DATE('02/23/2019','MM/DD/YYYY'), TO_DATE('06/21/2021','MM/DD/YYYY'), 979.4);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (10, 10, 10, TO_DATE('11/22/2015','MM/DD/YYYY'), TO_DATE('10/14/2021','MM/DD/YYYY'), 1640.15);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (11, 11, 11, TO_DATE('07/29/2020','MM/DD/YYYY'), TO_DATE('06/07/2024','MM/DD/YYYY'), 3622.66);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (12, 12, 12, TO_DATE('08/16/2015','MM/DD/YYYY'), TO_DATE('08/15/2024','MM/DD/YYYY'), 111.66);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (13, 13, 13, TO_DATE('02/25/2020','MM/DD/YYYY'), TO_DATE('08/09/2021','MM/DD/YYYY'), 442.77);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (14, 14, 14, TO_DATE('10/17/2018','MM/DD/YYYY'), TO_DATE('01/10/2021','MM/DD/YYYY'), 1993.46);
insert into Rental (Rental_id, Cust_id, Inst_id, Rental_start, Rental_due, Rental_cost) values (15, 15, 15, TO_DATE('11/21/2018','MM/DD/YYYY'), TO_DATE('03/25/2023','MM/DD/YYYY'), 2333.7);

prompt Inserting Repair

insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (1, 1, 1, 946.79, TO_DATE('07/09/2017','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (2, 2, 2, 126.49, TO_DATE('04/01/2019','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (3, 3, 3, 849.77, TO_DATE('03/13/2016','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (4, 4, 4, 110.92, TO_DATE('02/28/2015','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (5, 5, 5, 958.23, TO_DATE('09/21/2028','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (6, 6, 6, 804.41, TO_DATE('02/25/2028','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (7, 7, 7, 373.1, TO_DATE('07/09/2029','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (8, 8, 8, 494.38, TO_DATE('10/04/2030','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (9, 9, 9, 732.31, TO_DATE('12/14/2023','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (10, 10, 10, 544.21, TO_DATE('03/24/2023','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (11, 11, 11, 238.0, TO_DATE('08/08/2025','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (12, 12, 12, 239.43, TO_DATE('10/03/2020','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (13, 13, 13, 22.88, TO_DATE('08/14/2017','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (14, 14, 14, 620.21, TO_DATE('06/04/2027','MM/DD/YYYY'));
insert into Repair (Repair_id, Cust_id, Inst_id, Repair_cost, Repair_date_read) values (15, 15, 15, 577.6, TO_DATE('07/18/2028','MM/DD/YYYY'));