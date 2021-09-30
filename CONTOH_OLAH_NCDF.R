setwd("~/Downloads/S2_2/SB6126_Mikrofisika_Awan_dan_Hujan/Kinematic_Driver_Model/KiD_2.3.2654/output")
library(ncdf4)
library(sommer)
############# CASE=SQUALL_SD all, skema: Thompson07, Thompson09, Morrison
nc<-nc_open("sq2dt07.nc")
nc1<-nc_open("sq2dt09.nc")
nc2<-nc_open("sq2morr2.nc")
nc3<-nc_open("sq2dlem24.nc")
nc4<-nc_open("sq2dum7_3.nc")
nc5<-nc_open("sq2dwsm6.nc")
nc6<-nc_open("sq2d4A.nc")
var<-names(nc$var)
var1<-names(nc1$var)
var2<-names(nc2$var)
var3<-names(nc3$var)
var4<-names(nc4$var)
var5<-names(nc5$var)
var6<-names(nc6$var)
################################# VAR LINE PLOT #################################
############## "mean_cloud_mass_path" 
cmp<-ncvar_get(nc,"mean_cloud_mass_path" )
cmp1<-ncvar_get(nc1,"mean_cloud_mass_path" )
cmp2<-ncvar_get(nc2,"mean_cloud_mass_path" )
cmp3<-ncvar_get(nc3,"mean_cloud_mass_path" )
cmp4<-ncvar_get(nc4,"mean_cloud_mass_path" )
cmp5<-ncvar_get(nc5,"mean_cloud_mass_path" )
cmp6<-ncvar_get(nc6,"mean_cloud_mass_path" )
############## "mean_rain_mass_path" 
rmp<-ncvar_get(nc,"mean_rain_mass_path")
rmp1<-ncvar_get(nc1,"mean_rain_mass_path")
rmp2<-ncvar_get(nc2,"mean_rain_mass_path")
rmp3<-ncvar_get(nc3,"mean_rain_mass_path")
rmp4<-ncvar_get(nc4,"mean_rain_mass_path")
rmp5<-ncvar_get(nc5,"mean_rain_mass_path")
rmp6<-ncvar_get(nc6,"mean_rain_mass_path")
########### variable "mean_ice_mass_path"  
mimp<-ncvar_get(nc,"mean_ice_mass_path" )
mimp1<-ncvar_get(nc1,"mean_ice_mass_path" )
mimp2<-ncvar_get(nc2,"mean_ice_mass_path" )
mimp3<-ncvar_get(nc3,"mean_ice_mass_path" )
mimp4<-ncvar_get(nc4,"mean_ice_mass_path" )
mimp5<-ncvar_get(nc5,"mean_ice_mass_path" )
mimp6<-ncvar_get(nc6,"mean_ice_mass_path" )
#variable "total_surface_ppt"
tsp<-ncvar_get(nc,"total_surface_ppt")
tsp1<-ncvar_get(nc1,"total_surface_ppt")
tsp2<-ncvar_get(nc2,"total_surface_ppt")
tsp3<-ncvar_get(nc3,"total_surface_ppt") ###EORROR
tsp4<-ncvar_get(nc4,"total_surface_ppt") ###EORROR
tsp5<-ncvar_get(nc5,"total_surface_ppt") ###EORROR
tsp6<-ncvar_get(nc6,"total_surface_ppt") ###EORROR

