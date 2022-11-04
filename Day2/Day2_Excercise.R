Fahrenheit_to_C <- function(f) {
  c <- (f-32)*(5/9)
  c
}

Fahrenheit_to_C(100)


#2nd

Coef_Var <- function(c1) {
  c <- sd(c1,na.rm=T)/mean(c1,na.rm=T)
  c <- c*100
  c
}

cars93 <- read.csv("Cars93.csv",stringsAsFactors = T)
Coef_Var(cars93$Price)

#3rd
g <- c(9.34,8.24,NA,1.345,0.56,0,NA,7.89)


#This function we wrote is called mean imputation. In data where we have NA values we cannot afford
#to delete the data.. Instead we replace the values with mean if reasonable or median, mode etc
mean_impute <- function(x) {
  
  m <- mean(x,na.rm=T)
  y <- ifelse(is.na(x),m,x)
  y

}

mean_impute(g)
mean_impute(survery$Pulse)

