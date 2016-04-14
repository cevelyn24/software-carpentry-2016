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


###Creating functions### with Thomas C. Smith

#clear work history to avoid fouling up
#

#structure allows you to see structure
#of a function and tips to build a function
#on your own
str(read.csv)


#practive function F to Kelvin

temp<-67

fahr_to_kelvin<- function(temp){
  kelvin<- ((temp-32))*(5/9) + 273.15
  return(kelvin)}
  
fahr_to_kelvin(67)
fahr_to_kelvin(temp)
  
#combining functions
kelvin_to_celsius<-function(temp){
  celsius<-temp-273.15
  return(celsius)
}
  
kelvin_to_celsius(292.5944)  
  
  
#now combine the functions to bring
#fahrenheit to celsius

fahr_to_celsius<- function(temp){
  temp_k<-fahr_to_kelvin(temp)
  result<- kelvin_to_celsius(temp_k)
  return(result)
}

fahr_to_celsius(67)

#create a function challenge

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"  # R interprets a variable with a single value as a vector
# with one element.
fence(best_practice, asterisk)

fence<-(c(best_practice, asterisk))

fence<-function(vector.inside,vector.wrapper){
  fence.a<-(c(vector.inside,vector.wrapper))
  result<- (c(vector.wrapper,fence.a))
  return(result)
}

fence(best_practice, asterisk)


##### for loops!!!!  ############ with Mark Wilber
list.files()

#"usually when you copy and paste should be using 
#function or a for loop

analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

#have to plug in and copy-paste each time...

analyze("data/inflammation-01.csv")

#so let's set up a for loop

best_practice<-c("let", "the", "computers", "do", "the", "work")
best_practice

#function to print this as a sentence
print_words <- function(sentence){
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
  
}

print_words(best_practice)

#can exclude elements using - symbol
print_words(best_practice[-6])

#get NA in the print out because defined function 
#as needing to have 6 elements

print_words<-function(sentence){
  for(word in sentence){
    print(word)
  }
}

print_words(best_practice)
print_words(best_practice[-6])

#for loop explanation
#for(variable in collection){
#do operations on variable
#}

len<-0
vowels<-c("a", "e", "i", "o", "u")

for(v in vowels){
  print(len)
  len<-len+1}

len

#######loop challenge#######

A<- seq(3)

print_N<- function(numbers){
  order<-seq(numbers)
  for(x in order){
    print(x)
  }
}

print_N(7)


#exponetiation#

#write a function to do exponentiation
# 2 arguments, a base and a function

#look at this, Mark has code

######analyzing multilpe files########
#can use wildcards!

list.files()
Sys.glob("i*.csv") #glob is a way to grab a bunch of files

#or
list.files(pattern="inflammation")

filenames<- Sys.glob("i*.csv")

#run analysis on each file
for(file in filenames){
  print(file)
  analyze(file)
}

#####making choices######


analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}


analyze_all <- function(pattern) {
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames <- list.files(pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze(f)
  }
}

#print graphs or plots as pdf
pdf("inflammation-01.pdf")
analyze_all("inflammation-01.csv")
dev.off()pdf #need to turn it off



#####Conditionals#####

#if then clause

num<- 888

if(num>100){
  print("greater")
  }else{
      print("not greater")
    }
print("done")


####another example

num<-999

if(num>100){
  print("number is greater than 100")
}

####another example

sign<-function(num){
  if (num>0){
    return(1)
      } else if(num==0){
        return(0)
      } else {
        return(-1)
      }
}

sign(-3)

#can use other conditions <=, >=, != is NOT equal to

###with a string of tests want to use "and" "or"

if (1> 0 & -1 > 0){
  print ("both parts are true")
} else {
  print("at least one part is not true")
}


##"or" statement represented by |. pipe is or

if (1> 0 | -1 > 0){
  print ("at least one part is true")
} else {
  print("at least one part is not true")
}
