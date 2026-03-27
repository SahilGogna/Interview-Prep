# Solve It Together — Data Case Study
## Maple Commerce | Canadian Revenue Analysis 2024

You are a **Data Analyst at Maple Commerce**, a Canadian e-commerce company similar to a Shopify merchant. The business has been operating for 2 years and sells across Canada and the US. Your manager comes to you mid-month with a concern: revenue growth has slowed down, and leadership wants to understand why.

---

## Dataset

You have access to two tables. All four questions are based on this same dataset.

---

## SQL Setup

### Create and Populate the Tables

```sql
-- Table 1: orders
CREATE TABLE orders (
    order_id    VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    order_date  DATE,
    product_id  VARCHAR(10),
    quantity    INT,
    revenue     DECIMAL(10, 2),
    country     VARCHAR(50),
    status      VARCHAR(20)
);

INSERT INTO orders (order_id, customer_id, order_date, product_id, quantity, revenue, country, status) VALUES
('O001', 'C001', '2024-01-10', 'P01', 2,  240.00, 'Canada', 'completed'),
('O002', 'C002', '2024-01-18', 'P02', 1,   85.00, 'Canada', 'completed'),
('O003', 'C003', '2024-01-25', 'P03', 3,  315.00, 'USA',    'completed'),
('O004', 'C001', '2024-02-05', 'P01', 1,  120.00, 'Canada', 'completed'),
('O005', 'C004', '2024-02-12', 'P02', 2,  170.00, 'Canada', 'completed'),
('O006', 'C002', '2024-02-20', 'P03', 1,  105.00, 'Canada', 'completed'),
('O007', 'C005', '2024-03-03', 'P01', 3,  360.00, 'Canada', 'completed'),
('O008', 'C006', '2024-03-15', 'P02', 1,   85.00, 'Canada', 'failed'),
('O009', 'C001', '2024-04-08', 'P03', 2,  210.00, 'Canada', 'completed'),
('O010', 'C007', '2024-04-20', 'P01', 1,  120.00, 'USA',    'completed'),
('O011', 'C003', '2024-05-05', 'P02', 1,   85.00, 'USA',    'completed'),
('O012', 'C008', '2024-05-22', 'P03', 2,  210.00, 'Canada', 'completed'),
('O013', 'C009', '2024-06-10', 'P01', 1,  120.00, 'Canada', 'completed'),
('O014', 'C002', '2024-06-18', 'P02', 3,  255.00, 'Canada', 'completed'),
('O015', 'C010', '2024-06-25', 'P03', 1,  105.00, 'Canada', 'completed');


-- Table 2: customers
CREATE TABLE customers (
    customer_id          VARCHAR(10) PRIMARY KEY,
    name                 VARCHAR(100),
    signup_date          DATE,
    plan_type            VARCHAR(20),
    city                 VARCHAR(50),
    acquisition_channel  VARCHAR(50)
);

INSERT INTO customers (customer_id, name, signup_date, plan_type, city, acquisition_channel) VALUES
('C001', 'Aisha Patel',    '2023-11-15', 'premium', 'Toronto',   'organic'),
('C002', 'Ben Nguyen',     '2023-12-01', 'premium', 'Vancouver', 'referral'),
('C003', 'Carlos Rivera',  '2024-01-05', 'free',    'New York',  'paid_ad'),
('C004', 'Diana Chen',     '2024-01-20', 'free',    'Toronto',   'organic'),
('C005', 'Ethan Brown',    '2024-02-10', 'premium', 'Montreal',  'referral'),
('C006', 'Fatima Ali',     '2024-02-28', 'free',    'Calgary',   'paid_ad'),
('C007', 'George Kim',     '2024-03-14', 'free',    'Chicago',   'paid_ad'),
('C008', 'Hannah Roy',     '2024-04-02', 'premium', 'Ottawa',    'organic'),
('C009', 'Ivan Petrov',    '2024-05-18', 'free',    'Toronto',   'referral'),
('C010', 'Jasmine Wu',     '2024-06-01', 'free',    'Toronto',   'paid_ad');
```

