## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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



## Write a short comment describing this function

cacheSolve <- function(x, ...) 
{
  m <- x$getInverse()
  if (!is.null(m))
  {
    print ("Getting Cached Data")
    return(m) 
  }
  data <- x$get()
  m <- solve (data) 
  #solve(A) provides inverse of A

  x$setInverse (m)
  
  m  
  
}
