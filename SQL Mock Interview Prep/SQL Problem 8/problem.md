# SQL Problem 8: Derive IPL Matches

**Difficulty:** 🟡 Medium

## Context

You are working with an IPL teams table and need to generate match schedules.

📁 **Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%208/data.sql)

---

## Question

There are 10 IPL teams.

1. Write an SQL query such that each team plays with every other team **just once** (45 matches total).
2. Write an SQL query such that each team plays with every other team **twice** (90 matches total).

### Given Data: IPL Teams Table

| team_code | team_name |
|-----------|--------------------------|
| RCB | Royal Challengers Bangalore |
| MI | Mumbai Indians |
| CSK | Chennai Super Kings |
| DC | Delhi Capitals |
| RR | Rajasthan Royals |
| SRH | Sunrisers Hyderbad |
| PBKS | Punjab Kings |
| KKR | Kolkata Knight Riders |
| GT | Gujarat Titans |
| LSG | Lucknow Super Giants |

**Schema:**
- `team_code` - character varying (10)
- `team_name` - character varying (40)

---

## Expected Output - Part 1 (Each team plays once)

| team | opponent |
|----------------------|------------------------|
| Chennai Super Kings | Delhi Capitals |
| Chennai Super Kings | Gujarat Titans |
| Chennai Super Kings | Kolkata Knight Riders |
| ... | ... |

**Total: 45 rows** (each unique pair plays once)

---

## Expected Output - Part 2 (Each team plays twice)

| team | opponent |
|----------------------|------------------------|
| Chennai Super Kings | Delhi Capitals |
| Delhi Capitals | Chennai Super Kings |
| ... | ... |

**Total: 90 rows** (each pair plays home and away)

---

## Solution

👉 [View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_8.md)
