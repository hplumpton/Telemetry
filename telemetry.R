
library(rgdal)
library(maps)
library(raster)
library(rgeos)
library(maptools)



tel<-read.csv("TelData2.csv")
coordinates(tel)<-c("longitud","latitude")
proj4string(tel)<-CRS("+proj=longlat +datum=WGS84") 
writeOGR(obj=tel, dsn="tempdir", layer="telemetry", driver="ESRI Shapefile")
