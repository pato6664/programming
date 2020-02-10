# Functions - 02/03/2020
library(gtools)
# Primitive functions 

# Only exist in base package

make.df <- function(num_row,mu = 7,sigma = 3, theta = 1080,trials = 120,p = .65 ,age.range=4:10,
                    probs=c(.05,.10,.40,.15,.15,.10,.05),noise=.25,nlevels=5){
  
  if(num_row %% nlevels != 0){
   cat("Sample size must be divisible by number of levels",nlevels)  
    
  }
  else{
    
    score <- rnorm(n=num_row,mean = mu,sd= sigma)
    fix <- rpois(n = num_row, lambda = theta)
    nback <- rbinom(n=num_row,size = trials, prob = p)
    cond <- factor(rep(1:nlevels, each = num_row/nlevels),labels = paste('Lvl',1:nlevels))
    ages <- sample(age.range,size = num_row,replace = T, prob = probs) + rnorm(num_row,sd=noise)
  }

  # Functions always return the last line of function
  return(data.frame(score,fix,nback,cond,ages))
  
}


#dirichlet <- rdirichlet(1,c(5,10,40,15,15,10,5))

test2 <- make.df(num_row = 500, probs = as.numeric(rdirichlet(1,c(5,10,40,15,15,10,5))))


# Switch function - useful when we have multiple cases 
# Requires a lot of playing around with to get used to 

