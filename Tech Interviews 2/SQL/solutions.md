# Real-World SQL Interview — Solutions

## Solution to Q1 — City-Level Sales Summary
```sql
SELECT 
    c.city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    SUM(o.amount) AS total_revenue,
    ROUND(AVG(o.amount), 2) AS avg_order_value
FROM customers c
JOIN orders o 
  ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;
```

---

## Solution to Q2 — Customers Above Average Total Spend
```sql
SELECT 
    c.name,
    c.city,
    SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o 
  ON c.customer_id = o.customer_id
GROUP BY c.name, c.city
HAVING SUM(o.amount) > (
    SELECT AVG(total_spent)
    FROM (
        SELECT customer_id, SUM(amount) AS total_spent
        FROM orders
        GROUP BY customer_id
    ) t
)
ORDER BY total_spent DESC;
```
