# Solution: SQL Problem 29 - Flights That Were Always On Time

## SQL Query

```sql
SELECT DISTINCT flight_number
FROM flight_details f1
WHERE NOT EXISTS (
    SELECT 1
    FROM flight_details f2
    WHERE f2.flight_number = f1.flight_number
      AND f2.status != 'On Time'
);
```

---

## Explanation

1. **Outer query** selects distinct flight numbers
2. **NOT EXISTS** checks that there is no record of the same flight number with a non-on-time status
3. If a flight number has **any** delayed or cancelled record, it is excluded

### Key Concept: NOT EXISTS for Consistency Checks

- This is a **Facebook-style consistency check** pattern
- `NOT EXISTS` is often preferred over `NOT IN` because:
  - It handles NULLs correctly
  - It can be more performant (short-circuits when a match is found)
- `SELECT 1` is a convention — the actual selected value doesn't matter for EXISTS
- Tests whether a condition holds for **all** records of a group
