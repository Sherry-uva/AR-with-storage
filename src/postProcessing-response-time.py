import sys, os, csv, pdb

def parser(mode, numCustomers, numHighSpeedPorts, W, load, lossRate, num100GIP, runIndex):

	if mode == 'AR':
		result = mode+'-W'+str(W)+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+ '-runIndex' + str(runIndex)+'.csv'
		output = mode + '-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-W' + str(int(W)) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '-runIndex' + str(runIndex) + '.csv'
	else:
		result = mode+'-numCustomers'+str(numCustomers)+'-sharedPorts'+str(numHighSpeedPorts)+'-load'+str(int(load))+'-loss'+str(lossRate)+'-num100GIP'+str(int(num100GIP))+'.csv'
		output = 'IR-K' + str(numCustomers) + '-N' + str(numHighSpeedPorts) + '-load' + str(int(load))  + '-lossRate' + str(lossRate) + '-num100GIP' + str(int(num100GIP)) + '.csv'

	with open(result, 'wt') as csvfile:
		writer = csv.writer(csvfile)
		writer.writerow( ('numTransfers', 'numBlocked', 'blockingProb', 'blockingProbLessThan1TB', 'blockingProbLargerThan1TB', 'aveResponseTime', 'aveRespsTimeCircuit', 'aveRespsTime10GIP', 'aveResponseTimeNoWaiting', 'aveResponseTimeWithWaiting') )
	
	
# ('customerId', 'datasetSize(TB)', 'arrivalTime', 'startTimeDelay', 'responseTime', 'circuitOrNot')	
	numTransfers = 0
	numTransfersLessThan1TB = 0
	numBlocked = 0
	numBlockedLessThan1TB = 0
	numBlockedLargerThan1TB = 0
	numNoWaiting = 0
	numWithWaiting = 0
	responseTime = 0
	responseTimeBlocked = 0
	responseTimeNoWaiting = 0
	responseTimeWithWaiting = 0
	with open(output, 'r') as csvfile:
		csvfile.readline()
		csvreader = csv.reader(csvfile, delimiter=",")
		for line in csvreader:
			if len(line) < 6:
				continue
			numTransfers += 1
			responseTime += float(line[4])
			if float(line[1]) < 1.0: # file size smaller than 1TB
				numTransfersLessThan1TB += 1
				if line[5] == 'IP':
					numBlockedLessThan1TB += 1
			else:
				if line[5] == 'IP':
					numBlockedLargerThan1TB += 1	
			if line[5] == 'circuit':
				if float(line[3]) <= 0.01:
					responseTimeNoWaiting += float(line[4])
					numNoWaiting += 1
				else:
					responseTimeWithWaiting += float(line[4])
					numWithWaiting += 1
			if line[5] == 'IP':
				numBlocked += 1
				responseTimeBlocked += float(line[4])
			
	blockingProb = float(numBlocked)/numTransfers
	blockingProbLessThan1TB = float(numBlockedLessThan1TB)/numTransfersLessThan1TB
	blockingProbLargerThan1TB = float(numBlockedLargerThan1TB)/(numTransfers-numTransfersLessThan1TB)
	aveResponseTime = responseTime/float(numTransfers)
	aveRespsTimeCircuit = (responseTime-responseTimeBlocked)/float(numTransfers-numBlocked) 
	aveResponseTimeNoWaiting = responseTimeNoWaiting/numNoWaiting
	aveResponseTimeWithWaiting = responseTimeWithWaiting/numWithWaiting
	if numBlocked != 0:
		aveRespsTime10GIP = responseTimeBlocked/float(numBlocked)
	else:
		aveRespsTime10GIP = -1

	with open(result, 'a') as csvfile:
		writer = csv.writer(csvfile)
		writer.writerow( (numTransfers, numBlocked, round(blockingProb, 5), round(blockingProbLessThan1TB, 5), round(blockingProbLargerThan1TB, 5), round(aveResponseTime, 5), round(aveRespsTimeCircuit, 5), round(aveRespsTime10GIP, 5), round(aveResponseTimeNoWaiting, 5), round(aveResponseTimeWithWaiting, 5)) )


parser('AR', 10, 2, 1, 20, 1e-11, 2, 101)
# parser('AR', 10, 2, 1000, 20, 1e-11, 2, 101)
# parser('AR', 10, 2, 2000, 20, 1e-11, 2, 101)
# 
# parser('AR', 10, 2, 1500, 20, 1e-11, 2, 101)
# parser('AR', 10, 2, 2500, 20, 1e-11, 2, 101)		
# parser('AR', 10, 2, 3000, 20, 1e-11, 2, 101)
# 
# parser('AR', 10, 2, 4000, 20, 1e-11, 2, 101)
# parser('AR', 10, 2, 5000, 20, 1e-11, 2, 101)
# parser('AR', 10, 2, 6000, 20, 1e-11, 2, 101)
# 
# 
# 


		
