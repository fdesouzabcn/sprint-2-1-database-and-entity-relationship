-- ============================================
-- OPTICAL STORE DATABASE (CUL D'AMPOLLA)
-- ============================================
DROP DATABASE IF EXISTS culdampolla_store;
CREATE DATABASE culdampolla_store  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE culdampolla_store;

-- ============================================
-- TABLE: SUPPLIERS
-- ============================================
CREATE TABLE suppliers (
id_supplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
nif VARCHAR(15) NOT NULL,
phone_country_code varchar(4) default NULL,
phone VARCHAR(20) default NULL,
fax VARCHAR(20) default NULL,
address_line_one TEXT NOT NULL,
address_line_two TEXT,
city VARCHAR(50) NOT NULL,
postcode VARCHAR(10) NOT NULL,
country VARCHAR(50) NOT NULL,
CONSTRAINT UQ_suppliers_nif UNIQUE (nif)
);
CREATE INDEX idx_suppliers_NIF ON suppliers(nif);
CREATE INDEX idx_suppliers_country ON suppliers(country);

-- ============================================
-- TABLE: BRANDS
-- ============================================

CREATE TABLE brands (
    id_brand INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    brand_name varchar (50) NOT NULL,
    supplier_id INT NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT UQ_brands_name UNIQUE (brand_name),
    CONSTRAINT FK_brands_supplier 
        FOREIGN KEY (supplier_id) REFERENCES suppliers(id_supplier)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- ============================================
-- TABLE: PRODUCT - ONLY GLASSES FOR NOW
-- ============================================
CREATE TABLE glasses (
    id_glasses INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    left_lens_graduation DECIMAL(4,2) NOT NULL,
    right_lens_graduation DECIMAL(4,2) NOT NULL,
    frame_type ENUM('floating', 'plastic', 'metallic') NOT NULL,
    frame_color VARCHAR(30) NOT NULL,
    left_lens_color VARCHAR(30) NOT NULL,
    right_lens_color VARCHAR(30) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT CHK_glasses_price CHECK (price > 0),
    CONSTRAINT CHK_glasses_left_graduation 
        CHECK (left_lens_graduation BETWEEN -20.00 AND 20.00),
    CONSTRAINT CHK_glasses_right_graduation 
        CHECK (right_lens_graduation BETWEEN -20.00 AND 20.00),
    CONSTRAINT FK_glasses_brand 
        FOREIGN KEY (brand_id) REFERENCES brands(id_brand)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
CREATE INDEX idx_glasses_price ON glasses(price);
CREATE INDEX idx_glasses_brand_price ON glasses(brand_id, price);

-- ============================================
-- TABLE: CUSTOMERS
-- ============================================
CREATE TABLE customers (
    id_customer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    recommended_by INT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT UQ_customers_email UNIQUE (email),
	CONSTRAINT FK_customers_recommender 
        FOREIGN KEY (recommended_by) REFERENCES customers(id_customer)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
CREATE INDEX idx_customers_email ON customers(email);
CREATE INDEX idx_customers_registration_date ON customers(registration_date);
CREATE INDEX idx_customers_name ON customers(customer_name);

-- ============================================
-- TABLE: EMPLOYEES
-- ============================================
CREATE TABLE employees (
    id_employee INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    position VARCHAR(80) NOT NULL,
    hire_date DATE NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE INDEX idx_employees_name ON employees(employee_name);

-- ============================================
-- TABLE: ORDERS
-- ============================================
CREATE TABLE orders (
    id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    glasses_id INT NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    total_amount DECIMAL(10,2) NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT CHK_sales_quantity CHECK (quantity > 0),
    CONSTRAINT CHK_sales_amount CHECK (total_amount > 0),
    CONSTRAINT FK_orders_glasses 
        FOREIGN KEY (glasses_id) REFERENCES glasses(id_glasses)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT FK_orders_customer 
        FOREIGN KEY (customer_id) REFERENCES customers(id_customer)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT FK_orders_employee 
        FOREIGN KEY (employee_id) REFERENCES employees(id_employee)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_orders_employee_date ON orders(employee_id, order_date);


