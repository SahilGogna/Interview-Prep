# Solution: SQL Problem 6 - Input to Output (Remove Reverse Duplicates)

## SQL Query

```sql
WITH cte AS (
    SELECT *,
        ROW_NUMBER() OVER() AS rn
    FROM src_dest_distance
)
SELECT t1.source, t1.destination, t1.distance
FROM cte t1
JOIN cte t2
    ON t1.rn < t2.rn
    AND t1.source = t2.destination
    AND t1.destination = t2.source;
```

---

## Explanation

1. **CTE with ROW_NUMBER()**: Assigns a unique row number to each record

2. **Self-Join**: Joins the table with itself to find matching reverse pairs

3. **Join Conditions**:
   - `t1.rn < t2.rn` - Ensures we only get one of the two pairs (the one that appears first)
   - `t1.source = t2.destination` - Source of first row matches destination of second
   - `t1.destination = t2.source` - Destination of first row matches source of second

### How It Works

| t1.source | t1.dest | t1.rn | t2.source | t2.dest | t2.rn | Match? |
|-----------|---------|-------|-----------|---------|-------|--------|
| Bangalore | Hyderbad | 1 | Hyderbad | Bangalore | 2 | ✓ (1<2) |
| Hyderbad | Bangalore | 2 | Bangalore | Hyderbad | 1 | ✗ (2>1) |

### Alternative Solution (Using LEAST/GREATEST)

```sql
SELECT DISTINCT
    LEAST(source, destination) AS source,
    GREATEST(source, destination) AS destination,
    distance
FROM src_dest_distance;
```

This approach normalizes the pairs alphabetically, making duplicates identical and removable with DISTINCT.
