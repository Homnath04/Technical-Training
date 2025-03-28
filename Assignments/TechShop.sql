--use TechShop;
--create schema tecshop;
/* CREATE TABLE tecshop.CUSTOMER (CUST_ID INT NOT NULL PRIMARY KEY, 
                               F_NAME VARCHAR(30),
							   L_NAME VARCHAR(20),
							   EMAIL VARCHAR(255),
							   PHONE VARCHAR(30),
							   ADDRESS VARCHAR(255)); */

 /* INSERT INTO tecshop.CUSTOMER VALUES (1,'E','Raj','rioraj0408@gmail.com',9080765348,'Madurai'),
                            (2,'S','Tharic','tharicmod@gmail.com',8765930341,'Chennai'),
							(3,'S','Mani','muthumani@gmail.com',765390321,'Banglore'),
							(4,'S','Kiran','sankarki@gmail.com',809763452,'Kerala'),
							(5,'B','Cheran','bcheran@gmail.com',7652390754,'Kochin'),
							(6,'K','Abi','abin123@gmail.com',905743845,'Karnataka'),
							(7,'M','swetha','mahaswe@gmail.com',654382333,'Chennai'),
							(8,'A','Thiyanesh','thiyanesha@gmail.com',792350234,'Coimbatore'),
							(9,'S','Krishna','sankrish@gmail.com',9434572341,'Delhi'),
							(10,'P','Homnath','homnathps22@gmail.com',6383728778,'Madurai');  */
-- CREATING TABLE FOR PRODDUCTS
/* CREATE TABLE tecshop.PRODUCTS (PROD_ID INT PRIMARY KEY ,
                         PROD_NAME VARCHAR(255),
						 DESCRIPTION VARCHAR(255),
						 PRICE VARCHAR(255) );  */
--INSERTING PRODUCTS IN TABLE
/*
INSERT INTO tecshop.PRODUCTS VALUES (111,'KEYBOARD','RGB KEYBOARD',2901),
                           (112,'HARD DISK','1TB TO 50 TB',1999),
						   (113,'RAM','64GB',26999),
						   (114,'PROCESSOR','INTEL CORE I9-14900K',48000),
						   (115,'LIQUID COOLER','ANT ESPORTS ICE CHROMA 240 ARGB 240mm',4900),
						   (116,'CABINET BOX','CORSAIR ICUE 7000X RGB TEMPERED GLASS FULL-TOWER' ,26999),
						   (117,'GPU','GEFORCE RTX 4090 ',98123),
						   (118,'MONITOR','GIGABYTE M32UC 31.5 Inch  LCD GAMING MOITOR',62490),
						   (119,'STORAGE','WD_Black SN850P 2TB',32499),
						   (120,'MOUSE','LOGITECH G502 HERO HIGH PERFORMANCE',4180);
						    */
							--SELECT * FROM tecshop.PRODUCTS;

/*CREATE TABLE tecshop.ORDERS (ORDER_ID INT NOT NULL PRIMARY KEY , 
                    CUST_ID INT NOT NULL,
					ORDER_DATE DATE ,
					TOTAL_AMOUNT DECIMAL(10,2),
					FOREIGN KEY (CUST_ID) REFERENCES tecshop.CUSTOMER(CUST_ID));  */
/*
INSERT INTO tecshop.ORDERS VALUES (1,1,'2023-09-14',110490),
                          (2,2,'2022-12-21',7081),
						  (3,3,'2024-01-1',31899),
						  (4,4,'2022-07-04',160613),
						  (5,5,'2019-03-15',6899),
						  (6,6,'2012-07-16',54668),
						  (7,7,'2025-03-20',84153),
						  (8,8,'2019-10-15',5314),
						  (9,9,'2008-08-15',25534),
						  (10,10,'1999-06-21',68421); */
						  --SELECT * FROM tecshop.ORDERS;
