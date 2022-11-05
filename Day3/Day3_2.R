################Graphical Data Representaion######################

#Bar Plot

cars93 <- read.csv("Cars93.csv")

a <- c(45,20,14)
b <- c(40,20,10)
barplot(a) #Basic, crude bar graph
ab <- rbind(a,b) #Binding a and b as rows in dataframe
barplot(ab)#Plotting A and B crudely

#beside stacks them side by sid
#col will specify the color for the bars
barplot(ab, beside=T, col=c("red","blue"))


table(cars93$Type) %>% barplot() #Making a barplot on the frequency table of Types col in cars93 dataset

table(cars93$Type, cars93$Origin) %>% barplot(,beside=T)#Now bar graph on 2 things

#If we want to provide a title to the main graph
table(cars93$Type, cars93$Origin) %>% barplot(,beside=T,main="Car Types")



#HISTOGRAM


hist(cars93$Price, breaks=10) #Breaks are where the class interval is present
#Class intervals should have equal width
#Class intervals also known as Bins

#Histograms have continuous scale at x axis so we cant shuffle
#Judge breaks correctly, too many breaks can screw up the data


d <- read.csv2("Diamonds.csv")
hist(d$price, breaks=10,main = "Diamond Pricing", col=colors()[45]) #Breaks are where the class interval is present
colors()
 #Gives you all the colors in R
#You can specify  colors()[<number>] to get the colors according to the number assigned to the color
 

####BOX PLOT######
#Also known as Box and Whisker plot which are the two lines above and below the box
#Gap between FIrst and 3rd Quartile is called Inter Quartile Range (IQR)
#In boxplot we only plot quartiles
#Any data point that is 1.5IQR away from the edge of Box Plot it is tagged as Outlier

#Outliers are extreme Observations that need to be tracked, more the variation more the outliers

boxplot(cars93$Price) #Some outliers
boxplot(d$price)      #Many Outliers

boxplot(cars93$RPM) #No outliers

boxplot(d$depth) #Too many outliers

#If we want to do boxplots for one col related to another col(Like group by)

boxplot(cars93$Price ~ cars93$Type) #Price for every category
boxplot(d$depth ~ d$cut) #Depth of diamond relating the cut
#IF we want to change the scale it is ylim for y axis and xlim for xaxis


###########SCATTERPLOT##########


plot(cars93$Price,cars93$MPG.city)

plot(cars93$Price,cars93$MPG.city,pch=18, col ="green")
#Pch stands for Plotting Character, its the legend that marks a data point
#Col for which color for the pch

plot(cars93$Price,cars93$MPG.city,pch=18, col ="green", xlab="Car Price", ylab="Miles per Gallon",
     main="Scatter")
#xlab = Xlabel
#ylab = Ylabel
#main=Name of the graph

########LINE PLOT###########

#For timeseries based graphs X axis should be time
#WHenever we plot against time its better to plot it as a linegraph
gas <- read.csv("Gasoline.csv")
plot(gas$Week, gas$Sales, type='l') #Type = l for lineplot
plot(gas$Week, gas$Sales, type='b')#Type = b for lineplot and show the data points

####DENSITY PLOT#####

#Like histogram, but smoothened
#Call density function on the data and then use Plot()
cars93$Price %>% density() %>% plot()

#OR

plot(density(cars93$Price))

#--------------------------------------------------------------------------------------#
                               #####################
                               #      GGPLOT2      #
                               #####################


sal <- read.csv("Salaries.csv", stringsAsFactors = T)

#For ggplot2, use function ggplot, specify the dataframe, then function aes[AESTHETIC] within it
#to specify what is gonna be x axis and y axis and then 
#USE "+" operator and pass the relevant plot function

#geom_point() for scatterplot

ggplot(data=sal, aes(x=yrs.service,y=salary)) + geom_point()

#If values correspond to specific groups/ranks/columns we can specify separate colors for them
#For rank
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point()

#For Gender
ggplot(data=sal, aes(x=yrs.service,y=salary,color=sex)) + geom_point()
#shape will change the shape of the plotting character instead for color
ggplot(data=sal, aes(x=yrs.service,y=salary,shape=rank)) + geom_point()

#4 things at a time, shape defined by rank, colors defined by sex
ggplot(data=sal, aes(x=yrs.service,y=salary,shape=rank, col=sex)) + geom_point
#Size regulates the size of plot depending upon a certain characteristic
ggplot(data=sal, aes(x=yrs.service,y=salary,size=yrs.since.phd)) + geom_point()


#Alpha defines transparency of plotting -- When alpha is defined it is also known as bubbleplot
ggplot(data=sal, aes(x=yrs.service,y=salary,size=yrs.since.phd, color=rank)) + geom_point(alpha=0.3)

#The different color shift for the years in Phd is called a gradient
ggplot(data=sal, aes(x=yrs.service,y=salary,color=yrs.since.phd)) + geom_point(alpha=0.3)


###Histogram using GGplot####
ggplot(data=cars93, aes(x=Price)) + geom_histogram(bins=10)

#Some aesthetic changes by providing color
ggplot(data=cars93, aes(x=Price)) + geom_histogram(bins=10, fill="pink", color="red")

###Boxplot using GGplot####
ggplot(data=cars93, aes(y=Price)) + geom_boxplot(fill="pink", color="red")

#Color changes for each type and the boxplot is generated pertaining to each type
ggplot(data=cars93, aes(y=Price,x=Type, fill=Type)) + geom_boxplot()

#If we only want to change border colors
ggplot(data=cars93, aes(y=Price,x=Type, color=Type)) + geom_boxplot()


ggplot(data=cars93, aes(y=Price,x=Type, color=Type)) + geom_boxplot()+coord_flip()
#coord_flip can flip any graph


###Density Plot####
#with color and x axis
ggplot(data=cars93, aes(x=Price)) + geom_histogram( fill="pink", color="red")

#If we want 2 factors fill in aes() of ggplot set to type 
#and specify alpha in the geom_density so that all graphs are seen
#even through overlap
ggplot(data=cars93, aes(x=Price, fill=Type)) + geom_density(alpha=0.3)


####Line Graph####
ggplot(data=gas, aes(x=Week, y=Sales)) + geom_line() 
ggplot(data=gas, aes(x=Week, y=Sales)) + geom_point() + geom_line() #Put geom_point to see data points too

###Facet Grid ###
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(.~rank)
#Use + facet grid to separate the graph on the basis of a factor/column

ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(rank~.)
#Flipping the positioning of the ~. we can get the partitions horizontally


#If we add another column/factor to facet grid it further subdivides the graph now to 6 partitions
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(rank~.~sex)
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(sex~.~rank)

#------------------------------------------------------------------------------------------------#

#####################Interactive Graphics#########################


#Where the graph is dynamic based on what we choose

#Using something called shinyapp





