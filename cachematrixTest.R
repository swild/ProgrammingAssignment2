setwd("/home/swild/test3/ProgrammingAssignment2/")
source("cachematrix.R")

#creating an 2x3 matrix
m2 <- matrix(1:4, 2, 2)
#creating an 3x3 matrix
m3 <- matrix(rnorm(16), 4)

## Test start
a <- makeCacheMatrix(m2) 
a$get() # expected input matrix
a$getInverse() # expectiv NULL (cacheSolve was bever invoked)
cacheSolve(a) # expecting result (without "message from cache")
cacheSolve(a) # expecting result (WITH message "returning cached value")

## Test update Matrix
b <- makeCacheMatrix(m3) 
b$getInverse() # NULL
cacheSolve(b) # inversed matrix
b$getInverse() # calulated result from b
b$getInverse() # cached result from b

