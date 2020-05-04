---
title: "REAMDE.md"
author: "Daniel Piché"
date: "03/05/2020"
output: html_document
---

# Getting and Cleaning Data Course Project Assignment

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Getting Started

These instructions will get you a copy of the scrip run_analysis.R and allow you to run it on your local machine.

## CodeBook.md

The file CodeBook.md contains the details of the datasets resulting from the analysis.

### Prerequisites

What things you need to install the software and how to install them

```
1. The software R is required.
2. The following command should be run in R to install the dplyr package:
        install.packages("dplyr")
3. You must have downloaded the Samsung data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
```

### Installing

Save the run_analysis.R script in your R working directory. If you aren't sure what that is, run R and then type the command:

```
getwd()
```

Place the Samsung data file in your working directory. It must have the following name, which is the name created during the download:

```
getdata_projectfiles_UCI HAR Dataset.zip
```

Load the run_analsyis.R script

```
source("run_analysis.R")
```

Run the script. It returns the tidy dataset from Steo 5 of the assignment, namely the averages of the means and standard deviations grouped by Activity and Subject. You can store them in an object if you like.

```
data_sets<-run_analysis()
```

The script also writes both data sets to the following files in the original working directory retrieves with the getwd() command:

```
mean_std_data.csv
averages_data.csv
```

You can then analyze the data from the files or from the object returned by the run_analysis.R script.

Enjoy!
