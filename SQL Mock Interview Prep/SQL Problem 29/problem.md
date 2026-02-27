# SQL Problem 29: Flights That Were Always On Time

**Difficulty:** Medium

## Context

You are analyzing flight operations at Toronto Pearson International Airport. The data includes arrival and departure records with status tracking.

**Dataset**: [data.sql](https://github.com/SahilGogna/SQL-ORU/blob/main/4.%20sub_queries/2.%20Airport%20Dataset/toronto_pearson_airport_data.sql)

**Schema:**
- `flight_details` (`flight_number`, `airline`, `direction`, `scheduled_time`, `actual_time`, `terminal`, `gate`, `status`, `destination_or_origin`)

---

## Question

List all flight numbers that were **always on time** (never delayed or cancelled).

---

