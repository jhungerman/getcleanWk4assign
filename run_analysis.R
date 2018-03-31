#load various packages
library(dplyr)
library(tidyr)
#assign location
#get the training data and assign to variables
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#get the test data and assign to variables
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#get variable names
#select only v2
#convert to data frame
var_name_x <- as.data.frame(read.table("./UCI HAR Dataset/features.txt")[,2], stringsAsFactors = FALSE)
colnames(var_name_x) <- c("variables")
var_name_x$variables <- as.character(var_name_x$variables)
#apply variable names to test and train (x) sets
colnames(train_x) <- c(var_name$variables)
colnames(test_x) <- c(var_name$variables)
#get activity labels
act_lab <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
colnames(act_lab) <- c("number", "activity")
#merge the various test and train sets
full_x <- rbind(test_x, train_x)
full_y <- rbind(test_y, train_y)
full_sub <- rbind(test_sub, train_sub)
#add col name to y
colnames(full_y) <- c("number")
#add col name to sub
colnames(full_sub) <- c("subject")
#select only mean or std cols from x
select_cols <- grep("mean\\(\\)|std\\(\\)", colnames(full_x))
full_x <- full_x[,select_cols]
#merge subject and y data to x data
full_set <- cbind(full_sub, full_x, full_y)
#merge y data with activity labels
full_set_m <- merge(full_set, act_lab, by = "number")
#create tidy data set to average by activity and subject
tidy_table <- full_set_m %>% group_by(subject, activity) %>% summarize_all(mean)
#create new table in .txt format with resulting dataset
write.table(tidy_table, file = "./wk4assignment/wk4Assign_tidy.txt", row.names = FALSE)