/*
CREATE TABLE tecshop.ORDER_DETAILS (ORD_DET_ID INT NOT NULL PRIMARY KEY , 
                            ORDER_ID INT NOT NULL,
							PROD_ID INT NOT NULL,
							QUANTITY INT ,
							FOREIGN KEY (ORDER_ID) REFERENCES tecshop.ORDERS(ORDER_ID),
							FOREIGN KEY (PROD_ID) REFERENCES tecshop.PRODUCTS(PROD_ID));  */
     
/*
INSERT INTO tecshop.ORDER_DETAILS VALUES(711,1,111,2),
                                (712,2,120,1),
								(713,3,117,4),
								(714,4,112,1),
								(715,6,118,5),
								(822,5,115,12),
								(123,9,116,1),
								(934,7,112,8),
								(718,8,113,1),
								(720,10,119,4);		*/	
								--SELECT * FROM tecshop.ORDER_DETAILS;
/*
CREATE TABLE tecshop.Inventory (
    INVEN_ID INT PRIMARY KEY,
    PROD_ID INT NOT NULL,
    QuantityInStock INT NOT NULL CHECK (QuantityInStock >= 0),  
    LastStockUpdate DATETIME DEFAULT GETDATE(),  
    FOREIGN KEY (PROD_ID) REFERENCES tecshop.PRODUCTS(PROD_ID)); */

/*
INSERT INTO tecshop.Inventory VALUES (1, 111, 50, '2024-03-01 10:15:00'),
                             (2, 112, 30, '2024-03-02 11:45:00'),
							 (3, 113, 20, '2024-03-03 09:30:00'),
							 (4, 114, 75, '2024-03-04 14:10:00'),
							 (5, 115, 40, '2024-03-05 16:20:00'),
							 (6, 116, 50, '2021-12-08 11:15:00'),
                             (7, 117, 30, '2019-11-01 13:54:00'),
							 (8, 118, 20, '2018-02-11 19:03:00'),
							 (9, 119, 75, '2020-05-24 23:11:00'),
							 (10, 120, 40, '2025-03-20 21:21:00');
							  */



-- TASK 2 :
--1. Write an SQL query to retrieve the names and emails of all customers.  
/*SELECT DISTINCT L_NAME , EMAIL
FROM tecshop.CUSTOMER; */

--2.Write an SQL query to list all orders with their order dates and corresponding customer names. 
/* 
SELECT DISTINCT O.ORDER_DATE , C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME
FROM tecshop.ORDERS O
JOIN tecshop.CUSTOMER C
ON
O.CUST_ID = C.CUST_ID
ORDER  BY ORDER_DATE ; */

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.

--INSERT INTO tecshop.CUSTOMER (CUST_ID ,L_NAME,EMAIL ,ADDRESS ) VALUES (11,'GOKUL','gokul123@gmail.com','MADURAI');
--SELECT * FROM tecshop.CUSTOMER;

--4.Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%. 
/*
ALTER TABLE tecshop.PRODUCTS
ALTER COLUMN PRICE DECIMAL(10,2); */
/* UPDATE  tecshop.PRODUCTS SET PRICE = PRICE * 1.10;
SELECT * FROM tecshop.PRODUCTS
--THE PRICE HAS BEEN INCREASED BY 10% */

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables.\
--Allow users to input the order ID as a parameter.
/*
DELETE FROM tecshop.ORDER_DETAILS WHERE ORDER_ID = 1;  
DELETE FROM tecshop.ORDERS WHERE ORDER_ID = 1;*/

--6.Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,order date, and any other necessary information.
--INSERT INTO tecshop.ORDERS VALUES (11,10,'1998-12-24',34234);

--7.Write an SQL query to update the contact information (e.g., email and address) of a specific 
--customer in the "Customers" table. Allow users to input the customer ID and new contact information. 
/* DECLARE @CUST_ID INT = 3;
DECLARE @NEW_EMAIL VARCHAR(255) = 'muthumani@gmail.com';
DECLARE @NEW_ADDRESS VARCHAR(255)= 'CHENNAI';
UPDATE tecshop.CUSTOMER
SET EMAIL = @NEW_EMAIL, ADDRESS = @NEW_ADDRESS
WHERE CUST_ID = @CUST_ID; */
--SELECT * FROM tecshop.CUSTOMER;

