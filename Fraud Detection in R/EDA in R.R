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


######################################################################################
# Import skimr packages to display additional summary info including missing values
library(skimr)
skimr::skim(paysim) # applying skim function of skimr package

# Count missing values and plot the result
library(inspectdf)
library(dplyr)
show_plot(inspect_na(paysim))

# Numeric variables inspection
show_plot(inspect_num(paysim))

# Categorical variable
inspect_imb(paysim)
inspect_cat(paysim)

# Try dataexplorer

######################################################################################
# How many fraudulent transactions(= our target) are there? 
df_isFraud <- dplyr::filter(paysim, isFraud == 1)
df_notFraud <- dplyr::filter(paysim, isFraud == 0)
show_plot(inspect_mem(df_isFraud, df_notFraud))
show_plot(inspect_cat(df_isFraud, df_notFraud))

######################################################################################
# Correlation of columns
show_plot(inspect_cor(paysim))
show_plot(inspect_cor(df_isFraud))

# Compute a correlation matrix
cor(paysim)

# This doesn't work because the dataframe as a column with string values
# Every columns should be converted to numeric to calculate the pearson's r
# Let's skip this part for now

# A countplot of transaction types
library(ggplot2)
ggplot(paysim, aes(type), Freq) + geom_bar(fill="blue")
# Value counts
paysim %>%
  count(type)

# A function to check names appeared in any fraudulent transaction
get_balance_difference <-function (df, old_col, new_col){
  # Difference in old-balance and new-balance columns
  # R does math in a matrix element-wise.
  matrix(df$old_col) - matrix(df$new_col)
}
matrix(paysim$oldbalanceOrg) - paysim$newbalanceOrg
paysim$diffOrg <- get_balance_difference(paysim, oldbalanceOrg, newbalanceOrig)
head(paysim)

# If transaction amount is not equal to the difference in balances of origin
get_suspicious_names() <- function(df, col)
  suspicious_names <- list()
  for (name in df$nameOrig)
    if (df$amount != Difference_Orig)
      suspicious_names <- name

    suspicious_names += [name for name in data.nameDest if name not in suspicious_names]
  print(f'Fraud alert!!!')
  return list(set(suspicious_names)) 
  
}




# Now, let's compute the correlation matrix
cor(paysim)
corr <- round(cor(paysim), 1)
head(corr[, 1:6])

# Heatmap
library(ggcorrplot)
ggcorrplot(corr, outline.color="white")

######################################################################################
######################################################################################
######################################################################################



