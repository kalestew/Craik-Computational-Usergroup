# Summarise a plate reader export: mean signal per enzyme and treatment.
import pandas as pd

df = pd.read_csv("plate_reader.csv")

print(df.head())
print()

summary = df.groupby(["enzyme", "treatment"])["rfu"].mean().round(0)
print(summary)

# Save a bar chart next to the script.
ax = summary.unstack().plot.bar(figsize=(8, 4), ylabel="RFU")
ax.figure.tight_layout()
ax.figure.savefig("rfu.png")
print("\nSaved rfu.png")
