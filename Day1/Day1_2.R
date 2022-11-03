
#List
#Lists can contain objects of different types
#Many times the outputs of arithmatic functions are expressed as Lists
#Lists can be created using functions

s <- list(a=6,g=9.43,h="ftr",k=c(4,2,1,5))
class(s)
 #Ways to access elements in the list
#Access using names
s$g

s$k

s$k[4]
#Access using position, list strts from index 1
s[2] #Shows the name and the value of the named element

s[[2]] #Directly shows the value of the element
#For accessing vector within list
s[[4]][2]


#Factors are like String -> They are used to represent categorical data
#Non numeric non primary


gdr <- c("F","M","M","F")
df1$gdr
df1 <- data.frame(name,age,gdr)
df1$gdr <- factor(df1$gdr) #Converting vector to factor, adds an attribute called
#Levels that contains the unique values in the vector, sorted in ASCII order
df1$gdr

as.integer(df1$gdr) #Maps an integer to the unique values of factor vector i.e., levels
#in the same order as Levels is sorted so in case of gdr it mapped F -> 1 and M -> 2

#Now we specify the Levels order in the factor function so the mapping gets changed to
#M->1 and F->2
df1$gdr <- factor(df1$gdr,levels=c("M","F"))
as.integer(df1$gdr)


#Missing values are represented as NA or NAN
# NA --> Not Available i.e, no number is present
# NAN --> Not a Number i.e, Not defined or indeterminate like 0/0 in maths
f<-NA

#is.na(value) to check if a value is NA(or NaN) or not as T or F

is.na(f)

#This will check which values in the vector is NA(or NaN) as TRUE or FALSE
d <- c(NA,1,4,NA,NA,5, NaN)
is.na(d)

#table function gives you frequency table

table(is.na(d))

#OR

sum(is.na(d)) #Gives you how many numbers are there a.k.a counts the number of TRUE val 

#OR

as.integer(is.na(d)) #Maps TRUE to 1 and FALSE to 0

#Checks if value in f is NaN
f1 <- NaN
is.nan(f1)
#Checks if all values of vector are NaN
is.nan(d)

#Check if value is finite
f2 <- 23/0
is.finite(f2)
#Check if value is infinite
is.infinite


#Matrix can hold data in matrix form, can be created with R functions

m <- matrix(c(9,3,1,5,6,3),3,2) #Column wise
m

m <- matrix(c(9,3,1,5,6,3),3,2,byrow=T) #Row wise
m

#if correct size is con provided in the dimensions the values are recycled
m <- matrix(c(9,3,1,5,6,3),3,3) #Column wise
m

#When 2 vectors are joined where one vector is shorter than the other then
#the shorter one is recycled
name <- c("A","H","L","M","N","F")
age <- c(34,78,12,55)
rb <- rbind(name,age)
rb
#or cut off 
m <- matrix(c(9,3,1,5,6,3),2,2) #Column wise
m

#Array - Used sparingly as matrix does the job of 2 dim and vectors as 1 dim
#Mostly used for process more than 2 dim data

a <- array(dim=c(3,2))
a
#To put values in array

a[1,1] <- 4.56
a[1,2] <- 9
a[3,2] <- 5
a

#Extracting colnames from the data
data("mtcars")
colnames(mtcars)

#For list we use name functions, colnames wont work
s <- list(a=6,g=9.43,h="ftr",k=c(4,2,1,5))
names(s)


#Reading CSV(COMMA SEPARATED VALUES) files
#Make sure that the header is there if the header tag in the read function is set to
#TRUE or the first data in the file will be appropriated as header
b2 <- read.csv("E:/R/Datasets/Bollywood_2015_2.csv")
View(b2)

#header set to False
b2 <- read.csv("E:/R/Datasets/Bollywood_2015_2.csv",header = F)
colnames(b2) <- c("Movies","BO","Budget","Verdict")

View(b2) 
 
b3 <- read.csv("E:/R/Datasets/Bollywood_2015.csv")
View(b3)

#Set working directory for our Datasets so that we dont have to provide full path
setwd("E:/R/Datasets/")

#If data is separated by something other than ','
b4 <- read.csv("Diamonds.csv",sep = ";")

#It is recommended to use read.csv2 function rather than csv
d1 <- read.csv2("Diamonds.csv")
#It is equivalent to 
b4 <- read.csv("Diamonds.csv",sep = ";",dec=",")

#csv2 was created for convenience 
#Both CS and CSv2 are the same function read.table with different parameters
#for the Separator(sep) and the Decimal (dec) operator