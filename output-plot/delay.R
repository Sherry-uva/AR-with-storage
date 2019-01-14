rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)

K <- 10
N <- 4
load <- c(1:10,20,30,40,50)
col <- 8

data1 <- read.csv("~/Box Sync/JUNO/R programs/WDM-paper/OFC/AR-response-time.csv", header=TRUE, sep=",")
data1 <- as.matrix(data1)
data2 <- read.csv("~/Box Sync/JUNO/R programs/WDM-paper/OFC/IR-response-time.csv", header=TRUE, sep=",")
data2 <- as.matrix(data2)

# plot(load,data1[57:70,col],log='y',ylim=c(100,max(data1[1:28,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[1],lwd = 2,type='o',pch=shape[1])
# par(new = T)
# plot(load,data1[71:84,col],log='y',ylim=c(100,max(data2[15:28,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[3],lwd = 2,type='o',pch=shape[3],ann=FALSE, axes=FALSE)
# par(new = T)
# plot(load,data2[29:42,col],log='y',ylim=c(100,max(data1[1:28,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[2],lwd = 2,type='o',pch=shape[2],ann=FALSE, axes=FALSE)
# 
# par(new = F)
# plot(load,data1[29:42,col],log='y',ylim=c(100,max(data2[15:28,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[1],lwd = 2,type='o',pch=shape[1])
# par(new = T)
# plot(load,data1[43:56,col],log='y',ylim=c(100,max(data2[15:28,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[3],lwd = 2,type='o',pch=shape[3],ann=FALSE, axes=FALSE)
# par(new = T)
# plot(load,data2[15:28,col],log='y',ylim=c(100,max(data2[15:28,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[2],lwd = 2,type='o',pch=shape[2],ann=FALSE, axes=FALSE)
# 
# par(new = F)
# plot(load,data1[1:14,col],log='y',ylim=c(100,max(data1[1:14,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[1],lwd = 2,type='o',pch=shape[1])
# par(new = T)
# plot(load,data1[15:28,col],log='y',ylim=c(100,max(data2[1:14,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[3],lwd = 2,type='o',pch=shape[3],ann=FALSE, axes=FALSE)
# par(new = T)
# plot(load,data2[1:14,col],log='y',ylim=c(100,max(data1[1:14,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[2],lwd = 2,type='o',pch=shape[2],ann=FALSE, axes=FALSE)
# 
# par(new = F)
# plot(load,data1[1:length(load),col],log='y',ylim=c(100,max(data1[,col])),xlab="Load (No. of requests per day)",ylab="Ave. response time",col=color[1],lwd = 2,type='o',pch=shape[1])
# for (i in 1:5) {
#   low <- length(load)*i+1
#   high <- length(load)*(i+1)
#   index <- low:high
#   par(new = T)
#   plot(load,data1[index,col],log='y',ylim=c(100,max(data1[,col])),col=color[(i+1)],lwd = 2,type='o',pch=shape[(i+1)],ann=FALSE, axes=FALSE)
# }
# 
# 
# plot(load[1:12],data1[1:12,col],ylim=c(0,1800),xlab="Load (No. of requests per day)",ylab="Ave. response time of all requests",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(load[1:12],data1[15:26,col],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(load[1:12],data2[1:12,col],col=color[2],lwd = 2,type='o',pch=shape[2])
# 
# 
# plot(load[1:12],data1[29:40,col],ylim=c(0,2500),xlab="Load (No. of requests per day)",ylab="Ave. response time of circuits",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(load[1:12],data1[43:54,col],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(load[1:12],data2[15:26,col],col=color[2],lwd = 2,type='o',pch=shape[2])
# 
# 
# plot(load[1:12],data1[57:68,col],ylim=c(250,800),xlab="Load (No. of requests per day)",ylab="Ave. response time of all requests",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(load[1:12],data1[71:82,col],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(load[1:12],data2[29:40,col],col=color[2],lwd = 2,type='o',pch=shape[2])