---

### Table 1: orders

| order_id | customer_id | order_date | product_id | quantity | revenue | country | status |
|----------|-------------|------------|------------|----------|---------|---------|--------|
| O001 | C001 | 2024-01-10 | P01 | 2 | $240.00 | Canada | completed |
| O002 | C002 | 2024-01-18 | P02 | 1 | $85.00 | Canada | completed |
| O003 | C003 | 2024-01-25 | P03 | 3 | $315.00 | USA | completed |
| O004 | C001 | 2024-02-05 | P01 | 1 | $120.00 | Canada | completed |
| O005 | C004 | 2024-02-12 | P02 | 2 | $170.00 | Canada | completed |
| O006 | C002 | 2024-02-20 | P03 | 1 | $105.00 | Canada | completed |
| O007 | C005 | 2024-03-03 | P01 | 3 | $360.00 | Canada | completed |
| O008 | C006 | 2024-03-15 | P02 | 1 | $85.00 | Canada | failed |
| O009 | C001 | 2024-04-08 | P03 | 2 | $210.00 | Canada | completed |
| O010 | C007 | 2024-04-20 | P01 | 1 | $120.00 | USA | completed |
| O011 | C003 | 2024-05-05 | P02 | 1 | $85.00 | USA | completed |
| O012 | C008 | 2024-05-22 | P03 | 2 | $210.00 | Canada | completed |
| O013 | C009 | 2024-06-10 | P01 | 1 | $120.00 | Canada | completed |
| O014 | C002 | 2024-06-18 | P02 | 3 | $255.00 | Canada | completed |
| O015 | C010 | 2024-06-25 | P03 | 1 | $105.00 | Canada | completed |

---

### Table 2: customers

| customer_id | name | signup_date | plan_type | city | acquisition_channel |
|-------------|------|-------------|-----------|------|---------------------|
| C001 | Aisha Patel | 2023-11-15 | premium | Toronto | organic |
| C002 | Ben Nguyen | 2023-12-01 | premium | Vancouver | referral |
| C003 | Carlos Rivera | 2024-01-05 | free | New York | paid_ad |
| C004 | Diana Chen | 2024-01-20 | free | Toronto | organic |
| C005 | Ethan Brown | 2024-02-10 | premium | Montreal | referral |
| C006 | Fatima Ali | 2024-02-28 | free | Calgary | paid_ad |
| C007 | George Kim | 2024-03-14 | free | Chicago | paid_ad |
| C008 | Hannah Roy | 2024-04-02 | premium | Ottawa | organic |
| C009 | Ivan Petrov | 2024-05-18 | free | Toronto | referral |
| C010 | Jasmine Wu | 2024-06-01 | free | Toronto | paid_ad |

---

## Questions

### Question 1 — SQL | Monthly Revenue Trend

Your manager says:

> "I want to see monthly revenue for Canadian customers in 2024 — completed orders only. Also, show me the number of orders each month. Order by month."

---

### Question 2 — SQL | Identifying Repeat vs One-Time Customers

Your manager follows up:

> "Which Canadian customers placed more than one completed order in 2024? Show their total orders, total revenue, and the date of their most recent order. I want to know who our loyal customers are."

---

### Question 3 — Python | Revenue Drop Investigation

Your manager comes back after seeing the monthly revenue table from Q1. She says:

> "April and May look really weak compared to Q1. Can you use Python to calculate month-over-month revenue change for Canadian customers and flag any month where revenue dropped more than 15% from the previous month? Export it as a clean summary."

---

### Question 4 — Business Interpretation | Tell the Story

Your manager now has the full picture. She asks you to present a 2-minute summary to the leadership team answering:

> "What is going on with our Canadian revenue in 2024 and what should we do about it?"

Use the data from all three previous questions to build your answer.
