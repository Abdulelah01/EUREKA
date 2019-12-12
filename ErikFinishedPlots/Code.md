### Density of Floral Cover by Plant Family
```
densityFamilyFC <- ggplot(FamilyFC, aes(FamilyFC$`Cover Value`)) + geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3"))  + scale_y_continuous(name="Density") + facet_grid(~FamilyFC$Family) + ggtitle("Density of Floral Cover per Plant Family")
```
### Density of Plant Species Cover by Plant Family
```
densityFamilyPSC <- ggplot(FamilyPSC, aes(FamilyPSC$`Cover Value`)) + geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + scale_y_continuous(name="Density") + facet_grid(~FamilyPSC$Family) + ggtitle("Density of Plant Species Cover per Plant Family")
```
### Multi-Plot of Density for Floral Cover
```
densityNonNativeFC <- ggplot(nonNativeFC[c(2,9,10)], aes(nonNativeFC$`Cover Value`)) + geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + ggtitle("Density of Non-Native Floral Cover")
densityNativeFC <- ggplot(nativeFC[c(2,9,10)], aes(nativeFC$`Cover Value`)) + geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + ggtitle("Density of Native Floral Cover")
MultiFC <- grid.arrange(densityNonNativeFC, densityNativeFC)
```
### Multi-Plot of Density for Plant Species Cover
```
densityNativePSC <- ggplot(nativePSC[c(2,9,10)], aes(nativePSC$`Cover Value`)) + geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5)) + ggtitle("Density of Native Plant Species Cover")
densityNonNativePSC <- ggplot(nonNativePSC[c(2,9,10)], aes(nonNativePSC$`Cover Value`)) + geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5)) + ggtitle("Density of Non-Native Plant Species Cover")
MultiPSC <- grid.arrange(densityNativePSC, densityNonNativePSC)
```
