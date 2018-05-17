
library(ggplot2)
#library(reshape2)

dat.m<-melt(tel,id.var='name', measure.vars=c('s1.tot.day','s2.tot.year','s3.tot.year','s4.tot.year'))

tel<-read.csv("notes.csv")
day<-read.csv("day.csv")
area<-read.csv("area.csv")
dist<-read.csv("dist.csv")
tel<-read.csv("male_notes.csv")
tel<-read.csv("female_notes.csv")

library(lme4)
tel$ratio2<-scale(tel$ratio)


m1<-glm(ave.area~ratio2+sex+ratio2*sex, data=tel, family='poisson', na.action='na.pass')
m2<-glm(S1a.day.year~ratio2+sex+ratio2*sex, data=tel, family='poisson', na.action='na.pass')
m3<-glm(win.dep~ratio2+sex+ratio2*sex, data=tel, family='poisson', na.action='na.pass')
m4<-glm(ave.dist~ratio2+sex+ratio2*sex, data=tel, family='Gamma')

summary(m1)
summary(m2)
summary(m3)
summary(m4)

tel$fit<-m1$fitted.values
m.area<-ggplot(tel,aes(x=ratio2, y=fit))
m.area+stat_smooth(method = "lm",formula = y~poly(x,2),se=TRUE)+
  theme(axis.text.x=element_text(size=10, color='black'))+ 
  theme(axis.text.y=element_text(size=10, color='black'))+ 
  theme(panel.background = element_rect(colour = 'black', fill = 'white'))+
  theme(axis.title.y=element_text(size=12, color="black"))+
  theme(axis.title.x=element_text(size=13, color="black"))+
  ylim(1000,5000)+
  xlab('Ratio of time in South to North') +         
  ylab(bquote('Average Area of Wintering Site ( '*km^'2'*')'))


tel$fit<-fitted(m2)
m.arr<-ggplot(tel,aes(x=ratio, y=fit))
m.arr+stat_smooth(method = "lm",se=TRUE)+
  theme(axis.text.x=element_text(size=10, color='black'))+ 
  theme(axis.text.y=element_text(size=10, color='black'))+ 
  theme(panel.background = element_rect(colour = 'black', fill = 'white'))+
  theme(axis.title.y=element_text(size=12, color="black"))+
  theme(axis.title.x=element_text(size=13, color="black"))+
  #ylim(309,314)+
  xlab("Ratio of time in North to South") +         
  ylab("Arrival Date to first Winterting Site 
       (Julian Date)") 

tel$fit<-fitted(m3)
m.dep<-ggplot(tel,aes(x=ratio, y=fit))
m.dep+stat_smooth(method = "lm",se=TRUE)+
  theme(axis.text.x=element_text(size=10, color='black'))+ 
  theme(axis.text.y=element_text(size=10, color='black'))+ 
  theme(panel.background = element_rect(colour = 'black', fill = 'white'))+
  theme(axis.title.y=element_text(size=12, color="black"))+
  theme(axis.title.x=element_text(size=13, color="black"))+
  #ylim(81,86)+
  xlab("Ratio of time spent in South to North ") +         
  ylab("Departure Date from the Last Wintering 
       Site (Julian Date)") 

tel$fit<-fitted(m4)
m.dist<-ggplot(tel,aes(x=ave.dist, y=fit))
m.dist+stat_smooth(method = "lm",se=TRUE)+
  theme(axis.text.x=element_text(size=10, color='black'))+ 
  theme(axis.text.y=element_text(size=10, color='black'))+ 
  theme(panel.background = element_rect(colour = 'black', fill = 'white'))+
  theme(axis.title.y=element_text(size=12, color="black"))+
  theme(axis.title.x=element_text(size=13, color="black"))+
  ylim(78,86)+
  xlab("Average Distance Between Wintering Sites (km) ") +         
  ylab("Ratio of time spent in a region on the 
  wintering grounds (South to North)") 







quart<-function(x){
  r<-quantile(x,probs=c(0.05,0.25,0.5,0.75,0.95))
  names(r)<-c("ymin","lower","middle","upper","ymax")
  r
}


bar<-ggplot(tel,aes(num.sites))
bar+geom_bar()+
theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=13,color="black"))+
  theme(axis.title.y=element_text(size=13,color="black"))+
  ylim(0,30)+
  xlab("Number of Wintering Sites Used")+
  ylab("Frequency")

days<-ggplot(day, aes(x=period, y=days))
days+geom_boxplot()+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=14,color="black"))+
  theme(axis.title.y=element_text(size=14,color="black"))+
  ylim(0,200)+
  xlab("Period of Time Spent at a Wintering Site")+
  ylab("Number of days")

