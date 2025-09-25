# Insurance SQL — Solutions (Round 1)

## 1
```sql
SELECT
  full_name,
  email
FROM insurance.customers
WHERE city = 'Toronto';
```

---

## 2
```sql
SELECT
  policy_type,
  SUM(premium_amount) AS total_premium
FROM insurance.policies
GROUP BY policy_type
ORDER BY total_premium DESC;
```

---

## 3
```sql
SELECT
  a.full_name AS agent_name,
  COUNT(c.claim_id) AS total_claims,
  SUM(CASE WHEN c.status IN ('approved','paid') THEN 1 ELSE 0 END) AS approved_or_paid_claims
FROM insurance.agents a
LEFT JOIN insurance.policies p
  ON p.agent_id = a.agent_id
LEFT JOIN insurance.claims c
  ON c.policy_id = p.policy_id
GROUP BY a.full_name
ORDER BY approved_or_paid_claims DESC, total_claims DESC;
```
