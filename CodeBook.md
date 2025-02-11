# CodeBook: Human Activity Recognition Data Processing

## Overview
This CodeBook describes the dataset processed by `run_analysis.R`, including details about variables, data transformations, and cleaning steps.

## Source Data
The dataset originates from the UCI Machine Learning Repository:
[UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Raw Data Files Used:
- `activity_labels.txt`: Links activity class labels with activity names.
- `features.txt`: Contains the names of all measured features.
- `X_train.txt`, `y_train.txt`, `subject_train.txt`: Training data (measurements, activity labels, subjects).
- `X_test.txt`, `y_test.txt`, `subject_test.txt`: Test data (measurements, activity labels, subjects).

## Data Processing Steps
1. **Downloading and Extracting Data**:
   - The dataset is downloaded and extracted to the working directory.
2. **Loading and Cleaning Features**:
   - Only mean and standard deviation (`mean()` and `std()`) measurements are selected.
   - Feature names are cleaned and made more descriptive.
3. **Loading and Merging Train & Test Data**:
   - Activity and subject identifiers are merged with corresponding measurement data.
   - Train and test datasets are combined into a single dataset.
4. **Transformations**:
   - Activity labels are converted to descriptive factors.
   - Subject numbers are converted into factor variables.
   - Data is reshaped using `melt` and `dcast` to compute averages.
5. **Exporting Final Dataset**:
   - The cleaned dataset is written to `tidyData.txt`.

## Variables in the Final Dataset

### Identifiers:
- `SubjectNo.`: Factor variable identifying the subject (1-30).
- `Activity`: Factor variable describing the activity performed (e.g., Walking, Sitting).

### Measurement Variables:
All measurement variables represent the mean values calculated for each subject and activity. They include:

- `TimeBodyAccelerometerMeanX`
- `TimeBodyAccelerometerMeanY`
- `TimeBodyAccelerometerMeanZ`
- `TimeBodyAccelerometerStdX`
- `TimeBodyAccelerometerStdY`
- `TimeBodyAccelerometerStdZ`
- `FrequencyBodyAccelerometerMeanX`
- `FrequencyBodyAccelerometerMeanY`
- `FrequencyBodyAccelerometerMeanZ`
- `FrequencyBodyAccelerometerStdX`
- `FrequencyBodyAccelerometerStdY`
- `FrequencyBodyAccelerometerStdZ`

(Note: The list follows the same pattern for Gyroscope, Magnitude, and other derived features.)

## Summary of Transformations
- **Feature Selection**: Only mean and standard deviation measurements were retained.
- **Descriptive Naming**: Variables were renamed for clarity (e.g., `tBodyAcc-mean()-X` → `TimeBodyAccelerometerMeanX`).
- **Reshaping**: Data was reshaped to create an average for each measurement grouped by subject and activity.

## Output File
- `tidyData.txt`: The final dataset with one row per subject and activity, containing mean values of selected features.

This CodeBook provides a complete description of the dataset, transformations, and output structure.

