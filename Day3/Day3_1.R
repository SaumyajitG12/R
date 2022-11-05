setwd("E:/R/Datasets/")


##################JOINS######################

#Read the contents of A and B csv into variables and use inner join function to join them on ID no
A <- read.csv("A.csv")
B <- read.csv("B.csv")
library(tidyverse)


inner_join(A,B,by="IdNum")
#Read the contents of Orders and details and then join them on Order.ID
orders <- read.csv("Orders.csv")
details <- read.csv("Ord_Details.csv")

o_details <- inner_join(orders, details, by="Order.ID")

#Similarly we have full join and left join functions

######################TIDYR######################


#Two operations within : Gathering and spreading



#Gathering : using gather()
#Gather is also known as making the data long
table4a
gather(table4a, '1999','2000', key = "year" , value = "cases")#Data name, 2 columns which need to be stacked instead 
#of side by side and key value

#Better function to use is pivot_longer instead of Gather since the former is still under active
#development

pivot_longer(table4a, c('1999','2000'), names_to = "year", values_to = "cases")

#TO transform data back from long from to normal(Making data wider) we use
table2
spread(table2, key="type", value = "count")

pivot_wider(table2, names_from = "type", values_from = "count")


##Separate data from a column into separate colums, data that is separated by some separator
separate(table3, rate, into = c("cases","population"),convert = T)#into is names of the new 2 
#separated columns, while convert is used to autoconvert the data from(here from chr to int) one
#type to another if necessary automatically
#Any special character is considered as special character, multiple at the same time

#If we want to separate not based on delimiter but position
separate(table3, year, into = c("century","year"),sep=2)

#If we want to separate in 2 positions 
separate(table3, year, into = c("century","cent2","year"),sep=c(2,3))



#If we want to join 2 strings instead of separating them

a <- "Machine"
b <- "Learning"
paste(a,b)
paste0(a,b)#Join without separator


#Unite function to unite two columns
table5

unite(table5, new_col, century, year)

#But this joins with a separator "_", if we dont want such separator
unite(table5, new_col, century, year, sep = "")
#Set separator to "" empty string


#For missing data the ones which we see as NA is called explicitly missing,
#The data might also just be missing completely which is called implicitly missing fata


#Missing Data

stocks <- data.frame(
            year=c(2015,2015,2015,2015,2016,2016,2016),
            qtr=c(1,2,3,4,2,3,4),
            return=c(1.88,0.59,0.35,NA,0.92,0.17,2.66)
)
stocks

#to drop NA values
drop_na(stocks)


#Better way to check for NA values since a huge dataset may have many NA values
#and it might be impossible to manually check them or drop them

complete(stocks, year, qtr) #Points out NA values using year and qtr which defines
#the for the datasetcompleteness

mu <-  mean(stocks$return, na.rm=T)
complete(stocks, year,qtr,fill = list(return=mu))


#if we have data that have missing values but is implied that it is binded to the previous
#available value we use fill function to make it data analysis friendly

#Star Plus          Prog1          12
#   NA              Prog2          01
#   NA              Prog3          02

#Above it is implied that Star Plus has 3 programs Prog1,2,3 at three different times,
#but it is not data analysis friendly, so we use Fill function to fill in the gaps

#Star Plus          Prog1          12
#Star Plus          Prog2          01
#Star Plus          Prog3          02
fill(TVrate,channel)

stocks %>% 
  complete( year,qtr) %>% 
        fill(return) #filling NA with previous available value as default


stocks %>% 
  complete( year,qtr) %>% 
      fill(return, .direction = "up") #filling NA with next available value using .direction

TVrate <- data.frame(channel=c("A",NA,NA,"B",NA,NA,NA),
                     ratings = c(2,3,4,5,6,7,2))


#Pivot longer test exercise
quality <- read.csv("qual\ity.csv")

pivot_longer(quality, -Id, names_to = "New_col", values_to = "New_val")



