
USE culdampolla_store;

-- ============================================
-- SAMPLE DATA - SUPPLIERS
-- ============================================
INSERT INTO suppliers (supplier_name, nif, phone_country_code, phone, fax, address_line_one, address_line_two, city, postcode, country) VALUES
('OpticsWorld SL', 'B12345678', '+34', '933334455', '933334456', 'Gran Via 123', '2nd Floor, Office A', 'Barcelona', '08001', 'Spain'),
('VisionPlus SA', 'A87654321', '+34', '911112233', NULL, 'Carrer Major 45', NULL, 'Madrid', '28001', 'Spain'),
('EuroLens GmbH', 'DE123456789', '+49', '301234567', '301234568', 'Hauptstrasse 78', '3rd Floor, Suite B', 'Berlin', '10115', 'Germany'),
('ItalianOptics SRL', 'IT987654321', '+39', '0612345678', NULL, 'Via Roma 100', NULL, 'Milan', '20121', 'Italy');

-- ============================================
-- SAMPLE DATA - BRANDS
-- ============================================
INSERT INTO brands (brand_name, supplier_id) VALUES
('Ray-Ban', 1),
('Oakley', 1),
('Prada', 2),
('Gucci', 2),
('Zeiss', 3),
('Armani', 4);

-- ============================================
-- SAMPLE DATA - GLASSES
-- ============================================
INSERT INTO glasses (brand_id, left_lens_graduation, right_lens_graduation, frame_type, frame_color, left_lens_color, right_lens_color, price) VALUES
-- Ray-Ban models
(1, -1.50, -1.75, 'metallic', 'Black', 'Gray', 'Gray', 159.99),
(1, 0.00, 0.00, 'plastic', 'Tortoise', 'Brown', 'Brown', 189.99),
(1, -2.50, -2.50, 'metallic', 'Gold', 'Green', 'Green', 199.99),
-- Oakley models
(2, -2.00, -2.25, 'plastic', 'Matte Black', 'Clear', 'Clear', 225.00),
(2, 0.00, 0.00, 'floating', 'Blue', 'Mirror Blue', 'Mirror Blue', 249.99),
-- Prada models
(3, -0.75, -1.00, 'metallic', 'Gold', 'Clear', 'Clear', 349.99),
(3, 0.00, 0.00, 'plastic', 'Red', 'Black', 'Black', 399.99),
-- Gucci models
(4, 0.00, 0.00, 'floating', 'Silver', 'Green', 'Green', 425.00),
(4, -1.25, -1.50, 'metallic', 'Rose Gold', 'Clear', 'Clear', 475.00),
-- Zeiss models
(5, -3.50, -3.50, 'metallic', 'Titanium', 'Clear', 'Clear', 299.99),
(5, -5.00, -4.75, 'plastic', 'Black', 'Clear', 'Clear', 325.00),
-- Armani models
(6, 0.00, 0.00, 'plastic', 'Navy Blue', 'Gray', 'Gray', 380.00),
(6, -1.00, -1.00, 'metallic', 'Silver', 'Clear', 'Clear', 410.00);

-- ============================================
-- SAMPLE DATA - CUSTOMERS
-- ============================================
INSERT INTO customers (customer_name, postcode, phone, email, registration_date, recommended_by) VALUES
('Maria Garcia Lopez', '08008', '+34666111222', 'maria.garcia@email.com', '2023-01-15', NULL),
('Juan Martinez Ruiz', '08007', '+34666333444', 'juan.martinez@email.com', '2023-02-20', 1),
('Laura Fernandez Costa', '08008', '+34666555666', 'laura.fernandez@email.com', '2023-03-10', 1),
('Carlos Sanchez Perez', '08018', '+34666777888', 'carlos.sanchez@email.com', '2023-04-05', NULL),
('Ana Rodriguez Vila', '08011', '+34666999000', 'ana.rodriguez@email.com', '2023-05-12', 4),
('Pedro Lopez Martin', '08015', '+34677111222', 'pedro.lopez@email.com', '2023-06-18', 1),
('Sofia Gonzalez Ruiz', '08036', '+34677333444', 'sofia.gonzalez@email.com', '2024-01-10', 3),
('Miguel Torres Diaz', '08009', '+34677555666', 'miguel.torres@email.com', '2024-02-14', NULL);

