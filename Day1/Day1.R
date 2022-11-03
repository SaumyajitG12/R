w <- 24
y <- "S"
h <- w**3
ls()
d <- c(3,5,6,7)
class(d)
length(d)

#Vectorization
d+3
d*2
#You can only do numerical operations directly with vectors not list
#This is because vectors can contain only one type of data


#Class is character even if 1 character is introduced
s <- c(36.4,3.57,"df")
class(s)


#Class is numeric
s <- c(36.4,3.57)
class(s)

#rm(variable_name) to remove a variable from the environment
a=10
rm(a)

name <- c("A","H","L","M")
age <- c(34,78,12,55)

#Horizontal Binding
rb <- rbind(name,age)
rb

#Vertical Binding

cb <- cbind(name,age)
cb

#Measurable quatities are maintained in columns...
#For example if in an experiment we are maintaining temp,pressire,resistance,
#then we should store them in colums i.e they should be in 10X3 format (RxC)

class(rb)


#Dataframes

df <- data.frame(name,age)
df
View(df)


#Matrices are for mathematical calculations
#Dataframes are for data management -> pulling and working with data
#Collection of different vectors of same size binded together


#Inbuilt dataframes -> These dataframes have been created for practice purposes

data(mtcars)
View(mtcars)


#To access a certain column of a Dataframe like disp[Displacement] from mtcars
#dataset we can use $... "." is not any sort of specifier its the same as "_"
new <- mtcars$disp
mean (new)  #Function to calculate mean
sd(new)     #Function to calculate Standard Deviation

summary(new) # Displays Min. 1st Qu. Median  Mean 3rd Qu. Max. for the data
