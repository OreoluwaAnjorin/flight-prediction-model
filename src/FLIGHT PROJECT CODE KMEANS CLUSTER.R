# columns selection for data scaling
# non-numeric columns to numeric (1-7) before scaling
cluster_data <- flights %>%
  select(Flight_Duration, Day_of_Week) %>%
  mutate(Day_of_Week = as.numeric(Day_of_Week)) %>%
  scale()

# K-means clustering with k= 4 derived from the elbow method chart
set.seed(123)
kmeans_result <- kmeans(cluster_data, centers = 4, nstart = 25)

# Add cluster assignments to original data
flights$Cluster <- as.factor(kmeans_result$cluster)

# Cluster sizes view
table(flights$Cluster)

# Results export for visualization in Python
write.csv(flights, "flights_with_clusters.csv", row.names = FALSE)
