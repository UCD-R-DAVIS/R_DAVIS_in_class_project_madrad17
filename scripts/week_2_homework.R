#setting the seed set.seed(15) makes R generate the same "random" numbers as the homework assignment 
set.seed(15)
hw2 <- runif(50, 4, 50) 
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

#now we call the object and return all the values that are not NA with the !is.na function
hw2[!is.na(hw2)]

#creating an intermediate vector out of that value and naming it noNA
noNA <- hw2[!is.na(hw2)]

#assigning values from 14-38 inclusive to vector prob1
prob1 <- noNA [noNA>=14 & noNA<=38]

#multiplying prob1 by 3 and assigning that to vector times3
times3 <- prob1*3

#adding 10 to times3 vector and assigning that to vector plus10 
plus10 <- times3+10

#returning every other number in plus10 vector, starting with the first one, and assigning them to vector final 
final <- plus10[c(TRUE,FALSE)]

#printing final 
final
