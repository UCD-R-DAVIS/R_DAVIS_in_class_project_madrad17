# Introduction to R: arithmetic

3+4 

2*5 

#Order of operations
4+(8*3)^2

#P.S. These are comments!

#Sci notation
4e3

#Functions

exp(4)

log(16)

#these will be in order: x, base
log(4, 2) 

log(base = 4, x = 2)

#good practice! Specify x and base
log(x=4, base=2)




#nested functions

sqrt(exp(4))
#reads from middle out


#assigning variables with <- (this is a good practice)

mynumber <- 6

mynumber==5

mynumber

#is my number different than 5? 
mynumber != 5



#more on naming variables
othernumber <- -3


#P.S. THESE VARIABLES WILL ALL BE VISIBLE IN YOUR ENVIRONMENT IN R!!


#If you want to delete all the variables in your environment, use

rm(list = ls())




#errors and warnings

log_of_word <- log("a_word")
# you will get an error that says "Error in log("a_word") : non-numeric argument
# to mathematical function" and the variable will not be assigned

#warnings are even more "dangerous"!!!

log_of_negative <- log(-2)
log_of_negative
#this DOES assign log(-2) to log_of_negative, but will return "NaN" ("Not a Number") 


#CHALLENGE

elephant1_kg <- 3492
elephant2_lb <- 7757

elephant1_lb <- elephant1_kg*2.2

elephant2_lb > elephant1_lb

myelephants <- c(elephant1_lb, elephant2_lb)

which(myelephants ==max(myelephants))
      