--8.Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
--table based on the prices and quantities in the "OrderDetails" table. 
/* UPDATE tecshop.ORDERS
SET TOTAL_AMOUNT = (
         SELECT SUM(p.PRICE * a.QUANTITY)
		 FROM tecshop.ORDER_DETAILS a
		 JOIN tecshop.PRODUCTS p
		 ON
		 a.PROD_ID = P.PROD_ID
		 WHERE a.ORDER_ID = tecshop.ORDERS.ORDER_ID); */
		 --SELECT * FROM tecshop.ORDERS;

/*9.Write an SQL query to delete all orders and their associated order details for a specific 
customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
as a parameter. */

/* DECLARE @CUST_ID INT = 4;

DELETE FROM tecshop.ORDER_DETAILS 
WHERE ORDER_ID IN (SELECT ORDER_ID FROM tecshop.ORDERS WHERE CUST_ID = @cust_id);

DELETE FROM tecshop.ORDERS 
WHERE CUST_ID = @cust_id;

SELECT * FROM tecshop.ORDERS;
SELECT * FROM tecshop.ORDER_DETAILS; */

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details. 

--INSERT INTO tecshop.PRODUCTS (PROD_ID,PROD_NAME,DESCRIPTION,PRICE) VALUES (121,'PENDRIVE','36 GB ST',2000);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

--ALTER TABLE tecshop.ORDERS ADD STATUS VARCHAR(50);
/*
DECLARE @NEW_ORDER_ID INT = 2;
DECLARE @NEW_STATUS VARCHAR(50) = 'PENDING';

UPDATE tecshop.ORDERS
SET STATUS = @NEW_STATUS
WHERE ORDER_ID = @NEW_ORDER_ID; 
SELECT * FROM tecshop.ORDERS; */



--12. Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table. 
/*ALTER TABLE tecshop.CUSTOMER 
ADD ORDER_COUNT INT DEFAULT 0;  */
/*UPDATE tecshop.CUSTOMER 
       SELECT ORDER_COUNT = (
	   FROM tecshop.ORDERS
	   WHERE tecshop.ORDERS.CUST_ID = tecshop.CUSTOMER.CUST_ID 
	   );*/
	   --SELECT * FROM tecshop.CUSTOMER

--TASK 3:
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,customer name) for each order.
/* 
SELECT O.ORDER_ID, O.ORDER_DATE, O.TOTAL_AMOUNT, 
       C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME,
	   C.EMAIL, C.PHONE, C.ADDRESS
FROM tecshop.ORDERS O
JOIN tecshop.CUSTOMER C 
ON
O.CUST_ID = C.CUST_ID; */

--2.
/* 
SELECT P.PROD_NAME , SUM(P.PRICE * OD.QUANTITY)AS TOTAL_REVENUE
FROM tecshop.ORDER_DETAILS OD
JOIN tecshop.PRODUCTS P 
ON
OD.PROD_ID = P.PROD_ID
GROUP BY P.PROD_NAME
ORDER BY TOTAL_REVENUE DESC; */

--3.
/* 
SELECT DISTINCT C.CUST_ID,C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME ,C.EMAIL,C.PHONE,C.ADDRESS
FROM tecshop.CUSTOMER C
JOIN tecshop.ORDERS O
ON
C.CUST_ID = O.CUST_ID; */

--4.

/* SELECT TOP 1 P.PROD_NAME, SUM(OD.QUANTITY) AS TOTAL_QUANTITY_ORDERED
FROM tecshop.ORDER_DETAILS OD
JOIN tecshop.PRODUCTS P
ON
OD.PROD_ID = P.PROD_ID
GROUP BY PROD_NAME
ORDER BY TOTAL_QUANTITY_ORDERED DESC; */

