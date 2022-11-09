setwd("E:/R/Datasets/")
auto <- read.csv("AutoCollision.csv")
library(tidyverse)
library(ggplot2)
library(esquisse)
esquisser(auto)

#Use labs to provide titles to graphs
#1
ggplot(data = auto, aes(x=Severity, y=Claim_Count, color=Vehicle_Use))+geom_point()+
  labs(title="Severity by Claim Count")+theme(plot.title = element_text(hjust=0.5))

#Theme is used to adjust for aesthetics :: in this case plot.title refers to the 
#title of the graph which is to be adjusted to the centre using hjust

#2
ggplot(data = auto, aes(y=Claim_Count, fill=Vehicle_Use))+geom_boxplot()+
  labs(title="Claim count by Vehicle Type",x="Vehicle Type",y="Claim Count")+
  theme(plot.title = element_text(hjust=0.5))


#3
Ornstein <- read.csv("Ornstein.csv")
ggplot(data=Ornstein, aes(x=nation,fill=sector))+geom_bar()+
  labs(title = "Firms by Nation across Sector", x="Nation", y="Count")+
  theme(plot.title = element_text(hjust=0.5))


#4
  ggplot(data=Ornstein, aes(x=assets,y=interlocks,color=sector))+geom_point()+
    facet_grid(.~nation)+
    labs(title = "Assets by Interlocks", x="Interlocks", y="Assets")+
    theme(plot.title = element_text(hjust=0.5))
  
#5
  cars <- mtcars
  cars$gear <- factor(cars$gear)
  ggplot(data=cars, aes(x=disp,y=mpg,color=gear))+geom_point()+
    labs(title = "Displacement by MPG", x="Displacement", y="Miles per Gallon")+
    theme(plot.title = element_text(hjust=0.5))