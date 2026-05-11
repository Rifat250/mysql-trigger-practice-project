-- Basic Trigger Questions.

-- 1.Create a trigger that saves old and new stock in stock_audit whenever product stock is updated. 

DELIMITER $$

CREATE TRIGGER product_stock_automator
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
	INSERT INTO stock_audit(product_id, old_stock, new_stock)
    VALUES(OLD.product_id, OLD.stock, NEW.stock);
END $$

DELIMITER ;

DROP TRIGGER product_stock_automator;

-- 2.Create a trigger that saves old and new price in price_audit whenever product price is updated. 

DELIMITER $$

CREATE TRIGGER product_price_automator
AFTER UPDATE 
ON products
FOR EACH ROW
BEGIN
	INSERT INTO price_audit(product_id, old_price, new_price)
    VALUES(OLD.product_id, OLD.price, NEW.price);
END $$

DELIMITER ;

DROP TRIGGER product_price_automator;

-- 3.Create a trigger that prevents inserting a product with negative stock. 

DELIMITER $$

CREATE TRIGGER prevent_negative_stock
BEFORE INSERT
ON products
FOR EACH ROW
BEGIN
	IF NEW.stock < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'STOCK CAN NOT BE NEGATIVE';
	END IF ;
END $$

DELIMITER ;

DROP TRIGGER prevent_negative_stock;

-- 4.Create a trigger that prevents updating product price to less than 1. 

DELIMITER $$

CREATE TRIGGER prevent_update_negative_price
BEFORE UPDATE
ON products
FOR EACH ROW
BEGIN
	IF NEW.price < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price cannot be less than 1';
    END IF;
END $$

DELIMITER ;

DROP TRIGGER prevent_update_negative_price;

-- 5.Create a trigger that automatically sets stock to 0 if inserted stock is negative. 

DELIMITER $$

CREATE TRIGGER stock_automator
BEFORE INSERT
ON products
FOR EACH ROW
BEGIN
	IF NEW.stock < 0 THEN
    SET NEW.stock = 0;
    END IF;
END $$

DELIMITER ;

DROP TRIGGER stock_automator;

-- Intermediate Trigger Questions

-- 6.Create a trigger that prevents deleting products from the products table. 

DELIMITER $$

CREATE TRIGGER prevent_deleting_products
BEFORE DELETE
ON products
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'DELETING PRODUCTS IS NOT ALLOWED';
END $$

DELIMITER ;

DROP TRIGGER prevent_deleting_products;

-- 7.Create a trigger that increases price by 10% automatically if category is Electronics. 

DELIMITER $$

CREATE TRIGGER price_increase_automator
BEFORE INSERT
ON products
FOR EACH ROW
BEGIN
	if NEW.category = 'Electronics' THEN
		SET NEW.price = NEW.price + (0.10 * NEW.price);
	END if;
END $$

DELIMITER ;

DROP TRIGGER price_increase_automator;

-- 8.Create a trigger that records price changes only when the new price is greater than the old price. 

DELIMITER $$

CREATE TRIGGER price_record_automator
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
	IF NEW.price > OLD.price THEN
		INSERT INTO price_audit(product_id,old_price,new_price)
        VALUES(OLD.product_id,OLD.price,NEW.price);
	END if;
END $$

DELIMITER ;

DROP TRIGGER price_record_automator;

-- 9.Create a trigger that prevents stock update if new stock is greater than 1000. 

DELIMITER $$

CREATE TRIGGER stock_updator
BEFORE UPDATE
ON products
FOR EACH ROW
BEGIN
	IF NEW.stock > 1000 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'stock can not be greater than 1000';
	END IF;
END $$

DELIMITER ;

DROP TRIGGER stock_updator;

-- 10.Create a trigger that changes product name to uppercase before insert. 

DELIMITER $$

CREATE TRIGGER name_automator
BEFORE INSERT
ON products
FOR EACH ROW
BEGIN
	SET NEW.product_name = UPPER(NEW.product_name);
END $$

DELIMITER ;

DROP TRIGGER name_automator;

-- Real-Life Trigger Questions

