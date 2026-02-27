# Solution: SQL Problem 17 - Flight Count with Cancellations

## SQL Query

```sql
SELECT 
    airline,
    COUNT(*) AS total_flights,
    (SELECT COUNT(*) 
     FROM flight_details f2 
     WHERE f2.airline = f1.airline AND status = 'Cancelled') AS cancelled_flights
FROM flight_details f1
GROUP BY airline;
```

---

## Explanation

1. **Outer query** groups flights by airline and counts total flights
2. **Correlated subquery in SELECT** counts cancelled flights for each airline
   - References `f1.airline` from the outer query — this makes it *correlated*
   - Executes once per group in the outer query

3. The subquery runs for **each airline** returned by the GROUP BY

### Key Concept: Correlated Subquery in SELECT

- A correlated subquery references columns from the outer query
- It re-executes for each row (or group) of the outer query
- Useful for computing per-group metrics alongside other aggregations
- Can be less performant than JOINs for large datasets, but is very readable
