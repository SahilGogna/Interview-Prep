# ✅ Solution Guide — Pandas Data Analysis Interview

## Step 1: Import Libraries
```python
import pandas as pd
df = pd.read_csv("sales_data.csv")
df.head()
```

---

## Step 2: Data Cleaning
### Remove Duplicates
```python
df = df.drop_duplicates()
```

### Handle Missing Values
```python
df = df.dropna(subset=["quantity", "price"])
```

---

## Step 3: Compute Revenue
```python
df["revenue"] = df["quantity"] * df["price"]
```

---

## Step 4: Aggregations

### By Product
```python
df.groupby("product")["revenue"].sum().sort_values(ascending=False)
```
→ **Chicken** has highest revenue ≈ *125.0 USD*

### By Store
```python
df.groupby("store")["revenue"].sum().sort_values(ascending=False)
```
→ **Store B** ≈ *184.7 USD*

### By Category
```python
df.groupby("category")["revenue"].sum().sort_values(ascending=False)
```
→ **Meat** ≈ *125.0 USD*

### By Date
```python
df.groupby("date")["revenue"].sum().sort_values(ascending=False).head()
```
→ **2024-01-15** had ≈ *76.1 USD* revenue

---

## Summary
| Metric | Top Performer | Revenue |
|:-------|:---------------|--------:|
| Product | Chicken | 125.0 |
| Store | Store B | 184.7 |
| Category | Meat | 125.0 |
| Date | 2024-01-15 | 76.1 |
