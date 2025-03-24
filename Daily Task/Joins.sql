use joins;
/* CREATE TABLE salesman ( salesman_id INT PRIMARY KEY,
                        name VARCHAR(50) NOT NULL,
						city VARCHAR(50),
						commission DECIMAL(5,2)); */

/* INSERT INTO salesman  VALUES(5001, 'James Hoog', 'New York', 0.15),
                            (5002, 'Nail Knite', 'Paris', 0.13),
							(5005, 'Pit Alex', 'London', 0.11),
							(5006, 'Mc Lyon', 'Paris', 0.14),
							(5007, 'Paul Adam', 'Rome', 0.13),
							(5003, 'Lauson Hen', 'San Jose', 0.12); */

/* CREATE TABLE customer (customer_id INT PRIMARY KEY,
                       cust_name VARCHAR(50) NOT NULL,
					   city VARCHAR(50),
					   grade INT,
					   salesman_id INT,
					   FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)); */

/* INSERT INTO customer  VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
							 (3005, 'Graham Zusi', 'California', 200, 5002),
							 (3008, 'Julian Green', 'London', 300, 5002),
							 (3004, 'Fabian Johnson', 'Paris', 300, 5006),
							 (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
							 (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
							 (3001, 'Brad Guzan', 'London', NULL, 5005); */

/* CREATE TABLE orders (ord_no INT PRIMARY KEY,
                     purch_amt DECIMAL(10,2) NOT NULL,
					 ord_date DATE NOT NULL,
					 customer_id INT,
					 salesman_id INT,
					 FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
					 FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)); */

/* INSERT INTO orders  VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
                           (70009, 270.65, '2012-09-10', 3001, 5005),
						   (70002, 65.26, '2012-10-05', 3002, 5001),
						   (70004, 110.5, '2012-08-17', 3009, 5003),
						   (70007, 948.5, '2012-09-10', 3005, 5002),
						   (70005, 2400.6, '2012-07-27', 3007, 5001),
						   (70008, 5760, '2012-09-10', 3002, 5001),
						   (70010, 1983.43, '2012-10-10', 3004, 5006),
						   (70003, 2480.4, '2012-10-10', 3009, 5003); */

/* CREATE TABLE company (com_id INT PRIMARY KEY,
                      com_name VARCHAR(50) NOT NULL); */

/* INSERT INTO company VALUES(11, 'Samsung'),
                            (12, 'iBall'),
							(13, 'Epsion'),
							(14, 'Zebronics'),
							(15, 'Asus'),
							(16, 'Frontech'); */

/* CREATE TABLE item_mast ( pro_id INT PRIMARY KEY,
                        pro_name VARCHAR(50) NOT NULL,
						pro_price DECIMAL(10,2) NOT NULL,
						pro_com INT NOT NULL); */

/* INSERT INTO item_mast  VALUES(101, 'Mother Board', 3200.00, 15),
                             (102, 'Key Board', 450.00, 16),
							 (103, 'ZIP drive', 250.00, 14),
							 (104, 'Speaker', 550.00, 16),
							 (105, 'Monitor', 5000.00, 11),
							 (106, 'DVD drive', 900.00, 12),
							 (107, 'CD drive', 800.00, 12),
							 (108, 'Printer', 2600.00, 13),
							 (109, 'Refill cartridge', 350.00, 13),
							 (110, 'Mouse', 250.00, 12); */


/* CREATE TABLE emp_department (dpt_code INT PRIMARY KEY,
                            dpt_name VARCHAR(50) NOT NULL,
                            dpt_allotment DECIMAL(10,2) NOT NULL); */

/* INSERT INTO emp_department  VALUES (57, 'IT', 65000),
                                   (63, 'Finance', 15000),
								   (47, 'HR', 240000),
								   (27, 'RD', 55000),
								   (89, 'QC', 75000); */

/* CREATE TABLE emp_details ( emp_idno INT PRIMARY KEY,
                           emp_fname VARCHAR(50) NOT NULL,
                           emp_lname VARCHAR(50),
                           emp_dept INT,
                           FOREIGN KEY (emp_dept) REFERENCES emp_department(dpt_code)); */

/* INSERT INTO emp_details  VALUES (127323, 'Michale', 'Robbin', 57),
                                (526689, 'Carlos', 'Snares', 63),
								(843795, 'Enric', 'Dosio', 57),
								(328717, 'Jhon', 'Snares', 63),
								(444527, 'Joseph', 'Dosni', 47),
								(659831, 'Zanifer', 'Emily', 47),
								(847674, 'Kuleswar', 'Sitaraman', 57),
								(748681, 'Henrey', 'Gabriel', 47),
								(555935, 'Alex', 'Manuel', 57); */




