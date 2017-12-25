Companion to run_analysis.R

             ### Read in Files
	     read in x_train.txt and x_test.txt

             ### Merge training	and test
	     merged them into one large data table with rbind
	     
             ### Extract mean and Standard Deviation information
	     read in the column names from features.txt. Reorder them to be column names 
	     and add them to the large data table. Picked out anything that had mean or 
	     std in the name to be cut into the smaller array. Used grep to do this. 
	     Then created X_cut which is all means and Stdevs.

             ### Add a column of factor	 for activity labels
	     Took the activity labels from y_train.txt and y_test.txt and merged them. Then
	     converted them to factors. Comared them to a factor array or descriptive 
	     activites and had them changed to the descriptive name. Added this column to X_cut.

             ### Change names
	     get rid of special characters, upper case, and spell out time and freq to be a 
	     little more explicit. 

             ### create	tidy with averages!
	     Use the factors to group the data and find the averages for each activity. 

	     ### Write out tidy data set
	     write out to tidy_data.txt in the UCI_HAR_Dataset directory
