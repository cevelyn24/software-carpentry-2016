12

#changing directories. used setwd equivalent to
# 'cd' in unix

#lots of ways to do this. use Session->Set working directory
setwd("C:/Users/evelyn/Desktop/Software-carpentry-2016/data-files/data-files/r-lesson/data")

#bring in data
read.csv("inflammation-01.csv", header=FALSE)


weight_kg<-55

#convert weight to lbs

weight_lbs<-weight_kg*2.2

#can change variables
weight_kg<-57.5

#new lbs value need to re-assign using the equation

weight_lbs
#gives 121

#this should give updated value:
weight_lbs<-weight_kg*2.2

weight_kg<-57.5

weight_lbs


dat<-read.csv("inflammation-01.csv", header=FALSE)

#what kind of data do we have
class(dat)

#what are its dimensions?
dim(dat)

#to call out specific data use []
dat[1,1]

dat[30,20]

#call out a chunk of data
dat[1:4,1:10]

#can call non-contiguous rows 
#and columns
dat[c(3,8,37,56), c(10,14,29)]

#or all data in a row...
dat[5,]

#...or a column
dat[,5]

#pull out data and assign a name
raptor_1<- dat[1,]

#can pull out stats
min(raptor_1)

max(raptor_1)

#or pull data
min(dat[2,])

#mean values from day 7
mean(dat[,7])

mean(raptor_1)
raptor_1

#check data type it might limit you
raptor_1<-as.numeric(raptor_1)
mean(raptor_1)

?apply

#averagea inflammation for each raptor across
#the study
avg_raptor_inflammation<-apply(dat,1,mean)

#average daily inflammation
avg_day_inflammation<-apply(dat,2,mean)

avg_day_inflammation

plot(avg_day_inflammation)

#max daily inflammation
max_day_inflammation<-apply(dat,2,max)

plot(max_day_inflammation)

#min
min_day_inflammation<-apply(dat,2,min)

plot(min_day_inflammation)



#use c to combine the data

sd_day_inflammation<-apply(dat,2,sd)

plot(sd_day_inflammation)
