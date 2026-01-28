# Solution: SQL Problem 7 - Ungroup the Given Input Data

## SQL Query

```sql
WITH RECURSIVE cte AS (
    -- Base case: start with all items, level 1
    SELECT id, item_name, total_count, 1 AS level
    FROM travel_items
    
    UNION ALL
    
    -- Recursive case: repeat while count > 1
    SELECT cte.id, cte.item_name, cte.total_count - 1, level + 1 AS level
    FROM cte
    JOIN travel_items t 
        ON t.item_name = cte.item_name 
        AND t.id = cte.id
    WHERE cte.total_count > 1
)
SELECT id, item_name
FROM cte
ORDER BY id;
```

---

## Explanation

1. **Recursive CTE**: Used to generate multiple rows from a single row

2. **Base Case**: 
   - Selects all items with their `total_count`
   - `level = 1` tracks the first occurrence

3. **Recursive Case**:
   - Joins back to generate additional rows
   - Decrements `total_count` by 1 each iteration
   - Continues while `total_count > 1`

4. **Final SELECT**: Returns just `id` and `item_name` (the ungrouped result)

### How It Works (For "Apple" with total_count = 4)

| Iteration | id | item_name | total_count | level |
|-----------|-----|-----------|-------------|-------|
| Base | 3 | Apple | 4 | 1 |
| 1st | 3 | Apple | 3 | 2 |
| 2nd | 3 | Apple | 2 | 3 |
| 3rd | 3 | Apple | 1 | 4 |

Result: 4 rows of "Apple"

### Key Concept: Recursive CTEs

- **Base case**: Initial query (anchor member)
- **Recursive case**: References the CTE itself
- **Termination**: `WHERE` clause stops recursion when condition is false
- Essential for row generation, hierarchical data, and sequences
