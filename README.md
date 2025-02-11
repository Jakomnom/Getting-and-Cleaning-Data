# README: Human Activity Recognition Data Processing

## Overview
This R script downloads, processes, and tidies the Human Activity Recognition (HAR) dataset collected from smartphone accelerometers. The final output is a clean dataset that contains the average values of selected measurements for each subject and activity.

## Dataset Source
The data is obtained from the UCI Machine Learning Repository:
[UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Script Workflow
1. **Download and Unzip Data**: The script fetches the dataset from the provided URL and extracts the files.
2. **Load Activity Labels and Features**:
   - Reads activity labels and feature names.
   - Extracts only the measurements on mean and standard deviation.
   - Cleans and renames feature names for clarity.
3. **Load and Process Data**:
   - Reads train and test datasets.
   - Loads corresponding activity and subject identifiers.
   - Merges subject, activity, and measurement data.
4. **Merge Train and Test Data**:
   - Combines both datasets into a single structured data table.
   - Converts activity labels into descriptive factors.
   - Converts subject numbers into factor variables.
5. **Reshape Data**:
   - Uses `melt` and `dcast` functions to calculate the mean for each variable, grouped by subject and activity.
6. **Save the Final Dataset**:
   - Writes the cleaned dataset to `tidyData.txt`.

## Dependencies
The script requires the following R packages:
- `data.table`
- `reshape2`
- `gsubfn`
- `pacman` (for managing package loading)

If any package is missing, the script installs it automatically.

## How to Run the Script
1. Ensure R is installed on your system.
2. Open an R session or RStudio.
3. Run the script using:
   ```r
   source("run_analysis.R")
   ```
4. The final output will be saved as `tidyData.txt` in the working directory.

## Output
- **tidyData.txt**: A cleaned and processed dataset where each row represents the mean values of selected measurements for a specific subject and activity.

## Notes
- If `fwrite` fails, replace it with `write.table(testTrain, file = "tidyData.txt", row.names = FALSE)`.
- The script is designed to be efficient and modular by using a function to process train and test data.

## License
This project is based on open-source data from the UCI Machine Learning Repository. You are free to modify and distribute this script as needed.

