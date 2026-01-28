# SQL Problem 4: Display Highest and Lowest Salary

**Difficulty:** Easy

## Context

You are working with an employee table and need to analyze salary data by department.

**Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%204/data.sql)

---

## Question

From the given employee table, display the highest and lowest salary corresponding to each department. Return the result corresponding to each employee.

### Given Data: Employee Table

| id | name | dept | salary |
|----|----------|---------|--------|
| 1 | Alexander | Admin | 6500 |
| 2 | Leo | Finance | 7000 |
| 3 | Robin | IT | 2000 |
| 4 | Ali | IT | 4000 |
| 5 | Maria | IT | 6000 |
| 6 | Alice | Admin | 5000 |
| 7 | Sebastian | HR | 3000 |
| 8 | Emma | Finance | 4000 |
| 9 | John | HR | 4500 |
| 10 | Kabir | IT | 8000 |

**Schema:**
- `id` - [PK] integer
- `name` - character varying (100)
- `dept` - character varying (100)
- `salary` - integer

---

## Expected Output

| id | name | dept | salary | highest_sal | lowest_sal |
|----|----------|---------|--------|-------------|------------|
| 1 | Alexander | Admin | 6500 | 6500 | 5000 |
| 6 | Alice | Admin | 5000 | 6500 | 5000 |
| 2 | Leo | Finance | 7000 | 7000 | 4000 |
| 8 | Emma | Finance | 4000 | 7000 | 4000 |
| 9 | John | HR | 4500 | 4500 | 3000 |
| 7 | Sebastian | HR | 3000 | 4500 | 3000 |
| 10 | Kabir | IT | 8000 | 8000 | 2000 |
| 5 | Maria | IT | 6000 | 8000 | 2000 |
| 4 | Ali | IT | 4000 | 8000 | 2000 |
| 3 | Robin | IT | 2000 | 8000 | 2000 |

---

## Solution

[View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_4.md)
