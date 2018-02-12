
library(rgdal)
library(maps)
library(raster)
library(rgeos)
library(maptools)


library(ks)

b80908f09<-read.csv("year/b80908f09.csv")
b80908f09<-do.call( rbind, lapply( split(b80908f09, b80908f09$date),function(df) df[sample(nrow(df), 1) , ] ))


bs80908f09<-as.data.frame(cbind(b80908f09$longitud,b80908f09$latitude))
plot(kde(bs80908f09),display='persp')
bs80908f09.H<-Hpi(bs80908f09)
plot(kde(bs80908f09[,1:2],H=bs80908f09.H),display="slice",drawpoints=TRUE)

band.mult<-3
x.grid.size<-500
x=seq(min(bs80908f09[,1])-band.mult*sqrt(bs80908f09.H[1,1]), max(bs80908f09[,1]) + band.mult *sqrt(bs80908f09.H[1,1]), length.out=x.grid.size)

y=seq(min(bs80908f09[,2])-band.mult*sqrt(bs80908f09.H[2,2]), max(bs80908f09[,2])+ band.mult*sqrt(bs80908f09.H[2,2]), by=(x[2]-x[1])) 

grid<-expand.grid(x,y)

bs80908f09<-kde(bs80908f09,H=bs80908f09.H,eval.points=grid)
bs80908f09.out<- cbind(bs80908f09$eval.points[,1],bs80908f09$eval.points[,2],bs80908f09$estimate)

#plot(bs80908f09.out[,1],bs80908f09.out[,2])

sum((x[2]-x[1])*(y[2]-y[1])*bs80908f09.out[,3])

vol<-bs80908f09.out[,3]/sum(bs80908f09.out[,3])

bs80908f09.out<-data.frame(cbind(bs80908f09.out,vol))
bs80908f09.out<-bs80908f09.out[order(-bs80908f09.out$vol),]
cumV<-cumsum(bs80908f09.out$vol)
hist(cumV)

bs80908f09.out<-data.frame(cbind(bs80908f09.out,cumV))
bs80908f09.UD<-subset(bs80908f09.out,bs80908f09.out$cumV<=0.50)

plot(bs80908f09.UD$V1,bs80908f09.UD$V2)

volume<-bs80908f09.UD$vol
z<-((volume-min(volume))/(max(volume)-min(volume)))*100

bs80908f09.UD<-cbind(bs80908f09.UD,z)
write.csv(bs80908f09.UD, "bs80908f09.UD.csv",row.names=FALSE)


###################################################################################


telsco<-rgdal::readOGR("Telemetry/telsco.shp")
c1<-rgdal::readOGR("Telemetry/c1.shp")
telsco<-cbind(telsco,c1[1:2])

bathy=raster("Layers/etopo1.tif")
proj4string(bathy)<-CRS("+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")

substrate=rgdal::readOGR("Layers/substrate/conmapsg.shp")
substrate<-spTransform(substrate,CRS(proj4string(telsco)))

slope<-terrain(bathy, opt=c('slope'), unit='degrees')
proj4string(slope)<-CRS("+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")


shoreline=rgdal::readOGR("Layers/shoreline/GSHHS_shp/i/GSHHS_i_L1.shp")
spTransform(shoreline,CRS("+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")) 
shoreline<-gBuffer(shoreline,width = 0)
seshoreline <- crop(shoreline, extent(-82, -63.5, 29, 45))
seshoreline<-spTransform(seshoreline,proj4string(telsco))

telsco<-as.data.frame(telsco)
coordinates(telsco)<-c("x","y")
proj4string(telsco)<-CRS("+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")
telsco=spTransform(telsco,CRS(proj4string(bathy)))


dist<-distanceFromPoints(seshoreline,telsco)
proj4string(dist)<-CRS("+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")


eco=rgdal::readOGR("Layers/MEOW/meow_ecos.shp")
ecoregion <- crop(eco, extent(-82, -63.5, 29, 45))
ecoregion<-spTransform(ecoregion,CRS(proj4string(telsco)))



###################################################################################



telsco$bathy=extract(bathy,telsco,fun=mean)
telsco$bathy=as.numeric(telsco$bathy)

telsco$substrate=over(telsco,substrate)

telsco$slope=extract(slope,telsco, fun=mean)
telsco$slope=as.numeric(telsco$slope)

telsco$eco=over(telsco, ecoregion)

dist<-distanceFromPoints(seshoreline,telsco)
telsco$dist=extract(dist,telsco)



telsco$bathy2=scale(telsco$bathy)
telsco$bathy2=as.numeric(telsco$bathy2)

telsco$slope2=scale(telsco$slope)
telsco$slope2=as.numeric(telsco$slope2)

telsco$dist2=scale(telsco$dist)
telsco$dist2=as.numeric(telsco$dist2)


telsco$sednum=as.factor(telsco@data$substrate$SEDNUM)
telsco$substrate<-NULL
telsco$eco=as.factor(telsco@data$eco$ECOREGION)

write.table(telsco,"telsco.txt", sep="\t")




#####################################################################################
###binomial testing


telsco<-read.csv("telsco.csv")

telsco<-data.frame(telsco)
telsco$eco=as.factor(telsco$eco)
telsco$sednum=as.factor(telsco$sednum)
telsco$geo=as.factor(telsco$geo)
telsco<-na.omit(telsco)

library(lme4)

m1<-glm(geo~bathy2+dist2+slope2+eco+sednum, data=telsco,family = 'binomial')
summary(m1)

m2<-glm(geo~bathy2+dist2+slope2, data=telsco,family = 'binomial')
summary(m2)












