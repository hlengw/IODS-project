# Load the data sets (BPRS and RATS) into R using as the source the GitHub repository of MABS
bprs <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", header = T)
rats <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = T)

# 1. (1 point) take a look at the data sets (wide-form): 
# check their variable names
colnames(bprs)
colnames(rats)

# bprs dataset has 11 variables which names are shown as following:
# [1] "treatment" "subject"   "week0"     "week1"     "week2"     "week3"     "week4"    
# [8] "week5"     "week6"     "week7"     "week8"

# rats dataset has 13 variables which names are shown as following:
# [1] "ID"    "Group" "WD1"   "WD8"   "WD15"  "WD22"  "WD29"  "WD36"  "WD43"  "WD44"  "WD50" 
# [12] "WD57"  "WD64" 

# view the data contents and structures
# bprs dataset has 11 variables and 40 rows with all integers data between 18 to 95 (except columns 1 to 2).
head(bprs)
str(bprs)
min(bprs[, c(3:11)])
max(bprs[, c(3:11)])

#   treatment subject week0 week1 week2 week3 week4 week5 week6 week7 week8
# 1         1       1    42    36    36    43    41    40    38    47    51
# 2         1       2    58    68    61    55    43    34    28    28    28
# 3         1       3    54    55    41    38    43    28    29    25    24
# 4         1       4    55    77    49    54    56    50    47    42    46
# 5         1       5    72    75    72    65    50    39    32    38    32
# 6         1       6    48    43    41    38    36    29    33    27    25

# 'data.frame':	40 obs. of  11 variables:
#   $ treatment: int  1 1 1 1 1 1 1 1 1 1 ...
# $ subject  : int  1 2 3 4 5 6 7 8 9 10 ...
# $ week0    : int  42 58 54 55 72 48 71 30 41 57 ...
# $ week1    : int  36 68 55 77 75 43 61 36 43 51 ...
# $ week2    : int  36 61 41 49 72 41 47 38 39 51 ...
# $ week3    : int  43 55 38 54 65 38 30 38 35 55 ...
# $ week4    : int  41 43 43 56 50 36 27 31 28 53 ...
# $ week5    : int  40 34 28 50 39 29 40 26 22 43 ...
# $ week6    : int  38 28 29 47 32 33 30 26 20 43 ...
# $ week7    : int  47 28 25 42 38 27 31 25 23 39 ...
# $ week8    : int  51 28 24 46 32 25 31 24 21 32 ...

# rats dataset has 13 variables and 16 rows with all integers data between 230 to 612 (except columns 1 to 3).
head(rats)
str(rats)
min(rats[, c(4:11)])
max(rats[, c(4:11)])

# ID Group WD1 WD8 WD15 WD22 WD29 WD36 WD43 WD44 WD50 WD57 WD64
# 1  1     1 240 250  255  260  262  258  266  266  265  272  278
# 2  2     1 225 230  230  232  240  240  243  244  238  247  245
# 3  3     1 245 250  250  255  262  265  267  267  264  268  269
# 4  4     1 260 255  255  265  265  268  270  272  274  273  275
# 5  5     1 255 260  255  270  270  273  274  273  276  278  280
# 6  6     1 260 265  270  275  275  277  278  278  284  279  281

# 'data.frame':	16 obs. of  13 variables:
#   $ ID   : int  1 2 3 4 5 6 7 8 9 10 ...
# $ Group: int  1 1 1 1 1 1 1 1 2 2 ...
# $ WD1  : int  240 225 245 260 255 260 275 245 410 405 ...
# $ WD8  : int  250 230 250 255 260 265 275 255 415 420 ...
# $ WD15 : int  255 230 250 255 255 270 260 260 425 430 ...
# $ WD22 : int  260 232 255 265 270 275 270 268 428 440 ...
# $ WD29 : int  262 240 262 265 270 275 273 270 438 448 ...
# $ WD36 : int  258 240 265 268 273 277 274 265 443 460 ...
# $ WD43 : int  266 243 267 270 274 278 276 265 442 458 ...
# $ WD44 : int  266 244 267 272 273 278 271 267 446 464 ...
# $ WD50 : int  265 238 264 274 276 284 282 273 456 475 ...
# $ WD57 : int  272 247 268 273 278 279 281 274 468 484 ...
# $ WD64 : int  278 245 269 275 280 281 284 278 478 496 ...

