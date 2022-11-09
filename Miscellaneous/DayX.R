setwd("E:/R/Datasets/")
library(tidyverse)

d <- read.csv("Cars93.csv")
d %>% group_by(Type) %>% summarise(mean(Min.Price),mean(Max.Price))


library(esquisse)
esquiss
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