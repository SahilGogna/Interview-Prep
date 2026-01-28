# Solution: SQL Problem 3 - Delete Duplicate Data

## SQL Query

There are multiple approaches to solve this problem:

### Solution 1: Using MIN with GROUP BY
```sql
DELETE FROM cars
WHERE model_id NOT IN (
    SELECT MIN(model_id)
    FROM cars
    GROUP BY model_name, brand
);
```

### Solution 2: Using CTID (PostgreSQL specific)
```sql
DELETE FROM cars
WHERE ctid IN (
    SELECT MAX(ctid)
    FROM cars
    GROUP BY model_name, brand
    HAVING COUNT(1) > 1
);
```

### Solution 3: Using ROW_NUMBER()
```sql
DELETE FROM cars
WHERE model_id IN (
    SELECT model_id
    FROM (
        SELECT *,
            ROW_NUMBER() OVER(PARTITION BY model_name, brand ORDER BY model_id) AS rn
        FROM cars
    ) x
    WHERE x.rn > 1
);
```

---

## Explanation

### Solution 1 (Recommended)
1. **GROUP BY model_name, brand** - Groups duplicates together
2. **MIN(model_id)** - Keeps the first occurrence (lowest ID)
3. **NOT IN** - Deletes all rows that are NOT the first occurrence

### Solution 2 (PostgreSQL)
- Uses `ctid` (physical row identifier in PostgreSQL)
- `HAVING COUNT(1) > 1` finds groups with duplicates
- Deletes the last occurrence of duplicates

### Solution 3 (Most Flexible)
- Uses window function `ROW_NUMBER()` to number duplicates
- Partitions by the columns that define duplicates
- Deletes all rows where `rn > 1` (keeping only first)

### Key Concept: Identifying Duplicates
- Duplicates are defined by matching `model_name` AND `brand`
- `model_id` is unique, so we use it to identify which duplicate to keep
