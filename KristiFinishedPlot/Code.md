natFC_data <- read.csv("nativeFloralCover.csv") 
natPC_data <- read.csv("nativePlantCover.csv") 
NatCombCov <- rbind(natFC_data, natPC_data) 
NatCombCov <- NatCombCov[!is.na(NatCombCov$CoverValue), ]
NatCombCov <- with(NatCombCov, table(FieldID,CoEOfConsvm)) 
NatCombCov <- as.data.frame(NatCombCov) 
NatCombCov <- NatCombCov[NatCombCov$Freq !=0, ] 
expSiteData <- read.csv("ExpandedSiteData.csv") 
sd <- select(expSiteData,1,7) 
sd <- sd[!duplicated(sd), ] -- remove duplicates caused by multiple transects with different landscape data 
CoE_Estab_Data <- merge(x=NatCombCov, y=sd, by="FieldID", all=FALSE)  
ggplot(data = CoE_Estab_Data) +  
geom_point(mapping = aes(x=Freq, y=FieldID,  color=Established) ) + 
facet_grid(.~CoEOfConsvm) + 
xlab("Number of Species by CoEfficient of Conservatism") + 
ylab("Fields") 

I added four data files, nativeFloralCover.csv, nativePlantCover.csv,ExpandedSiteData.csv, and . The first three are needed for the plot above and the fourth is the one I created with the taxonomy data, Order, family, and genius.
