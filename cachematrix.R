## The below two functions are example of caching the data for computations which take
## a lot of time and processing.

## makeCacheMatrix function gets and sets the matrix and its inverse

makeCacheMatrix <- function (x = matrix())
{
  m <- NULL
   
  set <- function (y) 
  {
    x <<- y
    m <<- NULL    
  }
  
  get <- function()
  {
    x
  }
  
  setInverse <- function (invmx)
  {
    m <<- invmx
  }
  
  getInverse <- function()
  {
    m
  } 
    
  list (set=set, get = get, setInverse = setInverse, getInverse = getInverse)
  
}    



## function cacheSolve either gets the cached data of matrix inverse, if already present
## else calculates its inverse and sets it, using the function makeCacheMatrix 

cacheSolve <- function(x, ...) 
{
  m <- x$getInverse()
  if (!is.null(m))
  {
    print ("Getting Cached Data")
    return(m) 
  }
  data <- x$get()

  ## solve(A) provides inverse of matrix A
  m <- solve (data) 
 

  x$setInverse (m)
  
  m  
  
}
