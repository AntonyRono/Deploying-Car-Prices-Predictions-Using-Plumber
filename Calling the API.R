library(httr)
library(jsonlite)


##### Run "run_plumber" as a separate job before running this script #######


get_prices_preds <- function(Mileage,EngineV, Year ){
  
  
  ####### Creating URL  ########
  
  # Specifying the base url
  b_url <- "http://127.0.0.1:5022//car_price"  ## Combination of where it is hosted and endpoint which you sepcified in the @get in plumber script
  
  ## Creating Named list with parameters and values
  params <- list(Mileage = Mileage, EngineV = EngineV, Year = Year)
  
  ## Combining the url and parameter  i.e filling the in the parameters
  query_url <- modify_url(url = b_url, query = params)
  
  ###### Sending Request ########
  resp <- GET(query_url)
  
  ###### Parse Request ########
  
  resp_raw <- content(resp, as = "text", encoding = "utf-8")
  
  fromJSON(resp_raw)
  
  
  
}

get_prices_preds(200, 3, 2009)
