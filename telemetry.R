
library(rgdal)
library(maps)
library(raster)
library(rgeos)
library(maptools)



tel<-read.csv("TelData2.csv")
coordinates(tel)<-c("longitud","latitude")
proj4string(tel)<-CRS("+proj=longlat +datum=WGS84") 
#writeOGR(obj=tel, dsn="tempdir", layer="telemetry", driver="ESRI Shapefile")



b26486f10<-rgdal::readOGR("tempdir/blsc26486f11.shp")
b26486f10<-subset(b26486f10,lat_p>44.5 & lon_p<81.5,select=animal:sampsiz)
L1<-subset(b26486f10,lc94=="L1",select=animal:sampsiz)
L2<-subset(b26486f10,lc94=="L2",select=animal:sampsiz)
L3<-subset(b26486f10,lc94=="L3",select=animal:sampsiz)
b26486f10<-rbind(L1,L2,L3)
b26486f10<-spTransform(b26486f10,CRS(proj4string(tel)))
summary(b26486f10)

b80908<-rgdal::readOGR("tempdir/blsc80908.shp")
b80908<-spTransform(b80908,CRS(proj4string(tel)))

library(adehabitatHR)
home<-kernelUD(b80908[,3], h="href",grid=50, extent=0.5)
image(home)
ver<-getverticeshr(home,50)
plot(ver)

library(ks)

hb26486f10<-kde(b26486f10)
