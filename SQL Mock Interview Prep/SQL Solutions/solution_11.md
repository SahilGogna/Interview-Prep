# Solution: SQL Problem 11 - Branch Performance Analysis (Banking)

## SQL Query

```sql
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

---

## Explanation

1. **LEFT JOINs**: Ensure all branches are included, even those with no accounts or transactions

2. **Conditional SUM for active_accounts**:
   - `CASE WHEN a.status = 'active' THEN 1 ELSE 0 END`
   - Counts only accounts with 'active' status

3. **Conditional SUM for total_deposits**:
   - `CASE WHEN t.txn_type = 'deposit' THEN t.amount ELSE 0 END`
   - Only sums deposit transactions, ignores withdrawals and fees

4. **GROUP BY b.name** - Aggregates at branch level

5. **ORDER BY with NULLS LAST** - Branches with no deposits appear last

### Key Concept: Conditional Aggregation

Using `CASE WHEN` inside aggregate functions allows:
- Multiple metrics in one query
- Filtering within aggregation
- Avoiding complex subqueries
