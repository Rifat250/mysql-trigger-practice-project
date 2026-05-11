CREATE DATABASE trigger_practice;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE stock_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    old_stock INT,
    new_stock INT,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE price_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop A', 'Electronics', 75000, 20),
('Laptop B', 'Electronics', 82000, 15),
('Mouse A', 'Electronics', 800, 100),
('Keyboard A', 'Electronics', 1500, 80),
('Monitor A', 'Electronics', 18000, 25),
('Phone A', 'Electronics', 45000, 30),
('Phone B', 'Electronics', 52000, 22),
('Headphone A', 'Electronics', 2500, 60),
('Speaker A', 'Electronics', 3500, 45),
('Router A', 'Electronics', 2800, 40),
('T-Shirt A', 'Clothing', 600, 120),
('T-Shirt B', 'Clothing', 700, 110),
('Jeans A', 'Clothing', 1800, 70),
('Jeans B', 'Clothing', 2200, 65),
('Shirt A', 'Clothing', 1200, 90),
('Shirt B', 'Clothing', 1400, 85),
('Jacket A', 'Clothing', 3500, 35),
('Jacket B', 'Clothing', 4200, 25),
('Shoe A', 'Clothing', 3000, 50),
('Shoe B', 'Clothing', 3800, 45),
('Rice 5kg', 'Grocery', 450, 200),
('Rice 10kg', 'Grocery', 850, 150),
('Oil 1L', 'Grocery', 180, 300),
('Oil 5L', 'Grocery', 850, 120),
('Sugar 1kg', 'Grocery', 120, 250),
('Salt 1kg', 'Grocery', 40, 400),
('Flour 2kg', 'Grocery', 160, 220),
('Tea 500g', 'Grocery', 300, 180),
('Coffee 200g', 'Grocery', 450, 100),
('Milk Powder', 'Grocery', 700, 90),
('Book A', 'Stationery', 350, 75),
('Book B', 'Stationery', 420, 70),
('Pen A', 'Stationery', 15, 500),
('Pen B', 'Stationery', 20, 450),
('Notebook A', 'Stationery', 80, 300),
('Notebook B', 'Stationery', 120, 250),
('Pencil A', 'Stationery', 10, 600),
('Eraser A', 'Stationery', 8, 550),
('Marker A', 'Stationery', 60, 180),
('File A', 'Stationery', 50, 200),
('Chair A', 'Furniture', 2500, 35),
('Chair B', 'Furniture', 3200, 30),
('Table A', 'Furniture', 5500, 20),
('Table B', 'Furniture', 7500, 15),
('Sofa A', 'Furniture', 25000, 8),
('Sofa B', 'Furniture', 32000, 6),
('Bed A', 'Furniture', 28000, 10),
('Bed B', 'Furniture', 35000, 7),
('Wardrobe A', 'Furniture', 18000, 12),
('Wardrobe B', 'Furniture', 22000, 9),
('Football', 'Sports', 900, 60),
('Cricket Bat', 'Sports', 2500, 30),
('Cricket Ball', 'Sports', 250, 100),
('Badminton Racket', 'Sports', 1200, 40),
('Shuttlecock', 'Sports', 100, 200),
('Tennis Racket', 'Sports', 3500, 20),
('Basketball', 'Sports', 1500, 35),
('Dumbbell 5kg', 'Sports', 1200, 45),
('Yoga Mat', 'Sports', 850, 55),
('Skipping Rope', 'Sports', 300, 90),
('Face Wash', 'Beauty', 350, 100),
('Shampoo', 'Beauty', 500, 120),
('Conditioner', 'Beauty', 550, 90),
('Body Lotion', 'Beauty', 650, 80),
('Perfume A', 'Beauty', 1800, 40),
('Perfume B', 'Beauty', 2200, 35),
('Lipstick A', 'Beauty', 700, 70),
('Lipstick B', 'Beauty', 850, 65),
('Cream A', 'Beauty', 900, 60),
('Cream B', 'Beauty', 1100, 55),
('Toy Car', 'Toys', 450, 90),
('Doll A', 'Toys', 700, 75),
('Puzzle A', 'Toys', 350, 100),
('Blocks A', 'Toys', 900, 60),
('Remote Car', 'Toys', 1800, 35),
('Drone Toy', 'Toys', 3500, 15),
('Teddy Bear', 'Toys', 1200, 50),
('Board Game', 'Toys', 1500, 40),
('Action Figure', 'Toys', 800, 70),
('Toy Train', 'Toys', 2000, 25),
('Plate Set', 'Kitchen', 1200, 60),
('Glass Set', 'Kitchen', 900, 80),
('Knife Set', 'Kitchen', 1500, 45),
('Frying Pan', 'Kitchen', 1800, 35),
('Pressure Cooker', 'Kitchen', 3500, 25),
('Rice Cooker', 'Kitchen', 4500, 20),
('Blender', 'Kitchen', 3000, 30),
('Kettle', 'Kitchen', 2200, 40),
('Water Bottle', 'Kitchen', 500, 100),
('Lunch Box', 'Kitchen', 650, 90),
('Medicine A', 'Health', 120, 300),
('Medicine B', 'Health', 180, 250),
('Vitamin C', 'Health', 350, 150),
('Bandage', 'Health', 80, 200),
('Thermometer', 'Health', 600, 70),
('Mask Pack', 'Health', 150, 180),
('Sanitizer', 'Health', 250, 160),
('First Aid Box', 'Health', 1200, 45),
('Pain Relief Spray', 'Health', 400, 90),
('Digital BP Machine', 'Health', 3500, 20);


CREATE TABLE low_stock_alerts
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    stock INT,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deleted_products
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_summary
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	total_product INT,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product_summary(total_product)
VALUES(0);

CREATE TABLE price_change_log
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    price_change_percentage DECIMAL(10,2),
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

