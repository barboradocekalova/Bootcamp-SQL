create table salesman (
salesman_id NUMERIC (5) PRIMARY KEY,
name VARCHAR (30),
city VARCHAR (15),
commision DECIMAL (5,2)
);

INSERT INTO salesman  
VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman  
VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman  
VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman  
VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman  
VALUES (5007, 'Paul Adam', 'Rome', 0.13);
INSERT INTO salesman  
VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE orders (
ord_no NUMERIC (5) PRIMARY KEY,
purch_amt DECIMAL (8,2),
ord_date DATE,
customer_id NUMERIC (5),
salesman_id NUMERIC (5),
CONSTRAINT FK_salesman_id FOREIGN KEY(salesman_id)
REFERENCES salesman(salesman_id),
CONSTRAINT FK_customer_id FOREIGN KEY(customer_id)
REFERENCES customer(customer_id));

INSERT INTO orders
VALUES (70001, 150.5, to_date('2012-10-05','yyyy-mm-dd'), 3005, 5002);
INSERT INTO orders
VALUES (70009, 270.65, to_date('2012-09-10','yyyy-mm-dd'), 3002, 5005);
INSERT INTO orders
VALUES (70002, 65.26, to_date('2012-10-05','yyyy-mm-dd'), 3002, 5001);
INSERT INTO orders
VALUES (70004, 110.5, to_date('2012-08-17','yyyy-mm-dd'), 3009, 5003);
INSERT INTO orders
VALUES (70007, 948.5, to_date('2012-09-10','yyyy-mm-dd'), 3005, 5002);
INSERT INTO orders
VALUES (70005, 2400.6, to_date('2012-07-27','yyyy-mm-dd'), 3007, 5001);
INSERT INTO orders
VALUES (70008, 5760, to_date('2012-09-10','yyyy-mm-dd'), 3002, 5001);
INSERT INTO orders
VALUES (70010, 1983.43, to_date('2012-10-10','yyyy-mm-dd'), 3004, 5006);
INSERT INTO orders
VALUES (70003, 2480.4, to_date('2012-10-10','yyyy-mm-dd'), 3009, 5003);
INSERT INTO orders
VALUES (70012, 250.45, to_date('2012-06-27','yyyy-mm-dd'), 3008, 5002);
INSERT INTO orders
VALUES (70011, 75.29, to_date('2012-08-17','yyyy-mm-dd'), 3003, 5007);
INSERT INTO orders
VALUES (70013, 3145.6, to_date('2012-04-25','yyyy-mm-dd'), 3002, 5001);

CREATE TABLE customer (
customer_id NUMERIC (5) PRIMARY KEY,
cust_name VARCHAR (30),
city VARCHAR (15),
grade NUMERIC (3),
salesman_id NUMERIC (5));

INSERT INTO customer
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customer
VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customer
VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customer
VALUES (3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO customer
VALUES (3004, 'Fabian Johnson', 'Paris', 300, 5006);
INSERT INTO customer
VALUES (3009, 'Geoff Cameron', 'Berlin', 100, 5003);
INSERT INTO customer
VALUES (3003, 'Jozy Altidor', 'Moscow', 200, 5007);

--1
SELECT cust_name, name AS sales_name, commision
FROM customer c
JOIN salesman s
ON c.salesman_id = s.salesman_id;

--2
SELECT ord_no, ord_date, cust_name, c_city, grade, salesman_name, s_city, commision
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
JOIN salesman s
ON o.salesman_id = s.salesman_id
ORDER BY (cust_name);

--3
SELECT ord_no, purch_amt, cust_name, c_city
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
WHERE purch_amt >= 500 AND purch_amt <=2000;

--4
SELECT ord_no, salesman_id
FROM orders
WHERE salesman_id IN (SELECT salesman_id FROM salesman WHERE salesman_name = 'James Hoog');

--5
SELECT *
FROM orders
WHERE purch_amt > (
SELECT AVG (purch_amt)
FROM orders
WHERE ord_date >= '10.10.2012');




