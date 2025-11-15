-- ============================================
-- PIZZERIA DELIVERY DATABASE
-- ============================================
DROP DATABASE IF EXISTS pizzeria_delivery;
CREATE DATABASE pizzeria_delivery CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pizzeria_delivery;

-- ============================================
-- TABLE: CUSTOMERS
-- ============================================
CREATE TABLE customers (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT UQ_customers_phone UNIQUE (phone)
);

CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_customers_name ON customers(last_name, first_name);

-- ============================================
-- TABLE: STORES
-- ============================================
CREATE TABLE stores (
    id_store INT AUTO_INCREMENT PRIMARY KEY,
	store_name VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_stores_city ON stores(city);
CREATE INDEX idx_stores_name ON stores(store_name);
CREATE INDEX idx_stores_postal_code ON stores(postal_code);

-- ============================================
-- TABLE: EMPLOYEES
-- ============================================
CREATE TABLE employees (
    id_employee INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    employee_type ENUM('cook', 'delivery') NOT NULL,
    hire_date DATE NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT UQ_employees_nif UNIQUE (nif),
    CONSTRAINT UQ_employees_phone UNIQUE (phone),
    CONSTRAINT FK_employees_store 
        FOREIGN KEY (store_id) REFERENCES stores(id_store)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_employees_nif ON employees(nif);
CREATE INDEX idx_employees_store ON employees(store_id);
CREATE INDEX idx_employees_type ON employees(employee_type);

-- ============================================
-- TABLE: CATEGORIES (for pizzas only)
-- ============================================
CREATE TABLE categories (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT UQ_categories_name UNIQUE (category_name)
);

-- ============================================
-- TABLE: PRODUCTS
-- ============================================
CREATE TABLE products (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_type ENUM('pizza', 'burger', 'drink') NOT NULL,
    category_id INT NULL,
    product_description TEXT, 
    image_url VARCHAR(500),
    price DECIMAL(6,2) NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT CHK_products_price CHECK (price > 0),

    -- Business rule: only pizzas can have categories
    CONSTRAINT CHK_products_category_pizza 
        CHECK (
            (product_type = 'pizza' AND category_id IS NOT NULL) OR
            (product_type != 'pizza' AND category_id IS NULL)
        ),
	CONSTRAINT FK_products_category 
        FOREIGN KEY (category_id) REFERENCES categories(id_category)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_products_type ON products(product_type);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_price ON products(price);

-- ============================================
-- TABLE: ORDERS
-- ============================================
CREATE TABLE orders (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    store_id INT NOT NULL,
	order_datetime DATETIME NOT NULL,
    order_type ENUM('delivery', 'pickup') NOT NULL,
	total_amount DECIMAL(8,2) NOT NULL,
 	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,   

    CONSTRAINT CHK_orders_total_amount CHECK (total_amount > 0),
    CONSTRAINT FK_orders_customer 
        FOREIGN KEY (customer_id) REFERENCES customers(id_customer)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	CONSTRAINT FK_orders_employee 
        FOREIGN KEY (employee_id) REFERENCES employees(id_employee)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT FK_orders_store 
        FOREIGN KEY (store_id) REFERENCES stores(id_store)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_employee ON orders(employee_id);
CREATE INDEX idx_orders_store ON orders(store_id);
CREATE INDEX idx_orders_datetime ON orders(order_datetime);
CREATE INDEX idx_orders_type ON orders(order_type);

-- ============================================
-- TABLE: ORDER_DETAILS
-- ============================================
CREATE TABLE order_details (
    id_order_detail INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price_order DECIMAL(6,2) NOT NULL,
    subtotal DECIMAL(8,2) NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT CHK_order_details_quantity CHECK (quantity > 0),
    CONSTRAINT CHK_order_details_unit_price CHECK (unit_price_order > 0),
    CONSTRAINT CHK_order_details_subtotal CHECK (subtotal > 0),
    CONSTRAINT FK_order_details_order 
        FOREIGN KEY (order_id) REFERENCES orders(id_order)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_order_details_product 
        FOREIGN KEY (product_id) REFERENCES products(id_product)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_order_details_order ON order_details(order_id);
CREATE INDEX idx_order_details_product ON order_details(product_id);

-- ============================================
-- TABLE: DELIVERIES (for delivery orders - only)
-- ============================================
CREATE TABLE deliveries (
    id_delivery INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    delivery_employee_id INT NOT NULL,
    delivery_datetime DATETIME NOT NULL,
	created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT UQ_deliveries_order UNIQUE (order_id),
    CONSTRAINT FK_deliveries_order 
        FOREIGN KEY (order_id) REFERENCES orders(id_order)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_deliveries_employee 
        FOREIGN KEY (delivery_employee_id) REFERENCES employees(id_employee)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_deliveries_datetime ON deliveries(delivery_datetime);
CREATE INDEX idx_deliveries_employee ON deliveries(delivery_employee_id);