--5.
--ALTER TABLE tecshop.PRODUCTS ADD CATEGORY VARCHAR(100);
/* UPDATE tecshop.PRODUCTS
SET CATEGORY = 
    CASE 
        WHEN PROD_NAME LIKE '%GPU%' THEN 'Graphics Card'
        WHEN PROD_NAME LIKE '%RAM%' THEN 'Memory'
        WHEN PROD_NAME LIKE '%Hard Disk%' OR PROD_NAME LIKE '%Storage%' THEN 'Storage'
        WHEN PROD_NAME LIKE '%Processor%' THEN 'CPU'
        WHEN PROD_NAME LIKE '%Keyboard%' OR PROD_NAME LIKE '%Mouse%' THEN 'Peripherals'
        ELSE 'Others'
    END; 
	SELECT PROD_NAME, CATEGORY, PRICE  
    FROM tecshop.PRODUCTS; */



--6.
/*
SELECT C.CUST_ID, C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME,AVG(O.TOTAL_AMOUNT) AS AVERAGE_ORDER_VALUE
FROM tecshop.ORDERS O
JOIN tecshop.CUSTOMER C 
ON
O.CUST_ID = C.CUST_ID
GROUP BY C.CUST_ID, C.F_NAME, C.L_NAME
ORDER BY AVERAGE_ORDER_VALUE DESC; */

--7.
/* 
SELECT TOP 1 O.ORDER_ID, O.TOTAL_AMOUNT, O.ORDER_DATE, 
             C.CUST_ID, C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME,C.EMAIL, C.PHONE, C.ADDRESS
FROM tecshop.ORDERS O
JOIN tecshop.CUSTOMER C
ON 
O.CUST_ID = C.CUST_ID
ORDER BY O.TOTAL_AMOUNT DESC; */


--8.
/* 
SELECT P.PROD_NAME, COUNT(OD.PROD_ID) AS TIMES_ORDERED  
FROM tecshop.ORDER_DETAILS OD  
JOIN tecshop.PRODUCTS P
ON 
OD.PROD_ID = P.PROD_ID  
GROUP BY P.PROD_NAME  
ORDER BY TIMES_ORDERED DESC; */

--9.

/* 
DECLARE @ProductName VARCHAR(255) = 'GPU';  

SELECT DISTINCT C.CUST_ID, C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME, C.EMAIL, C.PHONE, C.ADDRESS
FROM tecshop.CUSTOMER C
JOIN tecshop.ORDERS O 
ON
C.CUST_ID = O.CUST_ID
JOIN tecshop.ORDER_DETAILS OD 
ON
O.ORDER_ID = OD.ORDER_ID
JOIN tecshop.PRODUCTS P 
ON
OD.PROD_ID = P.PROD_ID
WHERE P.PROD_NAME = @ProductName; */

--10.
/* 
DECLARE @StartDate DATE = '2023-01-01';  
DECLARE @EndDate DATE = '2024-01-01';    

SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE  
FROM tecshop.ORDERS  
WHERE ORDER_DATE BETWEEN @StartDate AND @EndDate; */


--TASK 4 :

--1.Write an SQL query to find out which customers have not placed any orders. 
/* SELECT C.CUST_ID,C.F_NAME + ' ' + L_NAME AS CUSTOMER_NAME ,C.EMAIL,C.PHONE,C.ADDRESS
FROM tecshop.CUSTOMER C
LEFT JOIN tecshop.ORDERS O 
ON
C.CUST_ID = O.CUST_ID
WHERE O.ORDER_ID IS NULL; */

--2. Write an SQL query to find the total number of products available for sale. 
/* SELECT SUM(QuantityInStock) AS TOTAL_NO_PRODUCTS
FROM tecshop.Inventory; */

