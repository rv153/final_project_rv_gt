#Reasha Vora
#reashav2@uw.edu
#I worked with Gauri Thaliyil. 

#Library statments
library(dplyr)
library(stringr)
library(ggplot2)

# Loading in our datasets
drugs_df <- read.csv("drugs_data.csv") 
usage_df <- read.csv("usage_data.csv") 

#join data
df <- left_join(drugs_df, usage_df, by = c("Ages" = "College.Age.Group"))
