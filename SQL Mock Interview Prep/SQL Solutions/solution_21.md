# Solution: SQL Problem 21 - Airlines with Zero Cancellations

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE airline NOT IN (
    SELECT DISTINCT airline
    FROM flight_details
    WHERE status = 'Cancelled'
);
```

---

## Explanation

1. **Subquery** finds airlines that have at least one cancelled flight
2. **NOT IN** excludes all flights by those airlines
3. Returns flights only from airlines with a perfect record (no cancellations)

### Key Concept: NOT IN Subquery

- `NOT IN` is the inverse of `IN` — excludes rows matching the subquery
- ⚠️ **Watch out for NULLs**: If the subquery returns any NULL values, `NOT IN` will return no rows. Use `NOT EXISTS` or add `WHERE column IS NOT NULL` in the subquery to be safe
