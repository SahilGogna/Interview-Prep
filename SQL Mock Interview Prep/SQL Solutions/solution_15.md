# Solution: SQL Problem 15 - Flights by Airlines with Cancellations

## SQL Query

```sql
SELECT * 
FROM flight_details 
WHERE airline IN (
    SELECT DISTINCT airline 
    FROM flight_details 
    WHERE status = 'Cancelled'
);
```

---

## Explanation

1. **Inner subquery** finds all airlines that have at least one cancelled flight using `DISTINCT`
2. **Outer query** uses `IN` to filter all flights belonging to those airlines
3. This returns **all flights** (not just cancelled ones) for airlines that have experienced cancellations

### Key Concept: Subquery in WHERE with IN

- The `IN` operator checks if a value matches any value returned by the subquery
- `DISTINCT` in the subquery avoids duplicate airline names
- This is one of the most common subquery patterns in SQL interviews
