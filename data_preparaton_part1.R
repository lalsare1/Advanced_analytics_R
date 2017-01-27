getwd()
fin = read.csv('Future-500.csv')
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

