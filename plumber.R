library(plumber)



# Reading in the pricing model --------------------------------------------

pricing_model <- readr::read_rds("car_pricing_mode.rds")



# Creating API -----------------------------------------------------------

#* @apiTitle Car Pricing Predictions

#* @apiDescription This API serves up predictions of car prices based on the total mileage, engine displacement and the year of manufacture of the vehicle

#* @param  Mileage  The total mileage of the vehicle

#* @param EngineV The engine displacement/volume of the vehicle

#* @param Year The year of manufacture of the vehicle 

#* @get /car_price
function(Mileage, EngineV, Year){
  
  to_predict <- data.frame(Mileage = as.numeric(Mileage), EngineV = as.numeric(EngineV), Year = as.numeric(Year))
  
  log_price = predict(pricing_model, to_predict)
  
  price = exp(log_price)
  
  return(price)

}