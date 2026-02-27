# Solution: SQL Problem 27 - Delayed More Than Airline Average

## SQL Query

```sql
SELECT flight_number, airline,
       EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60 AS delay_minutes
FROM flight_details f1
WHERE status = 'Delayed'
  AND EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60 >
      (
          SELECT AVG(EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60)
          FROM flight_details
          WHERE airline = f1.airline AND status = 'Delayed'
      );
```

---

## Explanation

1. **Outer query** filters to delayed flights and calculates delay in minutes
2. **Correlated subquery** computes the average delay for the **same airline**
3. The `WHERE airline = f1.airline` makes it correlated — it recalculates for each airline
4. Only returns flights whose delay exceeds their airline's average

### Key Concept: Correlated Subquery for Per-Group Comparison

- This is an **Amazon-style analytics** pattern
- Compares individual rows against their group's aggregate
- The correlated subquery re-executes for each row in the outer query
- Alternative approach: use a CTE or window function (`AVG() OVER(PARTITION BY airline)`)
