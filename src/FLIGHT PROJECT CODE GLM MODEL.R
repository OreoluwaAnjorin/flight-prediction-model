library(tidyverse)
library(caret)

flights <- read.csv("flights_200.csv")

# Delayed to factor for classification
flights$Delayed <- as.factor(flights$Delayed)

# Categorical variables to factors
flights$Weather_Conditions <- as.factor(flights$Weather_Conditions)
flights$Day_of_Week <- as.factor(flights$Day_of_Week)

# Build logistic regression model
glm_model <- glm(Delayed ~ Flight_Duration + Day_of_Week + Weather_Conditions, 
                   data = flights, family = "binomial")

# Summary of the model
summary(glm_model)

# Data Split into training and testing sets (70/30 split)
set.seed(123)
trainIndex <- createDataPartition(flights$Delayed, p = 0.7, list = FALSE)
train <- flights[trainIndex, ]
test <- flights[-trainIndex, ]

# Train model on training set
model_train <- glm(Delayed ~ Flight_Duration + Day_of_Week + Weather_Conditions, 
                   data = train, family = "binomial")

# Predict on test set
predictions <- predict(model_train, newdata = test, type = "response")
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# Confusion matrix
confusionMatrix(data = as.factor(predicted_classes), reference = test$Delayed)

# Creating a sequence of flight durations covering short, medium, and long flights
flight_durations <- seq(60, 240, by = 30)  # Stipulates 30-min increments From 1 hour to 4 hours 

# All days of the week
days_of_week <- 1:7

# All weather conditions from the original data
weather_conditions <- c("Clear", "Windy", "Fog", "Rain", "Snow", "Storm")

# Combinations of these factors
test_data <- expand.grid(
  Flight_Duration = flight_durations,
  Day_of_Week = days_of_week,
  Weather_Conditions = weather_conditions
)

# Converting to factors to match the original data structure
test_data$Day_of_Week <- factor(test_data$Day_of_Week, levels = 1:7)
test_data$Weather_Conditions <- factor(test_data$Weather_Conditions, 
                                       levels = weather_conditions)

# Some random noise to flight durations to make more realistic
set.seed(123)
test_data$Flight_Duration <- test_data$Flight_Duration + rnorm(nrow(test_data), 0, 10)
test_data$Flight_Duration <- round(test_data$Flight_Duration, 0)

# View the first few rows of test data
head(test_data, 20)

# Making predictions on the test data
test_predictions <- predict(glm_model, newdata = test_data, type = "response")

# Adding predictions to the test data
test_data$Predicted_Delay_Probability <- test_predictions
test_data$Predicted_Delay <- ifelse(test_predictions > 0.5, 1, 0)

# Viewing results with highest probability of delay
head(test_data[order(-test_data$Predicted_Delay_Probability), ], 10)

# Viewing results with lowest probability of delay
head(test_data[order(test_data$Predicted_Delay_Probability), ], 10)
 
# Summary statistics of predictions
summary(test_data$Predicted_Delay_Probability)

# Total of flights predicted to be delayed
table(test_data$Predicted_Delay)

# Average delay probability by weather condition
aggregate(Predicted_Delay_Probability ~ Weather_Conditions, data = test_data, mean)

# Average delay probability by day of week
aggregate(Predicted_Delay_Probability ~ Day_of_Week, data = test_data, mean)

# Interaction between weather and day of week
aggregate(Predicted_Delay_Probability ~ Weather_Conditions + Day_of_Week, 
          data = test_data, mean)

# Summary comparison of the test data and Original Data
comparison <- data.frame(
  Dataset = c("Original", "Test"),
  Rows = c(nrow(flights), nrow(test_data)),
  Columns = c(ncol(flights), ncol(test_data)),
  Avg_Flight_Duration = c(mean(flights$Flight_Duration, na.rm = TRUE), 
                          mean(test_data$Flight_Duration, na.rm = TRUE))
)

print(comparison)