--1. 
/* SELECT a.name as Salesman , b.cust_name as Customer , a.city
from salesman a
join customer b 
on
b.city = a.city; */

--2.
/* SELECT a.ord_no as OrderNo , a.purch_amt as PurchaseAmount, b.cust_name as Customer , b.city as City
from orders a
join customer b
on
a.customer_id= b.customer_id
where a.purch_amt between 500 and 2000; */

--3.
/* SELECT a.cust_name as Customer , a.city as City , b.name as Salesman , b.commission as Commission
from customer a
join salesman b
on
a.salesman_id = b.salesman_id; */

--4.
/* select a.cust_name as Customer , a.city as City , b.name as Salesman , b.commission as Commission 
from customer a
join salesman b
on
a.salesman_id = b.salesman_id
where b.commission > 0.12; */

--5.
/* select a.cust_name as Customer , a.city as City , b.city as Salesmancity, b.commission as Commission
from customer a
join salesman b
on
a.salesman_id = b.salesman_id
where a.city <> b.city and b.commission > 0.12; */

--6.
/* select a.ord_no as OrderNo , a.ord_date as OrderDate, a.purch_amt as PurchaseAmount , b.cust_name as Cutomer,b.grade as Grade ,c.name as Salesman
from orders a
join customer b
on
a.customer_id = b.customer_id
join salesman c
on
a.salesman_id = b.salesman_id; */

--7. 
/* SELECT 
    a.ord_no, 
    a.ord_date, 
    a.purch_amt, 
    b.customer_id, 
    b.cust_name, 
    b.city AS customer_city, 
    b.grade, 
    c.salesman_id, 
    c.name AS salesman_name, 
    c.city AS salesman_city, 
    c.commission
FROM orders a
JOIN customer b ON b.customer_id = b.customer_id
JOIN salesman c ON c.salesman_id = c.salesman_id; */

--8.
/* select a.cust_name as Customer , a.city as City , a.grade as Grade, b.name as Salesman , b.city as salesmanCity
from customer a
join salesman b
on
a.salesman_id = b.salesman_id 
order by a.customer_id asc; */


--9.
/* select a.cust_name as Customer,a.city as City , a.grade as Grade,b.name as Salesman,b.city as Salesmancity
from customer a
join salesman b
on
a.salesman_id = b.salesman_id
where a.grade < 300 
order by a.cust_name  asc; */

--10.
/* select a.cust_name as Customer , a.city as City, b.ord_no AS OrderNo, b.ord_date as Orderdate , b.purch_amt as OrderAmount
from customer a
join orders b
on
a.customer_id = b.customer_id
order by b.ord_date asc; */

--11.
/* SELECT a.cust_name AS Customer_Name,a.city AS Customer_City,b.ord_no AS Order_Number,b.ord_date AS Order_Date,b.purch_amt AS Order_Amount, 
    c.name AS Salesperson_Name,c.commission AS Commission
FROM customer a
LEFT JOIN orders b ON a.customer_id = b.customer_id
LEFT JOIN salesman c ON c.salesman_id = c.salesman_id
ORDER BY b.ord_date ASC; */

--12.
/* select a.name as Salesman , a.city as City , a.commission as Commission , b.cust_name as Customer
from salesman a
left join customer b
on
a.salesman_id = b.salesman_id
order by a.name asc; */

--13.
/* select a.name as Salesman , a.city as City, a.commission as Commission,
       b.cust_name as Customer, b.city as City,b.grade as Grade,
	   c.ord_no as OrderNo, c.ord_date as OrderDate, c.purch_amt as PruchaseAmount
from salesman a
left join customer b
on
a.salesman_id = b.salesman_id
left join orders c
on
b.customer_id = c.customer_id
order by a.name asc, b.cust_name asc, c.ord_date asc; */

--14.
/* select a.name as Salesman , a.city as City, a.commission as Commission,
       b.cust_name as Customer, b.city as City,b.grade as Grade,
	   c.ord_no as OrderNo, c.ord_date as OrderDate, c.purch_amt as PruchaseAmount
from salesman a
left join customer b
on
a.salesman_id = b.salesman_id
left join orders c
on
b.customer_id = c.customer_id and (c.purch_amt >= 2000 or c.ord_no is NULL)
where b.grade is not null or c.ord_no is null
order by a.name asc,b.cust_name asc,c.ord_date asc; */

--15.
/* select coalesce(a.cust_name , 'unknown customer') as CustomerName, coalesce(a.city , 'Unknown city') as CustomerCity,
b.ord_no as OrderNo,b.ord_date as Orderdate,b.purch_amt as PurchaseAmount
from customer a
left join orders b
on
a.customer_id= a.customer_id 
order by b.ord_date asc,a.cust_name asc; */

