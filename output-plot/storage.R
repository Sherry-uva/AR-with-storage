rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)
# W <- c(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000)
W <- c(50, 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000, 3000, 4000, 5000, 6000)

K <- 10
N <- 4
load <- 20
lossRate <- 1e-11
num100GIP <- 2

input <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/plot-storageUsage", "-K", K, "-N", N, "-load", load, "-lossRate", lossRate, "-num100GIP", num100GIP, sep = "")
data <- read.csv(input, header=TRUE, sep=",")
data <- as.matrix(data)

par(mar=c(4,4,3,4) + 0.1, oma = c(2,1,1,1))
# mean, median, 95 percentile, 98 percentile, 99 percentile, max
plot(W,data[,5]/1000.0,ylim=c(0,max(data[,4]/1000.0)+10),xlab="",ylab='',col=color[1],lwd = 2,type='o',pch=shape[1])
lines(W,data[,7]/1000.0,col=color[4],lwd = 2,type='o',pch=shape[2])
lines(W,data[,9]/1000.0,col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(W,data[,10]/1000.0,col=color[4],lwd = 2,type='o',pch=shape[4])
lines(W,data[,11]/1000.0,col=color[5],lwd = 2,type='o',pch=shape[5])
lines(W,data[,4]/1000.0,col=color[6],lwd = 2,type='o',pch=shape[6])
title(paste("K=", K, ", N=", N, ", load=", load, ", num100GIP=", num100GIP, sep = ""))
title(xlab="Reservation window size (s)", line=2.5, cex.lab=1.2)
title(ylab="Storage usage (TB)", line=2.5, cex.lab=1.2)

# text(1850,275, labels="Blocking probability", cex=1, pos=3)
# arrows(800,300,300,300, length=.15, lwd=1.5)
# 
# text(4000,320, labels="Maximum", cex=1, pos=3)
# arrows(4000,365,4200,410, length=.15, lwd=1.5)
# text(5500,150, labels="99 percentile", cex=1, pos=3)
# arrows(5500,150,5700,110, length=.15, lwd=1.5)
# text(3500,150, labels="95 percentile", cex=1, pos=3)
# arrows(3500,150,3300,50, length=.15, lwd=1.5)
# text(1500,180, labels="Red: mean", cex=1, pos=3)
# text(1500,150, labels="Green: median", cex=1, pos=3)
# arrows(1500,150,600,15, length=.15, lwd=1.5)

text(1850,90, labels="Blocking probability", cex=1, pos=3)
arrows(800,100,350,100, length=.15, lwd=1.5)

text(4000,125, labels="Maximum", cex=1, pos=3)
arrows(4000,145,4200,168, length=.15, lwd=1.5)
text(5000,50, labels="99 percentile", cex=1, pos=3)
arrows(5000,50,5200,15, length=.15, lwd=1.5)
text(2000,63, labels="95 percentile, mean", cex=1, pos=3)
text(2080,50, labels="and median (overlapping)", cex=1, pos=3)
arrows(1800,50,600,2, length=.15, lwd=1.5)

input <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/plot-blockingProb", "-K", K, "-N", N, "-load", load, "-lossRate", lossRate, "-num100GIP", num100GIP, sep = "")
info <- read.csv(input, header=TRUE, sep=",")
info <- as.matrix(info)

par(new = T)
plot(W, info[,3], type='o',pch=18, axes=F, xlab=NA, ylab=NA, cex=1.5)
axis(side = 4)
mtext(side = 4, line = 2.5, 'Blocking probability', cex=1.2)







