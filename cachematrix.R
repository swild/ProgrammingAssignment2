# This File contains following to functions:
# 1) makeCacheMatrix: makeCacheMatrix: creates a matrix with cacheable of its inverse
# 2) cacheSolve: calculates the inverse of a by makeCacheMatrix created matrix

## Some Test functions calls can be found in the file cachematrixTest.R

##  makeCacheMatrix: creates a matrix with cacheable of its inverse
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse
# get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  
  # initialize the inverse matrix cache
  inverseMatrix <- NULL
  
  # set the value of the matrix
  set <- function(m) {
    # save new matrix
    x <<- m
    # reset cache
    inverseMatrix <<- NULL
  }
  
  # get the original matrix
  get <- function() x
  
  # set the value of the inverse matrix
  setInverse <- function(newInverseMatrix) inverseMatrix <<- newInverseMatrix
  
  # get the value of the inverse matrix
  getInverse <- function() inverseMatrix
  
  # return a list of all the above functions
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse
  )
}


## cacheSolve: calculates the inverse of on matrix.
## As additional feature this functions saves the calculated inversed
## of the given matrix.
cacheSolve <- function(x, ...) {
  # check if the inverse is already cached,
  # if so, we get the inverse from the cache directly
  inversedMatrix <- x$getInverse()
  if(!is.null(inversedMatrix)) {
    message("returning cached value")
    return(inversedMatrix)
  }
  # else, we first get the matrix
  matrix <- x$get()
  # and calculate the inverse
  inversedMatrix <- solve(matrix, ...)
  # next, cache the inverse of the matrix
  x$setInverse(inversedMatrix)
  ## Return a matrix that is the inverse of 'x'
  inversedMatrix
}