# create some brief summaries of the variables
summary(bprs)
summary(rats)

# treatment      subject          week0           week1           week2          week3      
# Min.   :1.0   Min.   : 1.00   Min.   :24.00   Min.   :23.00   Min.   :26.0   Min.   :24.00  
# 1st Qu.:1.0   1st Qu.: 5.75   1st Qu.:38.00   1st Qu.:35.00   1st Qu.:32.0   1st Qu.:29.75  
# Median :1.5   Median :10.50   Median :46.00   Median :41.00   Median :38.0   Median :36.50  
# Mean   :1.5   Mean   :10.50   Mean   :48.00   Mean   :46.33   Mean   :41.7   Mean   :39.15  
# 3rd Qu.:2.0   3rd Qu.:15.25   3rd Qu.:58.25   3rd Qu.:54.25   3rd Qu.:49.0   3rd Qu.:44.50  
# Max.   :2.0   Max.   :20.00   Max.   :78.00   Max.   :95.00   Max.   :75.0   Max.   :76.00  
# week4           week5           week6           week7          week8      
# Min.   :20.00   Min.   :20.00   Min.   :19.00   Min.   :18.0   Min.   :20.00  
# 1st Qu.:28.00   1st Qu.:26.00   1st Qu.:22.75   1st Qu.:23.0   1st Qu.:22.75  
# Median :34.50   Median :30.50   Median :28.50   Median :30.0   Median :28.00  
# Mean   :36.35   Mean   :32.55   Mean   :31.23   Mean   :32.2   Mean   :31.43  
# 3rd Qu.:43.00   3rd Qu.:38.00   3rd Qu.:37.00   3rd Qu.:38.0   3rd Qu.:35.25  
# Max.   :66.00   Max.   :64.00   Max.   :64.00   Max.   :62.0   Max.   :75.00 
# 
# ID            Group           WD1             WD8             WD15            WD22      
# Min.   : 1.00   Min.   :1.00   Min.   :225.0   Min.   :230.0   Min.   :230.0   Min.   :232.0  
# 1st Qu.: 4.75   1st Qu.:1.00   1st Qu.:252.5   1st Qu.:255.0   1st Qu.:255.0   1st Qu.:267.2  
# Median : 8.50   Median :1.50   Median :340.0   Median :345.0   Median :347.5   Median :351.5  
# Mean   : 8.50   Mean   :1.75   Mean   :365.9   Mean   :369.1   Mean   :372.5   Mean   :379.2  
# 3rd Qu.:12.25   3rd Qu.:2.25   3rd Qu.:480.0   3rd Qu.:476.2   3rd Qu.:486.2   3rd Qu.:492.5  
# Max.   :16.00   Max.   :3.00   Max.   :555.0   Max.   :560.0   Max.   :565.0   Max.   :580.0  
# WD29            WD36            WD43            WD44            WD50            WD57      
# Min.   :240.0   Min.   :240.0   Min.   :243.0   Min.   :244.0   Min.   :238.0   Min.   :247.0  
# 1st Qu.:268.8   1st Qu.:267.2   1st Qu.:269.2   1st Qu.:270.0   1st Qu.:273.8   1st Qu.:273.8  
# Median :356.5   Median :360.0   Median :360.0   Median :362.0   Median :370.0   Median :373.5  
# Mean   :383.9   Mean   :387.0   Mean   :386.0   Mean   :388.3   Mean   :394.6   Mean   :398.6  
# 3rd Qu.:497.8   3rd Qu.:504.2   3rd Qu.:501.0   3rd Qu.:510.5   3rd Qu.:516.0   3rd Qu.:524.5  
# Max.   :590.0   Max.   :597.0   Max.   :595.0   Max.   :595.0   Max.   :612.0   Max.   :618.0  
# WD64      
# Min.   :245.0  
# 1st Qu.:278.0  
# Median :378.0  
# Mean   :404.1  
# 3rd Qu.:530.8  
# Max.   :628.0

