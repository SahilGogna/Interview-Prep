# Solution: SQL Problem 31 - Busiest Airline by Number of Flights

## SQL Query

```sql
SELECT airline, COUNT(*) AS total_flights
FROM flight_details
GROUP BY airline
HAVING COUNT(*) = (
    SELECT MAX(flight_count)
    FROM (
        SELECT COUNT(*) AS flight_count
        FROM flight_details
        GROUP BY airline
    ) AS airline_counts
);
```

---

## Explanation

1. **Outer query** counts total flights per airline
2. **Nested subquery** (two levels):
   - Inner: counts flights per airline
   - Outer: finds the MAX count
3. **HAVING** filters to only the airline(s) matching that max count

### Key Concept: Top-K with Nested Subqueries

- This is an **Amazon-style top-k filter** pattern
- Handles ties: if multiple airlines share the highest count, all are returned
- Alternative approaches:
  - `ORDER BY COUNT(*) DESC LIMIT 1` — simpler but doesn't handle ties
  - Window function: `RANK() OVER(ORDER BY COUNT(*) DESC) = 1`
- The nested subquery pattern is a classic interview technique
