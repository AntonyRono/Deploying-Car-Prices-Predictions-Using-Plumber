library(tidyverse)


# Importing Data ----------------------------------------------------------

data <- read_csv("Car Prices.csv")


# Cleaning Data -----------------------------------------------------------

data_cleaned <- data %>% 
  
  filter(!is.na(Price), !is.na(EngineV), EngineV >= 0.6, EngineV < quantile(EngineV, 0.9, na.rm = TRUE),  Mileage < quantile(Mileage, 0.9, na.rm = TRUE),
         
         Year > quantile(Year, 0.1, na.rm = TRUE)
         
         
         ) %>% 
  
  mutate(log_price = log(Price))

skimr::skim(data_cleaned)

# Creating Model to Predict Median GPA ------------------------------------

pricing_model <- lm(log_price ~ Mileage + EngineV + Year, data = data_cleaned)

summary(pricing_model)


# Make Predictions from Model ---------------------------------------------

to_predict <- data.frame(Mileage = as.numeric(100), EngineV = as.numeric(4), Year = as.numeric(2000))


predict(pricing_model, to_predict)


# Create a function for model predictions ---------------------------------

pred_price <- function(Mileage, EngineV, Year){
  
  to_predict <- data.frame(Mileage = as.numeric(Mileage), EngineV = as.numeric(EngineV), Year = as.numeric(Year))
  
  log_price = predict(pricing_model, to_predict)
  
  price = exp(log_price)
  
  return(price)
  
  
  
}

pred_price(100, 4, 2002)

# Save Our Model for future use----------------------------------------------------------

write_rds(pricing_model, "car_pricing_mode.rds")
