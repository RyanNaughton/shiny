
library(foreign)

data <- read.dta("teacher_labor_market/data/argentina.dta")

#head(data)
#table(data$age)

for(i in 1:ncol(data)){
  print(i)
  print(class(data[,i]))
  if(class(data[,i]) =='factor'){
    data[,i] <- factor(data[,i])
    gc()
  }
}

data$age <- as.character(data$age)
data$age[data$age == "Less than 1 year"] <- "0"
data$age[data$age == "1 year"] <- "1"
data$age[data$age == "2 years"] <- "2"
data$age[data$age == "100+"] <- "100"
data$age <- as.numeric(data$age)

save(data,file="teacher_labor_market/data/argentina.rdata")
#load("teacher_labor_market/data/argentina.rdata")
#column_types <- sapply(data,class) 

hist(data$age,breaks=100,freq=TRUE)

table(data$sex[data$empstatd == "Retired"])
table(data$sex[data$empstatd == "Housework"],data$year[data$empstatd == "Housework"])

barplot(table(data$sex[data$empstat == "Employed"],data$year[data$empstat == "Employed"]))

#labor force participation by gender,age,occupation through time

#gender = sex
#age = age
#occupation = 
selected_one <- 'sex'
selected_two <- 'year'
boxplot()
plot(data$age,data$year)
tmp <- table(data[,selected_one],data[,selected_two])
tmp <- as.matrix(tmp)
barplot(tmp)
tmp2 <- apply(X=tmp,2,FUN=function(x){
  x/sum(x)
})
barplot(tmp2,main=paste(selected_one,"~",selected_two))

plot(1)
as.list(tmp)
lapply(tmp,FUN=function(x){x/sum(x)}) #colSums(tmp)
barplot(tmp)
tmp
plot(data$year,data$sex,data$empstat)

names(data)
table(data$empstat,data$sex)
table(data$empstatd,data$empstat)
,data$sex)
table(data$year)

table(data$indgen)
table(data$ind)


table(data$ind[which(data$indgen == "Education")])

# 13     80    91   9310   9320  9999 
#93141 54385 41392  7138   204    31 

barplot(table(data$occ[(data$indgen == "Education")]))
sort(table(data$occ[(data$indgen == "Education")]))

sort(table(data$occ[(data$indgen == "Education")]))

janitors <- subset(data,occ == "5631" & indgen == "Education")

janitors_not_in_schools <- subset(data,occ == "5631" & indgen != "Education")

table(janitors$sex)
table(janitors_not_in_schools$sex)


4131