################################# VAR CONTOUR PLOT ###############################
########### variable "cloud_mass" 
cm<-ncvar_get(nc,"cloud_mass")
cm1<-ncvar_get(nc1,"cloud_mass")
cm2<-ncvar_get(nc2,"cloud_mass") 
cm3<-ncvar_get(nc3,"cloud_mass")
cm4<-ncvar_get(nc4,"cloud_mass") 
cm5<-ncvar_get(nc5,"cloud_mass") 
cm6<-ncvar_get(nc6,"cloud_mass") 
z<-ncvar_get(nc,'z')
t<-ncvar_get(nc,'time')
########### variable  "rain_mass" 
rm<-ncvar_get(nc,"rain_mass")
rm1<-ncvar_get(nc1,"rain_mass")
rm2<-ncvar_get(nc2,"rain_mass")
rm3<-ncvar_get(nc3,"rain_mass")
rm4<-ncvar_get(nc4,"rain_mass")
rm5<-ncvar_get(nc5,"rain_mass")
rm6<-ncvar_get(nc6,"rain_mass")
########### variable "ice_mass" 
im<-ncvar_get(nc,"ice_mass")
im1<-ncvar_get(nc1,"ice_mass")
im2<-ncvar_get(nc2,"ice_mass")
im3<-ncvar_get(nc3,"ice_mass")
im4<-ncvar_get(nc4,"ice_mass")
im5<-ncvar_get(nc5,"ice_mass")
im6<-ncvar_get(nc6,"ice_mass")
################################### PLOTTING LINE ################################
################# Plot "mean_ice_mass_path"
png("SQUALL_2D Mean Ice Mass Path.png",width = 823,height = 546)
plot(t,mimp, type = "l", col="blue", xlab="",ylab="",ylim = range(mimp2),cex.axis=1.8)
lines(t,mimp1, type = "l", col="green", add=T)
lines(t,mimp2, type = "l", col="red", add=T)
# lines(t,mimp3, type = "l", col="yellow", add=T)
title(cex.main=1.8, cex.lab=1.6, cex.axis=1.6,main="SQUALL_2D Mean Ice Mass Path",
      xlab="Time [s]", ylab="Mean Ice Mass [kg/kg kg/m2]")
legend(2000, 0.06, legend=c("Thompson07", "Thompson09","Morrison"),
       col=c("blue", "green","red"), lty=1, cex=1.8,
       title="Parameterisasi", text.font=4)
dev.off()
################# Plot "mean_rain_mass_path"
png("SQUALL_2D Mean Rain Mass Path.png",width = 823,height = 546)
plot(t,rmp, type = "l", col="blue", xlab="",ylab="",ylim = range(rmp2),cex.axis=1.8)
lines(t,rmp1, type = "l", col="green", add=T)
lines(t,rmp2, type = "l", col="red", add=T)
# lines(t,rmp6, type = "l", col="yellow", add=T)
title(cex.main=1.8, cex.lab=1.6, cex.axis=1.6, main="SQUALL_2D Mean Rain Mass Path",
      xlab="Time [s]", ylab="Mean Rain Mass Path [kg/kg kg/m2]")
legend(2000, 1.5, legend=c("Thompson07", "Thompson09","Morrison"),
       col=c("blue", "green","red"), lty=1, cex=1.8,
       title="Parameterisasi", text.font=4)
dev.off()
################# Plot "mean_cloud_mass_path" 
png("SQUALL_2D Mean Cloud Mass Path.png",width = 823,height = 546)
plot(t,cmp, type = "l", col="blue", xlab="",ylab="",ylim = range(cmp2),cex.axis=1.8)
lines(t,cmp1, type = "l", col="green", add=T)
lines(t,cmp2, type = "l", col="red", add=T)
# lines(t,cmp6, type = "l", col="yellow", add=T)
title(cex.main=1.8, cex.lab=1.6, cex.axis=1.6,main="SQUALL_2D Mean Cloud Mass Path",
      xlab="Time [s]", ylab="Mean Cloud Mass Path [kg/kg kg/m2]")
legend(2300, 0.9, legend=c("Thompson07", "Thompson09","Morrison"),
       col=c("blue", "green","red"), lty=1, cex=1.8,
       title="Parameterisasi", text.font=4)
dev.off()
################# Plot "total_surface_ppt"
png("SQUALL_2D Total Surface Precipitation.png",width = 823,height = 546)
plot(x,apply(tsp*1e+3, 2, FUN="mean", na.rm=T),
     type = "l", col="blue", xlab="",ylab="",ylim = range(tsp*1e+3),cex.axis=1.8)
lines(x,apply(tsp1*1e+3, 2, FUN="mean",na.rm=T), type = "l", col="green", add=T)
lines(x,apply(tsp2*1e+3, 2, FUN="mean",na.rm=T), type = "l", col="red", add=T)
title(cex.main=1.8, cex.lab=1.6, cex.axis=1.6,main="SQUALL_2D Total Surface Precipitation",
      xlab="x [m]", ylab="Total Surface Precipitaion [mm/h]")
