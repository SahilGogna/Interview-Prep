-- Ensure schema exists and use it
CREATE SCHEMA IF NOT EXISTS insurance;
SET search_path TO insurance;

-- Insurance Dataset (PostgreSQL-compatible)
-- Tables: agents, customers, policies, claims
-- Purpose: Practice joins, time intervals (active policies), ratios (claims vs premium), agent performance, window functions.

DROP TABLE IF EXISTS claims;
DROP TABLE IF EXISTS policies;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS agents;

CREATE TABLE agents (
  agent_id SERIAL PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  region VARCHAR(60) NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  city VARCHAR(80) NOT NULL,
  dob DATE NOT NULL,
  join_date DATE NOT NULL
);

CREATE TABLE policies (
  policy_id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  agent_id INT REFERENCES agents(agent_id),
  policy_type VARCHAR(30) NOT NULL CHECK (policy_type IN ('auto','home','life','health','travel')),
  premium_amount NUMERIC(12,2) NOT NULL CHECK (premium_amount > 0),
  start_date DATE NOT NULL,
  end_date DATE,
  status VARCHAR(20) NOT NULL CHECK (status IN ('active','expired','cancelled'))
);

CREATE TABLE claims (
  claim_id SERIAL PRIMARY KEY,
  policy_id INT NOT NULL REFERENCES policies(policy_id),
  claim_date DATE NOT NULL,
  claim_amount NUMERIC(12,2) NOT NULL CHECK (claim_amount > 0),
  status VARCHAR(20) NOT NULL CHECK (status IN ('submitted','approved','rejected','paid')),
  description VARCHAR(200)
);

-- Useful indexes
CREATE INDEX idx_policies_customer ON policies(customer_id);
CREATE INDEX idx_claims_policy_date ON claims(policy_id, claim_date);

INSERT INTO agents (full_name, region, hire_date) VALUES
  ('Ethan Brown','Atlantic','2021-12-08'),
  ('Alexander Gonzalez','BC Lower Mainland','2021-05-08'),
  ('David Anderson','Atlantic','2021-02-12'),
  ('Olivia Anderson','Atlantic','2023-07-13'),
  ('Sophia Wilson','Ontario West','2021-11-21'),
  ('Ethan Hernandez','Prairies','2023-11-21'),
  ('Charlotte Jones','Quebec','2023-10-22'),
  ('Emily Moore','Atlantic','2023-01-26');


INSERT INTO customers (full_name, email, city, dob, join_date) VALUES
  ('Anna Jackson','anna.jackson0@test.org','Mississauga','1986-09-08','2022-07-28'),
  ('Daniel Rodriguez','daniel.rodriguez1@sample.net','Toronto','2001-02-07','2023-06-02'),
  ('Chris Smith','chris.smith2@mail.com','Ottawa','1983-02-20','2022-11-21'),
  ('Michael Hernandez','michael.hernandez3@mail.com','Waterloo','1999-08-24','2023-02-12'),
  ('John Rodriguez','john.rodriguez4@sample.net','Montreal','1994-04-27','2023-05-29'),
  ('David Martin','david.martin5@example.com','Calgary','1990-12-19','2022-05-06'),
  ('Jane Lopez','jane.lopez6@sample.net','Montreal','1995-06-12','2022-08-10'),
  ('William Hernandez','william.hernandez7@mail.com','Waterloo','1993-01-27','2023-03-01'),
  ('James Taylor','james.taylor8@test.org','Waterloo','2004-07-12','2022-03-12'),
  ('Sophia Brown','sophia.brown9@test.org','Montreal','1972-07-02','2023-08-24'),
  ('James Martinez','james.martinez10@example.com','Calgary','1989-04-21','2023-04-02'),
  ('Robert Anderson','robert.anderson11@test.org','Brampton','1998-09-19','2022-10-09'),
  ('Daniel Johnson','daniel.johnson12@mail.com','Mississauga','1970-07-22','2023-05-24'),
  ('David Thomas','david.thomas13@example.com','Calgary','2003-03-11','2024-06-10'),
  ('Olivia Davis','olivia.davis14@example.com','Calgary','2001-10-25','2022-10-23'),
  ('Alexander Smith','alexander.smith15@test.org','Vancouver','1983-12-03','2024-06-11'),
  ('Robert Martinez','robert.martinez16@mail.com','Vancouver','1991-07-02','2023-09-14'),
  ('John Thomas','john.thomas17@mail.com','Brampton','1971-05-17','2022-06-19'),
  ('Ethan Miller','ethan.miller18@test.org','Calgary','1998-04-10','2023-06-25'),
  ('Michael Brown','michael.brown19@sample.net','Ottawa','1981-09-03','2023-10-13'),
  ('James Wilson','james.wilson20@sample.net','Mississauga','1972-10-14','2024-02-19'),
  ('Mia Taylor','mia.taylor21@test.org','Waterloo','2000-03-07','2022-08-05');


