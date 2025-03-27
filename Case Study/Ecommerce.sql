use Ecommerce;
/*CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL); */

/* INSERT INTO customers  VALUES ('Alice Johnson', 'alice@example.com', 'password123'),
                              ('Bob Smith', 'bob@example.com', 'password456'),
							  ('Charlie Brown', 'charlie@example.com', 'password789'),
							  ('Diana Prince', 'diana@example.com', 'password321'),
							  ('Ethan Hunt', 'ethan@example.com', 'password654'); */

/*CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description NVARCHAR(MAX),
    stockQuantity INT NOT NULL); */

/*INSERT INTO products  VALUES ('Laptop', 800.00, 'High performance laptop', 10),
                             ('Smartphone', 500.00, 'Latest model smartphone', 15),
							 ('Headphones', 100.00, 'Noise-canceling headphones', 30),
							 ('Smartwatch', 250.00, 'Water-resistant smartwatch', 20),
							 ('Gaming Mouse', 50.00, 'Ergonomic gaming mouse', 40); */
							 --select * from products;
							

/* CREATE TABLE cart (
    cart_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE); */

/* CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT GETDATE(),
    total_price DECIMAL(10,2) NOT NULL,
    shipping_address NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE); */

/* CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE); */

-- Drop procedures if they exist
/* GO
IF OBJECT_ID('CreateCustomer', 'P') IS NOT NULL DROP PROCEDURE CreateCustomer;
GO
IF OBJECT_ID('AddProduct', 'P') IS NOT NULL DROP PROCEDURE AddProduct;
GO
IF OBJECT_ID('DeleteProduct', 'P') IS NOT NULL DROP PROCEDURE DeleteProduct;
GO
IF OBJECT_ID('DeleteCustomer', 'P') IS NOT NULL DROP PROCEDURE DeleteCustomer;
GO
IF OBJECT_ID('AddToCart', 'P') IS NOT NULL DROP PROCEDURE AddToCart;
GO
IF OBJECT_ID('RemoveFromCart', 'P') IS NOT NULL DROP PROCEDURE RemoveFromCart;
GO
IF OBJECT_ID('PlaceOrder', 'P') IS NOT NULL DROP PROCEDURE PlaceOrder;
GO */
/*Go
CREATE PROCEDURE CreateCustomer @name NVARCHAR(100), @email NVARCHAR(100), @password NVARCHAR(255)
AS
BEGIN
    INSERT INTO customers (name, email, password) VALUES (@name, @email, @password);
END
GO */
/*GO
CREATE PROCEDURE AddProduct @pname NVARCHAR(100), @pprice DECIMAL(10,2), @pdesc NVARCHAR(MAX), @pstock INT
AS
BEGIN
    INSERT INTO products (name, price, description, stockQuantity) VALUES (@pname, @pprice, @pdesc, @pstock);
END
GO

CREATE PROCEDURE DeleteProduct @productId INT
AS
BEGIN
    DELETE FROM products WHERE product_id = @productId;
END
GO

CREATE PROCEDURE DeleteCustomer @customerId INT
AS
BEGIN
    DELETE FROM customers WHERE customer_id = @customerId;
END
GO

CREATE PROCEDURE AddToCart @customerId INT, @productId INT, @quantity INT
AS
BEGIN
    INSERT INTO cart (customer_id, product_id, quantity) VALUES (@customerId, @productId, @quantity);
END
GO

CREATE PROCEDURE RemoveFromCart @customerId INT, @productId INT
AS
BEGIN
    DELETE FROM cart WHERE customer_id = @customerId AND product_id = @productId;
END
GO */
/* GO 
CREATE PROCEDURE PlaceOrder 
    @cust_id INT, 
    @ship_addr NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;  

    DECLARE @total DECIMAL(10,2) = 0;
    DECLARE @order_id INT;

    SELECT @total = SUM(p.price * c.quantity)
    FROM Cart c
    JOIN Products p ON c.product_id = p.product_id
    WHERE c.customer_id = @cust_id;

    IF @total IS NULL OR @total = 0
    BEGIN
        PRINT 'Cart is empty. Order cannot be placed.';
        RETURN;
    END;

    INSERT INTO Orders (customer_id, order_date, total_price, shipping_address)
    VALUES (@cust_id, GETDATE(), @total, @ship_addr);

    SET @order_id = SCOPE_IDENTITY();

    INSERT INTO Order_Items (order_id, product_id, quantity)
    SELECT @order_id, c.product_id, c.quantity
    FROM Cart c
    WHERE c.customer_id = @cust_id;

    DELETE FROM Cart WHERE customer_id = @cust_id;

    PRINT 'Order placed successfully!';
END;

GO 

*/
/* GO
CREATE PROCEDURE ViewCart @customerId INT
AS
BEGIN
SELECT p.product_id, p.name, p.price, c.quantity
FROM cart c
JOIN products p ON c.product_id= p.product_id WHERE c.customer_id = @customerId;
END
GO  */
/* GO
CREATE PROCEDURE ViewCustomerOrders @customerId INT
AS
BEGIN
SELECT o.order_id, o.order_date, o.total_price, o.shipping_address, p.name AS product_name, 
oi.quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id 
JOIN products p ON oi.product_id = p.product_id WHERE o.customer_id = @customerId;
END
GO */
--CREATING CUSTOMER
--EXEC CreateCustomer @name = 'John Doe', @email = 'john@example.com', @password = 'john123';
--SELECT * FROM customers;
--ADDING A PRODUCT
--EXEC AddProduct @pname = 'Tablet', @pprice = 300.00, @pdesc = 'Portable tablet', @pstock = 25;
--SELECT * FROM products;
--ADDING PRODUCT TO CART
--EXEC AddToCart @customerId = 1, @productId = 11, @quantity = 2;
--PLACING AN ORDER
--EXEC PlaceOrder @cust_id = 1, @ship_addr = '123 Main St, New York, NY';
--REMOVE PRODUCT FROM CART
--EXEC RemoveFromCart @customerId = 1, @productId = 1;
--SELECT * FROM cart;
--SELECT * FROM orders;
--VIEWS CART OF A CUSTOMER
--EXEC ViewCustomerOrders @customerId = 1;