--3.Write an SQL query to calculate the total revenue generated by TechShop.  
/* SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM tecshop.ORDERS; */

--4.Write an SQL query to calculate the average quantity ordered for products in a specific category. 
--Allow users to input the category name as a parameter. 

 /* DECLARE @CategoryName VARCHAR(255) = 'Others'; 

SELECT P.CATEGORY, AVG(OD.QUANTITY) AS AVG_QUANTITY_ORDERED
FROM tecshop.ORDER_DETAILS OD
JOIN tecshop.PRODUCTS P 
ON
OD.PROD_ID = P.PROD_ID
WHERE P.CATEGORY = @CategoryName
GROUP BY P.CATEGORY;  */

--5.Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
 /* DECLARE @CUSTOMER_ID INT = 1;

 SELECT C.CUST_ID, C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_REVENUE
 FROM tecshop.CUSTOMER C
 JOIN tecshop.ORDERS O
 ON
 O.CUST_ID = C.CUST_ID
WHERE C.CUST_ID = @CUSTOMER_ID
GROUP BY C.CUST_ID,C.F_NAME,C.L_NAME; */

--6.Write an SQL query to find the customers who have placed the most orders. List their names 
--and the number of orders they've placed. 
/*
SELECT C.CUST_ID , C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME, COUNT(O.ORDER_ID) AS TOTAL_ORDERS
FROM tecshop.CUSTOMER C
JOIN tecshop.ORDERS O
ON
C.CUST_ID = O.CUST_ID
GROUP BY C.CUST_ID,C.F_NAME,C.L_NAME
ORDER BY TOTAL_ORDERS ;
*/

--7.Write an SQL query to find the most popular product category, which is the one with the highest 
--total quantity ordered across all orders. 
/* 
SELECT TOP 1 P.CATEGORY,SUM(OD.QUANTITY) AS TOTAL_QUANTITY_ORDERED
FROM tecshop.ORDER_DETAILS OD
JOIN tecshop.PRODUCTS P
ON
OD.PROD_ID = P.PROD_ID
GROUP BY P.CATEGORY
ORDER BY TOTAL_QUANTITY_ORDERED DESC;
*/

--8.Write an SQL query to find the customer who has spent the most money (highest total revenue) 
--on electronic gadgets. List their name and total spending. 
/*
SELECT C.CUST_ID,C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME , SUM(P.PRICE * OD.QUANTITY) AS TOTAL_REVENUE
FROM tecshop.CUSTOMER C
JOIN tecshop.ORDERS O ON C.CUST_ID = O.CUST_ID
JOIN tecshop.ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
JOIN tecshop.PRODUCTS P ON OD.PROD_ID = P.PROD_ID
WHERE P.CATEGORY = 'Graphics Card'
GROUP BY C.CUST_ID,C.F_NAME,C.L_NAME
ORDER BY TOTAL_REVENUE DESC;
*/

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of 
--orders) for all customers.
/* 
SELECT C.CUST_ID , C.F_NAME + ' ' +C.L_NAME AS CUSTOMER_NAME , (SUM(O.TOTAL_AMOUNT) /COUNT(O.ORDER_ID)) AS AVERAGE_ORDER_VALUE
FROM tecshop.CUSTOMER C
JOIN tecshop.ORDERS O
ON
C.CUST_ID= O.CUST_ID
GROUP BY C.CUST_ID,C.F_NAME,C.L_NAME;
*/

--10. Write an SQL query to find the total number of orders placed by each customer and list their 
--names along with the order count.
/* 
SELECT C.CUST_ID , C.F_NAME + ' ' + C.L_NAME AS CUSTOMER_NAME, COUNT(O.ORDER_ID) AS TOTAL_ORDER
FROM tecshop.CUSTOMER C
JOIN tecshop.ORDERS O
ON
C.CUST_ID = O.CUST_ID
GROUP BY C.CUST_ID,C.F_NAME,C.L_NAME
ORDER BY TOTAL_ORDER ;
*/

