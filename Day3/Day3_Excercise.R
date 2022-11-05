#Question 1

d1 <- read.csv("comb1.csv")
d1

pivot_longer(d1, c('Highlighter':'Refill'), names_to = "ItemType", values_to = "qty")

#Question2

d2 <- read.csv("comb2.csv")

separate(d2, PatientID, into = c("projectID","SiteID","PatientNumber"),convert = T)