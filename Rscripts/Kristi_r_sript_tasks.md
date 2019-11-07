```{r load Expanded Site Data, echo=FALSE}
expSiteData <- read.csv("ExpandedSiteData.csv", stringsAsFactors = FALSE)
transform(expSiteData, NumOfAcres = as.numeric(NumOfAcres),
                             PlantedDate = as.Date(PlantedDate, format("%m/%d/%y")),
                             SpeciesNum = as.numeric(SpeciesNum),
                             PLSAcre = as.numeric(PLSAcre))
print(expSiteData)
```

### Load Species Taxonomic Data

```{r import Species Data, echo=False}
expSpeciesData <- read.csv('Species_Attribute_expanded.csv',head=T)
expSpeciesDataRem <- expSpeciesData[,-c(2:3)]
```

### Load Native Floral Cover Data

```{r import Native Floral Data, echo=false}
nativeFloralCover <- read.csv('nativeFloralCover.csv',head=T)
transform(nativeFloralCover, VisitDate = as.Date(VisitDate),
                             PlantedDate = as.Date(PlantedDate))
expNativeFloralCover <- merge(expSpeciesDataRem,nativeFloralCover, by=c('Species'),all.x = F)
print(expNativeFloralCover)
```

### Native Plant Cover Data

```{r import Native Plant Data, echo=FALSE}
nativePlantCover <- read.csv('nativePlantCover.csv',head=T)
transform(nativePlantCover, VisitDate = as.Date(VisitDate),
                             PlantedDate = as.Date(PlantedDate))
expNativePlantCover <- merge(expSpeciesDataRem,nativePlantCover, by=c('Species'),all.x = F)
print(expNativeFloralCover)
```

### Non Native Floral Cover Data

```{r import non native floral data, echo=FALSE}
nonNativeFloralCover <- read.csv('nonNativeFloralCover.csv',head=T)
transform(nonNativeFloralCover, VisitDate = as.Date(VisitDate),
                             PlantedDate = as.Date(PlantedDate))
expNonNativeFloralCover <- merge(expSpeciesDataRem,nonNativeFloralCover, by=c('Species'),all.x = F)
print(expNonNativeFloralCover)
```

### Non Native Plant Cover Data

```{r Import non Native Plant Cover, echo=FALSE}

nonNativePlantCover <- read.csv('nonNativePlantCover.csv',head=T)
transform(nonNativePlantCover, VisitDate = as.Date(VisitDate),
                             PlantedDate = as.Date(PlantedDate))
expNonNativePlantCover <- merge(expSpeciesDataRem,nonNativePlantCover, by=c('Species'),all.x = F)
print(expNativeFloralCover)
```
