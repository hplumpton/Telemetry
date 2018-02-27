
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


shoreline=rgdal::readOGR("Layers/shoreline2/GSHHS_shp/f/GSHHS_f_L1.shp")
shoreline<-spTransform(shoreline,CRS("+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")) 

seshoreline <- crop(shoreline, extent(-82, -64, 29, 45))
seshoreline<-spTransform(seshoreline,proj4string(telsco))

telsco<-as.data.frame(telsco)
coordinates(telsco)<-c("x","y")
proj4string(telsco)<-CRS("+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")
telsco=spTransform(telsco,CRS(proj4string(bathy)))


dist<-distanceFromPoints(seshoreline,telsco)
proj4string(dist)<-CRS("+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")


eco=rgdal::readOGR("Layers/MEOW/meow_ecos.shp")
ecoregion <- crop(eco, extent(-82, -64, 29, 45))
ecoregion<-spTransform(ecoregion,CRS(proj4string(telsco)))



###################################################################################



telsco$bathy=extract(bathy,telsco,fun=mean)
telsco$bathy=as.numeric(telsco$bathy)

telsco$substrate=over(telsco,substrate)

telsco$slope=extract(slope,telsco, fun=mean)
telsco$slope=as.numeric(telsco$slope)

telsco$eco=over(telsco, ecoregion)

#dist<-distanceFromPoints(seshoreline,telsco)
#telsco$dist=extract(dist,telsco)
#telsco$dist<-gDistance(telsco,seshoreline,byid=TRUE)
library(geosphere)
telsco$dist<-dist2Line(telsco,seshoreline)

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

plot(telsco)
plot(seshoreline,add=TRUE)



#####################################################################################
###binomial testing
#####################################################################################

telsco<-read.csv("telsco.csv")

telsco<-data.frame(telsco)
telsco$eco=as.factor(telsco$eco)
telsco$sednum=as.factor(telsco$sednum)
telsco$geo=as.factor(telsco$geo)
telsco$in_geo=as.factor(telsco$in_geo)
telsco<-na.omit(telsco)

library(lme4)

#geographic location by majority where bird spent the winter (by id)

m1<-glm(geo~bathy2+dist2+slope2+eco+sednum, data=telsco,family = 'binomial')
summary(m1) #no significant variables closest was dist at p=0.139

#ecoregion and sednum had very high se thus removed
m2<-glm(geo~bathy2+dist2+slope2, data=telsco,family = 'binomial')
summary(m2)
#bathy p=0.0821, dist p=0.0191, slope p=0.157


#geographic location by location of each individual wintering site

m3<-glm(in_geo~bathy2+dist2+slope2+eco+sednum, data=telsco,family = 'binomial')
summary(m3) #virginian ecoregion p=1.02e-06

#sednum was removed for high se
m4<-glm(in_geo~bathy2+dist2+slope2, data=telsco,family = 'binomial')
summary(m4)
#bathy p=0.07403, dist p=0.00205, ecovirginian p=7.55e-07 
#the rest were not significant

#contained only variables that se did not cross zero
m5<-glm(in_geo~dist2+slope2, data=telsco, family='binomial')
summary(m5)

library(MuMIn)

out.put<-model.sel(m3,m4)
out.put


##################################################################################
####Mann-Whitney U-Test
#################################################################################

ma<-wilcox.test(bathy~geo,data=telsco)
ma #u=1343.5, p=0.005455

mb<-wilcox.test(dist~geo,data=telsco)
mb #u=1316, p=0.003248

mc<-wilcox.test(slope~geo,data=telsco)
mc #u=2606, p=0.0003944

md<-wilcox.test(bathy~in_geo,data=telsco)
md #u=1024, p=0.0001213

me<-wilcox.test(dist~in_geo,data=telsco)
me #u=1262, p=0.008577

mf<-wilcox.test(slope~in_geo,data=telsco)
mf #u=2555.5, p=3.852e-05




