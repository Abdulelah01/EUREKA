# Data Cleaning Notes

## Description of Data Source

The project team was provided the data in Excel format. The Excel spreadsheet was composed of six sheets, Site, Visit, Veg (Vegetation), Macro, Seed and Species Attributes. Below you will find descriptions of each of the Excel sheets.

### Site Data Description

The site data is composed of 17 rows. It contains a field id, a region, the number of acres associated with the field, the county, the date the site was planted, the planting method, the number of species planted, the Pure Live Seed pounds per acre, the previous vegetation cover and the Vendor for the seed planted. Only two cells were left N/A.
The Columns are as follows:
|Field ID|Region|Field acres|County|Planted Date|Planting method|# of species planted|Pure Live Seed lbs/acre|Previous cover|Seed Vendor|  
|--------|------|-----------|------|------------|---------------|--------------------|-----------------------|--------------|-------|  


|Attribute Name | Attribute Description |  
|---------------|-----------------------|
|FieldID	|The name assigned to the site |
|Region |	The Region of the state, like NorthEast(NE) |
|NumOfAcres|	The number of Acres associated with the site |
|County |	The county of the site |
|PlantedDate	|The date the species were planted |
|PlantingSeason|The season when the species were planted |
|Established	|The success or failure of the site |
|VisitNum	|The Number of Visits |
|SpeciesNum	|The number of Species planted |
|TotalPLSAcre	|The total amount of Pure Live Seed by pound by acre planted at the site |
|PreCover	|The species that was the previous cover |
|SeedVendor	|The name of the vendor that provided the seeds |
|Transect |The areas in which the site is divided. In most cases there are two transect but in one case there are three. |
|LandSTree	|Contains the trees in the surrounding landscape |
|LandSRoad	|Indicates if there is a road in the surrounding landscape |
|LandSStructures	|  Indicates if there are housing in the surrounding landscape |
|LandSCrop	 | Indicates what types of crops are in the surrounding landscape |
|LandSGrass	 | Indicates what type of grass is in the surrounding landscape |
|LandSWaterArea	|Indicates that some source of water exists near the site |
|LandSOther	|Indicates an attribute of the surrounding landscape that did not fall within the other 6 categories |
|VisitID   | Indicator to distinguish visits; starts with SP for Spring  or F for Fall and contains 1,2, or 3 for the transect |
|VisitDate  | Indicates date of the visits |
|VisitObserver  |Indicates who made the observations during the visits |
|SurrLandScape |Notation like text about the surrounding Landscape of the site; this data was broken up for more usability |
|VisitNotes        | Free form text about the visits |
|Species          | The species that were planted at the site or were observed at the site |
|SpeciesOrigin   |  The origin of the Species planted |
|SpeciesPLS      |   The pure live seed pounds per acre that was planted for a species |
|SpeciesCommName  |   The Common Name of a Species |
|CoEOfConsvm		|	The Coefficient of Conservatism which is a range between 0 and 10. The higher the score the lower tolerance to environmental degradation |
