# Solution: SQL Problem 9 - New Customer Lookup (Banking)

## SQL Query

```sql
SELECT
  full_name,
  email
FROM banking.customers
WHERE signup_date >= '2023-01-01'
  AND signup_date <  '2024-01-01'
ORDER BY signup_date, full_name;
```

---

## Explanation

1. **SELECT** the required columns: `full_name` and `email`

2. **WHERE clause** filters for 2023 signups:
   - `signup_date >= '2023-01-01'` - on or after Jan 1, 2023
   - `signup_date < '2024-01-01'` - before Jan 1, 2024
   - This range approach is more reliable than `YEAR(signup_date) = 2023`

3. **ORDER BY** for consistent, readable output

### Key Concept: Date Range Filtering

Using `>= start AND < end` is preferred over:
- `BETWEEN` (which includes both endpoints)
- `YEAR()` function (which can't use indexes efficiently)

This pattern is called a "half-open interval" and is a SQL best practice.
