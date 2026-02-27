# Solution: SQL Problem 26 - Airlines Where Every Flight is On Time

## SQL Query

```sql
SELECT DISTINCT airline
FROM flight_details fd
WHERE 'Cancelled' <> ALL (
    SELECT status
    FROM flight_details
    WHERE airline = fd.airline
);
```

---

## Explanation

1. **Correlated subquery** returns all statuses for the current airline
2. **`<> ALL`** ensures 'Cancelled' does not match **any** status for that airline
3. This effectively checks that no flight for the airline was cancelled
4. `DISTINCT` ensures each airline appears only once

### Key Concept: <> ALL for Universal Negation

- `<> ALL (subquery)` means "not equal to any value" in the result set
- This is equivalent to `NOT IN (subquery)` but expressed differently
- Tests the candidate's understanding of ALL with inequality operators
- ⚠️ Note: This only checks for non-cancelled status. To ensure truly "all on time," you'd also need to exclude 'Delayed' status
