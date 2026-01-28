# Solution: SQL Problem 8 - Derive IPL Matches

## Part 1: Each Team Plays Once (45 matches)

```sql
WITH matches AS (
    SELECT 
        ROW_NUMBER() OVER(ORDER BY team_name) AS id, 
        t.*
    FROM teams t
)
SELECT 
    team.team_name AS team, 
    opponent.team_name AS opponent
FROM matches team
JOIN matches opponent 
    ON team.id < opponent.id
ORDER BY team;
```

---

## Part 2: Each Team Plays Twice (90 matches)

```sql
WITH matches AS (
    SELECT 
        ROW_NUMBER() OVER(ORDER BY team_name) AS id, 
        t.*
    FROM teams t
)
SELECT 
    team.team_name AS team, 
    opponent.team_name AS opponent
FROM matches team
JOIN matches opponent 
    ON team.id <> opponent.id
ORDER BY team;
```

---

## Explanation

### Part 1 (Once - 45 matches)

1. **CTE with ROW_NUMBER()**: Assigns a unique ID to each team

2. **Self-Join with `team.id < opponent.id`**:
   - Creates pairs where first team's ID is less than second team's
   - This ensures each pair appears only once: (A vs B) but not (B vs A)
   - Avoids self-matches (A vs A)

3. **Math**: 10 teams = C(10,2) = 10×9÷2 = **45 unique pairs**

### Part 2 (Twice - 90 matches)

1. **Same CTE setup**

2. **Self-Join with `team.id <> opponent.id`**:
   - Creates all combinations where teams are different
   - Includes both (A vs B) AND (B vs A)
   - Still avoids self-matches

3. **Math**: 10 teams × 9 opponents = **90 matches**

### Key Concept: Self-Join Operators

| Operator | Effect | Use Case |
|----------|--------|----------|
| `<` | One-way pairs | Round-robin (play once) |
| `<>` | All pairs | Home & away (play twice) |
| `=` | Same row | Self-reference |

### Alternative: CROSS JOIN

```sql
-- For Part 2 (play twice)
SELECT a.team_name AS team, b.team_name AS opponent
FROM teams a
CROSS JOIN teams b
WHERE a.team_name <> b.team_name
ORDER BY team;
```
