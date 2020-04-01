# Clear Entire Workspace
rm(list = ls())

DJIA_Constituents <- read_csv("DJIA_Constituents.csv")


# Define Keywords
keywords = c("Blockchain","IoT","Internet of Things","Artificial Intelligence",
             "Machine Learning","Deep Learning","Natural Language Processing","NLP",
             "Robotic","Neural Network","Virtual Reality","Big Data","Data Science",
             "Cloud Computing","Cloud","Biometric","Automation","Digitization","Digital",
             "Analytics") %>% str_to_lower()


# Download Filings and search for Keywords
# 8-K for major Events that shareholders must know about
# 10-k standardized annual reports
# 10-Q standardized quarterly reports
# PRE 14A https://www.investopedia.com/terms/s/sec-form-pre-14a.asp
# DEF 14A https://www.investopedia.com/terms/s/sec-form-def-14a.asp
# https://www.investopedia.com/terms/s/seact1934.asp

# "PRE 14A","DEF 14A"
SEC_Filings <- searchFilings(cik.no = DJIA_Constituents$CIK,
                             form.type = c("8-K","10-K"),
                             filing.year = c(2015,2016,2017,2018,2019,2020),
                             keywords)

write.csv(SEC_Filings, file = "SEC_Filings.csv")