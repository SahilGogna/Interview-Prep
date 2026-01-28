-- Schema + seed data for a simple retail scenario (customers, orders)

-- Drop existing (idempotent for local testing)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Customers
CREATE TABLE customers (
  customer_id   INT PRIMARY KEY,
  name          VARCHAR(100),
  city          VARCHAR(100),
  signup_date   DATE
);

-- Orders
CREATE TABLE orders (
  order_id         INT PRIMARY KEY,
  customer_id      INT REFERENCES customers(customer_id),
  order_date       DATE,
  product_category VARCHAR(50),
  amount           DECIMAL(10,2)
);

-- Seed: customers
INSERT INTO customers (customer_id, name, city, signup_date) VALUES
(1, 'Alice Brown',   'Toronto',   '2023-01-15'),
(2, 'Bob Smith',     'Vancouver', '2023-02-20'),
(3, 'Charlie Wang',  'Toronto',   '2023-03-10'),
(4, 'Diana Patel',   'Calgary',   '2023-03-22'),
(5, 'Ethan Davis',   'Toronto',   '2023-04-05');

-- Seed: orders
INSERT INTO orders (order_id, customer_id, order_date, product_category, amount) VALUES
(101, 1, '2023-02-01', 'Electronics', 1200.00),
(102, 1, '2023-04-10', 'Groceries',    150.00),
(103, 2, '2023-03-15', 'Furniture',    800.00),
(104, 3, '2023-03-20', 'Electronics',  900.00),
(105, 3, '2023-05-02', 'Clothing',     250.00),
(106, 4, '2023-06-01', 'Groceries',     90.00),
(107, 5, '2023-07-18', 'Electronics', 2000.00),
(108, 5, '2023-07-30', 'Furniture',    700.00);
