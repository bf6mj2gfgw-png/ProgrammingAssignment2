## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # 缓存逆矩阵
  
  # 设置矩阵值
  set <- function(y) {
    x <<- y
    inv <<- NULL  # 如果矩阵改变了，清空缓存的逆矩阵
  }
  
  # 获取矩阵值
  get <- function() x
  
  # 设置缓存的逆矩阵值
  setInverse <- function(inverse) inv <<- inverse
  
  # 获取缓存的逆矩阵值
  getInverse <- function() inv
  
  # 返回一个包含所有函数的列表
  list(set = set, get = get,
       setInverse = setInverse, getInverse = getInverse)
}
cacheSolve <- function(x, ...) {
  # 检查缓存中是否已有逆矩阵
  inv <- x$getInverse()
  
  # 如果缓存中已有逆矩阵，直接返回缓存值
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # 如果缓存中没有逆矩阵，计算并缓存结果
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)  # 缓存逆矩阵
  inv
}
