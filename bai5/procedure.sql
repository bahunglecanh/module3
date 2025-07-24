
CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50),
    productName VARCHAR(100),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);

-- Thêm dữ liệu mẫu
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Laptop Lenovo', 1500.00, 10, 'Gaming laptop', 'Available'),
('P002', 'Smartphone Samsung', 800.00, 25, 'Android phone', 'Available'),
('P003', 'iPhone 13', 1200.00, 15, 'Apple smartphone', 'Out of stock'),
('P004', 'Tablet Xiaomi', 400.00, 30, 'Android tablet', 'Available');


CREATE UNIQUE INDEX idx_product_code ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productCode = 'P003';
EXPLAIN SELECT * FROM Products WHERE productName = 'iPhone 13' AND productPrice = 1200.00;

CREATE VIEW view_product_basic AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

CREATE OR REPLACE VIEW view_product_basic AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

DROP VIEW IF EXISTS view_product_basic;

DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_description, p_status);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateProductById(
    IN p_id INT,
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET 
        productCode = p_code,
        productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_description,
        productStatus = p_status
    WHERE Id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteProductById(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //

DELIMITER ;



