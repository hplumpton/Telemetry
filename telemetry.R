
library(rgdal)
library(maps)
library(raster)
library(rgeos)
library(maptools)



tel<-read.csv("TelData2.csv")
coordinates(tel)<-c("longitud","latitude")
proj4string(tel)<-CRS("+proj=longlat +datum=WGS84") 
#writeOGR(obj=tel, dsn="tempdir", layer="telemetry", driver="ESRI Shapefile")


b36485f10<-rgdal::readOGR("tempdir/b36485f10.shp")
b36485f10<-as.data.frame(b36485f10)
write.csv(b36485f10,file="b36485f10.csv")

b36485f11<-rgdal::readOGR("tempdir/b36485f11.shp")
b36485f11<-as.data.frame(b36485f11)
write.csv(b36485f11,file="b36485f11.csv")

b36486f10<-rgdal::readOGR("tempdir/blsc36486f10.shp")
b36486f10<-as.data.frame(b36486f10)
write.csv(b36486f10,file="b36486f10.csv")

b36486f11<-rgdal::readOGR("tempdir/blsc36486f11.shp")
b36486f11<-as.data.frame(b36486f11)
write.csv(b36486f11,file="b36486f11.csv")

b36486f12<-rgdal::readOGR("tempdir/blsc36486f12.shp")
b36486f12<-as.data.frame(b36486f12)
write.csv(b36486f12,file="b36486f12.csv")

b36492f10<-rgdal::readOGR("tempdir/blsc36492f10.shp")
b36492f10<-as.data.frame(b36492f10)
write.csv(b36492f10,file="b36492f10.csv")

b36492f11<-rgdal::readOGR("tempdir/blsc36492f11.shp")
b36492f11<-as.data.frame(b36492f11)
write.csv(b36492f11,file="b36492f11.csv")

b36492f12<-rgdal::readOGR("tempdir/blsc36492f12.shp")
b36492f12<-as.data.frame(b36492f12)
write.csv(b36492f12,file="b36492f12.csv")

b36614f10<-rgdal::readOGR("tempdir/blsc36614f10.shp")
b36614f10<-as.data.frame(b36614f10)
write.csv(b36614f10,file="b36614f10.csv")

b36614f11<-rgdal::readOGR("tempdir/blsc36614f11.shp")
b36614f11<-as.data.frame(b36614f11)
write.csv(b36614f11,file="b36614f11.csv")

b36615f10<-rgdal::readOGR("tempdir/blsc36615f10.shp")
b36615f10<-as.data.frame(b36615f10)
write.csv(b36615f10,file="b36615f10.csv")

b36650f10<-rgdal::readOGR("tempdir/blsc36650f10.shp")
b36650f10<-as.data.frame(b36650f10)
write.csv(b36650f10,file="b36650f10.csv")

b36650f11<-rgdal::readOGR("tempdir/blsc36650f11.shp")
b36650f11<-as.data.frame(b36650f11)
write.csv(b36650f11,file="b36650f11.csv")

b36657f10<-rgdal::readOGR("tempdir/blsc36657f10.shp")
b36657f10<-as.data.frame(b36657f10)
write.csv(b36657f10,file="b36657f10.csv")

b36657f11<-rgdal::readOGR("tempdir/blsc36657f11.shp")
b36657f11<-as.data.frame(b36657f11)
write.csv(b36657f11,file="b36650f11.csv")

b36657f12<-rgdal::readOGR("tempdir/blsc36657f12.shp")
b36657f12<-as.data.frame(b36657f12)
write.csv(b36657f12,file="b36657f12.csv")

b36944f10<-rgdal::readOGR("tempdir/blsc36944f10.shp")
b36944f10<-as.data.frame(b36944f10)
write.csv(b36944f10,file="b36944f17.csv")

b36970f10<-rgdal::readOGR("tempdir/b36970f10.shp")
b36970f10<-as.data.frame(b36970f10)
write.csv(b36970f10,file="b36970f10.csv")

b36970f11<-rgdal::readOGR("tempdir/b36970f11.shp")
b36970f11<-as.data.frame(b36970f11)
write.csv(b36970f11,file="b36970f11.csv")

b36970f12<-rgdal::readOGR("tempdir/b36970f12.shp")
b36970f12<-as.data.frame(b36970f12)
write.csv(b36970f12,file="b36970f12.csv")

b37019f10<-rgdal::readOGR("tempdir/b37019f10.shp")
b37019f10<-as.data.frame(b37019f10)
write.csv(b37019f10,file="b37019f10.csv")

