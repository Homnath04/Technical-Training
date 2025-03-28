--use Ecom;
--CREATE SCHEMA ECOM;
/*CREATE TABLE ECOM.CUSTOMERS (CUST_ID INT PRIMARY KEY,
                        NAME VARCHAR(255),
						EMAIL VARCHAR(255),
						PASSWORD VARCHAR(255));	 */
/* iNSERT INTO ECOM.CUSTOMERS VALUES (1,'RAJ','rioraj@gmail.com','rio123'),
                             (2,'Jane Smith','janesmith@gmail.com','janesmith'),
							 (3,'Robert Johnson','robert@gmail.com','rjohn009'),
							 (4,'Randy ortan','randyort@gmail.com','rortan111'),
							 (5,'Brocklesner','brockles007@gmail.com','broook'),
							 (6,'vijay','vijaykumar111@gmail.com','vijay'),
							 (7,'Ajith','ak123@gmail.com','ak1110'),
							 (8,'Laura Hall','laura@example.com','laura'),
							 (9,'Emma Wilson','emma@gmail.com','emma'),
							 (10,'Harry potter', 'harrypot@gmail.com','harry'); */

 /*CREATE TABLE ECOM.PRODUCTS (PRODUCT_ID INT PRIMARY KEY , 
                       NAME VARCHAR(255),
					   PRICE MONEY ,
					   DESCRIPTION VARCHAR(255) , 
					   STOCKQUANTITY INT); */ 

/* INSERT INTO ECOM.PRODUCTS VALUES (1,'Laptop',800,'High-performance laptop',10),
                            (2,'Smartphone',600,'Latest smartphone',15),
							(3,'Tablet',300,'Portable Tablet',20),
							(4,'Head phones',150,'Noise cancelling',30),
							(5,'TV',900,'4K SMART TV',40),
							(6,'Coffee Maker',50,'Automatic Coffee Maker',25),
							(7,'Refrigirator',700,'Energy Efficient',10),
							(8,'Microwave oven',80,'Counter Top Microwave',15),
							(9,'Blender',70,'High speed Blender',20),
							(10,'Vaccum Cleaner',120,'Bagless vaccum cleaner',10); */

/* CREATE TABLE CART (CART_ID INT PRIMARY KEY,
                   CUST_ID INT,
				   PRODUCT_ID INT,
				   QUANTITY INT,
				   FOREIGN KEY (CUST_ID) REFERENCES ECOM.CUSTOMERS(CUST_ID),
				   FOREIGN KEY (PRODUCT_ID) REFERENCES ECOM.PRODUCTS(PRODUCT_ID)); */ 

 /* INSERT INTO CART VALUES (1,1,1,2),
                        (2,1,3,1),
						(3,2,2,3),
						(4,3,4,4),
						(5,3,5,2),
						(6,4,6,1),
						(7,5,1,1),
						(8,6,10,2),
						(9,6,9,3),
						(10,7,7,2); */

 /* CREATE TABLE ECOM.ORDERS (ORDER_ID INT PRIMARY KEY ,
                     CUST_ID INT,
					 ORDER_DATE DATE,
					 TOTAL_PRICE MONEY,
					 SHIPPING_ADDRESS VARCHAR(255)
					 FOREIGN KEY (CUST_ID) REFERENCES ECOM.CUSTOMERS(CUST_ID));  */


/* INSERT INTO ECOM.ORDERS VALUES (1,1,'2023-08-12',1200,'chennai'),
                          (2,1,'2023-12-18',50,'chennai'),
						  (3,5,'2022-12-1',600,'MADURAI'),
						  (4,8,'2023-06-23',190,'TRICHY'),
						  (5,6,'2023-10-30',1500,'ERODE'),
						  (6,2,'2023-01-09',900,'COIMBATORE'),
						  (7,7,'2023-05-18',800,'PALANI'),
						  (8,4,'2024-09-14',500,'DINDUGAL'),
						  (9,10,'2024-06-12',170,'SALEM'),
						  (10,9,'2023-06-11',120,'PONDICHERY'); */

/* CREATE TABLE ECOM.ORDER_ITEMS (ORDER_ITEM_ID INT PRIMARY KEY,
                          ORDER_ID INT,
						  PRODUCT_ID INT,
						  QUANTITY INT,
						  FOREIGN KEY (ORDER_ID) REFERENCES ECOM.ORDERS (ORDER_ID),
						  FOREIGN KEY (PRODUCT_ID) REFERENCES ECOM.PRODUCTS (PRODUCT_ID)); */

/* INSERT INTO ECOM.ORDER_ITEMS VALUES(1,1,1,2),
                              (2,1,2,1),
							  (3,2,4,1),
							  (4,4,1,2),
							  (5,6,3,3),
							  (6,7,1,2),
							  (7,3,5,1),
							  (8,2,1,1),
							  (9,9,9,1),
							  (10,5,2,4); */

--CODING CHALLENGE 
--1.Update refrigerator product price to 800. 
/* UPDATE ECOM.PRODUCTS 
SET PRICE = 800
WHERE NAME = 'Refrigirator'; */
--SELECT * FROM ECOM.PRODUCTS;


--2. Remove all cart items for a specific customer. 
/* DELETE FROM CART
 WHERE CUST_ID = 3;
 SELECT * FROM CART; */

 --3. Retrieve Products Priced Below $100
