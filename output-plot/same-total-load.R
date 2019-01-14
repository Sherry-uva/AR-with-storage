rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)
K <- 5:20

W <- 8000
sharedPorts <- 4
lossRate <- 1e-11
num100GIP <- 2

input1 <- paste("WDM-paper/resultsAR", "-W", W, "-sharedPorts", sharedPorts, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data1 <- read.csv(input1, header=TRUE, sep=",")
data1 <- as.matrix(data1)

input2 <- paste("WDM-paper/resultsIR", "-sharedPorts", sharedPorts, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data2 <- read.csv(input2, header=TRUE, sep=",")
data2 <- as.matrix(data2)

W <- 1000
input3 <- paste("WDM-paper/resultsAR", "-W", W, "-sharedPorts", sharedPorts, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data3 <- read.csv(input3, header=TRUE, sep=",")
data3 <- as.matrix(data3)

W <- 100
input4 <- paste("WDM-paper/resultsAR", "-W", W, "-sharedPorts", sharedPorts, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data4 <- read.csv(input4, header=TRUE, sep=",")
data4 <- as.matrix(data4)

input5 <- paste("WDM-paper/maxMinIR", "-sharedPorts", sharedPorts, "-loss", lossRate, "-num100GIP", num100GIP, ".csv", sep = "")
data5 <- read.csv(input5, header=TRUE, sep=",")
data5 <- as.matrix(data5)

plot(K,data1[,4],ylim=c(0,0.002),xlab="Number of customers (K)",ylab="Blocking probablity",col=color[1],lwd = 2,type='o',pch=shape[1])
lines(K,data2[,4],col=color[2],lwd = 2,type='o',pch=shape[2])
lines(K,data3[,4],col=color[3],lwd = 2,type='o',pch=shape[3])
lines(K,data4[,4],col=color[4],lwd = 2,type='o',pch=shape[4])

par(new = T)
plot(K, data5[,4], type='o',pch=shape[5], axes=F, xlab=NA, ylab=NA, cex=1.2)
axis(side = 4)
mtext(side = 4, line = 3, 'Variation of blocking probability')

# plot(K,data1[,5],ylim=c(420,600),xlab="Number of customers (K)",ylab="Average response time (s)",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(K,data2[,5],col=color[2],lwd = 2,type='o',pch=shape[2])
# lines(K,data3[,5],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(K,data4[,5],col=color[4],lwd = 2,type='o',pch=shape[4])
# 
# plot(K,data1[,6],ylim=c(305,310),xlab="Number of customers (K)",ylab="Average circuit response time (s)",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(K,data2[,6],col=color[2],lwd = 2,type='o',pch=shape[2])
# lines(K,data3[,6],col=color[3],lwd = 2,type='o',pch=shape[3])
# lines(K,data4[,6],col=color[4],lwd = 2,type='o',pch=shape[4])

# plot(K,data1[,7],ylim=c(5300,6000),xlab="Number of customers (K)",ylab="Average 10G IP response time (s)",col=color[1],lwd = 2,type='o',pch=shape[1])
# lines(K,data2[,7],col=color[2],lwd = 2,type='o',pch=shape[2])
# lines(K,data3[,7],col=color[3],lwd = 2,type='o',pch=shape[3])

