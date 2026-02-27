# Solution: SQL Problem 30 - Airlines with Above-Average Delays

## SQL Query

```sql
SELECT airline, 
       AVG(EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60) AS avg_delay
FROM flight_details
WHERE status = 'Delayed'
GROUP BY airline
HAVING AVG(EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60) > (
    SELECT AVG(EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60)
    FROM flight_details
    WHERE status = 'Delayed'
);
```

---

## Explanation

1. **Main query** calculates the average delay per airline (only delayed flights)
2. **Subquery in HAVING** calculates the **overall** average delay across all airlines
3. `HAVING` filters to only keep airlines whose average exceeds the global average

### Key Concept: Subquery in HAVING Clause

- This is a **Microsoft-style aggregate filtering** pattern
- The subquery computes a single scalar value (the overall average)
- `HAVING` applies the filter **after** GROUP BY aggregation
- Cannot use `WHERE` here because the filter depends on an aggregate function