--16.
/* SELECT COALESCE(a.cust_name, 'Unknown Customer') AS Customer_Name, 
    COALESCE(a.city, 'Unknown City') AS Customer_City, 
    b.ord_no AS Order_Number, 
    b.ord_date AS Order_Date, 
    b.purch_amt AS Purchase_Amount
FROM orders b
LEFT JOIN customer a ON a.customer_id = a.customer_id
WHERE a.grade IS NOT NULL 
   OR a.customer_id IS NULL
ORDER BY b.ord_date ASC, a.cust_name ASC; */

--17.
/* select a.salesman_id as SalesmanId,a.name as Salesman ,a.city as City,a.commission as Commission,
       b.customer_id as CustomerID,b.cust_name as Customer,b.city as City,	b.grade as Grade
	   from salesman a
	   cross join customer b; */

--18.
/* select a.name as Salesman,a.city as City , a.commission as Commission , 
       b.cust_name as Customer, b.grade as Grade
	   from salesman a
	   join customer b
	   on
	   a.city= b.city  
	   order by a.salesman_id , b.customer_id; */

--19.
/* SELECT a.salesman_id AS Salesman_ID,a.name AS Salesman,a.city AS Salesman_City,a.commission AS Commission, 
    b.customer_id AS Customer_ID,b.cust_name AS Customer,b.city AS Customer_City,b.grade AS Grade
FROM salesman a
CROSS JOIN customer b
WHERE a.city IS NOT NULL  
AND b.grade IS NOT NULL   
ORDER BY a.salesman_id, b.customer_id; */

--20.
/* SELECT a.salesman_id AS Salesman_ID,a.name AS Salesman,a.city AS Salesman_City,a.commission AS Commission, 
    b.customer_id AS Customer_ID,b.cust_name AS Customer,b.city AS Customer_City,b.grade AS Grade
FROM salesman a
CROSS JOIN customer b
WHERE a.city IS NOT NULL  
AND b.grade IS NOT NULL   
AND a.city <> b.city      
ORDER BY a.salesman_id, b.customer_id; */

--21.
/* SELECT a.pro_id AS Product_ID,a.pro_name AS Product_Name,a.pro_price AS Product_Price, 
    b.com_id AS Company_ID,b.com_name AS Company_Name
FROM item_mast a
INNER JOIN company b
ON
a.pro_com = b.com_id; */

--22.
/* SELECT a.pro_name AS Product_Name,a.pro_price AS Product_Price, 
    b.com_name AS Company_Name
FROM item_mast a
INNER JOIN company b
ON
a.pro_com = b.com_id; */

--23.
/* SELECT b.com_name AS Company_Name, 
    AVG(a.pro_price) AS Average_Price
FROM item_mast a
INNER JOIN company b
ON
a.pro_com = b.com_id
GROUP BY b.com_name; */

--24.
/* SELECT b.com_name AS Company_Name, 
    AVG(a.pro_price) AS Average_Price
FROM item_mast a
INNER JOIN company b
ON 
a.pro_com = b.com_id
GROUP BY b.com_name
HAVING AVG(a.pro_price) >= 350; */

--25.
/* SELECT a.pro_name AS Product_Name,a.pro_price AS Product_Price, 
    b.com_name AS Company_Name
FROM item_mast a
INNER JOIN company b
ON 
a.pro_com = b.com_id
WHERE a.pro_price = (SELECT MAX(c.pro_price)
    FROM item_mast c
    WHERE c.pro_com = a.pro_com);*/

--26.
/* SELECT e.emp_idno AS Employee_ID,e.emp_fname AS First_Name,e.emp_lname AS Last_Name,
    d.dpt_name AS Department,d.dpt_allotment AS Budget_Allocation
FROM emp_details e
JOIN emp_department d
ON
e.emp_dept = d.dpt_code; */

--27.
/* SELECT e.emp_fname AS First_Name,e.emp_lname AS Last_Name,
    d.dpt_name AS Department_Name,d.dpt_allotment AS Sanction_Amount
FROM emp_details e
JOIN emp_department d
ON
e.emp_dept = d.dpt_code; */

--28.
/* SELECT e.emp_fname AS First_Name,e.emp_lname AS Last_Name,
    d.dpt_name AS Department_Name,d.dpt_allotment AS Budget
FROM emp_details e
JOIN emp_department d
ON
e.emp_dept = d.dpt_code
WHERE d.dpt_allotment > 50000; */

--29.
SELECT d.dpt_name AS Department_Name
FROM emp_details e
JOIN emp_department d
ON 
e.emp_dept = d.dpt_code
GROUP BY d.dpt_name
HAVING COUNT(e.emp_idno) > 2;














