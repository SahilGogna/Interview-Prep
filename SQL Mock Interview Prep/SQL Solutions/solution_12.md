# Solution: SQL Problem 12 - Customer Lookup by City (Insurance)

## SQL Query

```sql
SELECT
  full_name,
  email
FROM insurance.customers
WHERE city = 'Toronto';
```

---

## Explanation

1. **SELECT** the required columns: `full_name` and `email`

2. **WHERE city = 'Toronto'** - Simple equality filter on the city column

### Key Concept: String Matching

- String comparisons are case-sensitive in most databases
- If case-insensitivity is needed, use:
  - `WHERE LOWER(city) = 'toronto'`
  - `WHERE city ILIKE 'Toronto'` (PostgreSQL)
  - `WHERE city = 'Toronto' COLLATE NOCASE` (SQLite)
