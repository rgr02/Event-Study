# Clear Entire Workspace
rm(list = ls())

library(tidyverse)
library(tidyquant)
library(riingo)

# Loading table with all 30 Constituents
DJIA_Constituents <- read_csv("DJIA_Constituents.csv")

# retrieing Index data from Yahoo Finance
DJIA_TS <- tq_get("^DJI") %>% tq_mutate(select = close, mutate_fun = periodReturn, period = "daily")
SP500_TS <- tq_get("^GSPC") %>% tq_mutate(select = close, mutate_fun = periodReturn, period = "daily")


# Getting rid of unnecessary columns
DJIA_Constituents <- DJIA_Constituents %>% select(-c(`SEC filings`,
                                                     `Date first added`,
                                                     Founded))

# Retrieving Stock Time Series and Calculating daily returns
DJIA_Constituents <- DJIA_Constituents %>% tq_get() 




# %>%
#   mutate(daily.return = log(close/lead(close)))
# 
# 
#  
#   tq_mutate(select = close, mutate_fun = periodReturn, period = "daily")
  
# 
# 
# 
# tiingo_api_key(api_key = "c4f26a85abe1aa2074765acda6b110ba03d6d82f")
# 
# DJIA_TS <- riingo::riingo_prices("^DJI")
# supported_tickers()

