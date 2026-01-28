# SQL Problem 1: City-Level Sales Summary

## Context

You are working as a data analyst for a retail company. You have two tables:

- **customers** (`customer_id`, `name`, `city`, `signup_date`)
- **orders** (`order_id`, `customer_id`, `order_date`, `product_category`, `amount`)

📁 **Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%201/data.sql)

---

## Question

Your manager needs a quick city report. For each **city**, return:

- **total_customers** = count of unique customers in that city
- **total_revenue** = sum of order amounts from customers in that city
- **avg_order_value** = average order amount for that city

---

## Expected Output

![expected output](./expected_output.png)

---

<details>
<summary><strong>💡 Solution (Click to expand)</strong></summary>

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

### Explanation

1. **JOIN** customers and orders on `customer_id` to link customer location with their orders
2. **GROUP BY** city to aggregate data per city
3. **COUNT(DISTINCT c.customer_id)** - counts unique customers (not double-counting if they have multiple orders)
4. **SUM(o.amount)** - total revenue from all orders in that city
5. **ROUND(AVG(o.amount), 2)** - average order value rounded to 2 decimal places
6. **ORDER BY total_revenue DESC** - highest revenue cities first

</details>
