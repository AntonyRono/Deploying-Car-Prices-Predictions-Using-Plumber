
## Useful when you want to have more control on where the API is hosted

pr <- plumber::plumb("plumber.R")

pr$run(host = "127.0.0.1", port = 5022)


## Run thos as job if you want to continue using R in the same session