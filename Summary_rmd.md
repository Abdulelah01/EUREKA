
---
title: "summary"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
   library(tidyverse)
   library(kableExtra)
   library(magick)
```

## Introduction

“The Xerces Society for Invertebrate Conservation is an international nonprofit organization
that protects the natural world through the conservation of invertebrates and their habitats”
(Mission & History). The name Xerces is based off of an extinct butterfly, Xerces Blue. This
extinction was the first known in North America due to human activities. “The Xerces Society’s
core programs focus on habitat conservation and restoration, species conservation, protecting
pollinators, contributing to watershed health, and reducing harm to invertebrates from
pesticide use” (Mission & History).

The Eureka team is focusing on the data from the Xerces Society Pollinator Conservation
Program. The core focus of Pollinator Conservation Program is conserving the pollinators
habitats and attracting native pollinators. “The ecological service they provide is necessary for
the reproduction of over 85% of the world’s flowering plants, including more than two-thirds of
the world’s crop species” (Pollinator Conservation). The impact of losing pollinators is
monumental not to just humans but to animal life as well. “The economic value of these native
pollinators is estimated at $3 billion per year in the U.S” (Pollinator Conservation). Therefore,
not only would food from crops be in ruin but food obtained from most animals would be
ruined as well. The main threats to these pollinators are habit loss, pesticide use, and introduced diseases.

## The Data

The Eureka project team was provided the data in Excel format. The Excel spreadsheet was
composed of six sheets, Site, Visit, Veg (Vegetation), Macro, Seed and Species Attributes. The
Site data contained field id, a region, the number of acres associated with the field, the county,
the date the site was planted, the planting method, the number of species planted, the Pure
Live Seed pounds per acre, the previous vegetation cover and the Vendor for the seed planted.
There was very little missing data in the site data, two missing cells for Number of Species and
Pure Live Seed pounds per acre for the Prairie Plains Seed Vendor. The team received 14 rows
of site data.

The visit data contained a field ID, a visit ID, Transect, the visit date, the observer, the
surrounding Landscape and the Notes about the visit. Much of the data for the surrounding
landscape is duplicated for each transect and each visit. The notes cells have the missing data
for this sheet. The notes also contain an indication if the site failed. Another indication of a
failed site was a fall visit did not occur. The Surrounding Landscape and the Notes columns were
free text fields and difficult to parse. The Surrounding Landscape data has the potential to add
value though. As a result, this data was parsed manually into a new dataset. The team received
56 rows of visit data.

The veg or vegetation data contained a Visit ID, a species and 20 quadrat columns divided by
floral cover and non-floral cover. The quadrat contains a number from 1 to 6 that translates to
the amount of coverage for that species within the quadrat. Much of this data is blank but not
missing which is to be expected. The team received 891 rows of veg data. The macro data set
contained a Visit ID, 3 columns that categorizes the species cover in the macroplots, <1%, 1-5% and > 5%, and Notes. The Notes are free form text. Much of this data is blank but not missing which is to be expected. The team received 650 rows of macro data.

The seed data set contained a Field ID, Species, Pure Live Seed lbs per acre and Origin. This data
set contains no missing data. The sum of the Pure Live Seed pound per acre by Field ID data
matches the value found for that Field ID in the Site data sheet. The team received 543 rows of
seed data. The final data was the Species Attribute data set. This data set contained Species,
Coefficient of Conservatism and common Name. A significant portion of the Coefficient of
Conservatism is marked with an asterisk. These species will not be included in any coefficient of
conservation averages per the client. The team received 182 rows of Species Attribute data.

## Data Cleaning Process

The team used the data in the spreadsheet and used it to form a few other data sets. The first
new data set, we called expandedSiteData. This data set has the site data, visit data and the
new manually parsed surrounding landscaping data. The surrounding landscaping data was
parsed into 7 new columns, LandSTree, LandSRoad, LandSStructures, LandSSCrop, LandSGrass,
LandSWaterArea, and LandSOther. The success or failure from the notes column was added to
a new column called Established. The columns not included in the new data set were Visit ID,
Observer, Visit Date, Surrounding LandScape and Notes columns.

The team also expanded the Species Attributes data set by adding taxonomy data. This addition
was done in an effort to collapse the species data without losing essential meanings and making
it easier to work with. This task allowed us to reduce more than 700 rows of data into 1 row of
data, the order associated with the more than 700 species. The team also looked at the veg
data for ways to format it so that we could increase our success with analysis. We decided to
deconstruct it. We took 22 columns and constructed a new data set that was longer but not as
wide. Instead of 22 columns, the data set had 4 columns, Visit ID, Species, quadrat. This data set
was also combined with data from the visit data set as well as the site data set.

During the data cleaning process we also looked at the data process within the data sets that we received. There were a couple of issues that we needed to correct. First, we assumed that any column without data was not missing data. The team felt that the nature of the data would lead to much data being blank. We decided that this data could be ignored especially when looking at the seed data for the Quadrat.Second, we corrected some consistency issues across the data set like Site Gage11018 was labeled as Gage11018A in the visit data.This update was done for Harlan11007 & Harlan11008 as well.

## Research Questions

The team decided that we would use the data to evaluate 4 research questions

1. How has the variables associated with the site contributed to the success or failure of
the site?
2. How does the factor of being native versus non-native affect the plant growth of species
in the fields tested?
3. Do certain plant families show a greater cover value than others plant families?
4. Does the average Coefficient of Conservatism of the species planted in each field
contribute to the success of failure of the field?

The sites are situated in three regions within Nebraska. The regions are South Central (SC),
North East (NE) and South East (SE). The sites distributed pretty evenly between the regions.
There are 5 sites in the North East, 7 sites in the South Central and 5 sites in the South East
region. Most Regions had sites in multiple counties except for the North East where all of the
sites were in the same county. The number of acres per site does vary. There are some sites
that are just over one acre like the Johnson county site 110261 in the Southeastern part of 
Nebraska. While the largest site 11008 in South Central Nebraska in Furnas County is nearly 45
acres.

When tackling the question of what variables could have contributed to the success or failure of
a site, we should look at where the site was located. 80% of the sites in Antelope County in the
North East region failed. The failed sites in Antelope county received seed mixes from two
vendors and those vendors did not supply seed to any other site. All of the failed sites plantings
occurred in the spring. The Pure Live Seed per acre, which indicates the amount of seed in the
lot that is capable of developing into seedlings, is significantly lower than what was planted at
the majority of the successful sites.

Other than the Antelope county failures, there were two failures in the South East region. One
failure occurred in Webster county and the other in Harlan county. Both of those sites had
plantings in the spring as well. However, the seed vendor was different than in Antelope
County. Both sites had the same seed vendor, Star Seed. However, this seed vendor had
successful plantings at other sites where its seed was used. Also, the Pure Live Seed per Acre,
for these sites, was on the higher side with 2.7 compared to 1.69 and 1.57 in Antelope County.
What we cannot tell from the data is if there were other external events that caused the failure
of these sites. For instance, was the weather patterns abnormal for Antelope County during the
months after the planting occurred? Did something occur during the planting? Could the soil
have had issues? Or was it the seed itself? The vendors, Seed House and Kaup, had no success
at any of the sites that their seed was planted. The level of Pure Live Seed per acre was lower
than the majority of the other vendors. However, there is no other indications that the seed
had any other issues. Many of these variables could have contributed to the success or failure
of these sites.

The coefficient of the conservatism is a range from 0 - 10 and represent an estimated probability
that a plant is likely to occur in a landscape relatively unaltered from what is believed to be pre-European settlement condition. For example, common weedy species would have 0 or low C
values, they move into new habitats readily while a rare orchid species may have a C value of
10 – it needs very specific conditions to thrive. 

```{r Table: Average Coefficient of Conservatism, echo=FALSE}
   
   natPC_data <- read.csv("nativePlantCover.csv")
   natFC_data <- read.csv("nativeFloralCover.csv")
   expSiteData <- read.csv("ExpandedSiteData.csv")
   NatCombCov <- rbind(natFC_data,  natPC_data)
   NatCombCov <- NatCombCov[!is.na(NatCombCov$CoverValue), ]
   sd <- select(expSiteData,1,7)
   sd <- sd[!duplicated(sd), ]
   aggNatCombCov <- aggregate(NatCombCov$CoEOfConsvm, list(FieldID=NatCombCov$FieldID), FUN=mean)
   aggNatCombCov <- merge(x=aggNatCombCov, y=sd, by="FieldID", all=FALSE)
   names(aggNatCombCov)[1] <- "Field ID"
   names(aggNatCombCov)[2] <- "avg Coefficient Conservatism"
   kable(aggNatCombCov, format = "html",
       caption = "Table 1: Average Coefficient of Conservatism by Site for Native Plants",
         digits = c(0,3,0), align = "ccrr") %>%
      kable_styling(full_width = FALSE, position = "left")
```

Table 1 shows the average coefficient of conservatism for each site along with the status of the site, whether is was successful or not. The graph below shows the distribution of the species across the coefficient of Conservatism.


```{r fig.width=14,fig.height=8, echo=FALSE}
nativeCombCov <- with(NatCombCov, table(FieldID,CoEOfConsvm))
nativeCombCov <- as.data.frame(nativeCombCov)
nativeCombCov <- nativeCombCov[nativeCombCov$Freq !=0, ]
CoE_Estab_Data <- merge(x=nativeCombCov, y=sd, by="FieldID", all=FALSE)
ggplot(data = CoE_Estab_Data) +
geom_point(mapping = aes(x=Freq, y=FieldID, color=Established) ) +
facet_grid(.~CoEOfConsvm) +
xlab("Number of Native Species by CoEfficient of Conservatism") +
ylab("Fields")
```

The distribution of the species over the range of the coefficient of conservatism for the failed sites seems comparable to the sites that were successful. However, the amount of each species for the failed sites represented in each range is lower than in the amounts in the successful sites. As for the successful sites, there seems to be a significant concentration of species present in the 4 and 5 range of the coefficient of conservation. On a whole the successful sites have a stronger presence of species across all of the ranges shown. 
