# Solution: SQL Problem 2 - Customers Above Average Total Spend

## SQL Query

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

---

## Explanation

1. **Main Query**: JOINs customers with orders and groups by customer name and city
2. **HAVING clause**: Filters to only customers whose total spend exceeds the average
3. **Subquery breakdown**:
   - Inner subquery calculates total spend per customer: `SELECT customer_id, SUM(amount) AS total_spent FROM orders GROUP BY customer_id`
   - Outer subquery calculates the average of those totals: `SELECT AVG(total_spent) FROM (...)`
4. **ORDER BY total_spent DESC**: Shows highest spenders first

---

## Key Concept: HAVING vs WHERE

- **WHERE** filters rows *before* grouping
- **HAVING** filters groups *after* aggregation
- Since we're comparing aggregated values (SUM), we must use HAVING
