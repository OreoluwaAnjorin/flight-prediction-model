import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the data with clusters
flights = pd.read_csv(r"C:\Users\anjor\Documents\batch 888\FLIGHT PREDICTION\flights_with_clusters.csv")

# 1. Flight Duration Distribution by Delay Status
plt.figure(figsize=(10, 6))
sns.boxplot(x='Delayed', y='Flight_Duration', data=flights)
plt.title('Flight Duration Distribution by Delay Status')
plt.xlabel('Delayed (0 = No, 1 = Yes)')
plt.ylabel('Flight Duration (minutes)')
plt.show()

# 2. Delay Rate by Weather Conditions
delay_by_weather = flights.groupby('Weather_Conditions')['Delayed'].mean().reset_index()
plt.figure(figsize=(10, 6))
sns.barplot(x='Weather_Conditions', y='Delayed', data=delay_by_weather)
plt.title('Delay Rate by Weather Conditions')
plt.xlabel('Weather Conditions')
plt.ylabel('Delay Rate')
plt.xticks(rotation=45)
plt.show()

# 3. Clusters Visualization
plt.figure(figsize=(10, 6))
sns.scatterplot(x='Flight_Duration', y='Day_of_Week', hue='Cluster', data=flights, palette='viridis')
plt.title('Flight Clusters Based on Duration and Day of Week')
plt.xlabel('Flight Duration (minutes)')
plt.ylabel('Day of Week')
plt.show()