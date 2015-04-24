### First setup working directory
#setwd("/Users/Wei/Documents/Coursera/getting_cleaning_data/")

### Step 1: Merges the training and the test sets to create one data set
train <- read.table("UCI HAR Dataset/train/X_train.txt", header=F)
test <- read.table("UCI HAR Dataset/test/X_test.txt", header=F)
all <- rbind(train, test)

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
label <- read.table("UCI HAR Dataset/features.txt", header=F)
l1 <- grep('mean\\(\\)',label$V2)
l2 <- grep('std\\(\\)', label$V2)

### Step 3: Uses descriptive activity names to name the activities in the data set
### Step 4: Appropriately labels the data set with descriptive variable names
label <- label[c(l1,l2),]
label <- label[order(as.numeric(label$V1)),]

label$V2 <- gsub('-','_', label$V2)
label$V2 <- gsub('\\(','', label$V2)
label$V2 <- gsub('\\)','', label$V2)
label$V1 <- paste("V", label$V1,sep="")

vars <- names(all)[names(all) %in% label$V1]
final <- all[,vars]
names(final) <- label$V2

# handle activity labels
train_label <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)
test_label <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)
all_act_label <- rbind(train_label,test_label)
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)
names(activity_label) <- c("V1","activity")

sub_train_label <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F)
sub_test_label <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
all_sub_label <- rbind(sub_train_label, sub_test_label)
names(all_sub_label) <- "subject"

final <- cbind(all_act_label$V1, all_sub_label$subject, final)
names(final)[c(1,2)] <- c("V1", "subject")
final2 <- merge(activity_label, final, by.x = "V1")
final2 <- final2[,-1]

#### Step 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject
names(final2) # check each valieble in the final dataset
result <- aggregate(final2[,3],list(final2$activity,final2$subject), mean)
for (i in 4:68) {
  tmp <- aggregate(final2[,i],list(final2$activity,final2$subject), mean)
  result <- cbind(result,tmp[,3]) 
}
names(result) <- names(final2)


### output final dataset
write.table(result, file = "project.txt", row.names = F )


