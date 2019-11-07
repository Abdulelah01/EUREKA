setwd("C:/Users/Anitha/Desktop/D2D- R scripts")

########################################################
# Reading the csv file
########################################################

nonnative <- read.csv("nonNativePlantSpeciesCover.csv")
native <- read.csv("nativePlantSpeciesCover.csv")

View (native)
VIew(nonnative)


#########################################################
# calling out required library
#########################################################


library(pastecs)
library(dplyr)
library(data.table)

##########################################################
# Summary of native and non native plant species 
##########################################################


summary(native)
summary(nonnative)

############################################################
# code to change the names of the column for computation
###########################################################

names(native) <- c("X_no", "Field_ID", "Species", "Visit_ID", "Transect", "Date", "Coef_of_consv", "Planted_Date", "Seed_Vendor", "Quadrant",
                   "Cover_Value")
View(native)
summary(native)

################################################################################
# code for distributive statistice on coeffiencent column specific to field_id
################################################################################

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

#################################################################################
# code for distributive statistics on coefficient column specific to seed vendors.
##################################################################################


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

##########################################################################











