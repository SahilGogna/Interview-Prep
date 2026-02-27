# Solution: SQL Problem 23 - Flights Scheduled Before Any Delayed Flight

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE scheduled_time < ANY (
    SELECT scheduled_time
    FROM flight_details
    WHERE status = 'Delayed'
);
```

---

## Explanation

1. **Subquery** returns all scheduled times of delayed flights
2. **< ANY** means "less than at least one value" in the subquery result
3. Effectively: find flights scheduled before **the latest** delayed flight
4. Equivalent to `< (SELECT MAX(scheduled_time) FROM flight_details WHERE status = 'Delayed')`

### Key Concept: ANY Operator

- `< ANY (subquery)` = less than the **maximum** value in the subquery
- `> ANY (subquery)` = greater than the **minimum** value in the subquery
- `= ANY (subquery)` is equivalent to `IN (subquery)`
- Less commonly used than `IN`/`NOT IN`, but important for interview prep
