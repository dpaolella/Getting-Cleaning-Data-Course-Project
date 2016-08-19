# Import packages
packages <- c("dplyr", "tidyr", "stringr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# Import data
features <- read.table("./features.txt")
features <- as.vector(features$V2)
features <- c("subject", "label", features)

activity_labels <- read.table("./activity_labels.txt")
activity_labels <- rename(activity_labels, label = V1, activity = V2)

x_test <- read.table("./X_test.txt")
y_test <- read.table("./y_test.txt")
subject_test <- read.table("./subject_test.txt")

x_train <- read.table("./X_train.txt")
y_train <- read.table("./y_train.txt")
subject_train <- read.table("./subject_train.txt")

# Stack test and train data
test <- cbind(subject_test, y_test, x_test)
test$group <- "test"
train <- cbind(subject_train, y_train, x_train)
train$group <- "train"
dt <- rbind(test, train)

# Define column names using the features data set
colnames(dt) <- features

# Attach activity names to activity labels
dt <- merge(activity_labels, dt, by = "label")

# Keep only the columns mean and standard deviation for each measurement
columns_keep <- colnames(dt) %in% c("subject", "label" ,"activity", "group") | 
  grepl("mean()|std()", colnames(dt))
columns_keep <- colnames(dt)[columns_keep]

dt <- dt[columns_keep]

dt <- dt %>% 
  gather(variable, value, -label, -activity, -subject) %>%
  select(subject, activity, variable, value)

# Create a tidy data set with the average of each variable for each activity and each subject.
tidy <- dt %>% 
  group_by(subject, activity, variable) %>% 
  summarise(avg = mean(value))

# Write tidy data set to tab-delimited file
write.table(tidy, "tidy.txt", sep="\t", row.name=FALSE)
