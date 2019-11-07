# Import New Dataset and Merge 
1. Import new Expanded Site Data
```
ExpandedSiteData <- read_csv("ExpandedSiteData.csv")
```
2. Extract only 'FieldID' and 'Notes' columns
```
notes <- notes[-c(2,9,10), c(1,2)]
notes <- ExpandedSiteData[c(1,7)]
```
3. Rename 'FieldID' to 'Field ID' to keep consistency with other datasets
```
names(notes)[1] <- paste("Field ID")
```
4. Add missing Field ID and infer based on the Quadrant data resembling the cover values of success fields that the field was successful
```
notes[nrow(notes) + 1,] = list("Furnas1008","Success")
```
5. Merge the 'Notes' column to pre-existing datasets
```
combined <- merge(x=combined, y=notes, by="Field ID", all.x=TRUE)
trimmed <- merge(x=trimmed, y=notes, by="Field ID", all.x=TRUE)
```
## Redosplit over floral coverage and plant species coverage & regather the quadrant and cover value data 
Using tidyr::gather()
1. Gather the floral coverage data
```
meltFC <- trimmed %>% select("Field ID","Species","Visit ID","Q1","Q2","Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor", "Established") %>% gather("Quadrant", "Cover Value", 4:13)
```
2. Gather the plant species coverage data
```
meltPSC <- trimmed %>% select("Field ID","Species","Visit ID","Q1FC","Q2FC","Q3FC","Q4FC","Q5FC","Q6FC","Q7FC","Q8FC","Q9FC","Q10FC","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor", "Established") %>% gather("Quadrant", "Cover Value", 4:13)
```
## Seperating the gathered data into native and non-native
1. Native
```
nativePSC <- subset(meltPSC, meltPSC$`Coefficient of Conservatism` != '*')
nativeFC <- subset(meltFC, meltFC$`Coefficient of Conservatism`!= '*')
```
2. Non-native
```
nonNativePSC <- subset(meltPSC, meltPSC$`Coefficient of Conservatism`<='*')
nonNativeFC <- subset(meltFC, meltFC$`Coefficient of Conservatism`<='*')
```
## R Script for writing the CSV Files
#### nonNativeFloralCover
```
write.csv(nonNativeFC, file="nonNativeFloralCover.csv")
```
#### nativeFloralCover
```
write.csv(nativeFC, file="nativeFloralCover.csv")
```
#### nonNativePlantSpeciesCover
```
write.csv(nonNativePSC, file="nonNativePlantSpeciesCover.csv
```
#### nativePlantSpeciesCover
```
write.csv(nativePSC, file="nativePlantSpeciesCover.csv")
```
#### mergedData
```
write.csv(combined, "mergedData.csv")
```
#### trimmedData
```
write.csv(trimmed, "trimmedData.csv")
```
