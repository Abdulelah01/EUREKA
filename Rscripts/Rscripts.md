Final
================
Abdulelah Almubarak
11/7/2019

# Import New Dataset and Merge

1.  Import new Expanded Site Data

<!-- end list -->

    ExpandedSiteData <- read_csv("ExpandedSiteData.csv")

2.  Extract only ‘FieldID’ and ‘Notes’ columns

<!-- end list -->

    notes <- notes[-c(2,9,10), c(1,2)]
    notes <- ExpandedSiteData[c(1,7)]

3.  Rename ‘FieldID’ to ‘Field ID’ to keep consistency with other
    datasets

<!-- end list -->

    names(notes)[1] <- paste("Field ID")

4.  Add missing Field ID and infer based on the Quadrant data resembling
    the cover values of success fields that the field was successful

<!-- end list -->

    notes[nrow(notes) + 1,] = list("Furnas1008","Success")

5.  Merge the ‘Notes’ column to pre-existing datasets

<!-- end list -->

    combined <- merge(x=combined, y=notes, by="Field ID", all.x=TRUE)
    trimmed <- merge(x=trimmed, y=notes, by="Field ID", all.x=TRUE)

## Redosplit over floral coverage and plant species coverage & regather the quadrant and cover value data

Using tidyr::gather() 1. Gather the floral coverage data

    meltFC <- trimmed %>% select("Field ID","Species","Visit ID","Q1","Q2","Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor", "Established") %>% gather("Quadrant", "Cover Value", 4:13)

2.  Gather the plant species coverage data

<!-- end list -->

    meltPSC <- trimmed %>% select("Field ID","Species","Visit ID","Q1FC","Q2FC","Q3FC","Q4FC","Q5FC","Q6FC","Q7FC","Q8FC","Q9FC","Q10FC","Transect","Date","Coefficient of Conservatism","Planted Date","Seed Vendor", "Established") %>% gather("Quadrant", "Cover Value", 4:13)

## Seperating the gathered data into native and non-native

1.  Native

<!-- end list -->

    nativePSC <- subset(meltPSC, meltPSC$`Coefficient of Conservatism` != '*')
    nativeFC <- subset(meltFC, meltFC$`Coefficient of Conservatism`!= '*')

2.  Non-native

<!-- end list -->

    nonNativePSC <- subset(meltPSC, meltPSC$`Coefficient of Conservatism`<='*')
    nonNativeFC <- subset(meltFC, meltFC$`Coefficient of Conservatism`<='*')

## R Script for writing the CSV Files

#### nonNativeFloralCover

    write.csv(nonNativeFC, file="nonNativeFloralCover.csv")

#### nativeFloralCover

    write.csv(nativeFC, file="nativeFloralCover.csv")

