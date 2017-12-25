run_analysis <- function() {
	     ### Read in Files
	     X_train = read.table("UCI_HAR_Dataset/train/X_train.txt")
	     X_test = read.table("UCI_HAR_Dataset/test/X_test.txt")
	     y_train = read.table("UCI_HAR_Dataset/train/y_train.txt")
	     y_test = read.table("UCI_HAR_Dataset/test/y_test.txt")
	
     
	     ### Merge training and test
	     X_all <- rbind(X_test, X_train)
	     y_all <- rbind(y_test, y_train)


	     ### Extract mean and Standard Deviation information
	     headers = read.table("UCI_HAR_Dataset/features.txt") # read in the column names they used
	     (combined <- paste(headers[[2]], collapse='\n')) # convert from rows to columns
	     (split.list <- strsplit(combined[[1]], '\\n')) 
	     colnames(X_all) <- split.list[[1]]	    # Assign the column names they used to my new combined data
	     mean_loc <-grep("mean", names(X_all))  #Pick out means
	     std_loc <-grep("std", names(X_all))    #Pick out standard deviations
	     new_cols <- c(mean_loc, std_loc)	    #Make one array that has both means and stdev
	     X_cut <- X_all[new_cols]		    #Cut Big array to just those
	     

	     ### Add a column of factor for activity labels
	     activity_lables <- c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying")
	     act.factor <- factor(activity_lables)
	     y_all <- data.frame(apply(y_all, 2, as.factor))
	     levels(y_test$V1) <- act.factor
	     X_cut$activity <-y_all$V1
 	     

	     ### Change variable names 
	     new_names <- names(X_cut)
	     new_names <- tolower(new_names)
	     new_names <- gsub("^f","freq", new_names)	  	     # f -> frequency
	     new_names <- gsub("^t","time", new_names)    # t -> time
	     new_names <- gsub("[[:punct:]]","", new_names)


	     ### create tidy with averages for each activity label!
	     m <- length(new_cols)+1
	     X_tidy <- matrix(1:6,1:6, ncol = m, nrow = 6, dimnames = list(activity_lables, new_names))
	     for (i in 1:m) { ### In process
	     	 X_tidy[,i] <- with(X_cut, tapply(as.numeric(X_cut[,i]), X_cut$activity, mean))
	     }
	     
	     
	     ### Write out tidy data set
	     write.table(X_tidy, file = "UCI_HAR_Dataset/tidy_data.txt")
}