# Solution: SQL Problem 5 - Find Actual Distance

## SQL Query

```sql
SELECT *,
    cumulative_distance - LAG(cumulative_distance, 1, 0) OVER(
        PARTITION BY cars 
        ORDER BY days
    ) AS distance_travelled
FROM car_travels;
```

---

## Explanation

1. **LAG() Function**: A window function that accesses data from a previous row
   - `LAG(column, offset, default)` - gets value from `offset` rows before
   - `offset = 1` means previous row
   - `default = 0` handles the first row (no previous value)

2. **PARTITION BY cars**: Resets the LAG for each car (Car1, Car2, Car3 are separate groups)

3. **ORDER BY days**: Ensures rows are ordered chronologically within each car

4. **Calculation**: `current_cumulative - previous_cumulative = distance for this day`

### How It Works

| cars | days | cumulative | LAG value | Result |
|------|------|------------|-----------|--------|
| Car1 | Day1 | 50 | 0 (default) | 50 - 0 = **50** |
| Car1 | Day2 | 100 | 50 | 100 - 50 = **50** |
| Car1 | Day3 | 200 | 100 | 200 - 100 = **100** |
| Car3 | Day3 | 50 | 50 | 50 - 50 = **0** |

### Key Concept: LAG vs LEAD

- **LAG** - looks at previous rows (going backward)
- **LEAD** - looks at following rows (going forward)
- Both are essential for calculating differences between consecutive rows
