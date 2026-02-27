# Solution: SQL Problem 18 - All Flights by Airlines with Cancellations

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

1. **Subquery** identifies airlines with at least one cancelled flight
2. **Main query** returns all flights by those airlines using `IN`
3. Similar to Problem 15 — reinforces the foundational `IN` subquery pattern

### Key Concept: IN Subquery

- `IN` checks membership against a list returned by the subquery
- `DISTINCT` ensures no duplicate values in the subquery result
- This pattern is a building block for more complex subquery problems