ar<-ggplot(area, aes(x=site, y=area))
ar+geom_boxplot()+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  ylim(0,15000)+
  theme(axis.title.x=element_text(size=15,color="black"))+
  theme(axis.title.y=element_text(size=15,color="black"))+
  xlab("Area of Wintering Site")+
  ylab(bquote('Area ('*km^'2'*')'))

di<-ggplot(dist, aes(x=Sites, y=Distance))
di+geom_boxplot()+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  ylim(0,1500)+
  theme(axis.title.x=element_text(size=15,color="black"))+
  theme(axis.title.y=element_text(size=15,color="black"))+
  xlab("Distance between Wintering Sites")+
  ylab("Distance (km)")


ad<-ggplot(tel, aes(x=geo, y=S1a.day.year))
ad+geom_violin()+
  #geom_boxplot(width=0.15,coef=0)+
  stat_summary(fun.data=quart,width=0.15,geom="boxplot",aes(width=0.15))+
  #stat_summary(fun.y=o,geom="point", size=1)+
  stat_summary(fun.y=median,geom="point",shape=18,size=3)+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=13,color="black"))+
  theme(axis.title.y=element_text(size=13,color="black"))+
  xlab("Geographic Location")+
  ylab("Arrival date to wintering grounds
       (julian date)")

sa<-ggplot(tel, aes(x=S1a.day.year, fill=geo))
sa+geom_histogram(binwidth=5, alpha=.5, position="identity")+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=15,color="black"))+
  theme(axis.title.y=element_text(size=15,color="black"))+
  labs(fill='Geography')+
  xlab("Arrival date to First Wintering Site (Julian Date)")+
  ylab("Frequency")

dd<-ggplot(tel, aes(x=geo, y=win.dep))
dd+geom_violin()+
  #geom_boxplot(width=0.15)+
  stat_summary(fun.data=quart,width=0.15,geom="boxplot",aes(width=0.15))+
  stat_summary(fun.y=median,geom="point",shape=18,size=3)+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=13,color="black"))+
  theme(axis.title.y=element_text(size=13,color="black"))+
  xlab("Geographic Location")+
  ylab("Departure date from wintering grounds
       (julian date)")

sd<-ggplot(tel, aes(x=win.dep, fill=geo))
sd+geom_histogram(binwidth = 5, alpha=.5, position="identity")+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=15,color="black"))+
  theme(axis.title.y=element_text(size=15,color="black"))+
  xlab("Departure Date from Last Wintering Site (Julian Date)")+
  ylab("Frequency")

area<-ggplot(tel, aes(x=geo, y=ave.area))
area+geom_violin()+
  #geom_boxplot(width=0.15)+
  stat_summary(fun.data=quart,width=0.15,geom="boxplot",aes(width=0.15))+
  stat_summary(fun.y=median,geom="point",shape=18,size=3)+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=13,color="black"))+
  theme(axis.title.y=element_text(size=13,color="black"))+
  xlab("Geographic Location")+
  ylab(bquote('Average wintering site area ( '* km ^'2'*')'))

gwa<-ggplot(tel, aes(x=ave.area, fill=sex))
gwa+geom_histogram(binwidth = 500, alpha=.5, position="identity")+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=15,color="black"))+
  theme(axis.title.y=element_text(size=15,color="black"))+
  labs(fill='Sex')+
  xlab("Average Area of Wintering Site")+
  ylab("Frequency")

