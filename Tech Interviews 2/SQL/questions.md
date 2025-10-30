You are working as a data analyst for a retail company. You have two tables:

- **customers(customer_id, name, city, signup_date)**
- **orders(order_id, customer_id, order_date, product_category, amount)**

Use the provided `data.sql` to create and seed the schema.

---

## Q1
Your manager needs a quick city report. For each **city**, return:

- **total_customers** = count of unique customers in that city  
- **total_revenue** = sum of order amounts from customers in that city  
- **avg_order_value** = average order amount for that city  

---

## Q2 — Customers Above Average Total Spend (Moderate)
Find customers whose **total spend** is **greater than the average total spend across all customers**. 
