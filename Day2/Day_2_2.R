 #Writing our own Functions in 2 ways 

#With return
add <- function(a,b,c){
  ans <- a+b+c
  return(ans)
}

add(2,4,5)

#mtrs to km
mts <- 45000


#Now as a function without return
m_to_k <- function(m){
  kms <- m/1000
  kms
}

m_to_k(25000)


#To convert any code into a function select a block of code, then go to Code -> 
#Extract function -> Provide Name and Boom presto you got yourself a nice function

m_km_extracted <- function(mts) {
  kms <- mts/1000
  kms
}

#Impute refer to Day2_Excercise, but returning list
mean_impute <- function(x) {
  
  m <- mean(x,na.rm=T)
  y <- ifelse(is.na(x),m,x)
  list(imputed=y, mean=m)
  
}


mean_impute(survery$Pulse)

#Or taking the result in a var

res <- mean_impute(survery$Pulse)
res$mean     #[Extracting the mean from res]
res$imputed  #[Extracting the imputed from res]



#Managing Dates in R


#######Date Class#######

cdt <- "2022-11-05"
cdt
class(cdt)
dt <- as.Date(cdt)
dt
class(dt)


cdt2 <- "2022-10-31"
dt2 <- as.Date(cdt2)
class(dt2)
#Just like C++ the "-" has been overloaded for Date class so it gives us the time difference
#when two Date Objects are subtracted
dt-dt2 
unclass(dt)
unclass(dt2)

#The serial number is negative since its before 1st Jan 1970
dt3 <- as.Date("1947-08-15")
dt3
unclass(dt3)

#The date serial number starts from 1st Jan 1970 so the serial no for that day is 0,
#Any date after is positive, any before is negative
dt4 <- as.Date("1970-01-01")
dt4
unclass(dt4)

Sys.Date() #Uses something called Leopard Case naming



# Different Naming Conventions
#          Camel Case | Leopard Case | Snake Case
#          --------------------------------------
#           ReadCsv   |  read.csv    |  read_csv
#           SysDate   |  Sys.Date    |  Sys_date               
#

cdt1 <- "12-Jan-2022"
dt1 <- as.Date(cdt1,format="%d-%b-%Y")
dt1 #Internally still stored as yyyy-mm-dd which is industry standard

cdt2 <- "31-March-2022"
dt2 <- as.Date(cdt2,format="%d-%B-%Y")
dt2



cdt5 <- "Monday, 10 October 2022"
dt5 <- as.Date(cdt5,format="%A, %d %B %Y")
dt5


dt5+5 #Gives the date 5 after what is stored is dt5


#There is a function called format which converts date back into character
new <- format(dt5, "%A, %d %B %Y")
new
#strptime to strip time from timestamp

dft <- "20 October 2015 13:30:43"
dfy <- strptime(dft,"%d %B %Y %H:%M:%S")
dfy
class(dfy)


#Seq function can also be used to generate a sequence of dates

seq(from=Sys.Date(), length=10, by='week') #Can be done by week, year , month quarter etc




############Times is R###############


dt1 <- Sys.time()#Current sys time
dt1

#POSIXct
class(dt1)
unclass(dt1)


#Converting to POSIXlt
dt <- as.POSIXlt(dt1)
unclass(dt)
#With POSIXlt we get all the components of DT and TIme


#Package lubridate : better way to handle date and time

install.packages("lubridate")
library(lubridate)


cdt1 <- "12-Jan-2022"
dt1 <- dmy(cdt1)

cdt2 <- "03-31-2022"
dt1 <- mdy(cdt2)

dt <- "20, Feb 2015 13:40:32"
dt_prn <- parse_date_time(dt, "dmy_HMS")
class(dt_prn)
dt_prn

#THese functions also work on vectors
cdt <- c("12-Nov-2022", "15-Jun-2022","29-Sep-2022")

dt <- dmy(cdt)
#Functions to extract relevant number from date
d <-day(dt)
d
month(dt,label = F, abbr = F) #Label for full month, ABBR for small like Jan for January
year(dt)
wday(dt)
wday(dt,label=T) #The label makes the Output give the full name of the day of the week

#1->Sunday, 2->Monday etc

month(dt) <- month(dt)+1 #This increases the month value within all the elements of dt by 1


