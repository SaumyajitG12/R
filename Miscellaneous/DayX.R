setwd("E:/R/Datasets/")
library(tidyverse)

d <- read.csv("Cars93.csv")
d %>% group_by(Type) %>% summarise(mean(Min.Price),mean(Max.Price))


library(esquisse)
esquisser()
library(ggplot2)

ggplot(d) +
 aes(x = Price, y = MPG.highway, colour = Type) +
 geom_point(shape = "circle", size = 1.5) +
 scale_color_hue(direction = 1) +
 theme_minimal()
er(d)
library(ggplot2)
 #-----------------------------------------------------------------------------#

d <- read.csv("pizza.csv")
cor(d$Promote,d$Sales)
cor(d)

insure <- read.csv("Insure_auto.csv")
insure <- insure[-1]
cor(insure)

conc <- read.csv("Concrete.csv")
corel <- cor(conc)
heatmap(corel)


bost <- read.csv("Boston.csv")
corel1 <- cor(bost)

heatmap(corel1)


#-------------------------------------------------------------------------#
 lm(d$Sales~d$Promote) #Linear Regression for pizza csv
summary(lm(d$Sales~d$Promote)) #R squared


#OR

lm(d$Sales~d$Promote) |> summary()



lm(insure$Operating_Cost~insure$Home+insure$Automobile) |> summary()#Insure
  #OR
lm(Operating_Cost~Home+Automobile, data =insure) |> summary()
  #OR
lm(Operating_Cost~., data =insure) |> summary()


lm(medv~., data =bost) |> summary()#Boston

lm(CompressiveStrength~., data =conc) |> summary()#Concrete

########################################################################

#Predicitions

fitp <- lm(Sales~Promote,data=d)
tst_pizza <- data.frame(Promote=16)
predict(fitp,newdata=tst_pizza)

#Cement
fitc <- lm(CompressiveStrength~., data =conc)
test_cem <- data.frame(Cement=	600,BlastFurnaceSlag=150,FlyAsh=0,Water=150,
                       Superplasticizer=	1.5,CoarseAggregate=	1400,
                       FineAggregate=	700,Age=	34)

predict(fitc,newdata=test_cem)
#Boston

fitb <- lm(medv~., data =bost)
test_boston <- data.frame(crim=0.007,zn=20,indus=	2.5, chas=1,
                            nox=0.62,rm=0.9,age=42,dis=	5,
                            rad=3,tax=300,ptratio=10,
                            black=500,lstat=2)

predict(fitb,newdata=test_boston)

