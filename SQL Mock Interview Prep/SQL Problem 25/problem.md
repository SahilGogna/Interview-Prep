# SQL Problem 25: Flights Scheduled After All Cancelled Flights

**Difficulty:** Hard

## Context

You are analyzing flight operations at Toronto Pearson International Airport. The data includes arrival and departure records with status tracking.

**Dataset**: [data.sql](https://github.com/SahilGogna/SQL-ORU/blob/main/4.%20sub_queries/2.%20Airport%20Dataset/toronto_pearson_airport_data.sql)

**Schema:**
- `flight_details` (`flight_number`, `airline`, `direction`, `scheduled_time`, `actual_time`, `terminal`, `gate`, `status`, `destination_or_origin`)

---

## Question

Show flights that were **scheduled after ALL cancelled flights** (i.e., later than every single cancelled flight).

---

