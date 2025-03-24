use ScenarioSql;
/*
CREATE TABLE EMPLOYEES (EMP_ID INT , 
                        NAME VARCHAR(255),
						DEPARTMENT VARCHAR(255),
						SAL MONEY);*/
/*
INSERT INTO EMPLOYEES VALUES (11,'HARI','HR',80000),
                             (12,'RAM','MANAGER',60000),
							 (13,'SUNDAR','HR',80000),
							 (14,'SARAN','DEVLOPER',50000),
							 (15,'HOMNATH','TESTER',45000); */

--1.
/*
SELECT NAME
FROM EMPLOYEES
WHERE DEPARTMENT = 'HR' AND  SAL>= 50000;	 */

--2.
/*
CREATE TABLE ORDERS (ORD_ID INT , 
                     CUST_ID INT ,
					 ORD_DATE DATE , 
					 ORD_AMOUNT INT ); */
/*
INSERT INTO ORDERS VALUES (1,12,'2024-08-12',300),
                          (2,14,'2022-12-05',122),
						  (3,12,'2025-03-20',15); */
/*SELECT CUST_ID , COUNT(*) AS DUPLICATE 
FROM ORDERS
GROUP BY CUST_ID 
HAVING COUNT(*) > 1 ; */

--3.
/*
CREATE TABLE SALES (SALE_ID INT PRIMARY KEY  ,
                    PROD_ID INT,
					QUANTITY INT , 
					SALE_DATE DATE); */
/*
INSERT INTO SALES VALUES (1,121,200,'2022-09-05'),
                         (2,122,50,'2021-11-22'),
						 (3,123,20,'2019-01-11'); */
--INSERT INTO SALES VALUES (5,121,100,'2018-07-07');

 /*SELECT PROD_ID,SUM(QUANTITY) AS TOTALQUANTITY 
FROM SALES
GROUP BY PROD_ID; 
 */

 --4.
 /*
 CREATE TABLE TRANSACTIONS (TRAN_ID INT PRIMARY KEY,
                           ACC_ID INT , 
						   TRAN_DATE DATE ,
						   AMOUNT MONEY); */
/*
INSERT INTO TRANSACTIONS VALUES (12,1234,'2025-03-21',40000),
                                (13,0987,'2025-02-16',20000),
								(14,4558,'2025-03-01',80000),
								(15,8745,'2025-02-01',10000),
								(16,4523,'2025-01-09',50000); */

/*
SELECT *  
FROM TRANSACTIONS 
WHERE TRAN_DATE <= '2025-02-21'; */

--6.
/*
CREATE TABLE PROD (PROD_ID INT PRIMARY KEY ,
                   P_NAME VARCHAR(50),
				   PRICE MONEY , 
				   STOCK_QUAN INT ); */
/*
INSERT INTO PROD VALUES (21,'CPU',3000,200),
                        (22,'GPU',40000,50),
						(23,'SSD',30000,10); */
/*
UPDATE PROD
SET STOCK_QUAN = STOCK_QUAN * 1.10
WHERE STOCK_QUAN <= 100; */

--SELECT * FROM PROD;

--9.
/*
CREATE TABLE PRODUCTS (PROD_ID INT PRIMARY  KEY , 
                       P_NAME VARCHAR(20),
					   CATEGORY VARCHAR(20),
					   DISCOUNT VARCHAR(20)); */

					   /*
INSERT INTO PRODUCTS VALUES (11,'DIARYMILK','CHOCOLATE','10%'),
                            (12,'OREO','BISCUT','5%'),
							(13,'ORANGE','FRUIT',NULL),
							(14,'TOMATO','VEGETABLE',NULL),
							(15,'BENCH','WOOD','2%'); */

/*SELECT P_NAME , ISNULL(DISCOUNT , 'NO DISCOUNT') AS DISCOUNT
FROM PRODUCTS; */


