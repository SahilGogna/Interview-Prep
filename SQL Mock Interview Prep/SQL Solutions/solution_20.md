# Solution: SQL Problem 20 - Cancelled Flights at On-Time Gates

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE status = 'Cancelled'
AND gate IN (
    SELECT DISTINCT gate
    FROM flight_details
    WHERE status = 'On Time'
);
```

---

## Explanation

1. **Outer WHERE** filters to only cancelled flights
2. **Subquery** finds all gates that have had at least one on-time flight
3. **AND gate IN (...)** further filters cancelled flights to only those at gates with on-time history
4. Combines a direct filter (`status = 'Cancelled'`) with a subquery filter (`gate IN ...`)

### Key Concept: Combining WHERE Conditions with Subqueries

- You can combine regular WHERE conditions with subquery-based filters using AND/OR
- This tests the candidate's ability to layer multiple filtering criteria
