## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this 

##This function will create a matrix and store the inverse of that matrix.

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      #Create a new function called set
      set<-function(y){
            #Create new variables in a different enviroment (not actual enviroment) 
            x <<- y
            m <<- NULL
      }
      get <- function() x
      #Create a new function that store the inverse of a matrix 
      #and save the answer in the m variable
      setsolve <- function(solve) m <<- solve
      getsolve <- function() m
      list(set = set, get = get,
           setsolve = setsolve ,
           getsolve = getsolve)
      
}


## Write a short comment describing this function

##This function will calculate the inverse of a matrix and store 
##that solution in cache to avoid multiple computations.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getsolve ()
      ##If the inverse of this matrix was calculating before
      ##then R will look for this answer and bring it to the user.
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setsolve(m)
      m
}
