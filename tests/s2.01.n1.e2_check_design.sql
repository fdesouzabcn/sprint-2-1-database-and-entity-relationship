
USE pizzeria_delivery;

-- ============================================
-- STORES DATA
-- ============================================
INSERT INTO stores (store_name, address, postal_code, city, province) VALUES
('Pizza Bella Barcelona Centro', 'Carrer Pau Claris 100', '08009', 'Barcelona', 'Barcelona'),
('Pizza Bella Barcelona Norte', 'Gran Via de les Corts Catalanes 500', '08015', 'Barcelona', 'Barcelona'),
('Pizza Bella Madrid Centro', 'Calle Gran Via 25', '28013', 'Madrid', 'Madrid'),
('Pizza Bella Valencia Centro', 'Calle Colon 45', '46004', 'Valencia', 'Valencia');

-- ============================================
-- EMPLOYEES DATA
-- ============================================
INSERT INTO employees (store_id, first_name, last_name, nif, phone, employee_type, hire_date) VALUES
-- Barcelona Centro store
(1, 'Marco', 'Rossi', '12345678A', '+34611111111', 'cook', '2023-01-15'),
(1, 'Luigi', 'Bianchi', '23456789B', '+34622222222', 'cook', '2023-02-20'),
(1, 'Carlos', 'Mendez', '34567890C', '+34633333333', 'delivery', '2023-03-10'),
(1, 'Ana', 'Torres', '45678901D', '+34644444444', 'delivery', '2023-04-05'),
-- Barcelona Norte store
(2, 'Giuseppe', 'Verdi', '56789012E', '+34655555555', 'cook', '2023-01-20'),
(2, 'Maria', 'Santos', '67890123F', '+34666666666', 'delivery', '2023-05-15'),
(2, 'Roberto', 'Martinez', '78901234G', '+34677777777', 'cook', '2023-06-01'),
-- Madrid Centro store
(3, 'Paolo', 'Ferrari', '89012345H', '+34688888888', 'cook', '2023-02-01'),
(3, 'Laura', 'Garcia', '90123456I', '+34699999999', 'delivery', '2023-06-10'),
-- Valencia Centro store
(4, 'Diego', 'Sanchez', '01234567J', '+34600000000', 'cook', '2023-03-15'),
(4, 'Isabel', 'Lopez', '11223344K', '+34611223344', 'delivery', '2023-07-20');

-- ============================================
-- CATEGORIES DATA
-- ============================================
INSERT INTO categories (category_name) VALUES
('Classic Pizzas'),
('Gourmet Pizzas'),
('Vegetarian Pizzas'),
('Spicy Pizzas');

-- ============================================
-- PRODUCTS DATA
-- ============================================
-- Pizzas (Classic)
INSERT INTO products (product_name, product_type, category_id, product_description, image_url, price) VALUES
('Margherita', 'pizza', 1, 'Tomato sauce, mozzarella, fresh basil', '/images/margherita.jpg', 8.50),
('Pepperoni', 'pizza', 1, 'Tomato sauce, mozzarella, pepperoni', '/images/pepperoni.jpg', 10.00),
('Prosciutto e Funghi', 'pizza', 1, 'Ham and mushrooms with mozzarella', '/images/prosciutto.jpg', 11.50),

-- Pizzas (Gourmet)
('Quattro Formaggi', 'pizza', 2, 'Four cheese blend: mozzarella, gorgonzola, parmesan, fontina', '/images/quattro.jpg', 12.50),
('Truffle Special', 'pizza', 2, 'Truffle cream, mushrooms, parmesan', '/images/truffle.jpg', 15.00),

-- Pizzas (Vegetarian)
('Vegetariana', 'pizza', 3, 'Mixed vegetables, mozzarella, tomato sauce', '/images/vegetariana.jpg', 10.50),
('Caprese', 'pizza', 3, 'Fresh tomato, mozzarella, basil, olive oil', '/images/caprese.jpg', 11.00),

-- Pizzas (Spicy)
('Diavola', 'pizza', 4, 'Spicy salami, hot peppers, mozzarella', '/images/diavola.jpg', 11.00),

-- Burgers
('Classic Burger', 'burger', NULL, 'Beef patty, lettuce, tomato, cheese', '/images/classic_burger.jpg', 7.50),
('Bacon Burger', 'burger', NULL, 'Beef patty, bacon, cheese, BBQ sauce', '/images/bacon_burger.jpg', 9.00),
('Veggie Burger', 'burger', NULL, 'Vegetable patty, avocado, lettuce', '/images/veggie_burger.jpg', 8.00),

-- Drinks
('Coca-Cola 330ml', 'drink', NULL, 'Classic cola', '/images/cola.jpg', 2.00),
('Sprite 330ml', 'drink', NULL, 'Lemon-lime soda', '/images/sprite.jpg', 2.00),
('Fanta Orange 330ml', 'drink', NULL, 'Orange soda', '/images/fanta.jpg', 2.00),
('Water 500ml', 'drink', NULL, 'Mineral water', '/images/water.jpg', 1.50),
('Beer 330ml', 'drink', NULL, 'Local craft beer', '/images/beer.jpg', 3.50),
('Red Wine Glass', 'drink', NULL, 'House red wine', '/images/wine.jpg', 4.50);

