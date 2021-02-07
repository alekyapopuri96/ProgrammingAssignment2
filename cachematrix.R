## The above functions will calculate the inverse and stores it in cache and used when required


# example for testing the program
#matrix1 <- matrix(c(1,4,6,2), nrow = 2, ncol = 2, byrow = TRUE)
#matrix2<-(makeCacheMatrix(matrix1))

##output
'''
cacheSolve(matrix2)
            [,1]        [,2]
[1,] -0.09090909  0.18181818
[2,]  0.27272727 -0.04545455
'''
#makeCacheMatrix creates a special "matrix", which is really a list containing a function to

  #  set the value of the matrix
  #  get the value of the matrix
  #  set the value of the inverse
  #  get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  mat <- NULL
  set <- function(y) {
    x <<- y
    mat <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) mat <<- inverse
  getinverse <- function() mat
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##The below function calculates the inverse of the above function. 
#It firsts if the inverse is already created, 
#if it is then it gets from the cache if not it creates the inverse and return.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mat <- x$getinverse()
  if(!is.null(mat)) {
    message("getting cached data")
    return(mat)
  }
  data <- x$get()
  mat <- solve(data, ...)
  x$setinverse(m)
  mat
}
