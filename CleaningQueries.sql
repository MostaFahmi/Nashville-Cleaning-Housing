----------Data Cleaning--------------
-------------------------------------
-------------------------------------

SELECT *
FROM NashvilleHousing


-- Standardize Date Format

Alter Table NashvilleHousing Alter Column SaleDate Date


-- Investigating Nulls within ProperyAddress 

SELECT *
FROM NashvilleHousing
WHERE PropertyAddress IS NULL



-- Populate PropertyAddress

UPDATE a
SET a.PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
--SELECT a.[UniqueID], a.ParcelID, a.PropertyAddress,
--		b.[UniqueID ],b.ParcelID,b.PropertyAddress
FROM NashvilleHousing a
JOIN NashvilleHousing b
ON a.ParcelID = b.ParcelID
WHERE a.[UniqueID ] <> b.[UniqueID ]


-- Splitting PropertyAddresse Field

--SELECT SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as  [Property Address],
--SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,len(propertyaddress)) as  [City]
--FROM NashvilleHousing

Alter Table NashvilleHousing Add [Propery Address] varchar(255)
go
UPDATE NashvilleHousing
SET [Propery Address] = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)


Alter Table NashvilleHousing Add [City] varchar(255)
go
UPDATE NashvilleHousing
SET [City] = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,len(propertyaddress))


-- Renaming Column
--EXEC sp_rename 'NashvilleHousing.City' , 'Property City', 'COLUMN' 



-- Parsnaming OwnerAddress Field

--SELECT
--parsename(Replace(OwnerAddress,',','.'),3) as OwnerAddress,
--parsename(Replace(OwnerAddress,',','.'),2) as OwnerCity,
--parsename(Replace(OwnerAddress,',','.'),1) as OwnerState
--FROM NashvilleHousing

Alter Table NashvilleHousing add [Owner Address] varchar(255)
go
Update NashvilleHousing
SET [Owner Address] = parsename(Replace(OwnerAddress,',','.'),3) 

Alter Table NashvilleHousing add [Owner City] varchar(255)
go
Update NashvilleHousing
SET [Owner City] = parsename(Replace(OwnerAddress,',','.'),2)

Alter Table NashvilleHousing add [Owner State] varchar(255)
go
Update NashvilleHousing
SET [Owner State] = parsename(Replace(OwnerAddress,',','.'),1)




-- Replacing any 'N' to 'No' and 'Y' to 'Yes' in SoldAsVacant

--SELECT SoldAsVacant, COUNT(SoldAsVacant)
--FROM NashvilleHousing
--Group by SoldAsVacant
--Order by 2

UPDATE NashvilleHousing
SET SoldAsVacant = 
	Case
	WHEN SoldAsVacant = 'Noo' THEN 'No'
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	ELSE SoldAsVacant
	END

-- Remove Duplicates

WITH DuplicateCTE AS (
SELECT *,
	ROW_NUMBER() over(
	PARTITION BY parcelID,
				 LandUse,
				 SaleDate,
				 SalePrice,
				 LegalReference
				 ORDER BY UniqueID
				 ) RN

FROM NashvilleHousing
)
--SELECT *
DELETE
FROM DuplicateCTE
WHERE RN >= 2


-- Drop Redundant Columns

ALTER TABLE NashvilleHousing
DROP COLUMN PropertyAddress,OwnerAddress