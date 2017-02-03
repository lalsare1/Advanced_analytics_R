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
#---#

#Median imputation Method Part2:
fin[!complete.cases(fin),]
med_const_growth = 
  median(fin[fin$Industry=="Construction", "Growth"], na.rm = TRUE)

fin[is.na(fin$Growth) & fin$Industry=="Construction", "Growth"] = 
  med_const_growth

fin[8,]

#Median Imputation Method Part 3
fin[!complete.cases(fin),]
med_const_revenue = 
  median(fin[fin$Industry=="Construction", "Revenue"], na.rm = TRUE)
fin[is.na(fin$Revenue & fin$Industry=="Construction"), "Revenue"] = 
  med_const_revenue

fin[c(8, 42),]

fin[!complete.cases(fin),]
med_const_expenses = 
  median(fin[fin$Industry=="Construction", "Expenses"], na.rm = TRUE)
fin[is.na(fin$Expenses & fin$Industry=="Construction" & is.na(fin$Profit)), 
    "Expenses"] =
  med_const_expenses
fin[c(8, 42),]

# fin[!complete.cases(fin),]
# med_it_expenses = 
#   median(fin[fin$Industry=="IT Services", "Expenses"], na.rm = TRUE)
# med_it_expenses
# fin[is.na(fin$Expenses & fin$Industry== "IT Services"), "Expenses"] =
#   med_it_expenses
# fin[15,] Not to calculate the missing revenue, expense, or profit values if two of
# the values are available

#Calculating Missing Data
#Revenue = Expenses + Profit
#Expenses = Revenue - Profit

fin[!complete.cases(fin),]

fin[is.na(fin$Profit), "Profit"] = 
  fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit), "Expenses"]

fin[c(8, 42),]

fin[is.na(fin$Expenses), "Expenses"] = 
  fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"]

fin[15,]

fin[!complete.cases(fin),]

#Visualization
library(ggplot2)
#A scatterplot classified by industry showing revenue, expenses, profit
p = ggplot(data=fin)
p + geom_point(aes(x = Revenue, y = Expenses, colour = fin$Industry,
                   size = fin$Profit))
#A scatterplot that includes industry trends for the expenses
d  = ggplot(data = fin, aes(x = Revenue, y = Expenses,
                            colour = fin$Industry))

d + geom_point() +
  geom_smooth(fill = NA, size = 1.2)

#Boxplots showing growth by industry
f = ggplot(data = fin, aes(x = fin$Industry, y = Growth,
                           colour = fin$Industry))
f + geom_boxplot(size = 1)

#extras
f + geom_jitter() + 
  geom_boxplot(size = 1, alpha = 0.5, outlier.colour = NA)



