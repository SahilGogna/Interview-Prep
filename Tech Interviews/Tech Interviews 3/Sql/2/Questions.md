# SQL Practice Questions - Intermediate & Complex Level

---

## Query 1: Input to Output (INTERMEDIATE)

### Problem Statement
Write a SQL query to convert the given input into the expected output as shown below.

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

### Expected Output

| source | destination | distance |
|----------|-------------|----------|
| Bangalore | Hyderbad | 400 |
| Chennai | Pune | 400 |
| Mumbai | Delhi | 400 |

**Note:** The output should contain only unique pairs of routes (eliminating reverse duplicates).

---

## Query 2: Ungroup the Given Input Data (COMPLEX)

### Problem Statement
Ungroup the given input data. Display the result as per expected output.

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

### Expected Output

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

## Query 3: Derive IPL Matches (INTERMEDIATE)

### Problem Statement
There are 10 IPL teams.
1. Write an SQL query such that each team plays with every other team just once.
2. Write an SQL query such that each team plays with every other team twice.

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

### Expected Output - Part 1 (Each team plays once with every other team)

| team | opponent |
|----------------------|------------------------|
| Chennai Super Kings | Delhi Capitals |
| Chennai Super Kings | Gujarat Titans |
| Chennai Super Kings | Kolkata Knight Riders |
| Chennai Super Kings | Lucknow Super Giants |
| Chennai Super Kings | Mumbai Indians |
| Chennai Super Kings | Punjab Kings |
| Chennai Super Kings | Rajasthan Royals |
| Chennai Super Kings | Royal Challengers Bangalore |
| Chennai Super Kings | Sunrisers Hyderbad |
| Delhi Capitals | Gujarat Titans |
| Delhi Capitals | Kolkata Knight Riders |
| Delhi Capitals | Lucknow Super Giants |
| Delhi Capitals | Mumbai Indians |
| Delhi Capitals | Punjab Kings |
| Delhi Capitals | Rajasthan Royals |
| Delhi Capitals | Royal Challengers Bangalore |
| Delhi Capitals | Sunrisers Hyderbad |
| Gujarat Titans | Kolkata Knight Riders |
| Gujarat Titans | Lucknow Super Giants |
| Gujarat Titans | Mumbai Indians |
| Gujarat Titans | Punjab Kings |
| Gujarat Titans | Rajasthan Royals |
| Gujarat Titans | Royal Challengers Bangalore |
| Gujarat Titans | Sunrisers Hyderbad |
| Kolkata Knight Riders | Lucknow Super Giants |
| ... | ... |

***** Not all rows are shown. There are totally 45 rows. *****

**Schema:**
- `team` - character varying (40)
- `opponent` - character varying (40)

### Expected Output - Part 2 (Each team plays twice with every other team)

| team | opponent |
|----------------------|------------------------|
| Chennai Super Kings | Delhi Capitals |
| Chennai Super Kings | Gujarat Titans |
| Chennai Super Kings | Kolkata Knight Riders |
| Chennai Super Kings | Lucknow Super Giants |
| Chennai Super Kings | Mumbai Indians |
| Chennai Super Kings | Punjab Kings |
| Chennai Super Kings | Rajasthan Royals |
| Chennai Super Kings | Royal Challengers Bangalore |
| Chennai Super Kings | Sunrisers Hyderbad |
| Delhi Capitals | Chennai Super Kings |
| Delhi Capitals | Gujarat Titans |
| Delhi Capitals | Kolkata Knight Riders |
| Delhi Capitals | Lucknow Super Giants |
| Delhi Capitals | Mumbai Indians |
| Delhi Capitals | Punjab Kings |
| Delhi Capitals | Rajasthan Royals |
| Delhi Capitals | Royal Challengers Bangalore |
| Delhi Capitals | Sunrisers Hyderbad |
| Gujarat Titans | Chennai Super Kings |
| Gujarat Titans | Delhi Capitals |
| Gujarat Titans | Kolkata Knight Riders |
| Gujarat Titans | Lucknow Super Giants |
| Gujarat Titans | Mumbai Indians |
| Gujarat Titans | Punjab Kings |
| Gujarat Titans | Rajasthan Royals |
| Gujarat Titans | Royal Challengers Bangalore |
| Gujarat Titans | Sunrisers Hyderbad |
| ... | ... |

***** Not all rows are shown. There are totally 90 rows. *****

**Schema:**
- `team` - character varying (40)
- `opponent` - character varying (40)

---

## Notes
- Query 4 and Query 6 are at **INTERMEDIATE** difficulty level
- Query 5 is at **COMPLEX** difficulty level
- Focus on understanding:
  - Self-joins and cross joins
  - Recursive CTEs or row generation techniques
  - String manipulation and filtering
  - Combinatorial logic in SQL
- Test your solutions with the provided sample data before submitting