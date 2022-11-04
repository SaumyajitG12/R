#Question1

Orders <- read.csv("Orders.csv",stringsAsFactors = T)

dt1 <- dmy(Orders$Order.Date)

Day <- day(dt1)
Month <- month(dt1)
Year <- year(dt1)

Orders <- cbind(Orders,Day,Month,Year)#Using Cbind to append columns
str(Orders)

#Question2

After1Year <- year(dt1)+1 #Incrementing year by 1 and storing it in a variable

Orders <- cbind(Orders,After1Year)