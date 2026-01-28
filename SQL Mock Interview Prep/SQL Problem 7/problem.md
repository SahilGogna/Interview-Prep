# SQL Problem 7: Ungroup the Given Input Data

**Difficulty:** Medium

## Context

You are working with an inventory table that has grouped item counts.

**Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%207/data.sql)

---

## Question

Ungroup the given input data. Display the result as per expected output - each item should be repeated according to its `total_count` value.

### Given Data: Items Table

| id | item_name | total_count |
|----|------------|-------------|
| 1 | Water Bottle | 2 |
| 2 | Tent | 1 |
| 3 | Apple | 4 |

**Schema:**
- `id` - integer
- `item_name` - character varying (50)
- `total_count` - integer

---

## Expected Output

| id | item_name |
|----|------------|
| 1 | Water Bottle |
| 1 | Water Bottle |
| 2 | Tent |
| 3 | Apple |
| 3 | Apple |
| 3 | Apple |
| 3 | Apple |

**Note:** Each item should be repeated according to its `total_count` value.

---

## Solution

[View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_7.md)
