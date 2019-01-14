rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)
W <- c(50, 200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000, 3000, 4000, 5000, 6000)

K <- 10
N <- 4
load <- 20
lossRate <- 1e-11
num100GIP <- 2

input <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/plot-blockingProb", "-K", K, "-N", N, "-load", load, "-lossRate", lossRate, "-num100GIP", num100GIP, sep = "")
info <- read.csv(input, header=TRUE, sep=",")
info <- as.matrix(info)

plot(W, info[,4], ylim=c(min(info[,4:5]), max(info[,4:5])), col=color[1], type='o',pch=18, ylab="Average response time", xlab="Reservation window size (s)", cex=1.5)
lines(W,info[,5],col=color[3],lwd = 2,type='o',pch=shape[2])
# lines(W,info[,6],col=color[4],lwd = 2,type='o',pch=shape[3])





