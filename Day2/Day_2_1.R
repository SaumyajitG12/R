
cars <- read.csv("Cars93.csv",stringsAsFactors = T)
str(cars)
View(cars)
table(cars$Price.Category, cars$Type)
table(cars$Price.Category, cars$Type, cars$Origin) #with filter, 3 dim cross-tab


sum(cars$Price.Category=="15 to 30")

#Unique shows unique elements in dataframe
unique(cars$Price.Category)

#addmargins adds a sum of every column and row totals to the table output
addmargins(table(cars$Price.Category, cars$Type))


#Proportion tables
a <- c(34,90,21,79)
sum(a)

a/sum(a) #Getting proportions of all elements elem/sum

prop.table(a) #Function to get the proportions

#We can apply the prop.table func to cars to get proportion of cars by price category/total cars
prop.table(table(cars$Price.Category))
prop.table(table(cars$Price.Category))*100 #Percentage


#We can apply the prop.table func to cars to cross table 
# to get proportion of cars by category and price category/total cars


prop.table(table(cars$Price.Category,cars$Type))
prop.table(table(cars$Price.Category,cars$Type))*100 #percentage


#Table has missing values
survery <- read.csv("survey.csv",stringsAsFactors = T)
table(survery$Sex, useNA = "ifany") #Frequency table ignores missing value, so we use useNA tag

#Use useNA = ifany whenever you dont know the data


aff <- ifelse(cars$Price>30,"Expensive","Affordable")
aff

#If we want to bind it to a new column in cars(cars93)
cars$Affordability <- ifelse(cars$Price>30,"Expensive","Affordable")
View(cars)
table(cars$Affordability)

#Use cbind to add affordability to the middle of the dataset
cars1 <- cbind(cars[,1:5],aff,cars[,6:28])
cars1

#only 1 NA value can throw off so we use na.rm to remove
mean(survery$Pulse, na.rm = T)
sd(survery$Pulse, na.rm = T)
median(survery$Pulse,na.rm = T)


#quantile gives quartiles for the data, seq generates a sequence from 2 to 32 with 2 step
a <- seq(2,32,by=2)
quantile(a)

quantile(survery$Pulse, na.rm = T) #na.rm is true so that the func removes na data

#If we want to find specific percentile we can use probs flag
quantile(survery$Pulse, na.rm = T, probs=0.6) #This shows 60th percentile 

#Summary function gives you mean max quartile median and the NA's
summary(survery$Pulse)


#attach will make visible all the components of survey without $
#Dont use since it will cause confusion if we have 2 datasets with similarly named cols
attach(survery)
mean(Pulse, na.rm = T) 

#Use detach to make surveys's components invisible again
detach(survery)