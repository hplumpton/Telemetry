
library(rgdal)
library(maps)
library(raster)
library(rgeos)
library(maptools)



tel<-read.csv("TelData2.csv")
coordinates(tel)<-c("longitud","latitude")
proj4string(tel)<-CRS("+proj=longlat +datum=WGS84") 
#writeOGR(obj=tel, dsn="tempdir", layer="telemetry", driver="ESRI Shapefile")


b36485 <- subset(tel, ptt=="36485", 
                  select=c(animal:sampsize))
coordinates(b36485)<-c("longitud","latitude")
proj4string(b36485)<-CRS("+proj=longlat +datum=WGS84")

library(adehabitatHR)
home<-kernelUD(b36485[,3], h="LSCV",hlim= )
image(home)
ver<-getverticeshr(home,95)
plot(ver)
