# This is a copied version of one of the capstone project I did during my Bootcamp.
# In this script, the original notebook written in Python will be translated into R, cell by cell, for a hands-on practice.
# Data used in this project can be downloaded from Kaggle (https://www.kaggle.com/ntnu-testimon/paysim1).

# Load the csv file as a dataframe and print the first rows(head)
head(paysim)

# Print the dimension (.shape() in Python) of the dataframe
dim(paysim)

# Summary statistics of the dataframe (.describe() in Python)
summary(paysim)
# or use one of many libraries like dplyr

# install new packages within conda
library(skimr)
skim(df)