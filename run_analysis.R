# Load necessary packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(data.table, reshape2, gsubfn)

# Download and unzip dataset
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
unzip(temp)
unlink(temp)  # Remove temp file

# Load activity labels and features
activityLabels <- fread("UCI HAR Dataset/activity_labels.txt", col.names = c("classLabels", "activityNames"))
features <- fread("UCI HAR Dataset/features.txt", col.names = c("index", "featureNames"))

# Extract required features
featuresNeeded <- grep("(mean|std)\\(\\)", features$featureNames)
measurements <- gsubfn("(^t|^f|Acc|Gyro|Mag|BodyBody|\\(\\))",
                       list("t"="Time", "f"="Frequency", "Acc"="Accelerometer", "Gyro"="Gyroscope", 
                            "Mag"="Magnitude", "BodyBody"="Body", "()"=""), 
                       features$featureNames[featuresNeeded])

# Function to load and merge datasets
load_data <- function(type) {
  x_data <- fread(paste0("UCI HAR Dataset/", type, "/X_", type, ".txt"))[, featuresNeeded, with = FALSE]
  setnames(x_data, colnames(x_data), measurements)
  
  activity <- fread(paste0("UCI HAR Dataset/", type, "/y_", type, ".txt"), col.names = "Activity")
  subject <- fread(paste0("UCI HAR Dataset/", type, "/subject_", type, ".txt"), col.names = "SubjectNo.")
  
  cbind(activity, subject, x_data)
}

# Load train and test data
train <- load_data("train")
test <- load_data("test")

# Merge datasets
testTrain <- rbindlist(list(train, test))

# Convert columns to factors
testTrain[, Activity := factor(Activity, levels = activityLabels$classLabels, labels = activityLabels$activityNames)]
testTrain[, SubjectNo. := as.factor(SubjectNo.)]

# Reshape and aggregate data
tidyData <- dcast(melt(testTrain, id.vars = c("SubjectNo.", "Activity")), SubjectNo. + Activity ~ variable, mean)

# Save tidy data
# fwrite(tidyData, file = "tidyData.txt")
fwrite(tidyData, file = "tidyData.txt", row.names = FALSE)