#### nonNativePlantSpeciesCover

    write.csv(nonNativePSC, file="nonNativePlantSpeciesCover.csv

#### nativePlantSpeciesCover

    write.csv(nativePSC, file="nativePlantSpeciesCover.csv")

#### mergedData

    write.csv(combined, "mergedData.csv")

#### trimmedData

    write.csv(trimmed, "trimmedData.csv")

# Data Setup

### Site Data

    expSiteData <- read.csv("ExpandedSiteData.csv", stringsAsFactors = FALSE)
    transform(expSiteData, NumOfAcres = as.numeric(NumOfAcres),
                                 PlantedDate = as.Date(PlantedDate, format("%m/%d/%y")),
                                 SpeciesNum = as.numeric(SpeciesNum),
                                 PLSAcre = as.numeric(PLSAcre))
    print(expSiteData)

### Load Species Taxonomic Data

    expSpeciesData <- read.csv('Species_Attribute_expanded.csv',head=T)
    expSpeciesDataRem <- expSpeciesData[,-c(2:3)]

### Load Native Floral Cover Data

    nativeFloralCover <- read.csv('nativeFloralCover.csv',head=T)
    transform(nativeFloralCover, VisitDate = as.Date(VisitDate),
                                 PlantedDate = as.Date(PlantedDate))
    expNativeFloralCover <- merge(expSpeciesDataRem,nativeFloralCover, by=c('Species'),all.x = F)
    print(expNativeFloralCover)

### Native Plant Cover Data

    nativePlantCover <- read.csv('nativePlantCover.csv',head=T)
    transform(nativePlantCover, VisitDate = as.Date(VisitDate),
                                 PlantedDate = as.Date(PlantedDate))
    expNativePlantCover <- merge(expSpeciesDataRem,nativePlantCover, by=c('Species'),all.x = F)
    print(expNativeFloralCover)

### Non Native Floral Cover Data

    nonNativeFloralCover <- read.csv('nonNativeFloralCover.csv',head=T)
    transform(nonNativeFloralCover, VisitDate = as.Date(VisitDate),
                                 PlantedDate = as.Date(PlantedDate))
    expNonNativeFloralCover <- merge(expSpeciesDataRem,nonNativeFloralCover, by=c('Species'),all.x = F)
    print(expNonNativeFloralCover)

### Non Native Plant Cover Data

``` 

nonNativePlantCover <- read.csv('nonNativePlantCover.csv',head=T)
transform(nonNativePlantCover, VisitDate = as.Date(VisitDate),
                             PlantedDate = as.Date(PlantedDate))
expNonNativePlantCover <- merge(expSpeciesDataRem,nonNativePlantCover, by=c('Species'),all.x = F)
print(expNativeFloralCover)
```

# Distributive Statistics Native Plant Species

### Reading the csv file

    nonnative <- read.csv("nonNativePlantSpeciesCover.csv")
    native <- read.csv("nativePlantSpeciesCover.csv")
    
    View (native)
    VIew(nonnative)
    
    library(pastecs)
    library(dplyr)
    library(data.table)

### Summary of native and non native plant species

``` 


summary(native)
summary(nonnative)
```

### code to change the names of the column for computation

``` 

names(native) <- c("X_no", "Field_ID", "Species", "Visit_ID", "Transect", "Date", "Coef_of_consv", "Planted_Date", "Seed_Vendor", "Quadrant",
                   "Cover_Value")
View(native)
summary(native)
```

### code for distributive statistice on coeffiencent column specific to field\_id

``` 

stat.desc(native %>% filter(Field_ID == "Antelope11001")%>%select(Coef_of_consv))
#median - 3.0000000,mean -2.9523810,SE.mean  - 0.1178454,std.dev - 1.7077417

stat.desc(native %>% filter(Field_ID == "Antelope11002")%>%select(Coef_of_consv))
#median- 3.0000000, mean - 3.0000000, SE.mean - 0.1601282, std.dev - 1.0127394

stat.desc(native %>% filter(Field_ID == "Antelope11005")%>%select(Coef_of_consv))
# median - 3.5000000, mean - 2.6785714, SE.mean -0.1280577 ,std.dev - 2.1428145

stat.desc(native %>% filter(Field_ID == "Antelope11025A")%>%select(Coef_of_consv))
# median - 1.0000000, mean - 1.7222222, SE.mean - 0.1448593 ,std.dev - 1.9434909

stat.desc(native %>% filter(Field_ID == "Antelope11025B")%>%select(Coef_of_consv))
# median - 2.0000000, mean - 2.3181818, SE.mean - 0.1278658 ,std.dev - 1.8965569
```

### code for distributive statistics on coefficient column specific to seed vendors.

``` 


stat.desc(native %>% filter(Seed_Vendor == "The Seed House- same mix as Antelope11002")%>%select(Coef_of_consv))
# median - 3.0000000 , mean - 2.9523810 , SE.mean - 0.1178454  ,std.dev - 1.7077417

stat.desc(native %>% filter(Seed_Vendor == "Kaup Forage and Turf")%>%select(Coef_of_consv))
# median - 1.0000000, mean -  1.7222222, SE.mean -0.1448593  ,std.dev - 1.9434909

stat.desc(native %>% filter(Seed_Vendor == "Kaup Forage and Turf-Same mix as Antelope11025A")%>%select(Coef_of_consv))
# median -2.0000000 , mean - 2.3181818, SE.mean - 0.1278658 ,std.dev - 1.8965569

stat.desc(native %>% filter(Seed_Vendor == "Prairie Plains Resource Institute 12 bulk lbs of PPRI mix, purity 23-30%, no seed sheet info")%>%select(Coef_of_consv))
# median -4.0000000 , mean - 3.2931034, SE.mean - 0.0748248 ,std.dev - 0.5472102

stat.desc(native %>% filter(Seed_Vendor == "Star Seed - Dealer - PF")%>%select(Coef_of_consv))
# median - 4.000000e+00 , mean - 3.188119e+00 , SE.mean - 6.101788e-02 ,std.dev - 1.939179e+00

stat.desc(native %>% filter(Seed_Vendor == "Star Seed - Dealer -PF seed mix")%>%select(Coef_of_consv))
# median - 0.0000000 , mean - 0.4000000, SE.mean - 0.1142857 ,std.dev - 0.8081220

stat.desc(native %>% filter(Seed_Vendor == "Star Seed - Dealer - PF, same mix as Furnas11006")%>%select(Coef_of_consv))
# median - 4.000000e+00 , mean - 2.777778e+00, SE.mean - 9.112505e-02 ,std.dev - 1.933054e+00

stat.desc(native %>% filter(Seed_Vendor == "Stock Seed")%>%select(Coef_of_consv))
# median -3.000000e+00 , mean -2.902913e+00 , SE.mean - 5.655776e-02  ,std.dev - 1.815143e+00

stat.desc(native %>% filter(Seed_Vendor == "The Seed House")%>%select(Coef_of_consv))
# median - 3.0000000 , mean - 3.0000000, SE.mean - 0.1601282  ,std.dev - 1.0127394

stat.desc(native %>% filter(Seed_Vendor == "The Seed House- same mix as Antelope11002")%>%select(Coef_of_consv))
# median - 3.0000000, mean - 2.9523810, SE.mean -  0.1178454 ,std.dev - 1.7077417

stat.desc(native %>% filter(Seed_Vendor == "Wagner's Feed Store")%>%select(Coef_of_consv))
# median - 3.000000e+00, mean - 2.663265e+00, SE.mean - 5.204614e-02 ,std.dev - 1.629302e+00
```

# Contributorship Statement

Erik and Kristi focused on scripting the Data Cleaning Tasks Anitha
developed scripts for plotting Statistics Abe worked on developing the
Macro data \# Proofreader Statement 1, Abdulelah Almubarak, have
reviewed and proofread the following work and agree that it is ready for
submission.
