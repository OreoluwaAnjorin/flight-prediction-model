# Sample data for prediction
sample_data <- data.frame(
  Flight_Duration = c(150, 90, 200),
  Day_of_Week = factor(c(3, 5, 1), levels = 1:7),
  Weather_Conditions = factor(c("Clear", "Rain", "Snow"), 
                              levels = levels(flights$Weather_Conditions)))
  
  # probabilitiesPrediction
  predict(glm_model, newdata = sample_data, type = "response")
  
  # Values closer to 1 indicate higher probability of delay
  # Values closer to 0 indicate lower probability of delay