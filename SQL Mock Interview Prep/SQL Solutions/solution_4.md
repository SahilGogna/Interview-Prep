# Solution: SQL Problem 4 - Display Highest and Lowest Salary

## SQL Query

```sql
SELECT *,
    MAX(salary) OVER(PARTITION BY dept ORDER BY salary DESC) AS highest_sal,
    MIN(salary) OVER(
        PARTITION BY dept 
        ORDER BY salary DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_sal
FROM employee;
```

---

## Explanation

1. **Window Functions**: This solution uses window functions to calculate aggregates per department while keeping individual rows

2. **MAX(salary) OVER(PARTITION BY dept)**: 
   - Calculates the maximum salary within each department
   - Returns this value for every employee in that department

3. **MIN(salary) WITH RANGE clause**:
   - The `RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` is crucial
   - It ensures we look at ALL rows in the partition, not just preceding rows
   - Without this, MIN would only consider rows up to the current row in the order

4. **PARTITION BY dept**: Creates separate windows for each department

### Key Concept: Window Frames

- Default frame with ORDER BY is `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`
- For MIN to see all values, we need `UNBOUNDED FOLLOWING`
- MAX works without it because we're ordering DESC (highest first)

### Alternative Solution

```sql
SELECT *,
    MAX(salary) OVER(PARTITION BY dept) AS highest_sal,
    MIN(salary) OVER(PARTITION BY dept) AS lowest_sal
FROM employee
ORDER BY dept, salary DESC;
```

This simpler version works if you don't need a specific ordering within the window.
