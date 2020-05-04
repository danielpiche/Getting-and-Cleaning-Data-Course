## This function merges the training set and test sets from the Samsung accelorometer reading
## then writes two data sets and returns a data frame, which is the averages of the means and standard deviations grouped by Activity and Subject. 
run_analysis <- function() {
    
    ## Verify the zipfile is in the working directory
    if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
        error_msg<-paste("You must have getdata_projectfiles_UCI HAR Dataset.zip in your working directory:",getwd())
        stop(error_msg)
    }
    
    ## Unzip the file and move to that subdirectory
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
    setwd("UCI HAR Dataset")
    
    ## Read data sets
    activity_labels<-read.table("activity_labels.txt", header=FALSE, sep=" ", col.names=c("activity_id", "activity"))
    features<-read.table("features.txt", header=FALSE, sep=" ", col.names=c("feature_id", "feature"))
    cleanedFeatures <- data.frame(lapply(features, function(x) {gsub("[()-]", "", x)}))
    
    subject_test<-read.table("./test/subject_test.txt", header=FALSE, col.names="Subject")
    test_vector<-c(rep("Test",nrow(subject_test)))
    x_test<-read.table("./test/X_test.txt", header=FALSE, col.names=cleanedFeatures[,2])
    y_test<-read.table("./test/Y_test.txt", header=FALSE, col.names="Activity")
    test_data<-cbind(test_vector,subject_test, y_test, x_test)
    names(test_data)[1]<-"Data Set"
    
    subject_train<-read.table("./train/subject_train.txt", header=FALSE, col.names="Subject")
    train_vector<-c(rep("Train",nrow(subject_train)))
    x_train<-read.table("./train/X_train.txt", header=FALSE, col.names=cleanedFeatures[,2])
    y_train<-read.table("./train/Y_train.txt", header=FALSE, col.names="Activity")
    train_data<-cbind(train_vector,subject_train, y_train, x_train)
    names(train_data)[1]<-"Data Set"
    
    all_data<-rbind(test_data, train_data)
    mean_std_data_prep<-all_data[,grep("Data Set|Subject|Activity|[Mm]ean|[Ss]td",names(all_data))]
    
    ## First tidy Data Set: Extract mean and standard deviation columns
    mean_std_data<-mean_std_data_prep[,-grep("[Aa]ngle|[Ff]req",names(mean_std_data_prep))]
    
    ## Preparation for creating second tidy data set
    averages_prep_data<-mean_std_data[,2:69]
    library(dplyr)
    
    ## Second tidy data set with the average of each variable for each activity and each subject
    averages_data<-averages_prep_data %>% group_by(Activity, Subject) %>% summarise_each(list(average = ~mean(.)))
    
    setwd("..")
    write.csv(mean_std_data, "mean_std_data.csv", row.names=FALSE)
    write.csv(averages_data, "averages_data.csv", row.names=FALSE)
    
    return(averages_data)
}