# 2. (1 point) Convert the categorical variables of both data sets to factors.
library(dplyr) # Access the packages dplyr and tidyr
library(tidyr)
bprs$treatment <- factor(bprs$treatment) # Factor treatment & subject
bprs$subject <- factor(bprs$subject)

rats$ID <- factor(rats$ID) # Factor treatment & subject
rats$Group <- factor(rats$Group)

# 3. (1 point) Convert the data sets to long-form. 
# Add a week variable to bprs and a Time variable to rats.
# --
# (When converting the wide-form into the long-form, one needs to decide which values will be gathered into one column. 
# After that, we can decide the column name.)
bprsl <-  bprs %>% gather(key = weeks, value = bprs, -treatment, -subject) # Convert to long-form
bprsl <-  bprsl %>% mutate(week = as.integer(substr(weeks, 5, 5))) # Extract the week number, from the 5th letter to the 5 th letter
glimpse(bprsl) # Take a glimpse at the bprsl data

ratsl <- rats %>% gather(key = WD, value = rats, -ID, -Group) # Convert to long-form
ratsl <-  ratsl %>% mutate(Time = as.integer(substr(WD, 3, 4))) # Extract the week number, from the 3th letter to the 4 th letter
glimpse(ratsl) # Take a glimpse at the ratsl data

# 4. (2 points) Take a serious look at the new data sets and compare them with their wide-form versions: 
# Check the variable names, view the data contents and structures, and create some brief summaries of the variables. 
names(bprs) # wide-form variables' names
# [1] "treatment" "subject"   "week0"     "week1"     "week2"     "week3"     "week4"     "week5"     "week6"     "week7"    
# [11] "week8" 
names(bprsl) # long-form variables' names
# [1] "treatment" "subject"   "weeks"     "bprs"      "week" 
str(bprs) # wide-form
# 'data.frame':	40 obs. of  11 variables:
# $ treatment: Factor w/ 2 levels "1","2": 1 1 1 1 1 1 1 1 1 1 ...
# $ subject  : Factor w/ 20 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ week0    : int  42 58 54 55 72 48 71 30 41 57 ...
# $ week1    : int  36 68 55 77 75 43 61 36 43 51 ...
# $ week2    : int  36 61 41 49 72 41 47 38 39 51 ...
# $ week3    : int  43 55 38 54 65 38 30 38 35 55 ...
# $ week4    : int  41 43 43 56 50 36 27 31 28 53 ...
# $ week5    : int  40 34 28 50 39 29 40 26 22 43 ...
# $ week6    : int  38 28 29 47 32 33 30 26 20 43 ...
# $ week7    : int  47 28 25 42 38 27 31 25 23 39 ...
# $ week8    : int  51 28 24 46 32 25 31 24 21 32 ...
str(bprsl) # long-form
# 'data.frame':	360 obs. of  5 variables:
# $ treatment: Factor w/ 2 levels "1","2": 1 1 1 1 1 1 1 1 1 1 ...
# $ subject  : Factor w/ 20 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ weeks    : chr  "week0" "week0" "week0" "week0" ...
# $ bprs     : int  42 58 54 55 72 48 71 30 41 57 ...
# $ week     : int  0 0 0 0 0 0 0 0 0 0 ...
# --
# The main difference converting from wide-form to long-form dataset is the declining of vairables' numbers.
# In our case, the wide-form dataset contains 11 variabbles, whereas the long-form dataset contains only 5 variables, or we can say 4 variables if we delete the duplicated column "weeks".
# In long-form dataset, each row only contains one measurement with certain "key" and "value", which is more specific than wide-form dataset.