create database contact_management;
use contact_management;

create table company(
companyid int primary key,
companyname varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10)
);


-- 1

create table contact(
contactid int primary key,
companyid int,
firstname varchar(45),
lastname varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10),
ismain boolean,
email varchar(45),
phone varchar(12),
foreign key (companyid) references company(companyid)
);

-- 2

create table employee(
employeeid int primary key,
firstname varchar(45),
lastname varchar(45),
salary decimal (10,2),
hiredate date,
jobtitle varchar(25),
email varchar(45),
phone varchar(12) 
);

-- 3

create table contact_employee(
contactemployeeid int primary key,
contactid int,
employeeid int,
contactdate date,
description varchar(100),
foreign key (contactid) references contact(contactid),
foreign key (employeeid) references employee(employeeid)
);

-- 4

update employee
set phone = '215-555-8800'
where firstname = 'lesley' and lastname = 'bland';

-- 5

update company 
set companyname = 'urban outfitters'
where companyname = 'urban outfitters,inc.';

-- 6

delete from contact_employee
where contactid = (select contactid from contact where firstname = 'dianne' and lastname = 'connor') 
and
employeeid = (select employeeid from employee where firstname = 'jack' and lastname = 'lee');

-- 7

select e.firstname,
e.lastname from employee as e
join contact_employee as ce on e.employeeid = ce.employeeid 
join contact as c on ce.contactid = c.contactid
join company as co on c.companyid = co.companyid 
where co.companyname = 'toll brothers';


-- Q8) What is the significance of "%" and "_" operators in the LIKE statement?
-- Answer:
-- In SQL, the LIKE operator is used for searching patterns. 
-- - The "%" (percentage) sign matches any number of characters (zero or more). For example, 'A%' matches all names starting with A.
-- - The "_" (underscore) sign matches exactly one character. For example, '_a%' means the second letter must be 'a'.


-- Q9) Explain normalization in the context of databases.
-- Answer:
-- Normalization is a technique to organize data in the database. Its main goal is to reduce duplicate data (redundancy) and ensure data is stored logically. 
-- It involves breaking down large tables into smaller, related tables. The common forms are 1NF, 2NF, and 3NF.


-- Q10) What does a join in MySQL mean?
-- Answer:
-- A JOIN is used to combine rows from two or more tables based on a related column between them. When we have data split across different tables, we use Joins to fetch them together in a single result.

-- Q11) What do you understand about DDL, DCL, and DML in MySQL?
-- Answer:
-- SQL commands are divided into three categories:
-- 1. DDL (Data Definition Language): Used to define the table structure. Examples: CREATE, ALTER, DROP.
-- 2. DML (Data Manipulation Language): Used to modify or retrieve data inside the table. Examples: INSERT, UPDATE, DELETE, SELECT.
-- 3. DCL (Data Control Language): Used for permissions and security. Examples: GRANT, REVOKE.

-- Q12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
-- Answer:
-- The role of a JOIN is to link tables so we can query data from multiple places at once using a common key (like an ID).
-- Common types are:
-- - INNER JOIN: Returns records that match in both tables.
-- - LEFT JOIN: Returns all records from the left table and matched records from the right.
-- - RIGHT JOIN: Returns all records from the right table and matched records from the left.







