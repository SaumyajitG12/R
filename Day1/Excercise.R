ds <- read.csv("Orders.csv")
ds
#1
ss <- subset(ds, Payment.Terms == "Online" )
ss

#2
data("mtcars")
write.csv(mtcars, "E:/R/Day1/mtcars.csv")

#3
ds <- read.csv2("Diamonds.csv")
ds
ss <- subset(ds, cut == "Premium" )
ss

#4
ds <- read.csv2("Diamonds.csv")
ds

df1 <- data.frame(ds$carat,ds$color,ds$depth,ds$price)
colnames(df1) <- c("Carat","color","depth","price")
df1

#OR
ss <- ds[,c(1,3,5,7)]
ss
#5
d <- mtcars[c(2,18,30,12),]
d


#Extra Question

#By manually taking the name from the file and setting column name
ds <- read.csv("breast-cancer-wisconsin.data",header=F)
ds


colnames(ds) <- c("Sample","Clump Thickness","Uniformity","Uniformity Shape",
                  "Marginal Adhesion","Single Epithelial Cell Size","Bare Nuclei",
                  "Bland Chromatin","Normal Nucleoli","Mitoses","Class")
ds

cols <-  c("Sample","Clump_Thickness","Uniformity","Uniformity_Shape",
           "Marginal_Adhesion","Single_Epithelial_Cell_Size","Bare_Nuclei",
           "Bland_Chromatin","Normal_Nucleoli","Mitoses","Class")
ds
write.csv(ds, "E:/R/Day1/Breast_Cancer.csv")


#Extracting the data from the file using functions and adding the column names


ds <- read.csv("breast-cancer-wisconsin.data",header=F)
ds

ds1 <- read.csv("breast-cancer-wisconsin.names",sep = " ",header=F)
ds1
ds2 <- ds1[108:130,4:5, drop=F]
dc1 <- ds2[c(19,21),1]
dc2 <- ds2[c(2,3,4,8,10,12,13,15,17),2]
dc1
class(dc1)
class(dc2)
colv <- append(dc2,dc1)
colnames(ds) <- colv 
ds