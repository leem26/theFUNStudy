#######################################################################
##
## Population Health Science End-of-Summer Camp
## Some sample data to illustrate various concepts
## Working title: "Follow-up of Über-cool New Students: The FÜN Study"
## Author: Team TF
## Last updated: 
   Sys.Date()
##
#######################################################################

# This script generates the following variables:
# A.con   :  Number of hours of sleep a doctoral student received last night
# A.bin   :  Whether the student slept at least 8 hours last night
# W       :  Whether or not the doctoral student is in the "dissertating" phase
# Y.con   :  Number of times the student used a food delivery service last week 
#            (continuous scale, think for meal fractionals like snacks, alcohols)
# Y.bin   :  Whether the student ordered delivery for at least 10.5 meals last week
#            (i.e. half of weekly meals = (7*3)/2 )

generate_fun <- function(n) {

	# exogenous variables
	U.W  = runif(n, min = 1, max = 10)
	U.A  = rnorm(n, mean = 0, sd = 1.5)
	U.Y  = rnorm(n, mean = 0, sd = 1.5)

	# endogenous variables
  W        = as.numeric(U.W > 7.0)
  A.con    = (W == 1)*(5.0 + U.A) + (W == 0)*(7.0 + U.A)
  A.bin    = ifelse(A.con >= 8, 1, 0)
  Y.con    = ifelse(
               (W == 1)*(10.0 + U.Y) + (W == 0)*(3.0 + U.Y) < 0, 0,
               (W == 1)*(10.0 + U.Y) + (W == 0)*(3.0 + U.Y))
  Y.bin    = ifelse(Y.con >= 10.5, 1, 0) # half of weekly meals
  
  # return data.frame object
  return(data.frame(U.W, U.A, U.Y, W, A.con, A.bin, Y.con, Y.bin))
}

set.seed(123)
ObsData.big   <- generate_fun(10000)
ObsData.small <- generate_fun(50)

# plot(density(Y.con[A.bin==1], adjust=2), col="blue") 
# lines(density(Y.con[A.bin==0]), col="red") 

write.csv(ObsData.big,   "data/FUN_data_100000obs.csv", row.names = FALSE)
write.csv(ObsData.small, "data/FUN_data_50obs.csv",     row.names = FALSE)





