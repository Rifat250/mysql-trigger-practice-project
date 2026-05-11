SELECT * FROM price_audit;

SELECT * FROM stock_audit;

SELECT * FROM products;

SELECT * FROM low_stock_alerts;

SELECT * FROM deleted_products;

SELECT * FROM product_summary;

SELECT * FROM price_change_log;

-- 1.
UPDATE products
SET stock = 90
WHERE product_id = 1;


-- 2.
UPDATE products
SET price = 1800.00
WHERE product_id = 4;

-- 3.
INSERT INTO products (product_name, stock) VALUES ('Laptop', -5);

-- 4.
UPDATE products
SET price = -50000
WHERE product_id = 6;

-- 5.
INSERT INTO products (product_name, stock) VALUES ('Pencil A', -5);

-- 6.
DELETE FROM products WHERE product_id = 6;

-- 7.
INSERT INTO products (product_name, category, price)
VALUES ('Keyboard A', 'Electronics', 1000);

-- 8.
UPDATE products
SET price = 84000
WHERE product_id = 2;

-- 9.
UPDATE products
SET stock = 1200
WHERE product_id = 5;

-- 10.
INSERT INTO products (product_name, category, price)
VALUES ('laptop', 'Electronics', 1000);

-- 11.
UPDATE products
SET stock = 450
WHERE product_id = 5;

-- 12.
UPDATE products
SET price = 3200
WHERE product_id = 8;

-- 13.
UPDATE products
SET price = 30000
WHERE product_id = 2; 

-- 14. 
DELETE FROM products WHERE product_id = 2;

-- 15.
INSERT INTO products (product_name, price)
VALUES ('Table', 500);

-- 16.
UPDATE products
SET stock = 8
WHERE product_id = 8;

-- 17. 
DELETE FROM products
WHERE product_id = 2;

-- 18.
SET SQL_SAFE_UPDATES = 0;

INSERT INTO products( product_name, category, price, stock)
VALUES('Mouse A', 'Electronics', 1000, 15);

SET SQL_SAFE_UPDATES = 1;

-- 19.
INSERT INTO products( product_name, category, price, stock)
VALUES('Mouse A', 'Electronics', 1000, 15);

-- 20.
UPDATE products
SET price = 6500
WHERE product_id = 1;
