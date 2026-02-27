# Solution: SQL Problem 16 - Average Delay per Airline

## SQL Query

```sql
SELECT airline, AVG(delay_minutes) AS avg_delay
FROM (
    SELECT airline, 
           EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60 AS delay_minutes
    FROM flight_details
    WHERE status = 'Delayed'
) AS delays
GROUP BY airline;
```

---

## Explanation

1. **Inner subquery (FROM clause)** calculates delay in minutes for each delayed flight
   - `EXTRACT(EPOCH FROM ...)` converts the interval to total seconds
   - Dividing by 60 converts seconds to minutes

2. **Outer query** aggregates the delay minutes per airline using `AVG`

3. **Alias `delays`** is required — PostgreSQL requires derived tables to have an alias

### Key Concept: Subquery in FROM (Derived Table)

- The subquery acts as a virtual table that the outer query can reference
- Useful when you need to perform a calculation first, then aggregate the results
- Also known as an **inline view** or **derived table**
