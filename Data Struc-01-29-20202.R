# Test 
rm(list=ls())
x <- data.frame(norm_dat = rnorm(5),pois_dat = rpois(5,lambda=1))
l <- list(1:2,3:4,5:6,7:8,9:10)
x
#x$L2 <- l 
data.frame(x,"L3"=I(l))
