# Overview

This is a very simple REST API created using plumber package in R, that serves predictions on car prices based on mileage, engine displacement and year of manufacture.

# Step Invloved

The process can be broken down into three steps, each presented as a separate script:

1. Building a multiple linear regression model and saving it as an rds file
2. Turning the R model into a RESTFUL API, using the plumber package
3. Calling the API 

# Anatomy of an API

* Host (fixed) e.g. *https[]()://api.hostname.com/*

* Endpoint (varied) e.g. *https[]()://api.hostname.com/endpoint*

  * Endpoints are like a function
  * Determines what will happen

* Parameters (optional) e.g. *https[]()://api.hostname.com/endpoint/?param=value*
  * Think of these like function arguments
  * Addresses varying parts of a request


# Anatomy of a Plumber API

* Uses roxygen-like commenting #* to document

* #* is followed by tags

* Tags look like @tagName

* End points are defined by the appropriate method tag and endpoint name e.g. @get /predict
* Endpoint functionality is defined by an unassigned function immediately following the endpoint name

* Code outside of a function can be considered global


# Reference
1. https://github.com/JosiahParry/deploying-r-models

1. https://www.youtube.com/watch?v=w4yHEQWct20&t=2s&ab_channel=JosiahParry
