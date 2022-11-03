#skip=1 means skip first line
#colClasses : If not provided datatype will be assumed
#sep =" " means separator is space
mem <- read.table("members.txt",header=T,colClasses = c("character","character","integer"),skip=1,sep=" ")

mem


d1 <- read.csv2("Diamonds.csv")

#Find out how many rows and col, datatype of colums of dataframe and a glimpse of the data

str(d1)

#stringsAsFactors:

#Convert all the string values while reading into factors
d1 <- read.csv2("Diamonds.csv", stringsAsFactors = T)
str(d1) #Now all character col types have been converted to Factors


#Reading Excel files using XLSX package using XLSX or readxl

install.packages("xlsx")
library(xlsx)
bank <- read.xlsx("bankruptcy.xlsx",3)

#OR

install.packages("readxl")
library(readxl)
bank1 <- read.xlsx("bankruptcy.xlsx",sheet=3)

#Export data/Write data to CSV format
data("ChickWeight")
write.csv(ChickWeight, "E:/R/Day1/ChickWeight.csv")


#do data() and press CTRL + SPACE (if req) to check for available datasets




#SUBSETTING THE DATA


x <- c(12,23,52,78,90,10,28,93,95,92,95,79)

#Getting a part of vector
x[1:5]

#Compares every element of x to 50 and prints TRUE or FALSE
x>50
#Compares every element of x to 50 and prints the sum of whichever satisfies x>50
sum(x>50)
#Compares every element of x to 50 and prints elements which satisfies x>50
x[x>50]



m <- matrix(c(1:12),4,3)
#Get the element at 3rd row and 2nd colum
m[3,2]

#Get the 2nd row as a vector
m[2,]

#Get the 3rd column as a vector
m[,3]

#Get the 3rd column as a column
m[,3,drop=F]

#Get the second and 4th row
m[c(2,4),]

#Get all the rows from 2nd to the 4th one
m[2:4,]


#These functions also work for dataframes

d1 <- read.csv2("Diamonds.csv")
#We want column no 4 named clarity
d1$clarity

#OR

d1[,4]

#If we want 4th and 6th column
d1[,c(4,6)]

#If we want 4th and 6th column and first 50 rows
#and store for use later, nothing is stored if <- is not used
d1sub <- d1[1:50,c(4,6)]
d1sub
#If we want to exclude certain column of the dataset, use "-" for exclusion
#"-1" means exclude first one

#Exclude 4th and 6th rows
d1sub <- d1[1:50,-c(4,6)]
d1sub

#Exclude the first 50 rows
d1sub <- d1[-c(1:50),-c(4,6)]
d1sub


##FILTERING THE DATA

#Using Subset function

b3 <- read.csv("Bollywood_2015.csv")
b3

#Subset where Box Office collection >50cr
ss <- subset(b3, BO_Collection > 50)
ss
#Subset where Box Office collection >50cr and Budget>70cr
ss <- subset(b3, BO_Collection > 50 & Budget>70)
ss

#Subset where Box Office collection >50cr and Budget>70cr and we want to display
#only Movie_Name and BO_Collection
ss <- subset(b3, BO_Collection > 50 & Budget>70,select = c(Movie_Name, BO_Collection))
ss