# col <- 8
# plot(load[1:12],data1[1:12,col],ylim=c(250,1700),ann=FALSE,col=color[1],lwd = 2,type='o',pch=0)
# title(xlab="Per-customer load (No. of requests per day)", mgp=c(2,3,0), cex.lab=1.2)
# # title(xlab=expression("Per-customer load "~italic("l")~" (No. of requests per day)"), mgp=c(2,3,0), cex.lab=1.2)
# title(ylab="Ave. response time of all requests (s)", mgp=c(2.2,2,3), cex.lab=1.2)
# lines(load[1:12],data2[1:12,col],col=color[1],lwd = 2,type='o',pch=15)
# lines(load[1:11],data1[29:39,col],col=color[3],lwd = 2,type='o',pch=1)
# lines(load[1:11],data2[15:25,col],col=color[3],lwd = 2,type='o',pch=19)
# lines(load[1:12],data1[57:68,col],col=color[4],lwd = 2,type='o',pch=2)
# lines(load[1:12],data2[29:40,col],col=color[4],lwd = 2,type='o',pch=17)
# 
# lines(3.3,1660,col=color[1],lwd = 2,type='o',pch=15)
# lines(4.3,1660,col=color[3],lwd = 2,type='o',pch=19)
# lines(5.3,1660,col=color[4],lwd = 2,type='o',pch=17)
# text(4,1600, labels="Solid             : IR", cex=1, pos=3)
# lines(3.8,1560,col=color[1],lwd = 2,type='o',pch=0)
# lines(4.8,1560,col=color[3],lwd = 2,type='o',pch=1)
# lines(5.8,1560,col=color[4],lwd = 2,type='o',pch=2)
# text(4.5,1500, labels="Hollow             : AR", cex=1, pos=3)
# 
# text(5,1200, labels=expression(italic("(K,N)")~"= (15,2)"), cex=1, pos=3)
# arrows(5,1200,9,800, length=.15, lwd=1.5)
# arrows(5,1200,13,550, length=.15, lwd=1.5)
# 
# text(26,900, labels="(10,2)", cex=1, pos=3)
# arrows(26,1100,24,1270, length=.15, lwd=1.5)
# arrows(26,900,26,700, length=.15, lwd=1.5)
# 
# text(25,180, labels="(10,4)", cex=1, pos=3)
# arrows(25,350,23,550, length=.15, lwd=1.5)
# arrows(25,350,26,550, length=.15, lwd=1.5)


col <- 9
par(new = F)
plot(load[1:12],data1[1:12,col],ylim=c(280,700),ann=FALSE,col=color[1],lwd = 2,type='o',pch=0)
title(xlab="Per-customer load (No. of requests per day)", mgp=c(2,3,0), cex.lab=1.2)
title(ylab="Ave. resp. time of requests over circuits (s)", mgp=c(2.2,2,3), cex.lab=1.2)
lines(load[1:12],data2[1:12,col],col=color[1],lwd = 2,type='o',pch=15)
lines(load[1:11],data1[29:39,col],col=color[3],lwd = 2,type='o',pch=1)
lines(load[1:11],data2[15:25,col],col=color[3],lwd = 2,type='o',pch=19)
lines(load[1:12],data1[57:68,col],col=color[4],lwd = 2,type='o',pch=2)
lines(load[1:12],data2[29:40,col],col=color[4],lwd = 2,type='o',pch=17)

lines(3.3,690,col=color[1],lwd = 2,type='o',pch=15)
lines(4.3,690,col=color[3],lwd = 2,type='o',pch=19)
lines(5.3,690,col=color[4],lwd = 2,type='o',pch=17)
text(4,670, labels="Solid             : IR", cex=1, pos=3)
lines(3.9,650,col=color[1],lwd = 2,type='o',pch=0)
lines(4.9,650,col=color[3],lwd = 2,type='o',pch=1)
lines(5.9,650,col=color[4],lwd = 2,type='o',pch=2)
text(4.5,630, labels="Hollow             : AR", cex=1, pos=3)

text(8,550, labels=expression(italic("(K,N)")~"= (15,2)"), cex=1, pos=3)
arrows(8,550,11,420, length=.15, lwd=1.5)
arrows(8,550,15,340, length=.15, lwd=1.5)

text(22,580, labels="(10,2)", cex=1, pos=3)
arrows(22,580,21,470, length=.15, lwd=1.5)
arrows(22,580,22,340, length=.15, lwd=1.5)

text(26,355, labels="(10,4)", cex=1, pos=3)
arrows(26,410,25,530, length=.15, lwd=1.5)
arrows(26,410,27.5,470, length=.15, lwd=1.5)





