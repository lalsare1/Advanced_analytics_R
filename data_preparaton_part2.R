getwd()
#Basic Import: fin = read.csv('Future-500.csv')
#Importing the dataset by replacing empty character strings with NA
fin = read.csv("Future-500.csv", na.strings = c(""))
head(fin)
str(fin)
summary(fin)

#Changing from non factor to factor
fin$ID = factor(fin$ID)
fin$Inception = factor(fin$Inception)
summary(fin)

#Factor variable trap (FVT)
a = c("12", "13", "14", "12", "12")
b = as.numeric(a)
typeof(b)

z = factor(a)
y = as.numeric(z)

#fin$Profit = factor(fin$Profit)
#fin$Profit = as.numeric(fin$Profit)

#sub() and gsub()
?sub()
fin$Expenses = gsub(" Dollars", "", fin$Expenses)
fin$Expenses = gsub(",", "", fin$Expenses)

fin$Revenue = gsub("\\$", "", fin$Revenue)
fin$Revenue = gsub(",", "", fin$Revenue)

fin$Growth = gsub("%", "", fin$Growth)
head(fin)
str(fin)

fin$Expenses = as.numeric(fin$Expenses)
fin$Revenue = as.numeric(fin$Revenue)
fin$Growth = as.numeric(fin$Growth)

head(fin)

#Locate Missing Data
head(fin, 25)
fin[!complete.cases(fin),]
str(fin)

#Filtering using which() for non-missing data
head(fin)
fin[fin$Revenue == 9746272,]
which(fin$Revenue == 9746272)
fin[which(fin$Revenue == 9746272),]
fin[which(fin$Employees == 45),]

#Filtering using is.na() for missing data
is.na(fin$Expenses)
fin[is.na(fin$Revenue),]

#Removing records with missing data
fin_backup = fin
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]
fin = fin[!is.na(fin$Industry),]

fin[!complete.cases(fin),]

#Resetting the data frame index
rownames(fin) = NULL
fin

