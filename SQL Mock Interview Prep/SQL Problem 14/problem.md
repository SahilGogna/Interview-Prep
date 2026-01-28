# SQL Problem 14: Agent Performance Evaluation (Insurance)

**Difficulty:** Medium

## Context

You are working with an insurance database. Management is evaluating agent performance based on claims handling.

**Dataset**: [data.sql](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Problem%2014/data.sql)

**Schema:**
- `insurance.agents` - agent information (`agent_id`, `full_name`)
- `insurance.policies` - policy details (`policy_id`, `agent_id`)
- `insurance.claims` - claim records (`claim_id`, `policy_id`, `status`)

---

## Question

For each agent, show:
- **agent name**
- **total number of claims** handled on policies they wrote
- **number of claims that were approved or paid**

---

## Solution

[View Solution](https://github.com/SahilGogna/Interview-Prep/blob/main/SQL%20Mock%20Interview%20Prep/SQL%20Solutions/solution_14.md)
