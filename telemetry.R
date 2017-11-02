
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

b36650f10<-read.csv("year/b36650f10.csv")
b36650f10<-do.call( rbind, lapply( split(b36650f10, b36650f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36650f10)

b36657f10<-read.csv("year/b36657f10.csv")
b36657f10<-do.call( rbind, lapply( split(b36657f10, b36657f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36657f10)

b36657f11<-read.csv("year/b36657f11.csv")
b36657f11<-do.call( rbind, lapply( split(b36657f11, b36657f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36657f11)

b36657f12<-read.csv("year/b36657f12.csv")
b36657f12<-do.call( rbind, lapply( split(b36657f12, b36657f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36657f12)

b36944f10<-read.csv("year/b36944f10.csv")
b36944f10<-do.call( rbind, lapply( split(b36944f10, b36944f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36944f10)

b36970f10<-read.csv("year/b36970f10.csv")
b36970f10<-do.call( rbind, lapply( split(b36970f10, b36970f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36970f10)

b36970f11<-read.csv("year/b36970f11.csv")
b36970f11<-do.call( rbind, lapply( split(b36970f11, b36970f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36970f11)

b36970f12<-read.csv("year/b36970f12.csv")
b36970f12<-do.call( rbind, lapply( split(b36970f12, b36970f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b36970f12)

b37019f10<-read.csv("year/b37019f10.csv")
b37019f10<-do.call( rbind, lapply( split(b37019f10, b37019f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37019f10)

b37019f11<-read.csv("year/b37019f11.csv")
b37019f11<-do.call( rbind, lapply( split(b37019f11, b37019f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37019f11)

b37019f12<-read.csv("year/b37019f12.csv")
b37019f12<-do.call( rbind, lapply( split(b37019f12, b37019f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37019f12)

b37021f10<-read.csv("year/b37021f10.csv")
b37021f10<-do.call( rbind, lapply( split(b37021f10, b37021f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37021f10)

b37021f11<-read.csv("year/b37021f11.csv")
b37021f11<-do.call( rbind, lapply( split(b37021f11, b37021f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37021f11)

b37022f10<-read.csv("year/b37022f10.csv")
b37022f10<-do.call( rbind, lapply( split(b37022f10, b37022f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37022f10)

b37022f11<-read.csv("year/b37022f11.csv")
b37022f11<-do.call( rbind, lapply( split(b37022f11, b37022f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37022f11)

b37022f12<-read.csv("year/b37022f12.csv")
b37022f12<-do.call( rbind, lapply( split(b37022f12, b37022f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37022f12)

b37031f10<-read.csv("year/b37031f10.csv")
b37031f10<-do.call( rbind, lapply( split(b37031f10, b37031f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37031f10)

b37041f10<-read.csv("year/b37041f10.csv")
b37041f10<-do.call( rbind, lapply( split(b37041f10, b37041f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37041f10)

b37041f11<-read.csv("year/b37041f11.csv")
b37041f11<-do.call( rbind, lapply( split(b37041f11, b37041f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37041f11)

b37041f12<-read.csv("year/b37041f12.csv")
b37041f12<-do.call( rbind, lapply( split(b37041f12, b37041f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37041f12)

b37075f10<-read.csv("year/b37075f10.csv")
b37075f10<-do.call( rbind, lapply( split(b37075f10, b37075f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37075f10)

b37077f10<-read.csv("year/b37077f10.csv")
b37077f10<-do.call( rbind, lapply( split(b37077f10, b37077f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37077f10)

b37077f11<-read.csv("year/b37077f11.csv")
b37077f11<-do.call( rbind, lapply( split(b37077f11, b37077f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37077f11)

b37226f10<-read.csv("year/b37226f10.csv")
b37226f10<-do.call( rbind, lapply( split(b37226f10, b37226f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37226f10)

b37226f11<-read.csv("year/b37226f11.csv")
b37226f11<-do.call( rbind, lapply( split(b37226f11, b37226f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37226f11)

b37320f10<-read.csv("year/b37320f10.csv")
b37320f10<-do.call( rbind, lapply( split(b37320f10, b37320f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37320f10)

b37320f11<-read.csv("year/b37320f11.csv")
b37320f11<-do.call( rbind, lapply( split(b37320f11, b37320f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37320f11)

b37516f10<-read.csv("year/b37516f10.csv")
b37516f10<-do.call( rbind, lapply( split(b37516f10, b37516f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37516f10)

b37516f11<-read.csv("year/b37516f11.csv")
b37516f11<-do.call( rbind, lapply( split(b37516f11, b37516f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37516f11)

b37519f10<-read.csv("year/b37519f10.csv")
b37519f10<-do.call( rbind, lapply( split(b37519f10, b37519f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b37519f10)

b39069f10<-read.csv("year/b39069f10.csv")
b39069f10<-do.call( rbind, lapply( split(b39069f10, b39069f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39069f10)

b39069f11<-read.csv("year/b39069f11.csv")
b39069f11<-do.call( rbind, lapply( split(b39069f11, b39069f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39069f11)

b39069f12<-read.csv("year/b39069f12.csv")
b39069f12<-do.call( rbind, lapply( split(b39069f12, b39069f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39069f12)

b39076f10<-read.csv("year/b39076f10.csv")
b39076f10<-do.call( rbind, lapply( split(b39076f10, b39076f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39076f10)

b39076f11<-read.csv("year/b39076f11.csv")
b39076f11<-do.call( rbind, lapply( split(b39076f11, b39076f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39076f11)

b39076f12<-read.csv("year/b39076f12.csv")
b39076f12<-do.call( rbind, lapply( split(b39076f12, b39076f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39076f12)

b39081f10<-read.csv("year/b39081f10.csv")
b39081f10<-do.call( rbind, lapply( split(b39081f10, b39081f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39081f10)

b39082f10<-read.csv("year/b39082f10.csv")
b39082f10<-do.call( rbind, lapply( split(b39082f10, b39082f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39082f10)

b39082f11<-read.csv("year/b39082f11.csv")
b39082f11<-do.call( rbind, lapply( split(b39082f11, b39082f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39082f11)

b39089f10<-read.csv("year/b39089f10.csv")
b39089f10<-do.call( rbind, lapply( split(b39089f10, b39089f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39089f10)

b39090f10<-read.csv("year/b39090f10.csv")
b39090f10<-do.call( rbind, lapply( split(b39090f10, b39090f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39090f10)

b39090f11<-read.csv("year/b39090f11.csv")
b39090f11<-do.call( rbind, lapply( split(b39090f11, b39090f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39090f11)

b39090f12<-read.csv("year/b39090f12.csv")
b39090f12<-do.call( rbind, lapply( split(b39090f12, b39090f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39090f12)

b39099f10<-read.csv("year/b39099f10.csv")
b39099f10<-do.call( rbind, lapply( split(b39099f10, b39099f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39099f10)

b39211f10<-read.csv("year/b39211f10.csv")
b39211f10<-do.call( rbind, lapply( split(b39211f10, b39211f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39211f10)

b39212f10<-read.csv("year/b39212f10.csv")
b39212f10<-do.call( rbind, lapply( split(b39212f10, b39212f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39212f10)

b39212f11<-read.csv("year/b39212f11.csv")
b39212f11<-do.call( rbind, lapply( split(b39212f11, b39212f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39212f11)

b39233f10<-read.csv("year/b39233f10.csv")
b39233f10<-do.call( rbind, lapply( split(b39233f10, b39233f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39233f10)

b39233f11<-read.csv("year/b39233f11.csv")
b39233f11<-do.call( rbind, lapply( split(b39233f11, b39233f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39233f11)

b39233f12<-read.csv("year/b39233f12.csv")
b39233f12<-do.call( rbind, lapply( split(b39233f12, b39233f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39233f12)

b39244f10<-read.csv("year/b39244f10.csv")
b39244f10<-do.call( rbind, lapply( split(b39244f10, b39244f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39244f10)

b39244f11<-read.csv("year/b39244f11.csv")
b39244f11<-do.call( rbind, lapply( split(b39244f11, b39244f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39244f11)

b39260f10<-read.csv("year/b39260f10.csv")
b39260f10<-do.call( rbind, lapply( split(b39260f10, b39260f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39260f10)

b39268f10<-read.csv("year/b39268f10.csv")
b39268f10<-do.call( rbind, lapply( split(b39268f10, b39268f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39268f10)

b39268f11<-read.csv("year/b39268f11.csv")
b39268f11<-do.call( rbind, lapply( split(b39268f11, b39268f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39268f11)

b39268f12<-read.csv("year/b39268f12.csv")
b39268f12<-do.call( rbind, lapply( split(b39268f12, b39268f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39268f12)

b39271f10<-read.csv("year/b39271f10.csv")
b39271f10<-do.call( rbind, lapply( split(b39271f10, b39271f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39271f10)

b39293f10<-read.csv("year/b39293f10.csv")
b39293f10<-do.call( rbind, lapply( split(b39293f10, b39293f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39293f10)

b39293f11<-read.csv("year/b39293f11.csv")
b39293f11<-do.call( rbind, lapply( split(b39293f11, b39293f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39293f11)

b39293f12<-read.csv("year/b39293f12.csv")
b39293f12<-do.call( rbind, lapply( split(b39293f12, b39293f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39293f12)

b39301f10<-read.csv("year/b39301f10.csv")
b39301f10<-do.call( rbind, lapply( split(b39301f10, b39301f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39301f10)

b39301f11<-read.csv("year/b39301f11.csv")
b39301f11<-do.call( rbind, lapply( split(b39301f11, b39301f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39301f11)

b39365f10<-read.csv("year/b39365f10.csv")
b39365f10<-do.call( rbind, lapply( split(b39365f10, b39365f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39365f10)

b39365f11<-read.csv("year/b39365f11.csv")
b39365f11<-do.call( rbind, lapply( split(b39365f11, b39365f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39365f11)

b39365f12<-read.csv("year/b39365f12.csv")
b39365f12<-do.call( rbind, lapply( split(b39365f12, b39365f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39365f12)

b39746f10<-read.csv("year/b39746f10.csv")
b39746f10<-do.call( rbind, lapply( split(b39746f10, b39746f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39746f10)

b39746f11<-read.csv("year/b39746f11.csv")
b39746f11<-do.call( rbind, lapply( split(b39746f11, b39746f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39746f11)

b39753f10<-read.csv("year/b39753f10.csv")
b39753f10<-do.call( rbind, lapply( split(b39753f10, b39753f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39753f10)

b39753f11<-read.csv("year/b39753f11.csv")
b39753f11<-do.call( rbind, lapply( split(b39753f11, b39753f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39753f11)

b39753f12<-read.csv("year/b39753f12.csv")
b39753f12<-do.call( rbind, lapply( split(b39753f12, b39753f12$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39753f12)

b39761f10<-read.csv("year/b39761f10.csv")
b39761f10<-do.call( rbind, lapply( split(b39761f10, b39761f10$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39761f10)

b39761f11<-read.csv("year/b39761f11.csv")
b39761f11<-do.call( rbind, lapply( split(b39761f11, b39761f11$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b39761f11)

b65584f09<-read.csv("year/b65584f09.csv")
b65584f09<-do.call( rbind, lapply( split(b65584f09, b65584f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65584f09)

b65601f09<-read.csv("year/b65601f09.csv")
b65601f09<-do.call( rbind, lapply( split(b65601f09, b65601f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65601f09)

b65602f09<-read.csv("year/b65602f09.csv")
b65602f09<-do.call( rbind, lapply( split(b65602f09, b65602f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65602f09)

b65603f09<-read.csv("year/b65603f09.csv")
b65603f09<-do.call( rbind, lapply( split(b65603f09, b65603f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65603f09)

b65607f09<-read.csv("year/b65607f09.csv")
b65607f09<-do.call( rbind, lapply( split(b65607f09, b65607f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65607f09)

b65609f09<-read.csv("year/b65609f09.csv")
b65609f09<-do.call( rbind, lapply( split(b65609f09, b65609f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65609f09)

b65610f09<-read.csv("year/b65610f09.csv")
b65610f09<-do.call( rbind, lapply( split(b65610f09, b65610f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65610f09)

b65611f09<-read.csv("year/b65611f09.csv")
b65611f09<-do.call( rbind, lapply( split(b65611f09, b65611f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65611f09)

b65612f09<-read.csv("year/b65612f09.csv")
b65612f09<-do.call( rbind, lapply( split(b65612f09, b65612f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65612f09)

b65616f09<-read.csv("year/b65616f09.csv")
b65616f09<-do.call( rbind, lapply( split(b65616f09, b65616f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65616f09)

b65617f09<-read.csv("year/b65617f09.csv")
b65617f09<-do.call( rbind, lapply( split(b65617f09, b65617f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65617f09)

b65618f09<-read.csv("year/b65618f09.csv")
b65618f09<-do.call( rbind, lapply( split(b65618f09, b65618f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b65618f09)

b66287f09<-read.csv("year/b66287f09.csv")
b66287f09<-do.call( rbind, lapply( split(b66287f09, b66287f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b66287f09)

b80908f09<-read.csv("year/b80908f09.csv")
b80908f09<-do.call( rbind, lapply( split(b80908f09, b80908f09$date),function(df) df[sample(nrow(df), 1) , ] ))
summary(b80908f09)



library(ks)

bs36485f10<-as.data.frame(cbind(b36485f10$latitude,b36485f10$longitude))
plot(kde(bs36485f10),display='persp')
bs36485f10.H<-Hpi(bs36485f10)
band.mult<-3
x.grid.size<-50
x=seq(min(bs36485f10[,1])-band.mult*sqrt(bs36485f10.H[1,1]), max(bs36485f10[,1]) + band.mult *sqrt(bs36485f10.H[1,1]), length.out=x.grid.size)

y=seq(min(bs36485f10[,2])-band.mult*sqrt(bs36485f10.H[2,2]), max(bs36485f10[,2])+ band.mult*sqrt(bs36485f10.H[2,2]), by=(x[2]-x[1])) 

grid<-expand.grid(x,y)

bs36485f10<-kde(bs36485f10,H=bs36485f10.H,eval.points=grid)
bs36485f10.out<- cbind(bs36485f10$eval.points[,1],bs36485f10$eval.points[,2],bs36485f10$estimate)

sum((x[2]-x[1])*(y[2]-y[1])*bs36485f10.out[,3])

vol<-bs36485f10.out[,3]/sum(bs36485f10.out[,3])

bs36485f10.out<-data.frame(cbind(bs36485f10.out,vol))
cumV<-cumsum(bs36485f10.out$vol)
bs36485f10.out<-data.frame(cbind(bs36485f10.out,cumV))
bs36485f10.UD<-subset(bs36485f10.out,bs36485f10.out$cumV<=0.50)

volume<-bs36485f10.UD$vol
z<-((volume-min(volume))/(max(volume)-min(volume)))*100

bs36485f10.UD<-cbind(bs36485f10.UD,z)
write.csv(bs36485f10.UD, "bs36485f10.UD.csv",row.names=FALSE)