INSERT INTO policies (customer_id, agent_id, policy_type, premium_amount, start_date, end_date, status) VALUES
  (18,4,'health',1685.58,'2023-05-18',NULL,'active'),
  (10,4,'health',1791.11,'2022-11-10','2024-05-20','cancelled'),
  (18,6,'health',2492.25,'2023-07-18','2024-11-06','cancelled'),
  (9,4,'auto',1858.95,'2022-11-20',NULL,'active'),
  (6,4,'home',1898.79,'2022-10-11','2024-01-23','expired'),
  (7,5,'home',1030.03,'2022-11-06',NULL,'active'),
  (9,1,'auto',1472.73,'2023-12-16','2025-10-28','expired'),
  (1,5,'health',1301.04,'2022-12-15',NULL,'active'),
  (16,2,'auto',1121.63,'2022-03-17','2023-03-07','expired'),
  (19,5,'auto',2486.01,'2022-05-02',NULL,'active'),
  (20,4,'travel',1074.87,'2023-03-30',NULL,'active'),
  (14,5,'travel',1628.36,'2023-09-17','2024-06-24','expired'),
  (21,4,'life',1718.98,'2022-06-10',NULL,'active'),
  (6,1,'health',1236.16,'2023-09-01',NULL,'active'),
  (10,5,'health',363.71,'2022-08-28','2023-09-14','cancelled'),
  (4,4,'home',2289.35,'2024-04-26',NULL,'active'),
  (10,5,'health',486.01,'2023-12-07',NULL,'active'),
  (9,8,'health',385.02,'2022-02-10',NULL,'active'),
  (9,1,'auto',726.53,'2023-11-22',NULL,'active'),
  (9,1,'home',1282.15,'2023-10-30',NULL,'active'),
  (19,7,'health',2428.83,'2023-04-27',NULL,'active'),
  (22,2,'home',958.55,'2023-12-12','2025-08-13','expired'),
  (15,2,'life',780.52,'2022-04-29',NULL,'active'),
  (1,8,'health',324.67,'2023-06-15','2025-03-28','expired'),
  (7,5,'travel',501.33,'2022-10-22','2023-09-11','expired'),
  (21,4,'home',914.73,'2022-01-15',NULL,'active'),
  (4,8,'auto',1689.73,'2022-06-07','2024-05-28','cancelled'),
  (14,8,'health',760.58,'2023-07-19',NULL,'active'),
  (20,3,'auto',835.37,'2024-03-19',NULL,'active'),
  (9,1,'life',1869.92,'2024-05-07','2026-04-08','expired'),
  (15,8,'life',964.61,'2024-02-21',NULL,'active'),
  (11,4,'home',1515.13,'2022-08-28','2024-04-19','expired');

INSERT INTO claims (policy_id, claim_date, claim_amount, status, description) VALUES
  (21,'2025-02-01',7173.7,'paid','Trip cancellation'),
  (25,'2024-11-10',11917.05,'rejected','Water leakage'),
  (32,'2023-02-07',2024.76,'paid','Medical expense'),
  (7,'2025-06-14',12698.84,'submitted','Trip cancellation'),
  (1,'2025-01-09',2290.71,'paid','Water leakage'),
  (5,'2024-04-25',11755.65,'approved','Windshield replacement'),
  (26,'2024-10-27',1342.68,'approved','Theft claim'),
  (25,'2023-11-21',9457.97,'paid','Trip cancellation'),
  (3,'2024-09-24',1166.05,'rejected','Medical expense'),
  (15,'2025-02-03',1492.13,'paid','Fire damage'),
  (7,'2024-03-30',2620.52,'approved','Collision damage'),
  (3,'2023-11-29',11972.73,'approved','Medical expense'),
  (28,'2023-05-30',3776.33,'approved','Theft claim'),
  (12,'2023-06-24',2749.78,'rejected','Trip cancellation'),
  (16,'2024-05-24',13705.51,'submitted','Trip cancellation'),
  (17,'2024-04-15',3941.6,'submitted','Fire damage'),
  (30,'2023-10-22',10212.52,'submitted','Trip cancellation'),
  (23,'2024-08-24',4592.44,'paid','Theft claim'),
  (17,'2024-04-12',12702.76,'submitted','Trip cancellation'),
  (31,'2023-04-20',3672.5,'rejected','Windshield replacement'),
  (19,'2024-12-17',4534.18,'paid','Theft claim'),
  (26,'2023-10-09',270.25,'paid','Fire damage'),
  (4,'2024-09-12',11215.81,'paid','Medical expense'),
  (15,'2024-09-13',12058.69,'submitted','Water leakage'),
  (17,'2024-11-25',11370.32,'paid','Theft claim');
