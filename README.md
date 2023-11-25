## Data Cleaning for Nashville Housing Project

### Overview
This project focuses on cleaning and standardizing the data in the "NashvilleHousing" dataset to ensure consistency and accuracy. The cleaning process involves handling null values, standardizing date formats, splitting and renaming columns, parsing address information, replacing values, removing duplicates, and dropping redundant columns.

### Steps

#### 1. Standardize Date Format
- Adjusted the date format in the "SaleDate" column to ensure uniformity.

#### 2. Investigate Nulls within PropertyAddress
- Examined and identified rows with null values in the "PropertyAddress" column.

#### 3. Populate PropertyAddress
- Filled null values in the "PropertyAddress" column by matching ParcelID values in the dataset.

#### 4. Split PropertyAddress Field
- Created new columns "Property Address" and "City" by splitting the "PropertyAddress" field based on a comma.

#### 5. Rename Column
- Renamed the "City" column to "Property City" for clarity.

#### 6. Parse OwnerAddress Field
- Extracted and separated components of the "OwnerAddress" field into new columns: "Owner Address," "Owner City," and "Owner State."

#### 7. Replace Values in SoldAsVacant
- Replaced values in the "SoldAsVacant" column, changing 'Noo' to 'No' and 'Y' to 'Yes' for consistency.

#### 8. Remove Duplicates
- Removed duplicate rows based on specified criteria, keeping only the first occurrence.

#### 9. Drop Redundant Columns
- Removed redundant columns "PropertyAddress" and "OwnerAddress" from the dataset.

This cleaned dataset is now more structured and ready for further analysis or integration into other processes.
