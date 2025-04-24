use MyDatabase

delete from sales;
delete from customer;
drop table sales;
delete from customer;


create table cust
(
customer_id int,
customer_name varchar(20),
city varchar(30)
);

INSERT INTO cust (customer_id, customer_name, city) VALUES (1, 'Ravi', 'Mumbai');
INSERT INTO cust (customer_id, customer_name, city) VALUES (2, 'Kavi', 'Chennai');
INSERT INTO cust (customer_id, customer_name, city) VALUES (3, 'Yoga', 'Cochi');
INSERT INTO cust (customer_id, customer_name, city) VALUES (4, 'Renu', 'Chennai');


CREATE TABLE sales (
    order_id INT,
    order_date date,
    amount INT,
    customer_id INT,
	ord_no int
   );



INSERT INTO sales VALUES (101, '2025-10-01', 5000, 1,5); 
INSERT INTO sales VALUES (102, '2025-10-05', 3000, 2,6); 
INSERT INTO sales VALUES (103, '2025-10-07', 7000, 5,8);

--1 Display the customer name, order ID, and order amount for all orders that have a matching customer

select customer_name, order_id,amount from cust inner join sales 
on cust.customer_id=sales.customer_id;

--2 List all customers along with their order amounts. 
--If a customer has not placed any orders, still include them in the result

select * from cust left join sales 
on cust.customer_id = sales.customer_id;

--3 Display all order details even if there is no matching customer for some orders.

select * from sales right join cust 
on cust.customer_id=sales.customer_id;

--4Show a combined list of all customers and all orders. 
--Where there is a match, display them side by side. Where there is no match, display NULLs.
select 
   cust.customer_id, 
   cust.customer_name, 
   cust.city,
   sales.order_id,
   sales.order_date, 
   sales.amount,
   sales.ord_no
   from cust left join sales
   on cust.customer_id=sales.customer_id
   
   union all

   select 
   cust.customer_id, 
   cust.customer_name, 
   cust.city,
   sales.order_id,
   sales.order_date, 
   sales.amount,
   sales.ord_no
   from cust right join sales
   on cust.customer_id=sales.customer_id
   where cust.customer_id is null;



--5 Show the names of customers who never placed any order.

select customer_name from cust left join sales
on cust.customer_id=sales.customer_id
where sales.order_id is null;

--6 Show the details of orders for which the customer information is not available.

select * from sales left join cust
on cust.customer_id=sales.customer_id
where cust.customer_id is null
--8 Count how many customers have never placed any order.

select count(cust.customer_id) from cust left join sales
on cust.customer_id=sales.customer_id
where order_id is null;

--9 List the names of customers along with the number of orders they have placed.

select cust.customer_name, count(sales.order_id) from cust left join sales
on cust.customer_id=sales.customer_id
group by cust.customer_name;

--10 Display customers and total amount they have spent on orders.
select cust.customer_name,sum(sales.amount) as total from cust left join sales
on cust.customer_id=sales.customer_id
group by cust.customer_name;

