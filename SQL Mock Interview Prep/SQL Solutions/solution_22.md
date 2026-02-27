# Solution: SQL Problem 22 - Destinations with No On-Time Flights

## SQL Query

```sql
SELECT *
FROM flight_details
WHERE destination_or_origin NOT IN (
    SELECT DISTINCT destination_or_origin
    FROM flight_details
    WHERE status = 'On Time'
);
```

---

## Explanation

1. **Subquery** finds all destinations that have had at least one on-time flight
2. **NOT IN** excludes flights to/from those destinations
3. Returns only flights to destinations where **every** flight was delayed or cancelled

### Key Concept: NOT IN for Exclusion

- This is the logical complement of Problem 19
- Useful for finding "problem destinations" with no successful operations
- Same NULL caveat applies as with any `NOT IN` usage
