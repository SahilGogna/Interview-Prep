# Banking Dataset — SQL Solutions

---

**1**  
```sql
-- Customers who signed up in 2023
SELECT
  full_name,
  email
FROM banking.customers
WHERE signup_date >= '2023-01-01'
  AND signup_date <  '2024-01-01'
ORDER BY signup_date, full_name;
```
---

**2**  
```sql
-- Total transaction amount per type
SELECT
  txn_type,
  SUM(amount) AS total_amount
FROM banking.transactions
GROUP BY txn_type
ORDER BY total_amount DESC;
```
---

**3**  
```sql
-- Branch performance: active accounts and total deposit amount
SELECT
  b.name AS branch_name,
  SUM(CASE WHEN a.status = 'active' THEN 1 ELSE 0 END) AS active_accounts,
  SUM(CASE WHEN t.txn_type = 'deposit' THEN t.amount ELSE 0 END) AS total_deposits
FROM banking.branches b
LEFT JOIN banking.accounts a
  ON a.branch_id = b.branch_id
LEFT JOIN banking.transactions t
  ON t.account_id = a.account_id
GROUP BY b.name
ORDER BY total_deposits DESC NULLS LAST, active_accounts DESC;
```
