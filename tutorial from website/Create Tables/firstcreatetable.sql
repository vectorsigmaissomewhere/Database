---------------------------------------------------CREATE TABLE--------------------------------------------------------------------
--Example with no primary key
create table customers(
  customer_id number(10) not null,
  customer_name varchar2(50) not null,
  city varchar2(50)
  );

--Example with primary key
create table customers(
  customer_id number(10) not null,
  customer_name varchar2(50) not null,
  city varchar2(50),
  constraint customers_pk primary key(customer_id)
  );




--------------------------------------CREATE TABLE AS STATEMENT------------------------------------------------------------------------------------
----Example copying all columns of another table

---Example 1 creating a newcustomers table by copying all the columns from the already existing table customers
create table newcustomers
  as(select * from customers where customer-id <5000);

---Example 2 copying selected columns of another table
--This exmaple will create a new table called newcustomers2 with specific columns columns_if and customer_name
create table newcustomers2
as (select customer_id,customer_name
  from customers 
  where customer_id <5000);

--Example 3 copying selected columns from multiple tables 
--here we will copy the selected columns from two tables called regularcustomers and irregularcustomers to newcustomers3
--first we will create and then copy it
create table "regularcustomers"
  ("rcustomer_id" number(10,0) not null enable,
  "rcustomer_name" varchar2(50) not null enable,
  "rc_city" varchar2(50)
  )
/
create table "irregularcustomers"
("ircustomer_id" number(10,0) not null enable,
  "recustomer_name" varchar2(50) not null enable,
  "irc_city" varchar2(50)
  )
/
create table numcustomers3
as (select regularcustomers.rcustomer_id,regularcustomers.rc_city,iregularcustomers.ircustomer
  from regularcustomers,iregularcustomers
  where regularcustomers.rcustomer_id = irregularcustomers.ircustomers_id
  and regularcustomers.rcustomer_id<5000
  );







-----------------------------------------ORACLE ALTER TABLE STATEMENT----------------------------------------------------
--Example 1 add a new column customer_age into the table customers
--doing this you you will finally add a new table called customer_age in table customers
alter table customers
  add customer_age varchar2(50)

--Example 2 add multiple columns in the single table
  --doing this you finally added two new columns called customer_type and customer_address into the table customers
alter table customers
  add(customer_type varchar2(50),
    customer_address varchar2(50));
