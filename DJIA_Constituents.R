# Clear Entire Workspace
rm(list = ls())

# Libraries
library(tidyverse)
library(edgar)
library(rvest)

# Retrieving SP500 Constituents from Wikipedia
SP500_Constituents <- "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies" %>% 
  read_html() %>% html_nodes(xpath = '//*[@id="constituents"]') %>% 
  html_table() %>% bind_rows() %>% arrange(Symbol)

# Retrieving DJIA Constituents from Wikipedia
DJIA_Constituents <- "https://en.wikipedia.org/wiki/Dow_Jones_Industrial_Average" %>% 
  read_html() %>% html_nodes(xpath = '//*[@id="constituents"]') %>% 
  html_table() %>% bind_rows() %>% arrange(Symbol) 

# Removing Prefix of NYSE Stock Listings as retrieved from Wikipedia
# Necessary for Retrieving Time Series
# (String: "NYSE:")
DJIA_Constituents$Symbol <- str_replace_all(DJIA_Constituents$Symbol,"NYSE:","") %>% str_trim()

# Because of the DJIA beeing a Subset of the SP500 the SP500 Data Frame
# is sliced to the DJIA Constituents to retrieve Constituents Table includeing
# CIK Codes for SEC Filings
DJIA_Constituents <- slice(SP500_Constituents, which(Symbol %in% DJIA_Constituents$Symbol)) %>%
  write_csv("DJIA_Constituents.csv")