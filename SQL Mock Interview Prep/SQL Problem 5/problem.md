# SQL Problem 5: Find Actual Distance

**Difficulty:** 🟢 Easy

## Context

You are working with a car travel tracking system that stores cumulative distances.

📁 **Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%205/data.sql)

---

## Question

From the given cars_travel table, find the actual distance travelled by each car corresponding to each day.

### Given Data: cars_travel Table

| cars | days | cumulative_distance |
|------|------|---------------------|
| Car1 | Day1 | 50 |
| Car1 | Day2 | 100 |
| Car1 | Day3 | 200 |
| Car2 | Day1 | 0 |
| Car3 | Day1 | 0 |
| Car3 | Day2 | 50 |
| Car3 | Day3 | 50 |
| Car3 | Day4 | 100 |

**Schema:**
- `cars` - character varying (40)
- `days` - character varying (10)
- `cumulative_distance` - integer

---

## Expected Output

| cars | days | cumulative_distance | distance_travelled |
|------|------|---------------------|-------------------|
| Car1 | Day1 | 50 | 50 |
| Car1 | Day2 | 100 | 50 |
| Car1 | Day3 | 200 | 100 |
| Car2 | Day1 | 0 | 0 |
| Car3 | Day1 | 0 | 0 |
| Car3 | Day2 | 50 | 50 |
| Car3 | Day3 | 50 | 0 |
| Car3 | Day4 | 100 | 50 |

---

## Solution

👉 [View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_5.md)
