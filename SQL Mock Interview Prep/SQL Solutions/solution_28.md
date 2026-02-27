# Solution: SQL Problem 28 - Most Frequently Used Gate per Terminal

## SQL Query

```sql
SELECT terminal, gate, COUNT(*) AS flight_count
FROM flight_details
GROUP BY terminal, gate
HAVING COUNT(*) = (
    SELECT MAX(gate_count)
    FROM (
        SELECT COUNT(*) AS gate_count
        FROM flight_details
        WHERE terminal = flight_details.terminal
        GROUP BY gate
    ) AS gate_stats
);
```

---

## Explanation

1. **Outer query** groups flights by `terminal` and `gate`, counting flights per gate
2. **HAVING clause** filters to only keep the gate with the highest count per terminal
3. **Nested subquery** (two levels deep):
   - Inner: counts flights per gate within the same terminal
   - Outer: takes the MAX of those counts

### Key Concept: Nested Subqueries with Grouped Max

- This is a **Google-style** grouped max pattern
- Requires two levels of nesting to find the max within each group
- Alternative approaches:
  - Window function: `RANK() OVER(PARTITION BY terminal ORDER BY COUNT(*) DESC)`
  - CTE with filtering
- Handles ties: if two gates have the same count, both are returned
