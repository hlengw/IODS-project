# title: "create_human"
# author: "Hsiang-Leng, Wang"
# date: "11/27/2019"
# original data from: http://hdr.undp.org/en/content/human-development-index-hdi

# Load the ‘human’ data into R
# read the human dataset
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

# look at the (column) names of human
names(human)

# look at the structure of human
str(human)

# print out summaries of the variables
summary(human)

# 1. Mutate the data
library(stringr) # access the stringr package
str(human$GNI)# look at the structure of the GNI column in 'human'
human$GNI <- as.numeric(str_replace(human$GNI, pattern=",", replace ="")) # remove the commas from GNI and print out a numeric version of it
str(human$GNI) #NB: If use "as.numeric" function for human$GNI directly, the output will be interpreted to different numbers

# 2. Exclude unneeded variables
library(dplyr)
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F") # columns to keep
human <- select(human, one_of(keep)) # select the 'keep' columns
complete.cases(human) # print out a completeness indicator of the 'human' data; Return a logical vector indicating which cases are complete, i.e., have no missing values.
data.frame(human[-1], comp = complete.cases(human)) # print out the data along with a completeness indicator as the last column

# 3. Remove all rows with missing values
# filter out all rows with NA values
human_ <- filter(human, complete.cases(human))

# 4. Remove the observations which relate to regions instead of countries.
# define the last indice we want to keep
last <- nrow(human_) - 7
# choose everything until the last 7 observations
human_ <- human_[1:last,]

# 5. Define the row names of the data by the country names and remove the country name column from the data
# add countries as rownames
rownames(human_) <- human_$Country
# remove the Country variable
human_ <- select(human_, -Country)
#save my ‘human’ data
write.table(human_, file = "data/human.csv", sep = ",")
