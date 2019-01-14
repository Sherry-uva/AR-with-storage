rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)
# W <- c(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000)
W <- c(50, 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000, 3000, 4000, 5000, 6000)

K <- 20
N <- 4
load <- 20
lossRate <- 1e-11

input1 <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/plot-storageUsage", "-K", K, "-N", N, "-load", load, "-lossRate", lossRate, "-num100GIP2", sep = "")
data1 <- read.csv(input1, header=TRUE, sep=",")
data1 <- as.matrix(data1)

input2 <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/plot-storageUsage", "-K", K, "-N", N, "-load", load, "-lossRate", lossRate, "-num100GIP4", sep = "")
data2 <- read.csv(input2, header=TRUE, sep=",")
data2 <- as.matrix(data2)

par(mar=c(4,4,3,4) + 0.1, oma = c(2,1,1,1))
# mean, median, 95 percentile, 98 percentile, 99 percentile, max
plot(W,data1[,4]/1000.0,ylim=c(0,max(data1[,4]/1000.0)+10),xlab="",ylab='',col=color[1],lwd = 2,type='o',pch=shape[1])
lines(W,data2[,4]/1000.0,col=color[3],lwd = 2,type='o',pch=shape[3])
title(paste("K=", K, ", N=", N, ", load=", load, sep = ""))
title(xlab="Reservation window size (s)", line=2.5, cex.lab=1.2)
title(ylab="Average maximum storage usage (TB)", line=2.5, cex.lab=1.2)

text(3500, 1300, labels=expression(italic("n")*"=2"), cex=1.2, pos=3)
arrows(3500,1500, 4000,1800, length=.15, lwd=1.5)
text(3500, 700, labels=expression(italic("n")*"=4"), cex=1.2, pos=3)
arrows(3500,700, 4000,400, length=.15, lwd=1.5)

input <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/plot-blockingProb", "-K", K, "-N", N, "-load", load, "-lossRate", lossRate, "-num100GIP2", sep = "")
info <- read.csv(input, header=TRUE, sep=",")
info <- as.matrix(info)

par(new = T)
plot(W, info[,3], type='o',pch=18, axes=F, xlab=NA, ylab=NA, cex=1.5)
axis(side = 4)
mtext(side = 4, line = 2.5, 'Blocking probability', cex=1.2)



