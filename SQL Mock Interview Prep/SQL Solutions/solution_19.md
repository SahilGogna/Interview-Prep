# Solution: SQL Problem 19 - Flights to/from Cancelled Destinations

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE destination_or_origin IN (
    SELECT DISTINCT destination_or_origin
    FROM flight_details
    WHERE status = 'Cancelled'
);
```

---

## Explanation

1. **Subquery** finds all destinations/origins that had at least one cancellation
2. **Main query** returns all flights to/from those destinations, regardless of their own status
3. Filters on `destination_or_origin` instead of `airline` — same `IN` pattern, different column

### Key Concept: IN on Different Columns

- The `IN` subquery pattern works on any column, not just the grouping column
- This question tests whether the candidate can adapt the pattern to a different filtering dimension