dist<-ggplot(tel, aes(x=geo, y=ave.dist))
dist+geom_violin()+
  #geom_boxplot(width=0.15)+
  stat_summary(fun.data=quart,width=0.15,geom="boxplot",aes(width=0.15))+
  stat_summary(fun.y=median,geom="point",shape=18,size=3)+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=13,color="black"))+
  theme(axis.title.y=element_text(size=13,color="black"))+
  xlab("Geographic Location")+
  ylab("Average distance between wintering 
      sites (km)")

gdi<-ggplot(tel, aes(x=ave.dist, fill=sex))
gdi+geom_histogram(binwidth =100, alpha=0.5, position="identity")+
  theme(panel.background = element_rect(color = 'black',fill = 'white'))+
  theme(axis.title.x=element_text(size=15,color="black"))+
  theme(axis.title.y=element_text(size=15,color="black"))+
  labs(fill='Sex')+
  xlab("Average Distance between Wintering Site")+
  ylab("Frequency")


arr<-ggplot(tel, aes(x=S1a.day.year))
arr+geom_histogram(data = tel$S1a.day.year, fill="red",alpha=.5)+
  geom_histogram(data=tel$s2a.day.year,fill="green",alpha=.5)



aa<-wilcox.test(S1a.day.year~geo, data=tel)
ab<-wilcox.test(s1d.day.year~geo, data=tel)
ac<-wilcox.test(ave.area~geo, data=tel)
ad<-wilcox.test(ave.dist~geo, data=tel)
ba<-wilcox.test(S1a.day.year~sex, data=tel)
bb<-wilcox.test(s1d.day.year~sex, data=tel)
bc<-wilcox.test(ave.area~sex, data=tel)
bd<-wilcox.test(ave.dist~sex, data=tel)


a<-sd(tel$S1a.day.year, na.rm=TRUE)
b<-sd(tel$s1d.day.year, na.rm=TRUE)
c<-sd(tel$s1.area, na.rm=TRUE)
d<-sd(tel$s2a.day.year, na.rm=TRUE)
e<-sd(tel$s2d.day.year, na.rm=TRUE)
f<-sd(tel$s2.area, na.rm=TRUE)
g<-sd(tel$s3a.day.year, na.rm=TRUE)
h<-sd(tel$s3d.day.year, na.rm=TRUE)
i<-sd(tel$s3.area, na.rm=TRUE)
j<-sd(tel$s1.tot.day, na.rm=TRUE)
k<-sd(tel$s2.tot.year, na.rm=TRUE)
l<-sd(tel$s3.tot.year, na.rm=TRUE)
m<-sd(tel$s4a.day.year, na.rm=TRUE)
n<-sd(tel$s4d.day.year, na.rm=TRUE)
o<-sd(tel$s4.tot.year, na.rm=TRUE)
p<-sd(tel$d.s1.s2, na.rm=TRUE)
r<-sd(tel$d.s2.s3, na.rm=TRUE)
s<-sd(tel$d.s3.s4, na.rm=TRUE)
t<-sd(tel$win.dep, na.rm=TRUE)
u<-sd(tel$num.site, na.rm=TRUE)

##########################################################################

library(lme4)

m1<-glm(S1a.day.year~sex,data=tel,family = "poisson",na.action = 'na.pass')
m2<-glm(win.dep~sex,data=tel,family = "poisson",na.action = 'na.pass')
m3<-glm(ave.area~sex,data=tel,family = "poisson",na.action = 'na.pass')
m4<-glm(ave.dist~sex,data=tel,family = "poisson",na.action = 'na.pass')
summary(m3)


#########################################################################


library(ks)
b39081f10<-read.csv("b39081f10.csv")
bs39081f10<-as.data.frame(cbind(b39081f10$longitud,b39081f10$latitude))
plot(kde(bs39081f10),display='persp')
bs39081f10.H<-Hpi(bs39081f10)
plot(kde(bs39081f10[,1:2],H=bs39081f10.H),display="slice",drawpoints=TRUE)

band.mult<-3
x.grid.size<-500
x=seq(min(bs39081f10[,1])-band.mult*sqrt(bs39081f10.H[1,1]), max(bs39081f10[,1]) + band.mult *sqrt(bs39081f10.H[1,1]), length.out=x.grid.size)

y=seq(min(bs39081f10[,2])-band.mult*sqrt(bs39081f10.H[2,2]), max(bs39081f10[,2])+ band.mult*sqrt(bs39081f10.H[2,2]), by=(x[2]-x[1])) 

grid<-expand.grid(x,y)

bs39081f10<-kde(bs39081f10,H=bs39081f10.H,eval.points=grid)

bs39081f10.out<- cbind(bs39081f10$eval.points[,1],bs39081f10$eval.points[,2],bs39081f10$estimate)
#plot(bs39081f10.out[,1],bs39081f10.out[,2])
sum((x[2]-x[1])*(y[2]-y[1])*bs39081f10.out[,3])

vol<-bs39081f10.out[,3]/sum(bs39081f10.out[,3])

bs39081f10.out<-data.frame(cbind(bs39081f10.out,vol))
bs39081f10.out<-bs39081f10.out[order(-bs39081f10.out$vol),]
cumV<-cumsum(bs39081f10.out$vol)
hist(cumV)

bs39081f10.out<-data.frame(cbind(bs39081f10.out,cumV))
bs39081f10.UD<-subset(bs39081f10.out,bs39081f10.out$cumV<=0.50)

plot(bs39081f10.UD$V1,bs39081f10.UD$V2)

volume<-bs39081f10.UD$vol
z<-((volume-min(volume))/(max(volume)-min(volume)))*100

bs39081f10.UD<-cbind(bs39081f10.UD,z)
write.csv(bs39081f10.UD, "bs39081f10.UD.csv",row.names=FALSE)


