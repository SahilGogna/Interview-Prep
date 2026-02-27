# Solution: SQL Problem 25 - Flights Scheduled After All Cancelled Flights

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE scheduled_time > ALL (
    SELECT scheduled_time
    FROM flight_details
    WHERE status = 'Cancelled'
);
```

---

## Explanation

1. **Subquery** returns all scheduled times of cancelled flights
2. **> ALL** means "greater than **every** value" in the subquery
3. Only returns flights scheduled **after the latest cancelled flight**
4. Equivalent to `> (SELECT MAX(scheduled_time) FROM flight_details WHERE status = 'Cancelled')`

### Key Concept: ALL Operator

- `> ALL (subquery)` = greater than the **maximum** value
- `< ALL (subquery)` = less than the **minimum** value
- Much stricter than `ANY` — the condition must hold for **every** row in the subquery
- If the subquery returns an empty set, the condition is TRUE for all rows
