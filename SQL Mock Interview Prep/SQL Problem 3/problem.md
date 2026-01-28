# SQL Problem 3: Delete Duplicate Data

**Difficulty:** Easy

## Context

You are working with a CARS table that contains duplicate records based on car details.

**Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%203/data.sql)

---

## Question

From the given CARS table, delete the records where car details are duplicated.

### Given Data: CARS Table

| model_id | model_name | color | brand |
|----------|------------|-------|--------|
| 1 | Leaf | Black | Nissan |
| 2 | Leaf | Black | Nissan |
| 3 | Model S | Black | Tesla |
| 4 | Model X | White | Tesla |
| 5 | Ioniq 5 | Black | Hyundai |
| 6 | Ioniq 5 | Black | Hyundai |
| 7 | Ioniq 6 | White | Hyundai |

**Schema:**
- `model_id` - [PK] integer
- `model_name` - character varying (100)
- `color` - character varying (100)
- `brand` - character varying (100)

---

## Expected Output

| model_id | model_name | color | brand |
|----------|------------|-------|--------|
| 1 | Leaf | Black | Nissan |
| 3 | Model S | Black | Tesla |
| 4 | Model X | White | Tesla |
| 5 | Ioniq 5 | Black | Hyundai |
| 7 | Ioniq 6 | White | Hyundai |

---

## Solution

[View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_3.md)
