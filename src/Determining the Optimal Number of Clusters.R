# Function to compute total within-cluster sum of squares
wss <- function(k) {
  kmeans(cluster_data, k, nstart = 25)$tot.withinss
}

# wss plot for k = 1 to k = 10
k_values <- 1:10
wss_values <- map_dbl(k_values, wss)

plot(k_values, wss_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Total within-clusters sum of squares")