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

#Replacing missing data
fin[!complete.cases(fin),]
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City == "New York",]
fin[is.na(fin$State) & fin$City == "New York", "State"] = "NY"
fin[c(11, 377),]

fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City == "San Francisco", "State"] = "CA"
fin[c(82, 265),]

#Replacing Missing data Mediuan Imputation Method Part1
fin[!complete.cases(fin),]

med_empl_retail = median(fin[fin$Industry=="Retail", "Employees"], na.rm = TRUE)
fin[is.na(fin$Employees) & fin$Industry == "Retail",]
fin[is.na(fin$Employees) & fin$Industry == "Retail", "Employees"] = med_empl_retail

mean(fin[, "Employees"], na.rm = TRUE)
mean(fin[fin$Industry=="Financial Services", "Employees"], na.rm = TRUE)

fin[3,]

med_empl_finserv = median(fin[fin$Industry=="Financial Services", "Employees"], na.rm=TRUE)
fin[is.na(fin$Employees) & fin$Industry=="Financial Services","Employees"]=med_empl_finserv

fin[330,]

fin[!complete.cases(fin),]

#Median imputation Method Part2: