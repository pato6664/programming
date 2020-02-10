# 02-10-2020
 # Go and simulate data 
test2[,"score"]
test2[which(test2$cond %in% c('Lvl 1','Lvl 2')),]


# 'with' function can be useful 

test2 <- test2[order(test2$cond),]

mean.test <-with(test2, tapply(score, list(cond), mean))
mean.test # Returns a table 
aggregate(c(score)~cond,FUN=mean,data=test2) # Returns a dataframe 