-- ============================================
-- CUSTOMERS DATA
-- ============================================
INSERT INTO customers (first_name, last_name, address, postal_code, city, province, phone) VALUES
-- Barcelona customers
('Juan', 'Perez Martinez', 'Carrer de Balmes 150, 3-1', '08008', 'Barcelona', 'Barcelona', '+34700111222'),
('Maria', 'Lopez Garcia', 'Avinguda Diagonal 400, 5-2', '08037', 'Barcelona', 'Barcelona', '+34700222333'),
('Pedro', 'Sanchez Ruiz', 'Carrer Muntaner 200, 2-A', '08036', 'Barcelona', 'Barcelona', '+34700333444'),
('Laura', 'Fernandez Costa', 'Passeig Sant Joan 100, 4-B', '08009', 'Barcelona', 'Barcelona', '+34700444555'),
('Sofia', 'Gonzalez Vila', 'Rambla Catalunya 67', '08007', 'Barcelona', 'Barcelona', '+34700555666'),

-- Madrid customers
('Carlos', 'Rodriguez Diaz', 'Gran Via 300, 6-C', '28004', 'Madrid', 'Madrid', '+34700666777'),
('Elena', 'Martin Torres', 'Calle Alcala 150', '28009', 'Madrid', 'Madrid', '+34700777888'),

-- Valencia customers
('Miguel', 'Jimenez Ruiz', 'Calle Colon 89', '46004', 'Valencia', 'Valencia', '+34700888999'),
('Carmen', 'Navarro Perez', 'Avenida Blasco Ibanez 25', '46010', 'Valencia', 'Valencia', '+34700999000');

-- ============================================
-- ORDERS DATA (Multiple cities and employees)
-- ============================================

