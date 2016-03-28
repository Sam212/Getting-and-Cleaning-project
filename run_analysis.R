
require("dplyr")

#Set the working drive at the intended file destination setwd("destPath ")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",paste(getwd(),"/Ass4.zip",sep = ""),method = "curl")

#Read feature names into a data frame
featNames <- read.table("UCI HAR Dataset/features.txt")

#Extract feature names and save them into a feature vector
colNames = colNames <- t(featNames)[2,]

#Read trainig and test data
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = colNames)
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = colNames )

#Combine test and train data by row and assign combined matrix to Xcombined
Xcombined <- rbind(Xtest,Xtrain)

#Extract the standard deviation and the mean columns using grep then combine them using cbind
meanSTD <- cbind(Xcombined[,grep("mean",names(Xcombined))],Xcombined[,grep("std",names(Xcombined))])

#Make the names more desceptive by running regular expressions on them
names(meanSTD)<- sub("\\.\\.\\.","",names(meanSTD))
names(meanSTD)<- sub("\\.\\.","",names(meanSTD))

#Calculate mean for each variable using colNames
 colMeans <- colMeans(meanSTD)









