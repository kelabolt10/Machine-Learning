# Simple Linear Regression

# 1. Data preprocessing

# Input the data set

dataset = read.csv('Salary_Data.csv')

# Taking care of missing values

# Encoding the categorical values

# Splitting the dataset into Training and Test sets
# install.packages('caTools')
# Library(caTools)

set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
Training_set = subset(dataset, split == TRUE)
Test_set = subset(dataset, split == FALSE)

# feature scaling
# Most cases, all packages comes with feature scaling

# 2. Simple linear Regression

# Fitting regressor model to Training set

regressor = lm(formula = Salary ~ YearsExperience, data = Training_set)

# Predicting the Test set values

y_pred = predict(regressor, newdata = Test_set)

# Visualizing the Training set results
# install.packages('ggplot2')
# Library(ggplot2)

ggplot() +
  geom_point(aes(x = Training_set$YearsExperience, y = Training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = Training_set$YearsExperience, y = predict(regressor, newdata = Training_set)), 
            colour = 'blue') +
  labs(x = 'Years of Experience', y = 'Salary', title = 'Salary vs Experience (Training set)')
  
# Visualizing the Test set results

ggplot() +
  geom_point(aes(x = Test_set$YearsExperience, y = Test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = Training_set$YearsExperience, y = predict(regressor, newdata = Training_set)), 
            colour = 'blue') +
  labs(x = 'Years of Experience', y = 'Salary', title = 'Salary vs Experience (Test set)')

