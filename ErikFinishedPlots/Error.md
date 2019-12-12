Erik, Here is the error message that I received:

 densityNonNativeFC <- ggplot(nonNativeFC[c(2,9,10)], aes(nonNativeFC$`Cover Value`)) + 
+   geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + 
+   scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + 
+   ggtitle("Density of Non-Native Floral Cover")
> densityNativeFC <- ggplot(nativeFC[c(2,9,10)], aes(nativeFC$`Cover Value`)) + 
+   geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + 
+   scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + 
+   ggtitle("Density of Native Floral Cover")
> MultiFC <- grid.arrange(densityNonNativeFC, densityNativeFC)
Error in grid.arrange(densityNonNativeFC, densityNativeFC) : 
  could not find function "grid.arrange"
> library(gridExtra)
Error in library(gridExtra) : there is no package called ‘gridExtra’
> install.packages("gridExtra")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/gridExtra_2.3.zip'
Content type 'application/zip' length 1109220 bytes (1.1 MB)
downloaded 1.1 MB

package ‘gridExtra’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\j4klb01\AppData\Local\Temp\Rtmp8eR65R\downloaded_packages
> library(gridExtra)

Attaching package: ‘gridExtra’

The following object is masked from ‘package:dplyr’:

    combine

Warning message:
package ‘gridExtra’ was built under R version 3.6.1 
> MultiFC <- grid.arrange(densityNonNativeFC, densityNativeFC)
Error: stat_density requires the following missing aesthetics: x
> densityNonNativeFC <- ggplot(nonNativeFC[c(2,9,10)], aes(nonNativeFC$"Cover Value")) + 
+   geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + 
+   scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + 
+   ggtitle("Density of Non-Native Floral Cover")
> densityNativeFC <- ggplot(nativeFC[c(2,9,10)], aes(nativeFC$"Cover Value")) + 
+   geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + 
+   scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + 
+   ggtitle("Density of Native Floral Cover")
> MultiFC <- grid.arrange(densityNonNativeFC, densityNativeFC)
Error: stat_density requires the following missing aesthetics: x
> densityNonNativeFC <- ggplot(nonNativeFC[c(2,9,10)], aes(x=nonNativeFC$"Cover Value")) + 
+   geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + 
+   scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + 
+   ggtitle("Density of Non-Native Floral Cover")
> densityNativeFC <- ggplot(nativeFC[c(2,9,10)], aes(x=nativeFC$"Cover Value")) + 
+   geom_density() + scale_x_discrete(name ="Cover Value",limits=c("1","2","3","4","5","6"))  + 
+   scale_y_discrete(name="Density",limits=c(0.0,0.25,0.5,0.75,1.0,1.25,1.5,1.75,2.0)) + 
+   ggtitle("Density of Native Floral Cover")
> MultiFC <- grid.arrange(densityNonNativeFC, densityNativeFC)
Error: stat_density requires the following missing aesthetics: x
> 
