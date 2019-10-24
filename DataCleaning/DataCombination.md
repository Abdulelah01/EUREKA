## Combining the data into one dataset and trimming unneeded columns from the Excel file
1. Export each tab of excel spreadsheet into individual csv
2. Import each csv into RStudio
```
library(readr)
Veg_Data <- read_csv("veg data.csv", col_types = cols(Q4FC = col_double(), Q5FC = col_double(), Q6FC = col_double(), Q7FC = col_double(), Q8FC = col_double(), Q9FC = col_double()))
library(readr)
visit_data <- read_csv("visit data.csv", col_types = cols(Date = col_date(format = "%m/%d/%Y")))
library(readr)
site_data <- read_csv("site data.csv", col_types = cols(`Planted Date` = col_date(format = "%m/%d/%Y")))
library(readr)
species_attributes <- read_csv("species attributes.csv")
```
3. Combine all the data
```
combined <- merge(x=Veg_Data, y=visit_data, by="Visit ID", all=TRUE)
combined <- merge(x=combined, y=species_attributes, by="Species", all.x=TRUE)
combined <- merge(x=combined, y=site_data, by="Field ID", all.x=TRUE)
```
4. Trim the unneeded data columns
```
trimmed <- combined %>% select("Field ID","Species","Visit ID","Q1","Q1FC","Q2","Q2FC","Q3","Q3FC","Q4","Q4FC","Q5","Q5FC","Q6","Q6FC","Q7","Q7FC","Q8","Q8FC","Q9","Q9FC","Q10","Q10FC","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor")
```
## Split the floral coverage and plant species coverage & Gather the quadrant and cover value data 
#### Each of theses melts should have the rows of trimmed(891) x 10
Using tidyr::gather()
1. Gather the floral coverage data (Rows 8910, Cols 10)
```
meltFC <- trimmed %>% select("Field ID","Species","Visit ID","Q1","Q2","Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor") %>% gather("Quadrant", "Cover Value", 4:13)
```
2. Gather the plant species coverage data (Rows 8910, Cols 10)
```
meltPSC <- trimmed %>% select("Field ID","Species","Visit ID","Q1FC","Q2FC","Q3FC","Q4FC","Q5FC","Q6FC","Q7FC","Q8FC","Q9FC","Q10FC","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor") %>% gather("Quadrant", "Cover Value", 4:13)
```
## Seperating the gathered data into native and non-native
1. Native
```
native <- subset(meltFC, meltFC$`Coefficient of Conservatism`!= '*')
```
2. Non-native
```
nonNative <- subset(meltFC, meltFC$`Coefficient of Conservatism`<='*')
```
