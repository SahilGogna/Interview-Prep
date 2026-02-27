# SQL Mock Interview Prep — Instructions

## Overview

This folder contains **31 SQL practice problems** organized by difficulty level, perfect for peer interview practice or solo study.

| Difficulty | Count | Problems |
|------------|-------|----------|
| Easy | 13 | 1, 3, 4, 5, 9, 10, 12, 13, 15, 18, 19, 21 |
| Medium | 12 | 2, 6, 7, 8, 11, 14, 16, 17, 20, 22, 23, 24, 29, 30, 31 |
| Hard | 6 | 25, 26, 27, 28 |

---

## Folder Structure

```
SQL Mock Interview Prep/
├── SQL Problem 1/          # Each problem folder contains:
│   ├── problem.md          # Question + context
│   └── data.sql            # Schema + sample data
├── SQL Problem 2/
│   └── ...
├── ...
└── SQL Solutions/          # All solutions in one place
    ├── solution_1.md
    ├── solution_2.md
    └── ...
```

---

## How to Practice Solo

1. Open a problem folder (e.g., `SQL Problem 3/`)
2. Read `problem.md` for the question and context
3. Use `data.sql` to set up your database
4. Write your solution in your preferred SQL editor
5. Check `SQL Solutions/solution_X.md` when done

---

## Peer Interview Format

### Setup (5 min)
- **Interviewer**: Pick 2-3 problems (mix of Easy & Medium)
- **Candidate**: Have SQL editor ready
- Share `data.sql` with candidate for schema setup

### Interview (30 min)
1. Ask questions one at a time
2. Encourage candidate to:
   - Explain their thinking step by step
   - Ask clarifying questions
   - Try even if unsure — it's practice!

### If Candidate Gets Stuck
Use this prompt with an AI assistant:

```
I am conducting a peer SQL interview.

Here is the question:
<PASTE QUESTION HERE>

The schema is in the attached data.sql file.

Please give me **hints only**, not the full solution:
- Break the problem into smaller steps
- Point to the right tables/columns
- Suggest SQL concepts (JOIN, GROUP BY, window functions)
- Give 3-4 hints that get progressively more detailed
```

Share these hints with the candidate before showing the full solution.

---

## Problem Index

### Easy 
| # | Title | Topic |
|---|-------|-------|
| 1 | City-Level Sales Summary | GROUP BY, JOIN |
| 3 | Delete Duplicate Data | DELETE, ROW_NUMBER |
| 4 | Display Highest/Lowest Salary | Window Functions |
| 5 | Find Actual Distance | LAG |
| 9 | New Customer Lookup | WHERE, Date Filtering |
| 10 | Transaction Volumes by Type | GROUP BY, SUM |
| 12 | Customer Lookup by City | WHERE |
| 13 | Premium Revenue by Policy Type | GROUP BY |
| 15 | Flights by Airlines with Cancellations | Subquery, IN |
| 18 | All Flights by Airlines with Cancellations | Subquery, IN |
| 19 | Flights to/from Cancelled Destinations | Subquery, IN |
| 21 | Airlines with Zero Cancellations | Subquery, NOT IN |

### Medium 
| # | Title | Topic |
|---|-------|-------|
| 2 | Customers Above Average Spend | Subquery, HAVING |
| 6 | Remove Reverse Duplicates | Self-Join, CTE |
| 7 | Ungroup Input Data | Recursive CTE |
| 8 | Derive IPL Matches | Self-Join, Combinatorics |
| 11 | Branch Performance Analysis | Multi-table JOIN, CASE |
| 14 | Agent Performance Evaluation | Multi-table JOIN, CASE |
| 16 | Average Delay per Airline | Subquery in FROM |
| 17 | Flight Count with Cancellations | Correlated Subquery, SELECT |
| 20 | Cancelled Flights at On-Time Gates | Subquery, IN + WHERE |
| 22 | Destinations with No On-Time Flights | Subquery, NOT IN |
| 23 | Flights Scheduled Before Any Delayed | ANY Operator |
| 24 | Flights Scheduled After Any Cancelled | ANY Operator |
| 29 | Flights That Were Always On Time | NOT EXISTS |
| 30 | Airlines with Above-Average Delays | Subquery, HAVING |
| 31 | Busiest Airline by Number of Flights | Nested Subquery, MAX |

### Hard
| # | Title | Topic |
|---|-------|-------|
| 25 | Flights Scheduled After ALL Cancelled | ALL Operator |
| 26 | Airlines Where Every Flight is On Time | ALL, Correlated Subquery |
| 27 | Delayed More Than Airline Average | Correlated Subquery |
| 28 | Most Frequently Used Gate per Terminal | Nested Subquery, Grouped Max |

---

## Tips for Success

- **Read carefully**: Understand what output is expected
- **Start simple**: Get basic query working, then refine
- **Talk through it**: Explain your approach out loud
- **Check edge cases**: NULLs, empty results, duplicates

---

**Good luck with your practice!**
