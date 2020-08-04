# The Follow-up of &Uuml;ber-cool Students: The *F&Uuml;N* Study

This is a simulated dataset for instructional purposes, to be used as part of the 
Harvard University Population Health Science (PHS) PhD End of Summer Camp
Workshop. The F&Uuml;N Study is a survey of doctoral students pursuing health
related degrees. As part of the study, information on the following variables 
was collected: 

- `W`: Whether the student is currently in their "dissertating" stage of their PhD career. 
- `A.con`: The number of hours a student slept last night.
- `A.bin`: Whether the student slept at least 8 hours last night.
- `Y.con`: The number of times a student used a food delivery service last week (as opposed to cooking).
- `Y.bin`: Whether the student used a food delivery service for more than 50\% of the week's meals

During the primary wave of data collection, a large sample of 100,000 doctoral students were surveyed. 
Data on these individuals can be found in "data/FUN_data_100000obs.csv". Six months later, a smaller sample
of 50 doctoral students from a recently-opened small academic institution participated in the study. 
Data on this smaller subsample can be found in "data/FUN_data_50obs.csv". 

To download this data to your local computer directly from GitHub, you can use the following commands in `R`:


	# install.packages("RCurl") # install RCurl package if you don't have it already
	library(RCurl)

	# Load large dataset
	big.url <- getURL("https://raw.githubusercontent.com/leem26/theFUNStudy/master/data/FUN_data_100000obs.csv")
	big.FUN <- read.csv(text = big.url)

	# Load small dataset
	small.url  <- getURL("https://raw.githubusercontent.com/leem26/theFUNStudy/master/data/FUN_data_50obs.csv")
	small.FUN  <- read.csv(text = small.url)

