## The first function takes a matrix as an input, sets the inverse of the matrix to an object, and then uses a function to return that inverse as a cached object. The second function returns the previously created inverse matrix object or if that solution does not exist, it calculates it and returns it.

## This function creates a list with four functions that ultimately sets the inverse matrix to a cached object and uses function to return that cached matrix object.

makeCacheMatrix <- function(x = matrix()) {
    xinverse <- NULL
    set <- function{
      x<<-y
      xinverse <- NULL
    }
    get <- function() x
    setinverse <-  function(solve) xinverse <<- solve
    getinverse <- function() xinverse
    list = (set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function tests to see if it can return a cached inverse matrix object created by the preceding function. If uncalculated, then this function solves for it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    xinverse <- x$getinverse()
    if(!is.null(xinverse)){
      message('getting cached data')
      return(xinverse)
    }
    matrixdata <- x$get()
    xinverse <- solve(matrixdata)
    x$setinverse(xinverse)
    xinverse
}