-- Order 1: Delivery (Employee Marco - id 1)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(1, 1, 1, '2024-10-15 19:30:00', 'delivery', 24.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(1, 2, 2, 10.00, 20.00),   -- 2x Pepperoni
(1, 12, 2, 2.00, 4.00),     -- 2x Coca-Cola
(1, 15, 1, 1.50, 1.50);     -- 1x Water

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(1, 3, '2024-10-15 20:15:00');  -- Delivered by Carlos

-- Order 2: Pickup (Employee Luigi - id 2)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(2, 2, 1, '2024-10-16 20:00:00', 'pickup', 21.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(2, 1, 1, 8.50, 8.50),      -- 1x Margherita
(2, 9, 1, 7.50, 7.50),      -- 1x Classic Burger
(2, 13, 2, 2.00, 4.00),     -- 2x Sprite
(2, 15, 1, 1.50, 1.50);     -- 1x Water

-- Order 3: Delivery (Employee Marco - id 1)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(3, 1, 1, '2024-10-17 18:45:00', 'delivery', 32.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(3, 4, 1, 12.50, 12.50),    -- 1x Quattro Formaggi
(3, 5, 1, 15.00, 15.00),    -- 1x Truffle Special
(3, 16, 2, 3.50, 7.00);     -- 2x Beer

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(3, 4, '2024-10-17 19:30:00');  -- Delivered by Ana

-- Order 4: Delivery (Employee Luigi - id 2)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(4, 2, 1, '2024-10-18 21:00:00', 'delivery', 47.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(4, 1, 2, 8.50, 17.00),     -- 2x Margherita
(4, 6, 1, 10.50, 10.50),    -- 1x Vegetariana
(4, 8, 1, 11.00, 11.00),    -- 1x Diavola
(4, 12, 3, 2.00, 6.00),     -- 3x Coca-Cola
(4, 15, 2, 1.50, 3.00);     -- 2x Water

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(4, 3, '2024-10-18 21:45:00');  -- Delivered by Carlos

-- Order 5: Pickup (Employee Marco - id 1)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(5, 1, 1, '2024-10-19 13:30:00', 'pickup', 23.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(5, 10, 2, 9.00, 18.00),    -- 2x Bacon Burger
(5, 14, 2, 2.00, 4.00),     -- 2x Fanta
(5, 15, 1, 1.50, 1.50);     -- 1x Water

-- ============================================
-- BARCELONA NORTE STORE ORDERS
-- ============================================
-- Order 6: Delivery (Employee Giuseppe - id 5)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(2, 5, 2, '2024-10-20 19:15:00', 'delivery', 28.00);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(6, 3, 1, 11.50, 11.50),    -- 1x Prosciutto e Funghi
(6, 7, 1, 11.00, 11.00),    -- 1x Caprese
(6, 13, 2, 2.00, 4.00),     -- 2x Sprite
(6, 15, 1, 1.50, 1.50);     -- 1x Water

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(6, 6, '2024-10-20 20:00:00');  -- Delivered by Maria

-- Order 7: Pickup (Employee Roberto - id 7)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(3, 7, 2, '2024-10-21 14:00:00', 'pickup', 19.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(7, 1, 1, 8.50, 8.50),      -- 1x Margherita
(7, 9, 1, 7.50, 7.50),      -- 1x Classic Burger
(7, 12, 1, 2.00, 2.00),     -- 1x Coca-Cola
(7, 15, 1, 1.50, 1.50);     -- 1x Water

-- ============================================
-- MADRID CENTRO STORE ORDERS
-- ============================================
-- Order 8: Delivery (Employee Paolo - id 8)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(6, 8, 3, '2024-10-22 20:30:00', 'delivery', 29.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(8, 2, 1, 10.00, 10.00),    -- 1x Pepperoni
(8, 9, 1, 7.50, 7.50),      -- 1x Classic Burger
(8, 12, 2, 2.00, 4.00),     -- 2x Coca-Cola
(8, 16, 2, 3.50, 7.00),     -- 2x Beer
(8, 15, 1, 1.50, 1.50);     -- 1x Water

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(8, 9, '2024-10-22 21:15:00');  -- Delivered by Laura

-- Order 9: Pickup (Employee Paolo - id 8)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(7, 8, 3, '2024-10-23 19:15:00', 'pickup', 17.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(9, 1, 1, 8.50, 8.50),      -- 1x Margherita
(9, 13, 3, 2.00, 6.00),     -- 3x Sprite
(9, 15, 2, 1.50, 3.00);     -- 2x Water

-- Order 10: Delivery (Employee Paolo - id 8)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(6, 8, 3, '2024-10-24 18:00:00', 'delivery', 35.00);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(10, 5, 1, 15.00, 15.00),   -- 1x Truffle Special
(10, 8, 1, 11.00, 11.00),   -- 1x Diavola
(10, 17, 2, 4.50, 9.00);    -- 2x Red Wine

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(10, 9, '2024-10-24 18:45:00');  -- Delivered by Laura

-- ============================================
-- VALENCIA CENTRO STORE ORDERS
-- ============================================
-- Order 11: Delivery (Employee Diego - id 10)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(8, 10, 4, '2024-10-25 20:00:00', 'delivery', 26.50);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(11, 2, 1, 10.00, 10.00),   -- 1x Pepperoni
(11, 6, 1, 10.50, 10.50),   -- 1x Vegetariana
(11, 12, 2, 2.00, 4.00),    -- 2x Coca-Cola
(11, 15, 2, 1.50, 3.00);    -- 2x Water

INSERT INTO deliveries (order_id, delivery_employee_id, delivery_datetime) VALUES
(11, 11, '2024-10-25 20:45:00');  -- Delivered by Isabel

-- Order 12: Pickup (Employee Diego - id 10)
INSERT INTO orders (customer_id, employee_id, store_id, order_datetime, order_type, total_amount) VALUES
(9, 10, 4, '2024-10-26 13:00:00', 'pickup', 15.00);

INSERT INTO order_details (order_id, product_id, quantity, unit_price_order, subtotal) VALUES
(12, 11, 1, 8.00, 8.00),    -- 1x Veggie Burger
(12, 14, 2, 2.00, 4.00),    -- 2x Fanta
(12, 15, 2, 1.50, 3.00);    -- 2x Water

-- ================================================================================================
-- QUERY 1: Lista cuántos productos de tipo "Bebidas" se han vendido en una determinada localidad
-- ================================================================================================
SELECT 
    s.city AS city
    ,p.product_name AS drink_name
    ,SUM(od.quantity) AS total_units_sold
FROM order_details od
JOIN products p ON od.product_id = p.id_product
JOIN orders o ON od.order_id = o.id_order
JOIN stores s ON o.store_id = s.id_store
WHERE p.product_type = 'drink' 
  AND s.city = 'Barcelona'
GROUP BY s.city, p.product_name
ORDER BY total_units_sold DESC;

-- ======================================================================
-- QUERY 2: Lista cuántos pedidos ha efectuado un determinado empleado/a
-- ======================================================================

SELECT 
    e.id_employee
    ,CONCAT(e.first_name, ' ', e.last_name) AS employee_name
    ,e.employee_type
    ,s.city AS store_city
    ,COUNT(o.id_order) AS total_orders
FROM employees e
JOIN stores s ON e.store_id = s.id_store
LEFT JOIN orders o ON e.id_employee = o.employee_id
WHERE e.id_employee = 1
GROUP BY e.id_employee, e.first_name, e.last_name, e.employee_type, s.city
ORDER BY total_orders DESC;

-- =================================================================================
-- QUERY 3 : Lista cuántos pedidos han sido entregado por cada empleado de delivery
-- =================================================================================

SELECT 
    e.id_employee
    ,CONCAT(e.first_name, ' ', e.last_name) AS delivery_name
    ,e.employee_type
    ,s.city AS store_city
    ,COUNT(d.id_delivery) AS total_deliveries
FROM employees e
JOIN deliveries d ON e.id_employee = d.delivery_employee_id
JOIN orders o ON d.order_id = o.id_order
JOIN stores s ON e.store_id = s.id_store
WHERE e.employee_type = 'delivery'
GROUP BY e.id_employee, e.first_name, e.last_name, s.store_name
ORDER BY total_deliveries DESC;