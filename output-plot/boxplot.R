input <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/rawData-storageAR-K10-N4-W2000-load20-num100GIP2-runIndex0.csv", sep = "")
data <- read.csv(input, header=TRUE, sep=",")
data <- as.matrix(data)
data <- data[,1]/1000

boxplot(data, outline=FALSE)


input <- paste("~/Box Sync/JUNO/R programs/WDM-paper/OFC/rawData-storageAR-K10-N4-W2000-load20-num100GIP4-runIndex0.csv", sep = "")
data1 <- read.csv(input, header=TRUE, sep=",")
data1 <- as.matrix(data1)
data1 <- data1[,1]/1000

boxplot(data1, outline=FALSE)
