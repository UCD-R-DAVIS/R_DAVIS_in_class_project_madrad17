# Project Management ----

# working directories & file paths

#get your working directory, which is the file you're working out of
getwd()

### set your working directory ----
setwd("/Users/seantreacy/Desktop/Grad School/R-Projects/R_DAVIS_in_class_project_madrad17")

dir.create("/Users/seantreacy/Desktop/Grad School/R-Projects/R_DAVIS_in_class_project_madrad17/scripts")

# Working with vectors

# Vectors need to be all the same data type! Otherwise it thinks they're all strings

num_char <- c(1, 2, 3, 4)
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(num_char)

c("hello", "whatup")

animals <- c("mouse", "rat","dog","cat")
animals



