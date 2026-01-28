# Solution: SQL Problem 10 - Transaction Volumes by Type (Banking)

## SQL Query

```sql
SELECT
  txn_type,
  SUM(amount) AS total_amount
FROM banking.transactions
GROUP BY txn_type
ORDER BY total_amount DESC;
```

---

## Explanation

1. **SELECT txn_type** - The grouping column

2. **SUM(amount) AS total_amount** - Aggregates all transaction amounts per type

3. **GROUP BY txn_type** - Creates one row per transaction type (deposit, withdrawal, fee)

4. **ORDER BY total_amount DESC** - Shows highest volume types first

### Key Concept: Basic Aggregation

This is a foundational SQL pattern:
- `GROUP BY` defines the grouping
- Aggregate function (`SUM`, `COUNT`, `AVG`, etc.) computes the metric
- Column alias (`AS total_amount`) makes output readable
