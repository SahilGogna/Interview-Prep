# SQL Problem 27: Delayed More Than Airline Average

**Difficulty:** Hard

## Context

You are analyzing flight operations at Toronto Pearson International Airport. The data includes arrival and departure records with status tracking.

**Dataset**: [data.sql](https://github.com/SahilGogna/SQL-ORU/blob/main/4.%20sub_queries/2.%20Airport%20Dataset/toronto_pearson_airport_data.sql)

**Schema:**
- `flight_details` (`flight_number`, `airline`, `direction`, `scheduled_time`, `actual_time`, `terminal`, `gate`, `status`, `destination_or_origin`)

---

## Question

Find all **delayed flights** where the delay (in minutes) is **greater than the average delay for that airline**.

---

