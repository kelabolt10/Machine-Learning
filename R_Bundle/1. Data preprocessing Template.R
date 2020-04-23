# Data preprocessing template

# Input the data set

dataset = read.csv('Data.csv')

# Taking care of missing values

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean (x, na.rm = TRUE)),
                        dataset$Salary)

dataset$Age = ifelse(is.na(dataset$Age),
                        ave(dataset$Age, FUN = function(x) mean (x, na.rm = TRUE)),
                        dataset$Age)

# Encoding the categorical values

dataset$Country = factor(dataset$Country,
                         levels = c('Germany', 'Spain', 'France'),
                         labels = c('3', '2', '1'))

dataset$Purchased = factor(dataset$Purchased,
                         levels = c('Yes', 'No'),
                         labels = c('1', '0'))

# Splitting the dataset into Training and Test sets
# install.packages('caTools')
# Library(caTools)

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.4)
Training_set = subset(dataset, split == FALSE)
Test_set = subset(dataset, split == TRUE)

# feature scaling
# Most cases, all packages comes with feature scaling

Training_set[,2:3] = scale(Training_set[,2:3])
Test_set[, 2:3] = scale(Test_set[, 2:3])
                        
                         