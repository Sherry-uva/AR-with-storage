rm(list=ls(all=TRUE)) 

color <- c("red","black","skyblue","blue","violet","green")
shape <- c(19,20,21,14,23,24,15,16)

W <- 8000
sharedPorts <- 4
load <- 20
lossRate <- 1e-11
num100GIP <- 2

input1 <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/resultsAR", "-W", W, "-sharedPorts", sharedPorts, "-load", load, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data1 <- read.csv(input1, header=TRUE, sep=",")
data1 <- as.matrix(data1)
K <- (sharedPorts+1):(sharedPorts+nrow(data1))

input2 <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/resultsIR", "-sharedPorts", sharedPorts, "-load", load, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data2 <- read.csv(input2, header=TRUE, sep=",")
data2 <- as.matrix(data2)

W <- 1000
input3 <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/resultsAR", "-W", W, "-sharedPorts", sharedPorts, "-load", load, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data3 <- read.csv(input3, header=TRUE, sep=",")
data3 <- as.matrix(data3)

plot(K,data1[,4],ylim=c(0,0.25),xlab="Number of customers (K)",ylab="Blocking probablity",col=color[1],lwd = 2,type='o',pch=shape[1])
lines(K,data2[,4],col=color[2],lwd = 2,type='o',pch=shape[2])
lines(K,data3[,4],col=color[3],lwd = 2,type='o',pch=shape[3])

plot(K,data1[,5],ylim=c(300,8000),xlab="Number of customers (K)",ylab="Average response time (s)",col=color[1],lwd = 2,type='o',pch=shape[1])
lines(K,data2[,5],col=color[2],lwd = 2,type='o',pch=shape[2])
lines(K,data3[,5],col=color[3],lwd = 2,type='o',pch=shape[3])

plot(K,data1[,6],ylim=c(300,8000),xlab="Number of customers (K)",ylab="Average circuit response time (s)",col=color[1],lwd = 2,type='o',pch=shape[1])
lines(K,data2[,6],col=color[2],lwd = 2,type='o',pch=shape[2])
lines(K,data3[,6],col=color[3],lwd = 2,type='o',pch=shape[3])

# plot(K,data1[,7],ylim=c(5300,6000),xlab="Number of customers (K)",ylab="Average 10G IP response time (s)",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(K,data2[,7],col=color[2],lwd = 2,type='o',pch=shape[2])
# lines(K,data3[,7],col=color[3],lwd = 2,type='o',pch=shape[3])

