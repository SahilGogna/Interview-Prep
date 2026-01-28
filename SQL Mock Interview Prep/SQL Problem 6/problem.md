# SQL Problem 6: Input to Output (Remove Reverse Duplicates)

**Difficulty:** 🟡 Medium

## Context

You are working with a travel routes table that contains bidirectional route data.

📁 **Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%206/data.sql)

---

## Question

Write a SQL query to convert the given input into the expected output - eliminating reverse duplicate routes.

### Given Data: Travel Routes Table

| source | destination | distance |
|----------|-------------|----------|
| Bangalore | Hyderbad | 400 |
| Hyderbad | Bangalore | 400 |
| Mumbai | Delhi | 400 |
| Delhi | Mumbai | 400 |
| Chennai | Pune | 400 |
| Pune | Chennai | 400 |

**Schema:**
- `source` - character varying (20)
- `destination` - character varying (20)
- `distance` - integer

---

## Expected Output

| source | destination | distance |
|----------|-------------|----------|
| Bangalore | Hyderbad | 400 |
| Chennai | Pune | 400 |
| Mumbai | Delhi | 400 |

**Note:** The output should contain only unique pairs of routes (eliminating reverse duplicates).

---

## Solution

👉 [View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_6.md)
