
Data Cleaning for Nashville Housing Project
Overview
This project aims to clean and standardize the data in the "NashvilleHousing" dataset, ensuring consistency and accuracy. The cleaning process involves handling null values, standardizing date formats, splitting and renaming columns, parsing address information, replacing values, removing duplicates, and dropping redundant columns.

Steps
Standardize Date Format
Adjusted the date format in the "SaleDate" column to ensure uniformity.
Investigate Nulls within PropertyAddress
Examined and identified rows with null values in the "PropertyAddress" column.
Populate PropertyAddress
Filled null values in the "PropertyAddress" column by matching ParcelID values in the dataset.
Split PropertyAddress Field
Created new columns "Property Address" and "City" by splitting the "PropertyAddress" field based on comma.
Rename Column
Renamed the "City" column to "Property City" for clarity.
Parse OwnerAddress Field
Extracted and separated components of the "OwnerAddress" field into new columns: "Owner Address," "Owner City," and "Owner State."
Replace Values in SoldAsVacant
Replaced values in the "SoldAsVacant" column, changing 'Noo' to 'No' and 'Y' to 'Yes' for consistency.
Remove Duplicates
Removed duplicate rows based on specified criteria, keeping only the first occurrence.
Drop Redundant Columns
Removed redundant columns "PropertyAddress" and "OwnerAddress" from the dataset.
This cleaned dataset is now more structured and ready for further analysis or integration into other processes.
