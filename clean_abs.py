
import pandas as pd

# 1. Load Data1 sheet
df = pd.read_excel("data/retail_trade_table1.xlsx", sheet_name="Data1", skiprows=9)

# 2. Rename the date column
df = df.rename(columns={"Series ID": "period"})

# 3. Convert period to datetime
df["period"] = pd.to_datetime(df["period"], errors="coerce")

# 4. Drop any rows where period is null
df = df.dropna(subset=["period"])

# 5. Load the Index sheet to map Series IDs to readable names
index_df = pd.read_excel("data/retail_trade_table1.xlsx", sheet_name="Index", skiprows=9)
print("Index columns:", index_df.columns.tolist())
print(index_df.head(10))

# 6. Melt the data from wide to long format
# This turns each Series ID column into its own row
df_melted = df.melt(id_vars=["period"], var_name="series_id", value_name="turnover")

# 7. Drop nulls in turnover
df_melted = df_melted.dropna(subset=["turnover"])

# 8. Preview the result
print(df_melted.head(10))
print(df_melted.shape)
print(df_melted.dtypes)

# 9. Export clean file
df_melted.to_csv("data/retail_sales_clean.csv", index=False)
print("Clean file saved successfully.")