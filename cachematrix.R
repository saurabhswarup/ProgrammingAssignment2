## Matrix inversion is usually a costly computation and their may be some 
## benefit to caching the inverse of a matrix rather than compute it 
## repeatedly (there are also alternatives to matrix inversion that we will 
## not discuss here). Your assignment is to write a pair of functions 
## that cache the inverse of a matrix.

## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  setMatrix <- function(y) {
    x <<- y
    im <<- NULL
  }
  getMatrix <- function() x
  setInverse <- function(inverse) im <<- inverse
  getInverse <- function() im
  list(setMatrix = setMatrix, getMatrix = getMatrix, 
       setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve: This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x=matrix(), ...) {
  im <- x$getInverse()
  if(!is.null(im)) {
    message("getting cached data")
    return(im)    
  }
  data <- x$getMatrix()
  im <- solve(data)
  x$setInverse(im)
  im
        ## Return a matrix that is the inverse of 'x'
}
