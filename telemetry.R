
library(rgdal)
library(maps)
library(raster)
library(rgeos)
library(maptools)



tel<-read.csv("TelData2.csv")
coordinates(tel)<-c("longitud","latitude")
proj4string(tel)<-CRS("+proj=longlat +datum=WGS84") 
#writeOGR(obj=tel, dsn="tempdir", layer="telemetry", driver="ESRI Shapefile")

b36485f10<-read.csv("year/b36485f10.csv")
b36485f10<-do.call( rbind, lapply( split(b36485f10, b36485f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36485f10)

b36486f10<-read.csv("year/b36486f10.csv")
b36486f10<-do.call( rbind, lapply( split(b36486f10, b36486f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36486f10)

b36486f11<-read.csv("year/b36486f11.csv")
b36486f11<-do.call( rbind, lapply( split(b36486f11, b36486f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36486f11)

b36486f12<-read.csv("year/b36486f12.csv")
b36486f12<-do.call( rbind, lapply( split(b36486f12, b36486f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36486f12)

b36492f10<-read.csv("year/b36492f10.csv")
b36492f10<-do.call( rbind, lapply( split(b36492f10, b36492f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36492f10)

b36492f11<-read.csv("year/b36492f11.csv")
b36492f11<-do.call( rbind, lapply( split(b36492f11, b36492f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36492f11)

b36492f12<-read.csv("year/b36492f12.csv")
b36492f12<-do.call( rbind, lapply( split(b36492f12, b36492f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36492f12)

b36614f10<-read.csv("year/b36614f10.csv")
b36614f10<-do.call( rbind, lapply( split(b36614f10, b36614f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36614f10)

b36614f11<-read.csv("year/b36614f11.csv")
b36614f11<-do.call( rbind, lapply( split(b36614f11, b36614f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36614f11)

b36615f10<-read.csv("year/b36615f10.csv")
b36615f10<-do.call( rbind, lapply( split(b36615f10, b36615f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36615f10)

b36615f11<-read.csv("year/b36615f11.csv")
b36615f11<-do.call( rbind, lapply( split(b36615f11, b36615f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36615f11)

b36657f10<-read.csv("year/b36615f10.csv")
b36657f10<-do.call( rbind, lapply( split(b36657f10, b36657f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36657f10)

b36657f11<-read.csv("year/b36615f11.csv")
b36657f11<-do.call( rbind, lapply( split(b36657f11, b36657f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36657f11)

b36657f12<-read.csv("year/b36615f12.csv")
b36657f12<-do.call( rbind, lapply( split(b36657f12, b36657f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36657f12)








library(ks)

hb26486f10<-kde(b26486f10)