/* SELECT * FROM  ECOM.PRODUCTS
 WHERE PRICE < 100; */

 --4.Find Products with Stock Quantity Greater Than 5. 
 /* SELECT * FROM ECOM.PRODUCTS 
   WHERE STOCKQUANTITY > 5; */

 --5.Retrieve Orders with Total Amount Between $500 and $1000. 
  /*SELECT * FROM ECOM.ORDERS
  WHERE TOTAL_PRICE BETWEEN 500 AND 1000; */

--6.Find Products which name end with letter ‘r’
 /*SELECT * FROM ECOM.PRODUCTS 
WHERE NAME LIKE '%r'; */

--7.Retrieve Cart Items for Customer 5. 
/*SELECT * FROM CART
WHERE CUST_ID = 5; */

--8.Find Customers Who Placed Orders in 2023. 
/* SELECT DISTINCT a.* FROM ECOM.CUSTOMERS a
JOIN ECOM.ORDERS B
ON
a.CUST_ID = B.CUST_ID
WHERE YEAR(b.ORDER_DATE) = 2023; */

--9.Determine the Minimum Stock Quantity for Each Product Category.
/* SELECT PRODUCT_ID ,NAME,STOCKQUANTITY AS MIN_STOCK_QUANTITY
FROM ECOM.PRODUCTS
ORDER BY STOCKQUANTITY ASC; */

--10. Calculate the Total Amount Spent by Each Customer. 
/* SELECT a.CUST_ID , a.NAME, SUM(b.TOTAL_PRICE) AS TOTAL_AMOUNT
FROM ECOM.ORDERS b
JOIN ECOM.CUSTOMERS a
ON
a.CUST_ID = b.CUST_ID
GROUP BY a.CUST_ID, a.NAME
ORDER BY TOTAL_AMOUNT DESC; */

--11.Find the Average Order Amount for Each Customer. 
/* SELECT a.CUST_ID , a.NAME, AVG(b.TOTAL_PRICE) AS AVERAGE_AMOUNT
FROM ECOM.ORDERS b
JOIN ECOM.CUSTOMERS a
ON
a.CUST_ID = b.CUST_ID
GROUP BY a.CUST_ID,a.NAME
ORDER BY AVERAGE_AMOUNT DESC; */

--12. Count the Number of Orders Placed by Each Customer. 
/* SELECT a.CUST_ID , a.NAME, COUNT(b.ORDER_ID) AS NO_OF_ORDERS
FROM ECOM.ORDERS b
JOIN ECOM.CUSTOMERS a
ON
a.CUST_ID = b.CUST_ID
GROUP BY a.CUST_ID,a.NAME
ORDER BY NO_OF_ORDERS DESC;
 */

 --13.Find the Maximum Order Amount for Each Customer. 
/*  SELECT a.CUST_ID, a.NAME, MAX(b.TOTAL_PRICE) AS Max_Order_Amount
FROM ECOM.CUSTOMERS a
JOIN ECOM.ORDERS b
ON
a.CUST_ID = b.CUST_ID
GROUP BY a.CUST_ID, a.NAME
ORDER BY Max_Order_Amount DESC; */ 

--14. Get Customers Who Pla	ced Orders Totaling Over $1000.
/* SELECT b.CUST_ID, a.NAME, SUM(b.TOTAL_PRICE) AS Total_Spent
FROM ECOM.ORDERS b
JOIN ECOM.CUSTOMERS a
ON
b.CUST_ID = a.CUST_ID
GROUP BY b.CUST_ID, a.NAME
HAVING SUM(b.TOTAL_PRICE) > 1000 -- HAVING USED FOR FILTERING DATA AFTER AGGREGATION AFTER THE SUM OF TOTALPRICE
ORDER BY Total_Spent DESC; */

--15. Subquery to Find Products Not in the Cart.
/* 
SELECT * FROM ECOM.PRODUCTS
WHERE PRODUCT_ID NOT IN (SELECT DISTINCT PRODUCT_ID FROM CART); --DISTINCT REMOVES DUPLICATE AND NO REPETATION
*/

--16.Subquery to Find Customers Who Haven't Placed Orders.
/* 
SELECT * FROM ECOM.CUSTOMERS
WHERE CUST_ID NOT IN (SELECT DISTINCT CUST_ID FROM ECOM.ORDERS);
*/

--17. Subquery to Calculate the Percentage of Total Revenue for a Product.
/* 
SELECT pr.PRODUCT_ID, pr.NAME,SUM(oi.QUANTITY * pr.PRICE) AS product_revenue,
                              (SUM(oi.QUANTITY * pr.PRICE) * 100) /(SELECT SUM(oi2.QUANTITY * pr2.PRICE) 
FROM ECOM.ORDER_ITEMS oi2 
JOIN ECOM.PRODUCTS pr2 ON oi2.PRODUCT_ID = pr2.PRODUCT_ID) AS revenue_percentage
FROM ECOM.ORDER_ITEMS oi
JOIN ECOM.PRODUCTS pr ON oi.PRODUCT_ID = pr.PRODUCT_ID
GROUP BY pr.PRODUCT_ID, pr.NAME
ORDER BY revenue_percentage DESC; 
*/

--18. Subquery to Find Products with Low Stock. 
/* 
SELECT * FROM ECOM.PRODUCTS 
WHERE STOCKQUANTITY < (SELECT AVG(STOCKQUANTITY) FROM ECOM.PRODUCTS);
*/

--19. Subquery to Find Customers Who Placed High-Value Orders. 
/* 
SELECT * FROM ECOM.CUSTOMERS
WHERE CUST_ID IN (SELECT CUST_ID 
                  FROM ECOM.ORDERS
				  WHERE TOTAL_PRICE > (SELECT AVG(TOTAL_PRICE) FROM ECOM.ORDERS));
*/