b37019f11<-rgdal::readOGR("tempdir/b37019f11.shp")
b37019f11<-as.data.frame(b37019f11)
write.csv(b37019f11,file="b37019f11.csv")

b37019f12<-rgdal::readOGR("tempdir/b37019f12.shp")
b37019f12<-as.data.frame(b37019f12)
write.csv(b37019f12,file="b37019f12.csv")

b37021f10<-rgdal::readOGR("tempdir/b37021f10.shp")
b37021f10<-as.data.frame(b37021f10)
write.csv(b37021f10,file="b37021f10.csv")

b37021f11<-rgdal::readOGR("tempdir/b37021f11.shp")
b37021f11<-as.data.frame(b37021f11)
write.csv(b37021f11,file="b37021f11.csv")

b37021f12<-rgdal::readOGR("tempdir/b37021f12.shp")
b37021f12<-as.data.frame(b37022f10)
write.csv(b37022f10,file="b37022f10.csv")

b37021f12<-rgdal::readOGR("tempdir/b37021f12.shp")
b37021f12<-as.data.frame(b37022f10)
write.csv(b37022f10,file="b37022f10.csv")

b37022f10<-rgdal::readOGR("tempdir/b37022f10.shp")
b37022f10<-as.data.frame(b37022f10)
write.csv(b37022f10,file="b37022f10.csv")

b37022f11<-rgdal::readOGR("tempdir/b37022f11.shp")
b37022f11<-as.data.frame(b37022f11)
write.csv(b37022f11,file="b37022f11.csv")

b37022f12<-rgdal::readOGR("tempdir/b37022f12.shp")
b37022f12<-as.data.frame(b37022f12)
write.csv(b37022f12,file="b37022f12.csv")

b37031f10<-rgdal::readOGR("tempdir/b37031f10.shp")
b37031f10<-as.data.frame(b37031f10)
write.csv(b37031f10,file="b37031f10.csv")

b37041f10<-rgdal::readOGR("tempdir/b37041f10.shp")
b37041f10<-as.data.frame(b37041f10)
write.csv(b37041f10,file="b37041f10.csv")

b37041f11<-rgdal::readOGR("tempdir/b37041f11.shp")
b37041f11<-as.data.frame(b37041f11)
write.csv(b37041f11,file="b37041f11.csv")

b37041f12<-rgdal::readOGR("tempdir/b37041f12.shp")
b37041f12<-as.data.frame(b37041f12)
write.csv(b37041f12,file="b37041f12.csv")

b37075f10<-rgdal::readOGR("tempdir/b37075f10.shp")
b37075f10<-as.data.frame(b37075f10)
write.csv(b37075f10,file="b37075f10.csv")

b37077f10<-rgdal::readOGR("tempdir/b37077f10.shp")
b37077f10<-as.data.frame(b37077f10)
write.csv(b37077f10,file="b37077f10.csv")

b37077f11<-rgdal::readOGR("tempdir/b37077f11.shp")
b37077f11<-as.data.frame(b37077f11)
write.csv(b37077f11,file="b37077f11.csv")

b37226f10<-rgdal::readOGR("tempdir/b37226f10.shp")
b37226f10<-as.data.frame(b37226f10)
write.csv(b37226f10,file="b37226f10.csv")

b37226f11<-rgdal::readOGR("tempdir/b37226f11.shp")
b37226f11<-as.data.frame(b37226f11)
write.csv(b37226f11,file="b37226f11.csv")

b37226f12<-rgdal::readOGR("tempdir/b37226f12.shp")
b37226f12<-as.data.frame(b37226f12)
write.csv(b37226f12,file="b37226f12.csv")

b37320f10<-rgdal::readOGR("tempdir/b37320f10.shp")
b37320f10<-as.data.frame(b37320f10)
write.csv(b37320f10,file="b37320f10.csv")

b37320f11<-rgdal::readOGR("tempdir/b37320f11.shp")
b37320f11<-as.data.frame(b37320f11)
write.csv(b37320f11,file="b37320f11.csv")

b37320f12<-rgdal::readOGR("tempdir/b37320f12.shp")
b37320f12<-as.data.frame(b37320f12)
write.csv(b37320f12,file="b37320f12.csv")

b37516f10<-rgdal::readOGR("tempdir/b37516f10.shp")
b37516f10<-as.data.frame(b37516f10)
write.csv(b37516f10,file="b37516f10.csv")