-- ============================================
-- SAMPLE DATA - EMPLOYEES
-- ============================================
INSERT INTO employees (employee_name, position, hire_date) VALUES
('Sofia Moreno Torres', 'Sales Manager', '2020-06-01'),
('David Lopez Navarro', 'Sales Associate', '2022-03-15'),
('Elena Ruiz Gomez', 'Sales Associate', '2023-01-10'),
('Roberto Vila Sanchez', 'Optician', '2021-09-20');

-- ============================================
-- SAMPLE DATA - ORDERS (Multiple years for testing)
-- ============================================
-- Orders in 2023
INSERT INTO orders (glasses_id, customer_id, employee_id, order_date, quantity, total_amount) VALUES
(1, 1, 2, '2023-01-20 10:30:00', 1, 159.99),
(4, 2, 1, '2023-02-25 14:15:00', 1, 225.00),
(2, 3, 3, '2023-03-15 11:45:00', 1, 189.99),
(6, 1, 2, '2023-04-10 16:20:00', 1, 349.99),
(8, 4, 1, '2023-04-15 12:00:00', 1, 425.00),
(10, 5, 3, '2023-05-20 15:30:00', 1, 299.99),
(1, 3, 2, '2023-06-05 10:00:00', 2, 319.98),
(12, 6, 4, '2023-07-10 09:30:00', 1, 380.00),
(5, 2, 1, '2023-08-22 13:45:00', 1, 249.99),
(3, 1, 2, '2023-09-14 11:20:00', 1, 199.99),
(7, 4, 3, '2023-10-08 14:50:00', 1, 399.99),
(11, 5, 2, '2023-11-18 16:10:00', 1, 325.00),
(9, 6, 1, '2023-12-05 10:45:00', 1, 475.00);

-- Orders in 2024
INSERT INTO orders (glasses_id, customer_id, employee_id, order_date, quantity, total_amount) VALUES
(13, 7, 3, '2024-01-15 10:20:00', 1, 410.00),
(4, 8, 2, '2024-02-20 15:30:00', 1, 225.00),
(6, 7, 1, '2024-03-12 11:15:00', 1, 349.99),
(1, 1, 2, '2024-04-18 14:00:00', 1, 159.99),
(10, 3, 3, '2024-05-25 09:45:00', 1, 299.99),
(8, 2, 1, '2024-06-30 16:20:00', 1, 425.00),
(2, 4, 2, '2024-07-14 12:30:00', 1, 189.99),
(5, 5, 3, '2024-08-20 10:15:00', 1, 249.99),
(12, 6, 1, '2024-09-10 14:40:00', 1, 380.00),
(7, 8, 2, '2024-10-22 11:50:00', 1, 399.99),
(3, 7, 3, '2024-11-05 15:25:00', 1, 199.99);


-- =================================================
-- QUERY 1: Lista el total de compras de un cliente
-- =================================================

SELECT o.id_order, o.customer_id
FROM  orders o
LEFT JOIN  customers c ON o.customer_id = c.id_customer
WHERE 
	c.email = 'maria.garcia@email.com' ;

-- ==============================================================================
-- QUERY 2: Lista las distintas gafas que ha vendido un empleado durante un año
-- ==============================================================================

SELECT e.employee_name, o.glasses_id, count(o.id_order) as nb_orders
FROM  orders o
LEFT JOIN  employees e ON o.employee_id = e.id_employee
LEFT JOIN  glasses g ON o.glasses_id = g.id_glasses
WHERE 
	e.employee_name = 'Elena Ruiz Gomez' 
GROUP BY o.glasses_id;

-- ========================================================================================================
-- QUERY 3: Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica
-- =========================================================================================================

SELECT DISTINCT
    s.id_supplier,
    s.supplier_name,
    COUNT(DISTINCT b.id_brand) AS brands_supplied,
    COUNT(DISTINCT g.id_glasses) AS different_glasses_sold,
    COUNT(o.id_order) AS nb_orders,
    SUM(o.quantity) AS nb_quantity_sold,
    SUM(o.total_amount) AS total_revenue
FROM suppliers s
JOIN brands b ON s.id_supplier = b.supplier_id
JOIN glasses g ON b.id_brand = g.brand_id
JOIN orders o ON g.id_glasses = o.glasses_id
GROUP BY s.id_supplier, s.supplier_name
ORDER BY total_revenue DESC;


