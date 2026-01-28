# Solution: SQL Problem 13 - Premium Revenue by Policy Type (Insurance)

## SQL Query

```sql
SELECT
  policy_type,
  SUM(premium_amount) AS total_premium
FROM insurance.policies
GROUP BY policy_type
ORDER BY total_premium DESC;
```

---

## Explanation

1. **SELECT policy_type** - The grouping column (e.g., auto, home, life)

2. **SUM(premium_amount) AS total_premium** - Total revenue per policy type

3. **GROUP BY policy_type** - Creates one row per policy type

4. **ORDER BY total_premium DESC** - Highest revenue products first

### Key Concept: Revenue Analysis

This pattern is common in business analytics:
- Group by product/category
- Sum the revenue metric
- Order by value to identify top performers

This helps answer questions like:
- Which product generates most revenue?
- Where should we focus marketing efforts?
