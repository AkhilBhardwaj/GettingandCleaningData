run_analysis <- function()
{

	g <- getwd()
  	setwd("./UCI HAR Dataset/")
	activity_labels <- read.table(file="./activity_labels.txt")
	features <- read.table(file="./features.txt")

#Step 1
	setwd("./train")
	subject_train <- read.table("./subject_train.txt")
	y_train <- read.table("./y_train.txt")
	X_train <- read.table("./X_train.txt")

	setwd(g)
  	setwd("./UCI HAR Dataset/test")
	subject_test <- read.table("./subject_test.txt")
	y_test <- read.table("./y_test.txt")
	X_test <- read.table("./X_test.txt")

	subject <- rbind(subject_train,subject_test)
	y <- rbind(y_train,y_test)
	X <- rbind(X_train,X_test)

	names(subject) <- c("Subject")
	names(y) <- c("Activity")
	names(activity_labels) <- c("Activity","ActivityName")

	Data <- cbind(subject,y,X)

# Training & Test Datasets have been merged to create one dataset


#Step 2
	features$V3 <- gsub(pattern = "[-(),]",replacement="",x=features$V2)
	b <- grep("[mM]ean|[sS]td",features$V3)	
	c <-features$V3[b]
	X2 <- subset(X,select=b)

#Xnames <- names(X)
#a <- grep("[mM]ean|[sS]td",names(X))
#b <- Xnames[a]
#X2 <- subset(X,select=b)

#Extracted only the measurements on the mean and standard deviation for each measurement.

#Step 3
	Data <- cbind(subject,y,X2)
	Data2 = merge(Data,activity_labels,by.x="Activity",by.y="Activity",all=TRUE)

#Only descriptive activity names to names have been used to name the activities in the data set

#Step 4
	names(X2) <- c
	Data <- cbind(subject,y,X2)
	Data2 = merge(Data,activity_labels,by.x="Activity",by.y="Activity",all=TRUE)

	DataNames <- names(Data2)
	DataNames2 <- gsub(pattern="^[t]",x=DataNames,replacement="Time")
	DataNames <- DataNames2
	DataNames2 <- gsub(pattern="^[f]",x=DataNames,replacement="Frequency")
	names(Data2) <- DataNames2
#The labels of the data set have been appropriately changed with descriptive variable names.

#Step 5	
	Data3 <- aggregate(. ~Subject+Activity+ActivityName,Data2,mean)
	Data4 <- Data3[order(Data3$Subject,Data3$Activity),]

# creates a second, independent tidy data set with the average of each variable for each activity and each subject. - Done
	setwd(g)
write.table(x=Data4,file="./tidy_data.txt",sep="\t",eol="\n",row.name=FALSE)
	setwd(g)

	return(Data4)
}