b37516f11<-rgdal::readOGR("tempdir/b37516f11.shp")
b37516f11<-as.data.frame(b37516f11)
write.csv(b37516f11,file="b37516f11.csv")

b37519f10<-rgdal::readOGR("tempdir/b37519f10.shp")
b37519f10<-as.data.frame(b37519f10)
write.csv(b37519f10,file="b37519f10.csv")

b39069f10<-rgdal::readOGR("tempdir/b39069f10.shp")
b39069f10<-as.data.frame(b39069f10)
write.csv(b39069f10,file="b39069f10.csv")

b39069f11<-rgdal::readOGR("tempdir/b39069f11.shp")
b39069f11<-as.data.frame(b39069f11)
write.csv(b39069f11,file="b39069f11.csv")

b39069f12<-rgdal::readOGR("tempdir/b39069f12.shp")
b39069f12<-as.data.frame(b39069f12)
write.csv(b39069f12,file="b39069f12.csv")

b39076f10<-rgdal::readOGR("tempdir/b39076f10.shp")
b39076f10<-as.data.frame(b39076f10)
write.csv(b39076f10,file="b39076f10.csv")

b39076f11<-rgdal::readOGR("tempdir/b39076f11.shp")
b39076f11<-as.data.frame(b39076f11)
write.csv(b39076f11,file="b39076f11.csv")

b39076f12<-rgdal::readOGR("tempdir/b39076f12.shp")
b39076f12<-as.data.frame(b39076f12)
write.csv(b39076f12,file="b39076f12.csv")

b39081f10<-rgdal::readOGR("tempdir/b39081f10.shp")
b39081f10<-as.data.frame(b39081f10)
write.csv(b39081f10,file="b39081f10.csv")

b39082f10<-rgdal::readOGR("tempdir/b39082f10.shp")
b39082f10<-as.data.frame(b39082f10)
write.csv(b39082f10,file="b39082f10.csv")

b39082f11<-rgdal::readOGR("tempdir/b39082f11.shp")
b39082f11<-as.data.frame(b39082f11)
write.csv(b39082f11,file="b39082f11.csv")

b39082f12<-rgdal::readOGR("tempdir/b39082f12.shp")
b39082f12<-as.data.frame(b39082f12)
write.csv(b39082f12,file="b39082f12.csv")

b39089f10<-rgdal::readOGR("tempdir/b39089f10.shp")
b39089f10<-as.data.frame(b39089f10)
write.csv(b39089f10,file="b39089f10.csv")

b39090f10<-rgdal::readOGR("tempdir/b39090f10.shp")
b39090f10<-as.data.frame(b39090f10)
write.csv(b39090f10,file="b39090f10.csv")

b39090f11<-rgdal::readOGR("tempdir/b39090f11.shp")
b39090f11<-as.data.frame(b39090f11)
write.csv(b39090f11,file="b39090f11.csv")

b39090f12<-rgdal::readOGR("tempdir/b39090f12.shp")
b39090f12<-as.data.frame(b39090f12)
write.csv(b39090f12,file="b39090f12.csv")

b39099f10<-rgdal::readOGR("tempdir/b39099f10.shp")
b39099f10<-as.data.frame(b39099f10)
write.csv(b39099f10,file="b39099f10.csv")

b39099f11<-rgdal::readOGR("tempdir/b39099f11.shp")
b39099f11<-as.data.frame(b39099f11)
write.csv(b39099f11,file="b39099f11.csv")

b39121f10<-rgdal::readOGR("tempdir/b39121f10.shp")
b39121f10<-as.data.frame(b39121f10)
write.csv(b39121f10,file="b39121f10.csv")

b39211f10<-rgdal::readOGR("tempdir/b39211f10.shp")
b39211f10<-as.data.frame(b39211f10)
write.csv(b39211f10,file="b39211f10.csv")

b39211f10<-rgdal::readOGR("tempdir/b39211f10.shp")
b39211f10<-as.data.frame(b39211f10)
write.csv(b39211f10,file="b39211f10.csv")

b39212f11<-rgdal::readOGR("tempdir/b39212f11.shp")
b39212f11<-as.data.frame(b39212f11)
write.csv(b39212f11,file="b39212f11.csv")





b80908<-rgdal::readOGR("tempdir/blsc80908.shp")
b80908<-spTransform(b80908,CRS(proj4string(tel)))

library(adehabitatHR)
home<-kernelUD(b80908[,3], h="href",grid=50, extent=0.5)
image(home)
ver<-getverticeshr(home,50)
plot(ver)

library(ks)

hb26486f10<-kde(b26486f10)
