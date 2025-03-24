USE [TASK 2];

--1.
/*CREATE TABLE SALESPEOPLE(SALEPEO_ID INT PRIMARY KEY, 
                         NAME VARCHAR(255),
						 CITY VARCHAR(255),
						 COMMISSION DECIMAL(10,2)); */

/*INSERT INTO SALESPEOPLE VALUES (1,'RAJ','CHENNAI',0.12),
                               (2,'SANJAY','MUMBAI',1.23),
							   (3,'THARIC','KERALA',0.14),
							   (4,'KIRAN','KOCHIN',2.01),
							   (5,'BALA','ERODE',0.19); */
--SELECT * FROM SALESPEOPLE;

--2.
--SELECT  NAME , COMMISSION  
--FROM SALESPEOPLE ;

--3.
/*CREATE TABLE ORDERS (ORD_NO INT PRIMARY KEY,
                       PURCH_AMUNT MONEY,
					   ORD_DATE DATE,
					   CUST_ID INT,
					   SALEPEO_ID INT,
					   FOREIGN KEY (SALEPEO_ID) REFERENCES SALESPEOPLE(SALEPEO_ID));*/

/*
INSERT INTO ORDERS VALUES (70001,150.5,'2012-10-05',3005,1),
                          (70009,270.65,'2012-09-10',3001,2),
						   (70002,65.26,'2012-10-05',3002,3),
						   (70004,110.5,'2012-08-17',3009,4),
						   (70007,948.5,'2012-09-10',3005,5) ; */

--SELECT ORD_DATE , SALEPEO_ID,ORD_NO,PURCH_AMUNT
--FROM ORDERS;

--4.
/*SELECT SALEPEO_ID
FROM ORDERS; */

--5.
/*SELECT NAME , CITY 
FROM SALESPEOPLE
WHERE CITY = 'CHENNAI'; */

--6.

/*CREATE TABLE CUSTOMERS (CUSTOMER_ID INT PRIMARY KEY,
                          CUST_NAME VARCHAR(100),
						  CITY VARCHAR(50),
						  GRADE INT,
						  SALESMAN_ID INT); */

						  /*
INSERT INTO CUSTOMERS  VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                              (3007, 'Brad Davis', 'New York', 200, 5001),
							  (3005, 'Graham Zusi', 'California', 200, 5002),
							  (3008, 'Julian Green', 'London', 300, 5002),
							  (3004, 'Fabian Johnson', 'Paris', 300, 5006); */

/*SELECT CUSTOMER_ID,CUST_NAME ,GRADE,SALESMAN_ID
FROM CUSTOMERS
WHERE GRADE > 200; */

--7.
/*SELECT ORD_NO ,ORD_DATE,PURCH_AMUNT
FROM ORDERS
WHERE SALEPEO_ID = 1;  */

--8.
/*CREATE TABLE Nobel_Prizes (Year INT,
                          Subject VARCHAR(50),
						  Winner VARCHAR(100),
						  Country VARCHAR(50),
						  Category VARCHAR(50)); */

						  /*
INSERT INTO Nobel_Prizes  VALUES (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
                                 (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
								 (1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
								 (1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
								 (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
								 (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
								 (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
								 (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
								 (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist');  */

/*SELECT Year , Subject, Winner
FROM Nobel_prizes
where year = 1970; */




