rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)

K <- 20
N <- 4
load <- c(1:10,20,30,40,50)


data1 <- read.csv("~/Box Sync/JUNO/R programs/WDM-paper/OFC/AR-response-time.csv", header=TRUE, sep=",")
data1 <- as.matrix(data1)
blockingProb1 <- data1[,6]/(data1[,5]+data1[,6])
data2 <- read.csv("~/Box Sync/JUNO/R programs/WDM-paper/OFC/IR-response-time.csv", header=TRUE, sep=",")
data2 <- as.matrix(data2)
blockingProb2 <- data2[,6]/(data2[,5]+data2[,6])

data3 <- read.csv("~/Box Sync/JUNO/R programs/WDM-paper/OFC/AR-loss-4e-11.csv", header=TRUE, sep=",")
data3 <- as.matrix(data3)
blockingProb3 <- data3[,6]/(data3[,5]+data3[,6])
data4 <- read.csv("~/Box Sync/JUNO/R programs/WDM-paper/OFC/IR-loss-4e-11.csv", header=TRUE, sep=",")
data4 <- as.matrix(data4)
blockingProb4 <- data4[,6]/(data4[,5]+data4[,6])


# plot(load[1:12],blockingProb1[1:12],ylim=c(0,0.25),xlab="Load (No. of requests per day)",ylab="Blocking probability",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(load[1:12],blockingProb1[15:26],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(load[1:12],blockingProb2[1:12],col=color[2],lwd = 2,type='o',pch=shape[2])
# 
# 
# plot(load[1:12],blockingProb1[29:40],ylim=c(0,0.4),xlab="Load (No. of requests per day)",ylab="Blocking probability",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(load[1:12],blockingProb1[43:54],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(load[1:12],blockingProb2[15:26],col=color[2],lwd = 2,type='o',pch=shape[2])
# 
# 
# plot(load[1:12],blockingProb1[57:68],ylim=c(0,0.06),xlab="Load (No. of requests per day)",ylab="Blocking probability",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(load[1:12],blockingProb1[71:82],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(load[1:12],blockingProb2[29:40],col=color[2],lwd = 2,type='o',pch=shape[2])


plot(load[1:12],(blockingProb2[1:12]-blockingProb1[1:12])/blockingProb2[1:12],ylim=c(0.78,1),ann=FALSE,col=color[2],lwd = 2,type='o',pch=4)
lines(load[1:12],(blockingProb2[1:12]-blockingProb1[15:26])/blockingProb2[1:12],col=color[1],lwd = 2,type='o',pch=15)
lines(load[1:12],(blockingProb2[15:26]-blockingProb1[29:40])/blockingProb2[15:26],col=color[3],lwd = 2,type='o',pch=17)
lines(load[1:12],(blockingProb2[29:40]-blockingProb1[57:68])/blockingProb2[29:40],col=color[4],lwd = 2,type='o',pch=18)
lines(load[1:12],(blockingProb4[1:12]-blockingProb3[1:12])/blockingProb4[1:12],col=color[5],lwd = 2,type='o',pch=19)
title(xlab="Per-customer load (No. of requests per day)", mgp=c(2,3,0), cex.lab=1.2)
title(ylab="Improvement of blocking probability", mgp=c(2.2,2,3), cex.lab=1.2)

text(7,0.84, labels=expression(italic("(K,N,W,")*alpha*")= (10,2,2000,1)"), cex=1, pos=3)
arrows(8,0.87,13.5,0.904, length=.15, lwd=1.5)
# text(23,0.77, labels=expression("(15,2,2000,"*10^{-11}*")"), cex=1, pos=3)
text(23,0.77, labels=expression("(15,2,2000,1)"), cex=1, pos=3)
arrows(23,0.8,25,0.82, length=.15, lwd=1.5)
text(15,0.8, labels=expression("(10,2,2000,0.75)"), cex=1, pos=3)
arrows(15,0.83,17,0.92, length=.15, lwd=1.5)

text(14,0.945, labels=expression("(10,4,2000,1)"), cex=1, pos=3)
arrows(14,0.97,16,0.995, length=.15, lwd=1.5)
text(25,0.915, labels=expression("(10,2,4000,1)"), cex=1, pos=3)
arrows(25,0.94,27,0.965, length=.15, lwd=1.5)



