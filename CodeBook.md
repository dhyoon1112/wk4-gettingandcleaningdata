Variables:
Reading files
'Test' Data: subjecttest, xtest, ytest
'Train' Data: subjecttrain, xtrain, ytrain
'Activity and Features': activitylabels, features

Column Naming
column_names_for_x, column_names_for_y, column_names_for_subject

Combining the data
test, train, testandtrain

Finding columns for mean and standard deviation
y_id_check, subject_id_check, mean_check, std_check, mean_and_std

Appending the activitylabels list
mean_and_std_labeled

Tidying the data
tidy_subject, tidy_activity, tidy

1. Starts by downloading the zip file, ./wk4data/projectdataset.zip, and unzipping it
2. Reads the test files: subject_test.txt, X_test.txt, y_test.txt
3. Reads the train files: subject_train.txt, X_train.txt, y_train.txt
4. Reads the activity_lables.txt and features.txt files
5. Appends the column headers for the X_test and X_train data
6. Appends the column headers for the y_test and y_train data
7. Appends the column headers for the subject_test and subject_train data
8. Combines the test data and train data
9. Output answer for 1
10. Find all instances of y_id, subject_id, mean, and std in their respective data tables (y_id_check, subject_id_check, mean_check, std_check)
11. Find only the columns where only the check columns are available as mean_and_std
12. Output answer for 2
13. Append the activity labels to the mean_and_std table
14. Output answer for 3 & 4
15. Find the mean for every subject_id and activity respectively
16. Combine subject_id and activity into tidy
16. Output answer for 5
