# Hsiang-Leng Wang
# 2019/11/16
# RStudio Exercise 3
# Source: https://archive.ics.uci.edu/ml/datasets/Student+Performance
# ------------------------

# Part1. Data wrangling
# read the data from data folder
st_mat <- read.table("data/student-mat.csv", sep=";", header=TRUE)
st_por <- read.table("data/student-por.csv", sep=";", header=TRUE)

# explore the data structure
str(st_mat)
str(st_por)
intersect(names(st_mat), names(st_por))

# In "st_mat" dataset, there are 33 varibles with 395 rows data. 
# In "st_por" dataset, there are 33 variables with 649 rows data.
# Both dataset have completely the same column names.

#inner-join two dataset to keep the rows are in common
# "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet" as (student) identifiers
library(dplyr)
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
st_combine <- inner_join(st_mat, st_por, by = join_by)
str(st_combine)
colnames(st_combine)
# After keep the data based on those ID in common, the new joined dataframe has 53 variables with 382 rows data
# show the column name

# create a new data frame with only the joined columns
alc <- select(st_combine, one_of(join_by))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(st_mat)[!colnames(st_mat) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'st_combine' with the same original name
  two_columns <- select(st_combine, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}

# glimpse at the new combined data
glimpse(alc)

# define a new column alc_use by combining weekday and weekend alcohol use
alc$alc_use <- rowMeans(subset(alc, select = c("Dalc", "Walc")), na.rm = TRUE)
# create a new logical column 'high_use' which is TRUE for students for which 'alc_use' is greater than 2 
alc$high_use <- alc$alc_use > 2

write.table(st_combine, file = "data/st_combine.csv")
write.table(alc, file = "data/alc.csv")


install.packages("GGally")
install.packages("tidyverse")


         