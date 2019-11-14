## Plots showing the conservatism of coefficient specific to the filed_ID Gage11018A


### R Scripts

#### libraries
library(tidyverse)
library(ggplot2)
library(dplyr)


plot <- filter(nativeFC, Field_ID=="Gage11018A")
ggplot(plot, mapping =aes(x=Coefficient_of_Conservatism))+ geom_bar() + labs(x = "ConservatismOfCoefficient", y= "nativeSpeciesCount", title="Observation of conservatism of coefficient for field Gage11018A")

![Native Floral cover conservatism of coefficient](rplot_1.png)

Analysis:
Based on this plot we could say that the maximum number of species count fall under the coefficient of conservatism of 4 where the coefficient value ranges from 0 to 7.

ggplot(plot, mapping =aes(x=Coefficient_of_Conservatism,y=Visit_ID))+ geom_point()+labs(x = "ConservatismOfCoefficient", y= "Visit_ID", title="Observation specific to visitID for field Gage11018A")

![Native Floral cover conservatism of coefficient based on visit_ID](rplot_2.png)

Analysis:
Based on this plot we could see that there is a consistent in the coefficient ranging from 1 - 4 compared to other ranges for the native species specific to the vist_ID in the field Gage11018A.

## Plots showing the conservatism of coefficient specific to the filed_ID Webster11004

plot2 <- filter(nativeFC, Field_ID=="Webster11004")
ggplot(plot2, mapping =aes(x=Coefficient_of_Conservatism))+ geom_bar() + labs(x = "ConservatismOfCoefficient", y= "nativeSpeciesCount", title="Observation of conservatism of coefficient for field Webster11004")

![Native Floral cover conservatism of coefficient](rplot_3.png)

Analysis:
Based on this plot we could say that the maximum number of species count fall under the coefficient of conservatism of 4 where the coefficient value ranges from 0 to 7.

ggplot(plot2, mapping =aes(x=Coefficient_of_Conservatism,y=Visit_ID))+ geom_point()+labs(x = "ConservatismOfCoefficient", y= "Visit_ID", title="Observation specific to visitID for field Webster11004")

![Native Floral cover conservatism of coefficient based on visit_ID](rplot_4.png)

Analysis:
Based on this plot we could see that there is a consistent in the coefficient in the range 2,4,5 & 6 compared to other ranges for the native species specific to the vist_ID in the field Webster11004.

