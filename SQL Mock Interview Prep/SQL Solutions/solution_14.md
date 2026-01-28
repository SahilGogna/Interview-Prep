# Solution: SQL Problem 14 - Agent Performance Evaluation (Insurance)

## SQL Query

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

---

## Explanation

1. **LEFT JOINs**: Starting from agents ensures all agents are included
   - `agents → policies` - Get policies written by each agent
   - `policies → claims` - Get claims on those policies

2. **COUNT(c.claim_id)** - Total claims per agent
   - Using `COUNT(c.claim_id)` instead of `COUNT(*)` handles NULL correctly

3. **Conditional SUM for approved_or_paid_claims**:
   - `CASE WHEN c.status IN ('approved','paid') THEN 1 ELSE 0 END`
   - Counts only claims with successful outcomes

4. **ORDER BY** - Ranks agents by success metrics

### Key Concept: Multi-Table Aggregation

This query demonstrates:
- Chaining multiple JOINs
- Aggregating across related tables
- Combining COUNT and conditional SUM
- Using LEFT JOIN to include entities with no related records
