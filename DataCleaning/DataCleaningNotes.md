# Data Cleaning Notes

## Description of Data Source

The project team was provided the data in Excel format. The Excel spreadsheet was composed of six sheets, Site, Visit, Veg (Vegetation), Macro, Seed and Species Attributes. Below you will find descriptions of each of the Excel sheets. We did not have any intellectual property constraints or licensing issues associated with the data.

### Site Data Description

The Site data is composed of 17 rows and 10 columns. It contains a field id, a region, the number of acres associated with the field, the county, the date the site was planted, the planting method, the number of species planted, the Pure Live Seed pounds per acre, the previous vegetation cover and the Vendor for the seed planted. Only two cells were left N/A. 
The Columns for the Site Data:  

|Field ID|Region|Field acres|County|Planted Date|Planting method|# of species planted|Pure Live Seed lbs/acre|Previous cover|Seed Vendor|  
|--------|------|-----------|------|------------|---------------|--------------------|-----------------------|--------------|-------| 

#### Remediation of the Site Data

On a whole the site data was fine. There were two missing cells for Number of Species and Pure Live Seed pounds per acre for the Prairie Plains Seed Vendor. Otherwise the data set was complete. From the planted date, we will look at deriving a new field called PlantingSeason. The PlantingSeason allows for a friendlier translation of the date. However, the Site data alone is not enough information to draw many conclusions. As a result, it will be neceaary to merge this data with the visit data. 

-- Add R code for creating the PlantingSeason

### Visit Data Description  

The Visit data is composed of 56 rows and 7 columns. It contains a field ID, a visit ID, Transect, the visit date, the observer, the surrounding Landscape and the Notes about the visit. Much of the data for the surrounding landscape is duplicated for each transect and each visit. The notes cells have the missing data for this sheet. The notes also contain an indication if the site failed. Another indication of a failed site is a fall visit will not occur. The biggest issue with this data are the Surrounding Landscape and the Notes columns. These columns are free text fields and difficult to parse. The Surrounding Landscape data has the potential to add value though. As a result, this data was parsed manually with a description of this new dataset below.  
The Columns for the Visit Data:  

|Visit ID|Field ID|Transect|Date|Observer|Surrounding Landscape|Notes|  
|--------|--------|--------|----|--------|---------------------|-----| 

The columns for the parsed Surrounding Landscape Data:

|Field ID|LandSTree|LandSRoad|LandSStructures|LandSSCrop|LandSGrass|LandSWaterArea|LandSOther|  
|--------|---------|---------|---------------|----------|----------|--------------|----------|  

#### Remediation of the Visit Data

The visit data, on a whole, was fine. Most of the data was present. Only the Notes columns had missing cells and that is to be expected for a free form field. The Notes data for the most part will be ignored since it is more of a qualitative data. Although, the Notes column does tell us if the site was a failure. We will take that information and manually create a new column called established and populate the words success or failure. The Surrounding Landscape data was free form data as well. At first site we might have categorized this data as qualitative as well but the client specifically called out this data as varible in the analysis. Ithe the current form the data was unusuable though. Using Excel, this data was parsed into 7 columns. The data was collasped to the Field ID level. This collasping was done since the data did not vary by transect, observer or visit date. The observer was Ms. Rae Powers for every visit except two where she was joined by another individual.

Steps
1. Created copy of Visit data Excel Sheet and named it visit_data_updated
2. Added new columns to Excel sheet (LandSTree,LandSRoad,LandSStructures,LandSSCrop,LandSGrass,LandSWaterArea,LandSOther)  
3. Added data to each of the new columns based on the contents in the Surrounding Landscape column
4. Consolidated all visits into one row for each Field ID and removed extra rows.
5. Removed Visit ID, Observer, Visit Date, Surrounding LandScape and Notes columns.
6. Merged visit_data_updated sheet with site data sheet based on Field ID  

The New consolidated dataset, ExpandedSiteData

|FieldID|Region|NumOfAcres|County|PlantedDate|PlantingSeason|Planting method|# of species planted|Pure Live Seed lbs/acre|Previous cover|Seed Vendor| 


### Veg Data Description

The Veg data is composed of 891 rows and 22 columns. The data set contains a Visit ID, a species and 20 quadrat columns divided by floral cover and non-floral cover. The quadrat contains a number from 1 to 6 that translates to the amount of coverage for that species within the quadrat. Much of this data is blank but not missing which is to be expected.  
The Columns for Veg Data:  

|Visit ID|Species|Q1|Q1FC|Q2|Q2FC|Q3|Q3FC|Q4|Q4FC|Q5|Q5FC|Q6|Q6FC|Q7|Q7FC|Q8|Q8FC|Q9|Q9FC|Q10|Q10FC|  
|--------|-------|--|----|--|----|--|----|--|----|--|----|--|----|--|----|--|----|--|----|---|-----|  

### Macro Data Description  

The Macro data is composed of 650 rows and 5 columns. The data set contains a Visit ID, 3 columns that categorizes the species cover in the macroplots, <1%, 1-5% and > 5%, and Notes. The Notes are free form text. Much of this data is blank but not missing which is to be expected.  
The columns for Macro Data:  

|Visit ID|<1%|1-5%|>5%|Notes|   
|--------|---|----|---|-----|  

### Seed Data Description  

The Seed data is composed of 543 rows and 4 columns. The data set contains a Field ID, Species, Pure Live Seed lbs per acre and Origin. This data set contains no missing data. The sum of the Pure Live Seed pound per acre by Field ID data matches the value found for that Field ID in the Site data sheet.  
The columns for Seed Data:  

|Field ID|Species|Pure Live Seed lbs/acre|Origin|   
|--------|-------|-----------------------|------|  

### Species Attributes Description  

The Species attributes data is composed of 182 rows and 3 columns. The data set contains Species, Coefficient of Conservatism and common Name. A significant portion of the CoEfficient of Conservatism is marked with an asterick. These species will not be included in any coefficient of conservation averages per the client.  
The Columns for Species Attributes Data:  


|Species|Coefficent of Conservatism|Common Name|  
|-------|--------------------------|-----------|  
