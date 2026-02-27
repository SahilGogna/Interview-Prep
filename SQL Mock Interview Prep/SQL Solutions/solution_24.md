# Solution: SQL Problem 24 - Flights Scheduled After Any Cancelled Flight

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE scheduled_time > ANY (
    SELECT scheduled_time
    FROM flight_details
    WHERE status = 'Cancelled'
);
```

---

## Explanation

1. **Subquery** returns scheduled times of all cancelled flights
2. **> ANY** means "greater than at least one value" — i.e., after the **earliest** cancelled flight
3. Equivalent to `> (SELECT MIN(scheduled_time) FROM flight_details WHERE status = 'Cancelled')`

### Key Concept: > ANY Pattern

- Returns rows where the value exceeds **at least one** value from the subquery
- In practice, this means exceeding the minimum value
- Contrast with `> ALL` (Problem 25), which requires exceeding **every** value
