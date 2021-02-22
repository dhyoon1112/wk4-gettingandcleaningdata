setwd('C:/Users/dyoon/Desktop/R Coursera')

#Download and Unzip the file
if(!file.exists('./wk4data')) {dir.create('./wk4data')}
fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileurl, destfile = './wk4data/projectdataset.zip')
unzip(zipfile = './wk4data/projectdataset.zip', exdir = './wk4data')

# "Test" Data
subjecttest <- read.table('./wk4data/UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = '', dec = '.')
xtest <- read.table('./wk4data/UCI HAR Dataset/test/X_test.txt', header = FALSE, sep = '', dec = '.')
ytest <- read.table('./wk4data/UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = '', dec = '.')

# "Training" Data
subjecttrain <- read.table('./wk4data/UCI HAR Dataset/train/subject_train.txt', header = FALSE, sep = '', dec = '.')
xtrain <- read.table('./wk4data/UCI HAR Dataset/train/X_train.txt', header = FALSE, sep = '', dec = '.')
ytrain <- read.table('./wk4data/UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = '', dec = '.')

# Features and Activity Labels
activitylabels <- read.table('./wk4data/UCI HAR Dataset/activity_labels.txt')
features <- read.table('./wk4data/UCI HAR Dataset/features.txt', header = FALSE, sep = '', dec = '.')

# Assign column headers
column_names_for_x <- features[,2]
colnames(xtest) <- column_names_for_x
colnames(xtrain) <- column_names_for_x

column_names_for_y <- 'y_id'
colnames(ytest) <- column_names_for_y
colnames(ytrain) <- column_names_for_y

column_names_for_subject <- 'subject_id'
colnames(subjecttest) <- column_names_for_subject
colnames(subjecttrain) <- column_names_for_subject

colnames(activitylabels) <- c('activity_id', 'activity')

# Concatenate all the data
test <- cbind(xtest, subjecttest, ytest)
train <- cbind(xtrain, subjecttrain, ytrain)
testandtrain <- rbind(test, train)

# Answer for 1:
print(testandtrain)

#################

# Mean and Stdev for each measurement
y_id_check <- grepl('y_id', colnames(testandtrain))
subject_id_check <- grepl('subject_id', colnames(testandtrain))
mean_check <- grepl('*mean*', colnames(testandtrain))
std_check <- grepl('*std*', colnames(testandtrain))


mean_and_std <- testandtrain[, y_id_check == TRUE | subject_id_check == TRUE | mean_check == TRUE | std_check == TRUE]

# Answer for 2:
print(mean_and_std)

#################
mean_and_std_labeled <- merge(mean_and_std
                                , activitylabels
                                , by.x = 'y_id'
                                , by.y = 'activity_id'
                                , all.x = TRUE)

# Answer for 3 & 4:
print(mean_and_std_labeled)

# Answer for 5:
tidy <- data.frame(mean_and_std_labeled)
print(apply(tidy,2,mean))