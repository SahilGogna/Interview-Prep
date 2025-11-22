# SQL Practice Questions - Basic Level

---

## Query 1: Delete Duplicate Data

### Problem Statement
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

### Expected Output

| model_id | model_name | color | brand |
|----------|------------|-------|--------|
| 1 | Leaf | Black | Nissan |
| 3 | Model S | Black | Tesla |
| 4 | Model X | White | Tesla |
| 5 | Ioniq 5 | Black | Hyundai |
| 7 | Ioniq 6 | White | Hyundai |

---

## Query 2: Display Highest and Lowest Salary

### Problem Statement
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

### Expected Output

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

## Query 3: Find Actual Distance

### Problem Statement
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

### Expected Output

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

## Notes
- All queries are at **BASIC** difficulty level