---
title: "ReadMe"
author: "Bugata"
date: "Saturday, August 23, 2014"
output: html_document
---

###Introduction###
This is a read me document detailing out the process followed to complete **Getting and Cleaning Data** course project

Along with read me file you would find the following three files in the repository  
1. *run_analysis.R*    
2. *codebook.pdf*  
3. *tidydata2.txt*     

####run_analysis.R####
Course project required the following activities to be completed, which are automated in *run_analysis.R* script.   
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive variable names.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   


While the script contains detailed comments, I intended to describe high level the process I followed here.
File X_test.txt containing the **test** dataset is combined with *subject* (subject_test.txt) and *activity* (y_test.txt) data sets. Similarly **train** data set is combined with its *subject* and *activity* data. Following this both test and train data sets are combined to form a **master data set.**

I decided to add the *features* from features.txt as column labels (in addition to "Subject", "Activity" labels for the respective columns). I did this inorder to leverage column labels to extract out **mean** and **standard deviation** related columns from the rest.   

Further on the trimmed data frame, I have applied recommended text variable formatting, such as converting the labels to lowercase, taking out *hypens* "-" and *brackets* "()" to make the column labels readable. I must admit that original column labels were more readable than what this excercise did to them. However, i'm merely following the instructions.

After this, in order to create the second tidy data set, I have **melted** the data frame from the above excercise with Subject and Activity columns as **IDs** and rest as **variables**. I then leveraged the melted data frame and **casted** it to compute the **averages** of each variable for each Subject and Activity.

The resultant data frame is written to "tidydata2.txt" file using **write.table()** function with **row.names** set to FALSE


####codebook.pdf####
This file describes the data in the tidydata2.txt



####tidydata2.txt####
This is the data file containing averages of each variable for each Subject and Activity produced by the run_analysis.R script.   
Best way to read the data is to use the following code to read it as a data frame back into R.

**read.table("tidydata2.txt", header=TRUE)**

The code assumes tidydata2.txt is in your *working* directory

