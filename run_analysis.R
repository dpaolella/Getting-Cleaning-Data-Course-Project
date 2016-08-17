# Import packages
packages <- c("dplyr", "tidyr", "stringr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# Set working directory
dir <- "insert pathname here"
setwd(dir)

# Import data
features <- read.table("./features.txt")
features <- as.vector(features$V2)
features <- c("subject", "label", features)

activity_labels <- read.table("./activity_labels.txt")
activity_labels <- rename(activity_labels, label = V1, activity = V2)

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Stack test and train data
test <- cbind(subject_test, y_test, x_test)
test$group <- "test"
train <- cbind(subject_train, y_train, x_train)
train$group <- "train"
dt <- rbind(test, train)
colnames(dt) <- features
dt <- merge(activity_labels, dt, by = "label")

# Keep only the columns mean and standard deviation for each measurement.
columns_keep <- colnames(dt) %in% c("subject", "label" ,"activity", "group") | 
  grepl("mean()|std()", colnames(dt))
columns_keep <- colnames(dt)[columns_keep]

dt <- dt[columns_keep]

dt <- dt %>% 
  gather(variable, value, -label, -activity, -subject) %>%
  select(subject, activity, variable, value)

# Create a tidy data set with the average of each variable for each 
# activity and each subject.
tidy <- dt %>% 
  group_by(subject, activity, variable) %>% 
  summarise(avg = mean(value))
