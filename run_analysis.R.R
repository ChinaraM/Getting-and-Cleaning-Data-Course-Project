##Downloading files

URL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
File <-"UCI HAR Dataset.zip"

if (!file.exists(File)) {
  download.file(URL,File, mode = "wb")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(File)
}

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##Merging data sets

Subject_total <- rbind(subject_train, subject_test)
x_total <- rbind(x_train, x_test)
y_total <- rbind(y_train, y_test)
final_data<-cbind(Subject_total,x_total,y_total)

##Extracting needed data

colnames(final_data) <- c("subject", features[, 2], "activity")
saved_col <- grepl("subject|activity|mean|std", colnames(final_data))
final_data <- final_data[,saved_col]

##Naming activities in the data set

final_data$activity <- factor(final_data$activity, levels = activities[, 1], labels = activities[, 2])
final_col <- colnames(final_data)

##Appropriately labels the data set with descriptive variable names

final_col <- gsub("[\\(\\)-]", "", final_col)

final_col <- gsub("BodyBody", "Body", final_col)
final_col <- gsub("^f", "frequencyDomain", final_col)
final_col <- gsub("Freq", "Frequency", final_col)
final_col <- gsub("Acc", "Accelerometer", final_col)
final_col <- gsub("angle", "Angle", final_col)
final_col <- gsub("tBody", "TimeBody", final_col)
final_col <- gsub("std", "StandardDeviation", final_col)
final_col <- gsub("mean", "Mean", final_col)
final_col <- gsub("Mag", "Magnitude", final_col)
final_col <- gsub("Gyro", "Gyroscope", final_col)
final_col <- gsub("gravity", "Gravity", final_col)
colnames(final_data) <- final_col

##Creating second independent tidy data set

tidy_data <- final_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)




