---
title: "CodeBook.md"
author: "Daniel Piche"
date: "03/05/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Analysis Steps Performed

I performed an analysis of the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) using the script run_analysis.R (provided as a separate file) in order to generate two data sets, namely:  

1. mean_std_data.csv  
2. averages_data.csv

### mean_std_data.csv

The mean_std_data.csv dataset contains the following columns from measurements of an accelerometer place on a studied individual:  

* Data Set: Whether the row was test or training data  
* Subject: The individual in the study to which the data pertains (1-30 indivuals were studied)  
* Activity: The type of activity the subject was performing for that row of data (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
  
The other columns refer to the mean and standard deviation along the -XYZ axis for various measurements performed by the accelerometer. From the dataset features_info.txt file:  

> The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).   

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions._   

### averages_data.csv

The averages_data.csv dataset summarizes the data from the mean_std_data.csv dataset by taking the mean of each column grouped by the columns Activity and Subject.

### run_analysis.R

The script run_analysis.R returns the averages_data dataframe.
