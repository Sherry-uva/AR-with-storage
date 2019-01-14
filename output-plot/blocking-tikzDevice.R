rm(list=ls(all=TRUE)) 

color <- c("red","black","blue","green","violet","skyblue")
shape <- c(19,20,21,14,23,24,15,16)

K <- 20
N <- 4
load <- c(1:10,20,30,40,50)


data1 <- read.csv("WDM-paper/AR-response-time.csv", header=TRUE, sep=",")
data1 <- as.matrix(data1)
blockingProb1 <- data1[,6]/(data1[,5]+data1[,6])
data2 <- read.csv("WDM-paper/IR-response-time.csv", header=TRUE, sep=",")
data2 <- as.matrix(data2)
blockingProb2 <- data2[,6]/(data2[,5]+data2[,6])

data3 <- read.csv("WDM-paper/AR-loss-4e-11.csv", header=TRUE, sep=",")
data3 <- as.matrix(data3)
blockingProb3 <- data3[,6]/(data3[,5]+data3[,6])
data4 <- read.csv("WDM-paper/IR-loss-4e-11.csv", header=TRUE, sep=",")
data4 <- as.matrix(data4)
blockingProb4 <- data4[,6]/(data4[,5]+data4[,6])

require(tikzDevice)

tikz('blocking-prob.tex', 
     standAlone = TRUE, # We want a tex file that can be directly compiled to a dvi
     width = 5, height = 4,
     packages=c(options()$tikzLatexPackages, "\\usepackage{amsfonts}"))

plot(load[1:12],(blockingProb2[1:12]-blockingProb1[1:12])/blockingProb2[1:12],ylim=c(0.78,1),xlab="Load (No. of requests per day)",ylab="Improvement of blocking probability",col=color[2],lwd = 2,type='o',pch=4)
lines(load[1:12],(blockingProb2[1:12]-blockingProb1[15:26])/blockingProb2[1:12],col=color[1],lwd = 2,type='o',pch=15)
lines(load[1:12],(blockingProb2[15:26]-blockingProb1[29:40])/blockingProb2[15:26],col=color[3],lwd = 2,type='o',pch=17)
lines(load[1:12],(blockingProb2[29:40]-blockingProb1[57:68])/blockingProb2[29:40],col=color[4],lwd = 2,type='o',pch=18)
lines(load[1:12],(blockingProb4[1:12]-blockingProb3[1:12])/blockingProb4[1:12],col=color[5],lwd = 2,type='o',pch=19)
# text(8,0.8, labels="$(K, N, W, l) = (10, 2, 2000, 10^{-11})$", cex=1, pos=3)
arrows(10,0.85,15,0.9, length=.15)

dev.off()