legend(100000, 60, legend=c("Thompson07", "Thompson09","Morrison"),
       col=c("blue", "green","red"), lty=1, cex=1.8,
       title="Parameterisasi", text.font=4)
dev.off()

################################### PLOTTING CONTOUR ################################
################ Plot contour "cloud_mass"  
cols<-colorRampPalette(jet.colors(19))
ccm<-apply(cm, c(1,3), FUN = "mean", na.rm=T)
ccm1<-apply(cm1, c(1,3), FUN = "mean", na.rm=T)
ccm2<-apply(cm2, c(1,3), FUN = "mean", na.rm=T)
# ccm3<-apply(cm3, c(1,3), FUN = "mean", na.rm=T)
# ccm3<-apply(cm4, c(1,3), FUN = "mean", na.rm=T)
# ccm5<-apply(cm5, c(1,3), FUN = "mean", na.rm=T)
# ccm6<-apply(cm6, c(1,3), FUN = "mean", na.rm=T)
png("Cloud Mass SQUALL_2D Thompson07.png",width = 823,height = 546)
filled.contour(t,z,ccm*1e+4,color.palette = cols,
               plot.title = title(main = "Cloud Mass SQUALL_2D Thompson07 [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
png("Cloud Mass SQUALL_2D Thompson09.png",width = 823,height = 546)
filled.contour(t,z,ccm1*1e+4,color.palette = cols,
               plot.title = title(main = "Cloud Mass SQUALL_2D Thompson09 [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
png("Cloud Mass SQUALL_2D Morrison.png",width = 823,height = 546)
filled.contour(t,z,ccm2*1e+4,color.palette = cols,
               plot.title = title(main = "Cloud Mass SQUALL_2D Morrison [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
################ Plot contour "rain_mass" 
cols<-colorRampPalette(jet.colors(19))
crm<-apply(rm, c(1,3), FUN = "mean", na.rm=T)
crm1<-apply(rm1, c(1,3), FUN = "mean", na.rm=T)
crm2<-apply(rm2, c(1,3), FUN = "mean", na.rm=T)
png("Rain Mass SQUALL_2D Thompson07.png",width = 823,height = 546)
filled.contour(t,z,crm*1e+4,color.palette = cols,
               plot.title = title(main = "Rain Mass SQUALL_2D Thompson07 [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
png("Rain Mass SQUALL_2D Thompson09.png",width = 823,height = 546)
filled.contour(t,z,crm1*1e+4,color.palette = cols,
               plot.title = title(main = "Rain Mass SQUALL_2D Thompson09 [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
png("Rain Mass SQUALL_2D Morrison.png",width = 823,height = 546)
filled.contour(t,z,crm2*1e+4,color.palette = cols,
               plot.title = title(main = "Rain Mass SQUALL_2D Morrison [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
################ Plot contour "ice_mass"
cols<-colorRampPalette(jet.colors(19))
crm<-apply(im, c(1,3), FUN = "mean", na.rm=T)
crm1<-apply(im1, c(1,3), FUN = "mean", na.rm=T)
crm2<-apply(im2, c(1,3), FUN = "mean", na.rm=T)
png("Ice Mass SQUALL_2D Thompson07.png",width = 823,height = 546)
filled.contour(t,z,crm*1e+4,color.palette = cols,
               plot.title = title(main = "Ice Mass SQUALL_2D Thompson07 [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.1),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
png("Ice Mass SQUALL_2D Thompson09.png",width = 823,height = 546)
filled.contour(t,z,crm1*1e+4,color.palette = cols,
               plot.title = title(main = "Ice Mass SQUALL_2D Thompson09 [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()
png("Ice Mass SQUALL_2D Morrison.png",width = 823,height = 546)
filled.contour(t,z,crm2*1e+4,color.palette = cols,
               plot.title = title(main = "Ice Mass SQUALL_2D Morrison [kg/kg]",
               xlab="Time [s]", ylab="Height [m]",cex.main=1.8, cex.lab=1.6,cex.axis=1.6),
               key.title = title(main=expression(paste("x10"^"-4"))))
dev.off()