-- 11.Create a trigger to track every stock change in stock_audit.

DELIMITER $$

CREATE TRIGGER stock_tracker
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
	INSERT INTO stock_audit( product_id, old_stock, new_stock) 
    VALUES( NEW.product_id, OLD.stock, NEW.stock);
END $$

DELIMITER ;

DROP TRIGGER stock_tracker;

-- 12.Create a trigger to track every price change in price_audit. 

DELIMITER $$

CREATE TRIGGER price_tracker
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
	INSERT INTO price_audit( product_id, old_price, new_price) 
    VALUES( NEW.product_id, OLD.price, NEW.price);
END $$

DELIMITER ;

DROP TRIGGER price_tracker;

-- 13.Create a trigger that blocks price reduction greater than 50%. 

DELIMITER $$

CREATE TRIGGER price_reduction_tracker
BEFORE UPDATE
ON products
FOR EACH ROW
BEGIN
	IF NEW.price < (0.5 * OLD.price) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Suspicious price reduction';
    END IF;
END $$

DELIMITER ;

DROP TRIGGER price_reduction_tracker;

-- 14.Create a trigger that prevents product deletion if stock is greater than 0. 

DELIMITER $$

CREATE TRIGGER product_deletion_tracker
BEFORE DELETE
ON products
FOR EACH ROW
BEGIN
	IF OLD.stock > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Cannot delete product with remaining stock';
    END IF;
END $$

DELIMITER ;

DROP TRIGGER product_deletion_tracker;

-- 15.Create a trigger that automatically sets category to Uncategorized if category is NULL. 

DELIMITER $$

CREATE TRIGGER category_identifier
BEFORE INSERT
ON products
FOR EACH ROW
BEGIN
	IF NEW.category IS NULL THEN
		SET NEW.category = 'Uncategorized';
    END IF;
END $$

DELIMITER ;

DROP TRIGGER category_identifier;

-- 16.Whenever stock becomes less than 10, insert that product into low_stock_alerts.

DELIMITER $$

CREATE TRIGGER low_stock_identifier
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
	IF NEW.stock < 10 THEN
		INSERT INTO low_stock_alerts( product_id, product_name, stock)
        VALUES(NEW.product_id, NEW.product_name, NEW.stock);
    END IF;
END $$

DELIMITER ;

DROP TRIGGER low_stock_identifier;

-- 17.Before deleting any product, save its information into deleted_products.

DELIMITER $$

CREATE TRIGGER delete_logger
AFTER DELETE
ON products
FOR EACH ROW
BEGIN
		INSERT INTO deleted_products( product_id, product_name)
        VALUES(OLD.product_id, OLD.product_name);
END $$

DELIMITER ;

DROP TRIGGER delete_logger;

-- 18. After inserting a product, update total product count.

DELIMITER $$

CREATE TRIGGER product_counter
AFTER INSERT
ON products
FOR EACH ROW
BEGIN
	UPDATE product_summary
	SET total_product = total_product + 1;
END $$

DELIMITER ;

DROP TRIGGER product_counter;

-- 19.Create a trigger that prevents duplicate product names. 

DELIMITER $$

CREATE TRIGGER duplicate_product_detector
BEFORE INSERT
ON products
FOR EACH ROW
BEGIN
	IF EXISTS
		(SELECT
			*
		FROM products
        WHERE product_name = NEW.product_name) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate product name';
	END IF;
END $$

DELIMITER ;

-- 20. Create a trigger that stores price change percentage in a new audit table. 

DELIMITER $$

CREATE TRIGGER price_change_detector
AFTER UPDATE 
ON products
FOR EACH ROW
BEGIN 
	IF OLD.price <> NEW.price
    THEN INSERT INTO price_change_log 
    (
		product_id,
        product_name,
        old_price,
        new_price,
        price_change_percentage
    )
    VALUES
    (
		NEW.product_id,
        NEW.product_name,
        OLD.price,
        NEW.price,
        ROUND(((NEW.price - OLD.price) / OLD.price) * 100, 2)
    );
END IF;
END $$ 

DELIMITER ;

DROP TRIGGER price_change_detector;