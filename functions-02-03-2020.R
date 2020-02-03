# Functions - 02/03/2020

# Primitive functions 

# Only exist in base package

make.df <- function(num_row,mu = 7,sigma = 3, theta = 1080,trials = 120,p = .65 ,age.range=4:10,
                    probs=c(.05,.10,.40,.15,.15,.10,.05),noise=.25){
  
  score <- rnorm(n=num_row,mean = mu,sd= sigma)
  fix <- rpois(n = num_row, lambda = theta)
  nback <- rbinom(n=num_row,size = trials, prob = p)
  cond <- factor(rep(1:3, each = num_row/3),labels = c('easy','inter','hard'))
  
  
  r.age <- function(){
    rand.age <- sample(age.range,size = num_row,replace = T, prob = probs) + rnorm(num_row,sd=noise)
    return(rand.age)
  }
    
  ages <- r.age()
  
  
  return(data.frame(score,fix,nback,cond,ages))
  
}

test <- make.df(num_row = 120)

test
