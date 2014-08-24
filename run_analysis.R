## Reading test along with subject and activity data files

xTe <- read.table("test/X_test.txt")
subjectTestVar <- read.table("test/subject_test.txt")
yTestActivityVar <- read.table("test/y_test.txt")

xTe <- cbind(subjectTestVar,yTestActivityVar,xTe)


## Reading train along with subject and activity data files

xTr <- read.table("./train/X_train.txt")
subjectTrainVar <- read.table("train/subject_train.txt")
yTrainActivityVar <- read.table("train/y_train.txt")

xTr <- cbind(subjectTrainVar,yTrainActivityVar,xTr)

## Merge Test and Train Data files

xComb <- rbind(xTe,xTr)

## Get Feature names and use them to label the variables in Xcomb
featuresVar <- read.table("./features.txt")
cNames <- as.character(featuresVar$V2)

colnames(xComb) <- c("Subject", "Activity",cNames)

## Extract mean and std columns
xCombTrim <- xComb[,c(1,2,grep("mean\\(\\)",names(xComb)),
                      grep("std\\(\\)",names(xComb)))]

## Get Activity Labels and add them to the XComb
activityLabelsVar <- read.table("activity_labels.txt")

xCombTrim[,2] <- factor(xCombTrim[,2],labels=activityLabelsVar$V2)

## Make the variable names more descriptive

names(xCombTrim) <- tolower(names(xCombTrim))
names(xCombTrim) <- gsub("-|\\()", "",names(xCombTrim))

## Calculate the mean of variables per Subject and Activity

mDataSet <- melt(xCombTrim, id=c("subject","activity"))
cDataSet <- cast(mDataSet,subject+activity~variable,mean)

write.table(cDataSet, file="tidydata2.txt", row.names=F)





